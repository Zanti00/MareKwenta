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
        CREATE TABLE IF NOT EXISTS ticket_line (
            ticket_line_id INTEGER PRIMARY KEY AUTOINCREMENT,
            ticket_id INTEGER NOT NULL,
            product_type_id INTEGER NOT NULL,
            product_quantity INTEGER NOT NULL,
            unit_selling_price REAL NOT NULL,
            FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE ON UPDATE CASCADE,
            FOREIGN KEY (product_type_id) REFERENCES product_type(product_type_id) ON DELETE CASCADE ON UPDATE CASCADE
        )
    """)

    conn.commit()
    cursor.close()
except sqlite3.Error as e:
    print("An error occurred while connecting to sqlite", e)
finally:
    if conn:
        conn.commit()
        cursor.close()
        conn.close()
