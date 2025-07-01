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
        CREATE TABLE IF NOT EXISTS product_ingredients_recipe (
            recipe_id INTEGER PRIMARY KEY AUTOINCREMENT,
            required_ingredient_quantity DECIMAL(10,2) NOT NULL,
            product_type_id INTEGER NOT NULL,
            inventory_id INTEGER NOT NULL,
            FOREIGN KEY (product_type_id) REFERENCES product_type(product_type_id),
            FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
        )
    """)

    conn.commit()
    print("Product ingredients recipe table created successfully!")
    
except sqlite3.Error as e:
    print("An error occurred while connecting to sqlite", e)
finally:
    if conn:
        conn.commit()
        cursor.close()
        conn.close()