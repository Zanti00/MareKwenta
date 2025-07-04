import sqlite3
import os
from datetime import datetime
from tkinter import messagebox

class TicketController:
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
    def create_ticket(employee_id, cart_items, total_amount, cash_received, change, discount=0, payment_type="Cash", split_payments=None):
        """Create a new ticket with ticket lines and payment record(s), with inventory validation and deduction"""
        # Import here to avoid circular imports
        import sys
        import os
        sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'inventory'))
        from inventory.recipe_controller import RecipeController
        
        # First, check if we have enough inventory
        has_enough, error_msg = RecipeController.check_inventory_availability(cart_items)
        if not has_enough:
            return None, error_msg
        
        # Get database connection
        conn = TicketController.connect_db()
        if conn is None:
            return None, "Database connection failed"
            
        try:
            cursor = conn.cursor()
            
            # Calculate line price (subtotal before discount)
            line_price = sum((item["quantity"] * item["unit_price"]) + (item["quantity"] * item.get("extras_cost", 0)) for item in cart_items)
            
            # Insert main ticket record
            cursor.execute("""
                INSERT INTO ticket (employee_id, line_price, total_amount, change, discount, ticket_date)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (employee_id, round(line_price, 2), round(total_amount, 2), round(change, 2), round(discount, 2), datetime.now().strftime('%Y-%m-%d %H:%M:%S')))
            
            ticket_id = cursor.lastrowid
            
            # Insert ticket lines for each cart item
            for item in cart_items:
                # Calculate unit selling price including extras
                unit_selling_price = item["unit_price"] + item.get("extras_cost", 0)
                
                # Extract extra shots and whipped cream from extras
                extra_shots = 0
                whipped_cream = 0
                
                # Parse extras list to count extra shots and whipped cream
                extras_list = item.get("extras", [])
                if isinstance(extras_list, list):
                    for extra in extras_list:
                        if "Extra Shot" in extra:
                            # Extract quantity from "Extra Shot x1", "Extra Shot x2", etc.
                            try:
                                extra_shots = int(extra.split('x')[-1])
                            except (ValueError, IndexError):
                                extra_shots = 1  # Default to 1 if parsing fails
                        elif "Whip Cream" in extra:
                            # Extract quantity from "Whip Cream x1", "Whip Cream x2", etc.
                            try:
                                whipped_cream = int(extra.split('x')[-1])
                            except (ValueError, IndexError):
                                whipped_cream = 1  # Default to 1 if parsing fails
                
                cursor.execute("""
                    INSERT INTO ticket_line (ticket_id, product_type_id, product_quantity, unit_selling_price, extra_shots, whipped_cream)
                    VALUES (?, ?, ?, ?, ?, ?)
                """, (ticket_id, item["product_type_id"], item["quantity"], round(unit_selling_price, 2), extra_shots, whipped_cream))
                
            
            # Handle payment records
            if payment_type == "Split" and split_payments:
                # Insert multiple payment records for split payment
                for payment in split_payments:
                    cursor.execute("""
                        INSERT INTO ticket_payment (ticket_id, payment_type, payment_amount)
                        VALUES (?, ?, ?)
                    """, (ticket_id, payment["payment_type"], round(payment["payment_amount"], 2)))
                    
            else:
                # Insert single payment record
                cursor.execute("""
                    INSERT INTO ticket_payment (ticket_id, payment_type, payment_amount)
                    VALUES (?, ?, ?)
                """, (ticket_id, payment_type, round(cash_received, 2)))
            
            # Commit the ticket creation first
            conn.commit()
            cursor.close()
            conn.close()  # Close this connection before inventory deduction
            
            # Now deduct inventory using a separate connection to avoid locks
            inventory_deducted = RecipeController.deduct_inventory(cart_items)
            if not inventory_deducted:
                messagebox.showwarning("Warning: Failed to deduct inventory, but ticket was created")
            return ticket_id, None
            
        except Exception as e:
            conn.rollback()
            return None, f"Error creating ticket: {e}"
        finally:
            try:
                conn.close()
            except:
                pass

    @staticmethod
    def get_ticket_details(ticket_id):
        """Get complete ticket details including lines and payment"""
        
        conn = TicketController.connect_db()
        if conn is None:
            return None
            
        try:
            cursor = conn.cursor()
            
            # Get main ticket info - concatenate first_name and last_name for cashier
            cursor.execute("""
                SELECT t.ticket_id, t.employee_id, t.line_price, t.total_amount, 
                       t.change, t.discount, t.ticket_date, 
                       (u.first_name || ' ' || u.last_name) as cashier_name
                FROM ticket t
                LEFT JOIN user u ON t.employee_id = u.employee_id
                WHERE t.ticket_id = ?
            """, (ticket_id,))
            
            ticket_row = cursor.fetchone()
            if not ticket_row:
                return None
                
                
            ticket_info = {
                "ticket_id": ticket_row[0],
                "employee_id": ticket_row[1],
                "line_price": ticket_row[2],
                "total_amount": ticket_row[3],
                "change": ticket_row[4],
                "discount": ticket_row[5],
                "ticket_date": ticket_row[6],
                "employee_name": ticket_row[7] or "Unknown"
            }
            
            # Get ticket lines
            cursor.execute("""
                SELECT tl.product_quantity, tl.unit_selling_price, 
                       p.product_name, pt.size, pt.temperature
                FROM ticket_line tl
                LEFT JOIN product_type pt ON tl.product_type_id = pt.product_type_id
                LEFT JOIN products p ON pt.product_id = p.product_id
                WHERE tl.ticket_id = ?
            """, (ticket_id,))
            
            lines = []
            line_rows = cursor.fetchall()
            
            for line_row in line_rows:
                lines.append({
                    "quantity": line_row[0],
                    "unit_price": line_row[1],
                    "product_name": line_row[2] or "Unknown Product",
                    "size": line_row[3] or "",
                    "temperature": line_row[4] or ""
                })
            
            # Get payment info
            cursor.execute("""
                SELECT payment_type, payment_amount
                FROM ticket_payment
                WHERE ticket_id = ?
            """, (ticket_id,))
            
            payments = []
            payment_rows = cursor.fetchall()
            
            for payment_row in payment_rows:
                payments.append({
                    "payment_type": payment_row[0],
                    "payment_amount": payment_row[1]
                })
            
            ticket_info["lines"] = lines
            ticket_info["payments"] = payments
            
            cursor.close()
            return ticket_info
            
        except Exception as e:
            import traceback
            traceback.print_exc()
            return None
        finally:
            conn.close()
