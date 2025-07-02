import sqlite3
import os
from datetime import datetime
from typing import Dict, Optional

class CashboxController:
    def __init__(self):
        """Initialize the CashboxController with database connection."""
        # Go up three directories: cash_box -> features -> root
        self.base_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        self.db_name = os.path.join(self.base_path, "mare_kwenta.db")
        
    def get_db_connection(self) -> sqlite3.Connection:
        """Get database connection."""
        return sqlite3.connect(self.db_name)
    
    def get_payment_amounts_by_date(self, target_date: str = None) -> Dict[str, float]:
        """
        Fetch payment amounts by payment type for a specific date.
        
        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. 
                                       If None, uses current date.
        
        Returns:
            Dict[str, float]: Dictionary with payment types as keys and amounts as values.
        """
        if target_date is None:
            target_date = datetime.now().strftime('%Y-%m-%d')
        
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            # Query to get payment amounts grouped by payment type for specific date
            query = """
                SELECT 
                    tp.payment_type,
                    SUM(tp.payment_amount) as total_amount
                FROM ticket_payment tp
                INNER JOIN ticket t ON tp.ticket_id = t.ticket_id
                WHERE DATE(t.ticket_date) = ?
                GROUP BY tp.payment_type
            """
            
            cursor.execute(query, (target_date,))
            results = cursor.fetchall()
            
            # Initialize payment amounts dictionary
            payment_amounts = {
                'cash': 0.00,
                'gcash': 0.00,
                'maya': 0.00
            }
            
            # Populate the dictionary with actual data
            for payment_type, amount in results:
                payment_type_lower = payment_type.lower()
                if payment_type_lower in payment_amounts:
                    payment_amounts[payment_type_lower] = float(amount)
            
            cursor.close()
            conn.close()
            
            return payment_amounts
            
        except sqlite3.Error as e:
            print(f"Database error in get_payment_amounts_by_date: {e}")
            return {'cash': 0.00, 'gcash': 0.00, 'maya': 0.00}
        except Exception as e:
            print(f"Error in get_payment_amounts_by_date: {e}")
            return {'cash': 0.00, 'gcash': 0.00, 'maya': 0.00}
    
    def get_cash_sales_amount_by_date(self, target_date: str = None) -> float:
        """
        Calculate total cash sales amount (sum of all payment types) for a specific date.
        
        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. 
                                       If None, uses current date.
        
        Returns:
            float: Total cash sales amount.
        """
        payment_amounts = self.get_payment_amounts_by_date(target_date)
        return sum(payment_amounts.values())
    
    def get_gross_sales_by_date(self, target_date: str = None) -> float:
        """
        Get gross sales (total amount before discounts) for a specific date.
        
        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. 
                                       If None, uses current date.
        
        Returns:
            float: Gross sales amount.
        """
        if target_date is None:
            target_date = datetime.now().strftime('%Y-%m-%d')
        
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            # Query to get gross sales (total_amount + discount) for specific date
            query = """
                SELECT 
                    SUM(total_amount + discount) as gross_sales
                FROM ticket
                WHERE DATE(ticket_date) = ?
            """
            
            cursor.execute(query, (target_date,))
            result = cursor.fetchone()
            
            cursor.close()
            conn.close()
            
            return float(result[0]) if result[0] is not None else 0.00
            
        except sqlite3.Error as e:
            print(f"Database error in get_gross_sales_by_date: {e}")
            return 0.00
        except Exception as e:
            print(f"Error in get_gross_sales_by_date: {e}")
            return 0.00
    
    def get_total_discount_by_date(self, target_date: str = None) -> float:
        """
        Get total discount amount for a specific date.
        
        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. 
                                       If None, uses current date.
        
        Returns:
            float: Total discount amount.
        """
        if target_date is None:
            target_date = datetime.now().strftime('%Y-%m-%d')
        
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            query = """
                SELECT 
                    SUM(discount) as total_discount
                FROM ticket
                WHERE DATE(ticket_date) = ?
            """
            
            cursor.execute(query, (target_date,))
            result = cursor.fetchone()
            
            cursor.close()
            conn.close()
            
            return float(result[0]) if result[0] is not None else 0.00
            
        except sqlite3.Error as e:
            print(f"Database error in get_total_discount_by_date: {e}")
            return 0.00
        except Exception as e:
            print(f"Error in get_total_discount_by_date: {e}")
            return 0.00
    
    def get_net_sales_by_date(self, target_date: str = None) -> float:
        """
        Get net sales (total amount after discounts) for a specific date.
        
        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. 
                                       If None, uses current date.
        
        Returns:
            float: Net sales amount.
        """
        if target_date is None:
            target_date = datetime.now().strftime('%Y-%m-%d')
        
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            query = """
                SELECT 
                    SUM(total_amount) as net_sales
                FROM ticket
                WHERE DATE(ticket_date) = ?
            """
            
            cursor.execute(query, (target_date,))
            result = cursor.fetchone()
            
            cursor.close()
            conn.close()
            
            return float(result[0]) if result[0] is not None else 0.00
            
        except sqlite3.Error as e:
            print(f"Database error in get_net_sales_by_date: {e}")
            return 0.00
        except Exception as e:
            print(f"Error in get_net_sales_by_date: {e}")
            return 0.00
    
    def get_cashbox_summary_by_date(self, target_date: str = None) -> Dict[str, float]:
        """
        Get comprehensive cashbox summary for a specific date.
        
        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. 
                                       If None, uses current date.
        
        Returns:
            Dict[str, float]: Dictionary containing all cashbox metrics.
        """
        if target_date is None:
            target_date = datetime.now().strftime('%Y-%m-%d')
        
        payment_amounts = self.get_payment_amounts_by_date(target_date)
        cash_sales = self.get_cash_sales_amount_by_date(target_date)
        gross_sales = self.get_gross_sales_by_date(target_date)
        total_discount = self.get_total_discount_by_date(target_date)
        net_sales = self.get_net_sales_by_date(target_date)
        
        return {
            'cash_amount': payment_amounts['cash'],
            'gcash_amount': payment_amounts['gcash'],
            'maya_amount': payment_amounts['maya'],
            'cash_sales_amount': cash_sales,
            'gross_sales': gross_sales,
            'total_discount': total_discount,
            'net_sales': net_sales,
            'date': target_date
        }
    
    def get_transaction_count_by_date(self, target_date: str = None) -> int:
        """
        Get total number of transactions for a specific date.
        
        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. 
                                       If None, uses current date.
        
        Returns:
            int: Number of transactions.
        """
        if target_date is None:
            target_date = datetime.now().strftime('%Y-%m-%d')
        
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            query = """
                SELECT COUNT(*) as transaction_count
                FROM ticket
                WHERE DATE(ticket_date) = ?
            """
            
            cursor.execute(query, (target_date,))
            result = cursor.fetchone()
            
            cursor.close()
            conn.close()
            
            return int(result[0]) if result[0] is not None else 0
            
        except sqlite3.Error as e:
            print(f"Database error in get_transaction_count_by_date: {e}")
            return 0
        except Exception as e:
            print(f"Error in get_transaction_count_by_date: {e}")
            return 0

