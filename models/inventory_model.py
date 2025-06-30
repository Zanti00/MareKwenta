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
        CREATE TABLE IF NOT EXISTS inventory (
            inventory_id INTEGER PRIMARY KEY AUTOINCREMENT,
            ingredient_name VARCHAR(255) NOT NULL,
            quantity INTEGER NOT NULL,
            ingredient_cost INTEGER NOT NULL,
            ingredient_rpoint INTEGER NOT NULL,
            ingredient_unit VARCHAR(50) NOT NULL
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



