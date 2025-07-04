import sqlite3
import os

class RecipeController:
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
    def get_recipes_by_product_type_id(product_type_id):
        """Get all recipe ingredients for a product type"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT pir.required_ingredient_quantity, i.ingredient_name
                    FROM product_ingredients_recipe pir
                    JOIN inventory i ON pir.inventory_id = i.inventory_id
                    WHERE pir.product_type_id = ?
                """, (product_type_id,))
                rows = cursor.fetchall()
                cursor.close()
                return [(str(row[0]), row[1]) for row in rows]
            except Exception as e:
                print(f"Error fetching recipes: {e}")
                return []
            finally:
                conn.close()
        return []

    @staticmethod
    def get_inventory_id_by_name(ingredient_name):
        """Get inventory ID by ingredient name"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("SELECT inventory_id FROM inventory WHERE ingredient_name = ?", (ingredient_name,))
                row = cursor.fetchone()
                cursor.close()
                return row[0] if row else None
            except Exception as e:
                print(f"Error fetching inventory ID: {e}")
                return None
            finally:
                conn.close()
        return None

    @staticmethod
    def add_recipe_ingredients(product_type_id, ingredients_data):
        """Add recipe ingredients for a product type"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                for qty, inventory_id in ingredients_data:
                    cursor.execute("""
                        INSERT INTO product_ingredients_recipe (required_ingredient_quantity, product_type_id, inventory_id)
                        VALUES (?, ?, ?)
                    """, (qty, product_type_id, inventory_id))
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print(f"Error adding recipe ingredients: {e}")
                conn.rollback()
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def update_recipe_ingredients(product_type_id, ingredients_data):
        """Update recipe ingredients for a product type"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                # Delete existing recipes for this product type
                cursor.execute("DELETE FROM product_ingredients_recipe WHERE product_type_id = ?", (product_type_id,))
                # Insert new recipes
                for qty, inventory_id in ingredients_data:
                    cursor.execute("""
                        INSERT INTO product_ingredients_recipe (required_ingredient_quantity, product_type_id, inventory_id)
                        VALUES (?, ?, ?)
                    """, (qty, product_type_id, inventory_id))
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print(f"Error updating recipe ingredients: {e}")
                conn.rollback()
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def delete_recipes_by_product_type_id(product_type_id):
        """Delete all recipes for a product type"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("DELETE FROM product_ingredients_recipe WHERE product_type_id = ?", (product_type_id,))
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print(f"Error deleting recipes: {e}")
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def check_inventory_availability(cart_items):
        """Check if there's enough inventory for all cart items"""
        conn = RecipeController.connect_db()
        if not conn:
            return False, "Database connection failed"
        
        try:
            cursor = conn.cursor()
            
            # Aggregate required ingredients across all cart items
            total_required = {}  # {inventory_id: total_quantity_needed}
            
            for item in cart_items:
                product_type_id = item["product_type_id"]
                quantity = item["quantity"]
                
                # Get recipe for this product type
                cursor.execute("""
                    SELECT inventory_id, required_ingredient_quantity
                    FROM product_ingredients_recipe
                    WHERE product_type_id = ?
                """, (product_type_id,))
                
                recipe_rows = cursor.fetchall()
                
                for inventory_id, required_qty in recipe_rows:
                    total_needed = required_qty * quantity
                    if inventory_id in total_required:
                        total_required[inventory_id] += total_needed
                    else:
                        total_required[inventory_id] = total_needed
            
            # Check if we have enough of each ingredient
            insufficient_ingredients = []
            
            for inventory_id, needed_qty in total_required.items():
                cursor.execute("""
                    SELECT ingredient_name, quantity
                    FROM inventory
                    WHERE inventory_id = ?
                """, (inventory_id,))
                
                inv_row = cursor.fetchone()
                if inv_row:
                    ingredient_name, available_qty = inv_row
                    if available_qty < needed_qty:
                        insufficient_ingredients.append({
                            'name': ingredient_name,
                            'needed': needed_qty,
                            'available': available_qty
                        })
                else:
                    insufficient_ingredients.append({
                        'name': f'Unknown (ID: {inventory_id})',
                        'needed': needed_qty,
                        'available': 0
                    })
            
            cursor.close()
            
            if insufficient_ingredients:
                error_msg = "Insufficient inventory:\n"
                for item in insufficient_ingredients:
                    error_msg += f"• {item['name']}: Need {item['needed']:.1f}, Have {item['available']:.1f}\n"
                return False, error_msg
            
            return True, "Inventory sufficient"
            
        except Exception as e:
            print(f"Error checking inventory availability: {e}")
            return False, f"Error checking inventory: {e}"
        finally:
            conn.close()

    @staticmethod
    def deduct_inventory(cart_items):
        """Deduct inventory based on cart items"""
        conn = RecipeController.connect_db()
        if not conn:
            return False
        
        try:
            cursor = conn.cursor()
            
            # Aggregate required ingredients across all cart items
            total_required = {}  # {inventory_id: total_quantity_needed}
            
            for item in cart_items:
                product_type_id = item["product_type_id"]
                quantity = item["quantity"]
                
                # Get recipe for this product type
                cursor.execute("""
                    SELECT inventory_id, required_ingredient_quantity
                    FROM product_ingredients_recipe
                    WHERE product_type_id = ?
                """, (product_type_id,))
                
                recipe_rows = cursor.fetchall()
                
                for inventory_id, required_qty in recipe_rows:
                    total_needed = required_qty * quantity
                    if inventory_id in total_required:
                        total_required[inventory_id] += total_needed
                    else:
                        total_required[inventory_id] = total_needed
            
            # Deduct from inventory
            for inventory_id, deduct_qty in total_required.items():
                cursor.execute("""
                    UPDATE inventory 
                    SET quantity = quantity - ?
                    WHERE inventory_id = ?
                """, (deduct_qty, inventory_id))
                
                print(f"Deducted {deduct_qty} from inventory_id {inventory_id}")
            
            conn.commit()
            cursor.close()
            return True
            
        except Exception as e:
            print(f"Error deducting inventory: {e}")
            conn.rollback()
            return False
        finally:
            conn.close()
