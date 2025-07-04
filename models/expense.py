import sqlite3
import os

base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
db_name = os.path.join(base_path, "mare_kwenta.db")

# check if the database file exists
if not os.path.exists(db_name):
    print("Database doesn't exist. Creating a new one.")
else:
    print("Database exists. Proceeding with table creation.")

try:
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS expense (
            expense_id INTEGER PRIMARY KEY AUTOINCREMENT,
            expense_name VARCHAR(255) NOT NULL,
            expense_type VARCHAR(50) NOT NULL,
            expense_cost INT NOT NULL,
            date DATE NOT NULL,
            employee_id INTEGER NOT NULL,
            FOREIGN KEY (employee_id) REFERENCES user(employee_id) ON DELETE CASCADE ON UPDATE CASCADE
        )
    """)

    conn.commit()
    cursor.close
except sqlite3.Error as e:
    print("An error occured while connecting to sqlite", e)
finally:
    if conn:
        conn.commit()
        cursor.close
