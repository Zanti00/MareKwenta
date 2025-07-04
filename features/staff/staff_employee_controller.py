import sqlite3
import logging
from typing import List, Optional, Dict
import datetime

class StaffEmployeeController:
    def __init__(self, db_path: str = "mare_kwenta.db"):
        self.db_path = db_path
        self.setup_logging()

    def setup_logging(self):
        logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
        self.logger = logging.getLogger(__name__)

    def connect_db(self):
        try:
            conn = sqlite3.connect(self.db_path)
            conn.row_factory = sqlite3.Row
            return conn
        except sqlite3.Error as e:
            self.logger.error(f"Database connection error: {e}")
            raise

    def fetch_all_employees(self, target_date: datetime.date) -> List[dict]:
        """
        Fetches all non-admin employees with their attendance details and latest break info for a specific date.
        """
        target_date_str = target_date.strftime("%Y-%m-%d")
        try:
            with self.connect_db() as conn:
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT
                        u.employee_id,
                        u.first_name,
                        u.last_name,
                        sa.attendance_id,
                        sa.attendance_date,
                        sa.time_in,
                        sa.time_out,
                        sab.break_start,    -- Include break_start
                        sab.break_end       -- Include break_end
                    FROM
                        user u
                    LEFT JOIN
                        staff_attendance sa ON u.employee_id = sa.employee_id AND sa.attendance_date = ?
                    LEFT JOIN (
                        -- Subquery to get the latest break for each attendance_id on the target date
                        SELECT
                            attendance_id,
                            employee_id,
                            break_start,
                            break_end,
                            ROW_NUMBER() OVER(PARTITION BY attendance_id ORDER BY break_time_id DESC) as rn
                        FROM
                            staff_attendance_break
                        WHERE
                            employee_id IN (SELECT employee_id FROM user WHERE user_role = 'employee')
                    ) AS sab ON sa.attendance_id = sab.attendance_id AND sab.rn = 1
                    WHERE
                        u.user_role = 'employee'
                    ORDER BY
                        u.last_name, u.first_name
                """, (target_date_str,))
                rows = cursor.fetchall()

                employees = []
                for row in rows:
                    employee_dict = {
                        'employee_id': row['employee_id'],
                        'first_name': row['first_name'],
                        'last_name': row['last_name'],
                        'attendance_id': row['attendance_id'],
                        'attendance_date': row['attendance_date'],
                        'time_in': row['time_in'],
                        'time_out': row['time_out'],
                        'break_in': row['break_start'], # Map to break_in
                        'break_out': row['break_end'],   # Map to break_out
                    }
                    employees.append(employee_dict)

                self.logger.info(f"Fetched {len(employees)} employees for date {target_date_str}.")
                return employees

        except sqlite3.Error as e:
            self.logger.error(f"Error fetching employees: {e}")
            return []

    def update_attendance_time(self, employee_id: int, action_type: str, attendance_id: Optional[int] = None) -> bool:
        """
        Updates the time_in, time_out, break_in, or break_out for an employee.
        """
        current_date_str = datetime.datetime.now().strftime("%Y-%m-%d")
        time_str = datetime.datetime.now().strftime("%H:%M:%S")

        try:
            with self.connect_db() as conn:
                cursor = conn.cursor()

                # Fetch current attendance record for today
                cursor.execute(
                    "SELECT attendance_id, time_in, time_out FROM staff_attendance WHERE employee_id = ? AND attendance_date = ?",
                    (employee_id, current_date_str)
                )
                attendance_record = cursor.fetchone()

                # If action_type is 'break_in' or 'break_out', we need the attendance_id
                if action_type in ['break_in', 'break_out'] and attendance_record is None:
                    self.logger.warning(f"Cannot record break for employee {employee_id} as no active attendance record found for today.")
                    return False

                if action_type == 'time_in':
                    if attendance_record:
                        self.logger.warning(f"Employee {employee_id} already timed in today.")
                        return False
                    cursor.execute(
                        """
                        INSERT INTO staff_attendance (attendance_date, time_in, time_out, employee_id)
                        VALUES (?, ?, ?, ?)
                        """, (current_date_str, time_str, '00:00:00', employee_id) # Initialize time_out
                    )
                    conn.commit()
                    self.logger.info(f"Recorded time_in for employee {employee_id}: {time_str}.")
                    return True

                elif action_type == 'time_out':
                    if attendance_record and attendance_record['time_in'] != '00:00:00' and attendance_record['time_out'] == '00:00:00':
                        cursor.execute(
                            """
                            UPDATE staff_attendance SET time_out = ?
                            WHERE attendance_id = ?
                            """, (time_str, attendance_record['attendance_id'])
                        )
                        conn.commit()
                        self.logger.info(f"Recorded time_out for employee {employee_id}: {time_str}.")
                        return True
                    else:
                        self.logger.warning(f"Cannot record time_out for employee {employee_id}. No active time_in or already timed out.")
                        return False

                elif action_type == 'break_in':
                    # Check if there's an ongoing break (break_start present, break_end is NULL)
                    cursor.execute(
                        "SELECT break_time_id FROM staff_attendance_break WHERE attendance_id = ? AND break_end IS NULL",
                        (attendance_record['attendance_id'],)
                    )
                    ongoing_break = cursor.fetchone()

                    if ongoing_break:
                        self.logger.warning(f"Employee {employee_id} is already on an ongoing break.")
                        return False # Already on break

                    # Insert a new break record with break_end as NULL
                    cursor.execute(
                        """
                        INSERT INTO staff_attendance_break (attendance_id, employee_id, break_start, break_end)
                        VALUES (?, ?, ?, NULL)
                        """, (attendance_record['attendance_id'], employee_id, time_str)
                    )
                    conn.commit()
                    self.logger.info(f"Recorded break_in for employee {employee_id}: {time_str}.")
                    return True

                elif action_type == 'break_out':
                    # Find the latest ongoing break for this attendance
                    cursor.execute(
                        "SELECT break_time_id FROM staff_attendance_break WHERE attendance_id = ? AND break_end IS NULL ORDER BY break_time_id DESC LIMIT 1",
                        (attendance_record['attendance_id'],)
                    )
                    ongoing_break = cursor.fetchone()

                    if ongoing_break:
                        break_time_id = ongoing_break['break_time_id']
                        cursor.execute(
                            """
                            UPDATE staff_attendance_break SET break_end = ?
                            WHERE break_time_id = ?
                            """, (time_str, break_time_id)
                        )
                        conn.commit()
                        self.logger.info(f"Recorded break_out for employee {employee_id}: {time_str}.")
                        return True
                    else:
                        self.logger.warning(f"No active break found to record break_out for employee {employee_id}.")
                        return False

                else:
                    self.logger.error(f"Invalid action_type: {action_type}")
                    return False

        except sqlite3.Error as e:
            self.logger.error(f"Error updating attendance time for employee {employee_id}: {e}")
            return False

    def verify_password(self, employee_id: int, password: str) -> bool:
        """
        Verifies the password for a given employee.
        """
        try:
            with self.connect_db() as conn:
                cursor = conn.cursor()
                cursor.execute("SELECT password FROM user WHERE employee_id = ?", (employee_id,))
                result = cursor.fetchone()
                if result and result['password'] == password:
                    return True
                return False
        except sqlite3.Error as e:
            self.logger.error(f"Error verifying password for employee {employee_id}: {e}")
            return False