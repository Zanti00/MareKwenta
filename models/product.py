import sqlite3
import os

# Get the base path of the project
base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
db_name = os.path.join(base_path, "mare_kwenta.db")

# check if the database file exists
if not os.path.exists(db_name):
    print("Database doesn't exist. Creating a new one.")
else:
    print("Database exists. Proceeding with migration.")

try:
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS products (
            product_id INTEGER PRIMARY KEY AUTOINCREMENT,
            product_name VARCHAR(255) NOT NULL,
            image VARCHAR(500),
            category VARCHAR(100) NOT NULL
        )
    """)

    conn.commit()
    print("Products table created successfully!")
    
except sqlite3.Error as e:
    print("An error occurred while connecting to sqlite", e)
finally:
    if conn:
        conn.commit()
        cursor.close()
        conn.close()