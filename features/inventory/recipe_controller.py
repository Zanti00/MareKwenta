import sqlite3
import os

class RecipeController:
    @staticmethod
    def connect_db():
        base_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        db_name = os.path.join(base_path, "mare_kwenta.db")
        try:
            conn = sqlite3.connect(db_name)
            return conn
        except sqlite3.Error as e:
            print("An error occurred while connecting to sqlite", e)
            return None

    @staticmethod
    def add_recipe_ingredients(product_type_id, ingredients_data):
        """
        Add multiple ingredients for a product type
        ingredients_data: list of tuples [(quantity, inventory_id), ...]
        """
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                for quantity, inventory_id in ingredients_data:
                    cursor.execute("""
                        INSERT INTO product_ingredients_recipe 
                        (required_ingredient_quantity, product_type_id, inventory_id)
                        VALUES (?, ?, ?)
                    """, (quantity, product_type_id, inventory_id))
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error inserting recipe ingredients:", e)
                conn.rollback()
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def get_inventory_id_by_name(ingredient_name):
        """Get inventory_id by ingredient name"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT inventory_id FROM inventory 
                    WHERE ingredient_name = ?
                """, (ingredient_name,))
                result = cursor.fetchone()
                cursor.close()
                return result[0] if result else None
            except Exception as e:
                print("Error fetching inventory ID:", e)
                return None
            finally:
                conn.close()
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
                return [(row[0], row[1]) for row in rows]
            except Exception as e:
                print("Error fetching recipes:", e)
                return []
            finally:
                conn.close()
        return []

    @staticmethod
    def delete_recipes_by_product_type_id(product_type_id):
        """Delete all recipes for a specific product type"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("DELETE FROM product_ingredients_recipe WHERE product_type_id = ?", (product_type_id,))
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error deleting recipes:", e)
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def update_recipe_ingredients(product_type_id, ingredients_data):
        """Update recipe ingredients by deleting old ones and adding new ones"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                
                # Delete existing recipes for this product_type
                cursor.execute("""
                    DELETE FROM product_ingredients_recipe 
                    WHERE product_type_id = ?
                """, (product_type_id,))
                
                # Add new recipes
                for quantity, inventory_id in ingredients_data:
                    cursor.execute("""
                        INSERT INTO product_ingredients_recipe 
                        (required_ingredient_quantity, product_type_id, inventory_id)
                        VALUES (?, ?, ?)
                    """, (quantity, product_type_id, inventory_id))
                
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error updating recipe ingredients:", e)
                conn.rollback()
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def check_duplicate_ingredient(product_type_id, inventory_id):
        """Check if an ingredient already exists for a product type"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT COUNT(*) FROM product_ingredients_recipe 
                    WHERE product_type_id = ? AND inventory_id = ?
                """, (product_type_id, inventory_id))
                count = cursor.fetchone()[0]
                cursor.close()
                return count > 0
            except Exception as e:
                print("Error checking for duplicate ingredient:", e)
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def remove_ingredient(product_type_id, inventory_id):
        """Remove a specific ingredient from a product type"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    DELETE FROM product_ingredients_recipe 
                    WHERE product_type_id = ? AND inventory_id = ?
                """, (product_type_id, inventory_id))
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error removing ingredient:", e)
                conn.rollback()
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def get_coffee_non_coffee_options():
        """Get size and temperature options for Coffee/Non-Coffee items"""
        conn = RecipeController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT DISTINCT size, temperature FROM product_types
                    WHERE size IS NOT NULL AND temperature IS NOT NULL
                """)
                options = cursor.fetchall()
                cursor.close()
                return [{"size": row[0], "temperature": row[1]} for row in options]
            except Exception as e:
                print("Error fetching Coffee/Non-Coffee options:", e)
                return []
            finally:
                conn.close()
        return []
