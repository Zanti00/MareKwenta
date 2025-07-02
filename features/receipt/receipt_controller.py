import sqlite3
import os
from datetime import datetime

class ReceiptController:
    @staticmethod
    def connect_db():
        base_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        db_name = os.path.join(base_path, "mare_kwenta.db")
        try:
            conn = sqlite3.connect(db_name, timeout=30.0)
            conn.execute("PRAGMA busy_timeout = 30000")
            return conn
        except sqlite3.Error as e:
            print("An error occurred while connecting to sqlite", e)
            return None

    @staticmethod
    def get_all_tickets():
        """Get all tickets with their details from the database"""
        conn = ReceiptController.connect_db()
        if not conn:
            return []
        
        try:
            cursor = conn.cursor()
            
            # Get all tickets with employee information
            cursor.execute("""
                SELECT 
                    t.ticket_id,
                    t.employee_id,
                    t.line_price,
                    t.total_amount,
                    t.change,
                    t.discount,
                    t.ticket_date,
                    u.first_name,
                    u.last_name
                FROM ticket t
                LEFT JOIN user u ON t.employee_id = u.employee_id
                ORDER BY t.ticket_date DESC
            """)
            
            tickets = cursor.fetchall()
            result = []
            
            for ticket in tickets:
                ticket_id = ticket[0]
                
                # Get ticket lines (items) with extra shots and whipped cream
                cursor.execute("""
                    SELECT 
                        tl.product_quantity,
                        tl.unit_selling_price,
                        tl.extra_shots,
                        tl.whipped_cream,
                        pt.size,
                        pt.temperature,
                        p.product_name,
                        p.category
                    FROM ticket_line tl
                    JOIN product_type pt ON tl.product_type_id = pt.product_type_id
                    JOIN products p ON pt.product_id = p.product_id
                    WHERE tl.ticket_id = ?
                """, (ticket_id,))
                
                items = cursor.fetchall()
                
                # Get payment information
                cursor.execute("""
                    SELECT payment_type, payment_amount
                    FROM ticket_payment
                    WHERE ticket_id = ?
                """, (ticket_id,))
                
                payments = cursor.fetchall()
                
                # Format the ticket data
                ticket_data = {
                    "ticket_id": ticket_id,
                    "orderId": f"#{ticket_id}",
                    "dateTime": ticket[6],  # ticket_date
                    "totalAmount": float(ticket[3]),  # total_amount
                    "cashier": f"{ticket[7] or 'Unknown'} {ticket[8] or ''}".strip(),
                    "discount": float(ticket[5]),  # discount
                    "change": float(ticket[4]),  # change
                    "line_price": float(ticket[2]),  # line_price
                    "items": [],
                    "payments": []
                }
                
                # Process items
                for item in items:
                    item_data = {
                        "name": item[6],  # product_name
                        "qty": item[0],   # product_quantity
                        "price": float(item[1]),  # unit_selling_price
                        "category": item[7],  # category
                        "extra_shots": item[2],  # extra_shots
                        "whipped_cream": item[3]  # whipped_cream
                    }
                    
                    # Add size and temperature if they exist (for beverages)
                    if item[4]:  # size
                        item_data["size"] = item[4]
                    if item[5]:  # temperature
                        item_data["temperature"] = item[5]
                    
                    ticket_data["items"].append(item_data)
                
                # Process payments
                for payment in payments:
                    ticket_data["payments"].append({
                        "type": payment[0],
                        "amount": float(payment[1])
                    })
                
                # Determine payment mode and breakdown
                if len(payments) > 1:
                    ticket_data["paymentMode"] = "Split"
                    breakdown_parts = []
                    for payment in payments:
                        breakdown_parts.append(f"{payment[0]} ₱{payment[1]:.2f}")
                    ticket_data["paymentBreakdown"] = " + ".join(breakdown_parts)
                elif len(payments) == 1:
                    ticket_data["paymentMode"] = payments[0][0]
                    ticket_data["paymentBreakdown"] = ""
                else:
                    ticket_data["paymentMode"] = "Unknown"
                    ticket_data["paymentBreakdown"] = ""
                
                result.append(ticket_data)
            
            cursor.close()
            return result
            
        except Exception as e:
            print(f"Error fetching tickets: {e}")
            return []
        finally:
            conn.close()
            

            
