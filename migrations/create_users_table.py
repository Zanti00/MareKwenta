import sqlite3
import os

db_name = "mare_kwenta.db"

# check if the database file exists
if not os.path.exists(db_name):
    print("Database doesn't exist. Creating a new one.")
else:
    print("Database exists. Proceeding with migration.")

try:
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS users (
            user_id INTEGER PRIMARY KEY AUTOINCREMENT,
            first_name VARCHAR(25) NOT NULL,
            last_name VARCHAR(25) NOT NULL,
            username VARCHAR(25) NOT NULL UNIQUE,
            password VARCHAR(255) NOT NULL,
            email VARCHAR(50) NOT NULL UNIQUE,
            phone_number VARCHAR(15) NOT NULL UNIQUE
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
