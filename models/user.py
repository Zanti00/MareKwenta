import sqlite3
import os

db_name = "mare_kwenta.db"

# check if the database file exists
if not os.path.exists(db_name):
    print("Database doesn't exist. Creating a new one.")
else:
    print("Database exists. Proceeding with table creation.")

try:
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS user (
            employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
            first_name VARCHAR(255) NOT NULL,
            last_name VARCHAR(255) NOT NULL,
            user_role VARCHAR(255) NOT NULL DEFAULT 'employee',
            password VARCHAR(255) NOT NULL,
            username VARCHAR(255) NOT NULL UNIQUE
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
