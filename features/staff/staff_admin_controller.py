import sqlite3
import datetime

DB_NAME = "mare_kwenta.db"

class StaffAdminController:
    def get_all_staff_attendance():
        """
        Fetches all staff attendance data along with employee names from the database.
        Returns a list of dictionaries, where each dictionary represents an attendance record.
        """
        conn = None
        attendance_records = []
        try:
            conn = sqlite3.connect(DB_NAME)
            cursor = conn.cursor()
            cursor.execute("""
                SELECT
                    u.first_name,
                    u.last_name,
                    sa.time_in,
                    sa.time_out
                FROM staff_attendance sa
                JOIN user u ON sa.employee_id = u.employee_id
                ORDER BY sa.attendance_date DESC, sa.time_in DESC
            """)
            rows = cursor.fetchall()
            for row in rows:
                attendance_records.append({
                    "first_name": row[0],
                    "last_name": row[1],
                    "time_in": row[2],
                    "time_out": row[3] if row[3] else "--" # Handle potential NULL time_out
                })
        except sqlite3.Error as e:
            print(f"Database error in get_all_staff_attendance: {e}")
            # In a real application, you might want to log this error or re-raise a custom exception.
        finally:
            if conn:
                conn.close()
        return attendance_records

    def add_new_employee(first_name, last_name, username, password):
        """
        Adds a new employee to the 'user' table in the database.
        Returns the new employee's ID if successful, otherwise None.
        """
        conn = None
        employee_id = None
        try:
            conn = sqlite3.connect(DB_NAME)
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO user (first_name, last_name, username, password)
                VALUES (?, ?, ?, ?)
            """, (first_name, last_name, username, password))
            conn.commit()
            employee_id = cursor.lastrowid
        except sqlite3.IntegrityError: # e.g., username already exists
            print(f"Username '{username}' already exists.")
            employee_id = None
        except sqlite3.Error as e:
            print(f"Database error in add_new_employee: {e}")
        finally:
            if conn:
                conn.close()
        return employee_id

    def reset_employee_password(username, new_password):
        """
        Resets the password for a given employee username in the 'user' table.
        Returns True if the password was reset, False otherwise (e.g., username not found).
        """
        conn = None
        reset_success = False
        try:
            conn = sqlite3.connect(DB_NAME)
            cursor = conn.cursor()
            cursor.execute("""
                UPDATE user
                SET password = ?
                WHERE username = ?
            """, (new_password, username))
            conn.commit()
            if cursor.rowcount > 0:
                reset_success = True
            else:
                reset_success = False # Username not found
        except sqlite3.Error as e:
            print(f"Database error in reset_employee_password: {e}")
        finally:
            if conn:
                conn.close()
        return reset_success