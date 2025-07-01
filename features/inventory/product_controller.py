import sqlite3
import os

class ProductController:
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
    def add_product(product_name, selling_price, category, image_path=None):
        conn = ProductController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                
                # Insert the product first
                cursor.execute("""
                    INSERT INTO products (product_name, selling_price, image, category)
                    VALUES (?, ?, ?, ?)
                """, (product_name, selling_price, image_path, category))
                
                # Get the product_id of the newly inserted product
                product_id = cursor.lastrowid
                
                # If it's a Food item, automatically create a product_type with NULL size and temperature
                if category == "Food":
                    cursor.execute("""
                        INSERT INTO product_type (size, temperature, product_id, unit_price)
                        VALUES (?, ?, ?, ?)
                    """, (None, None, product_id, selling_price))
                
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error inserting product:", e)
                conn.rollback()
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def create_product_type(product_id, size, temperature, unit_price):
        """Create a product type for Coffee/Non-Coffee items"""
        conn = ProductController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    INSERT INTO product_type (size, temperature, product_id, unit_price)
                    VALUES (?, ?, ?, ?)
                """, (size, temperature, product_id, unit_price))
                conn.commit()
                product_type_id = cursor.lastrowid
                cursor.close()
                return product_type_id
            except Exception as e:
                print("Error creating product type:", e)
                return None
            finally:
                conn.close()
        return None

    @staticmethod
    def get_product_types_by_product_id(product_id):
        """Get all product types for a specific product"""
        conn = ProductController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT product_type_id, size, temperature, unit_price
                    FROM product_type
                    WHERE product_id = ?
                """, (product_id,))
                rows = cursor.fetchall()
                cursor.close()
                
                product_types = []
                for row in rows:
                    product_types.append({
                        "product_type_id": row[0],
                        "size": row[1],
                        "temperature": row[2],
                        "unit_price": row[3]
                    })
                return product_types
            except Exception as e:
                print("Error fetching product types:", e)
                return []
            finally:
                conn.close()
        return []

    @staticmethod
    def get_all_products():
        conn = ProductController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    SELECT product_id, product_name, selling_price, image, category
                    FROM products
                """)
                rows = cursor.fetchall()
                cursor.close()
                products = []
                for row in rows:
                    products.append({
                        "product_id": row[0],
                        "name": row[1],
                        "selling_price": row[2],
                        "image": row[3],
                        "category": row[4]
                    })
                return products
            except Exception as e:
                print("Error fetching products:", e)
                return []
            finally:
                conn.close()
        return []

    @staticmethod
    def delete_product_by_id(product_id):
        conn = ProductController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                
                # Delete related product_types first (cascade delete)
                cursor.execute("DELETE FROM product_type WHERE product_id = ?", (product_id,))
                
                # Then delete the product
                cursor.execute("DELETE FROM products WHERE product_id = ?", (product_id,))
                
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error deleting product:", e)
                conn.rollback()
                return False
            finally:
                conn.close()
        return False

    @staticmethod
    def update_product_by_id(product_id, product_name, selling_price, category, image_path=None):
        conn = ProductController.connect_db()
        if conn:
            try:
                cursor = conn.cursor()
                cursor.execute("""
                    UPDATE products 
                    SET product_name = ?, selling_price = ?, category = ?, image = ?
                    WHERE product_id = ?
                """, (product_name, selling_price, category, image_path, product_id))
                conn.commit()
                cursor.close()
                return True
            except Exception as e:
                print("Error updating product:", e)
                return False
            finally:
                conn.close()
        return False
