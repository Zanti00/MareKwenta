import sqlite3
import os
from datetime import datetime

class TicketController:
    @staticmethod
    def connect_db():
        base_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        db_name = os.path.join(base_path, "mare_kwenta.db")
        try:
            conn = sqlite3.connect(db_name)
            return conn
        except sqlite3.Error as e:
            print(f"Database connection error: {e}")
            return None

    @staticmethod
    def create_ticket(employee_id, cart_items, total_amount, cash_received, change, discount=0, payment_type="Cash"):
        """Create a new ticket with ticket lines and payment record"""
        conn = TicketController.connect_db()
        if conn is None:
            print("Failed to connect to database")
            return None
            
        try:
            cursor = conn.cursor()
            
            # Calculate line price (subtotal before discount)
            line_price = sum((item["quantity"] * item["unit_price"]) + (item["quantity"] * item.get("extras_cost", 0)) for item in cart_items)
            
            print(f"Creating ticket: employee_id={employee_id}, line_price={line_price}, final_total={total_amount}, discount={discount}, payment_type={payment_type}")
            
            # Insert main ticket record
            # line_price = subtotal before discount
            # total_amount = final amount after discount
            # discount = discount amount applied
            cursor.execute("""
                INSERT INTO ticket (employee_id, line_price, total_amount, change, discount, ticket_date)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (employee_id, line_price, total_amount, change, discount, datetime.now().strftime('%Y-%m-%d %H:%M:%S')))
            
            ticket_id = cursor.lastrowid
            print(f"Ticket created with ID: {ticket_id}, line_price: ₱{line_price:.2f}, total_amount: ₱{total_amount:.2f}, discount: ₱{discount:.2f}")
            
            # Insert ticket lines for each cart item
            for item in cart_items:
                # Calculate unit selling price including extras
                unit_selling_price = item["unit_price"] + item.get("extras_cost", 0)
                
                cursor.execute("""
                    INSERT INTO ticket_line (ticket_id, product_type_id, product_quantity, unit_selling_price)
                    VALUES (?, ?, ?, ?)
                """, (ticket_id, item["product_type_id"], item["quantity"], unit_selling_price))
                
                print(f"Added line: product_type_id={item['product_type_id']}, qty={item['quantity']}, price={unit_selling_price}")
            
            # Insert payment record with specified payment type
            cursor.execute("""
                INSERT INTO ticket_payment (ticket_id, payment_type, payment_amount)
                VALUES (?, ?, ?)
            """, (ticket_id, payment_type, cash_received))
            
            print(f"Added payment: {payment_type} {cash_received}")
            
            conn.commit()
            cursor.close()
            print(f"Ticket {ticket_id} created successfully with discount: ₱{discount:.2f}")
            return ticket_id
            
        except Exception as e:
            print(f"Error creating ticket: {e}")
            conn.rollback()
            return None
        finally:
            conn.close()

    @staticmethod
    def get_ticket_details(ticket_id):
        """Get complete ticket details including lines and payment"""
        print(f"Retrieving ticket details for ID: {ticket_id}")
        
        conn = TicketController.connect_db()
        if conn is None:
            print("Failed to connect to database")
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
                print(f"No ticket found with ID: {ticket_id}")
                return None
                
            print(f"Found ticket: {ticket_row}")
                
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
            print(f"Found {len(line_rows)} ticket lines")
            
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
            print(f"Found {len(payment_rows)} payments")
            
            for payment_row in payment_rows:
                payments.append({
                    "payment_type": payment_row[0],
                    "payment_amount": payment_row[1]
                })
            
            ticket_info["lines"] = lines
            ticket_info["payments"] = payments
            
            cursor.close()
            print("Ticket details retrieved successfully")
            return ticket_info
            
        except Exception as e:
            print(f"Error getting ticket details: {e}")
            import traceback
            traceback.print_exc()
            return None
        finally:
            conn.close()
