import sqlite3
import os



class InventoryController:
    @staticmethod
    def connect_db():
        base_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        db_name = os.path.join(base_path, "mare_kwenta.db")
        try:
            conn = sqlite3.connect(db_name, timeout=30.0)  # Add timeout to prevent locks
            conn.execute("PRAGMA busy_timeout = 30000")  # 30 second timeout
            return conn
        except sqlite3.Error as e:
            print("An error occurred while connecting to sqlite", e)
            return None

    @staticmethod
    def add_inventory(ingredient_name, quantity, measurement, cost, restock_point):
        conn = InventoryController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    INSERT INTO inventory (
                        ingredient_name, quantity, ingredient_cost, ingredient_rpoint, ingredient_unit
                    )
                    VALUES (?, ?, ?, ?, ?)
                """, (ingredient_name, quantity, cost,restock_point, measurement))
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error inserting inventory:", e)
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def delete_inventory_by_id(inventory_id):
        conn = InventoryController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute(
                    "DELETE FROM inventory WHERE inventory_id = ?",
                    (inventory_id,)
                )
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error deleting inventory:", e)
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def get_all_inventory():
        conn = InventoryController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT inventory_id, 
                            ingredient_name, quantity, 
                            ingredient_cost, 
                            ingredient_rpoint, 
                            ingredient_unit
                    FROM inventory
                """)
                rows = cursor.fetchall()
                cursor.close()
                inventory_list = []
                for row in rows:
                    inventory_list.append({
                        "inventory_id": row[0],
                        "ingredient": row[1],
                        "quantity": str(row[2]),
                        "cost": str(row[3]),
                        "restock_point": str(row[4]),
                        "measurement": row[5],  # ingredient_unit
                    })
                return inventory_list
            except Exception as e:
                print("Error fetching inventory:", e)
                return []
            finally:
                conn.close()
        return []

    @staticmethod
    def update_quantity_by_id(inventory_id, new_quantity):
        conn = InventoryController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute(
                    "UPDATE inventory SET quantity = ? WHERE inventory_id = ?",
                    (new_quantity, inventory_id)
                )
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error updating quantity:", e)
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def update_inventory_by_id(inventory_id, ingredient_name, quantity, measurement, cost, restock_point):
        conn = InventoryController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute(
                    """
                    UPDATE inventory
                    SET ingredient_name = ?, quantity = ?, ingredient_unit = ?, ingredient_cost = ?, ingredient_rpoint = ?
                    WHERE inventory_id = ?
                    """,
                    (ingredient_name, quantity, measurement, cost, restock_point, inventory_id)
                )
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error updating inventory:", e)
                return False
            finally:
                conn.close()
        return False



