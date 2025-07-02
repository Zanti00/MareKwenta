import sqlite3
import os
from datetime import datetime
from typing import Dict, Optional, List

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
        cash_expenses = self.get_total_expenses_by_type(target_date, "CASH")
        non_cash_expenses = self.get_total_expenses_by_type(target_date, "NON-CASH")
        
        return {
            'cash_amount': payment_amounts['cash'],
            'gcash_amount': payment_amounts['gcash'],
            'maya_amount': payment_amounts['maya'],
            'cash_sales_amount': cash_sales,
            'gross_sales': gross_sales,
            'total_discount': total_discount,
            'net_sales': net_sales,
            'cash_expenses_amount': cash_expenses,
            'non_cash_expenses_amount': non_cash_expenses,
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

    def add_expense(self, name: str, amount: float, category: str, employee_id: int) -> Optional[int]:
        """
        Adds a new expense record to the database.

        Args:
            name (str): The name of the expense.
            amount (float): The cost of the expense.
            category (str): The type of expense (e.g., 'CASH', 'NON-CASH').
            employee_id (int): The ID of the employee who added the expense.

        Returns:
            Optional[int]: The ID of the newly added expense, or None if an error occurred.
        """
        current_date = datetime.now().strftime('%Y-%m-%d')
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            query = """
                INSERT INTO expense (expense_name, expense_type, expense_cost, date, employee_id)
                VALUES (?, ?, ?, ?, ?)
            """
            cursor.execute(query, (name, category, amount, current_date, employee_id))
            conn.commit()
            expense_id = cursor.lastrowid
            
            cursor.close()
            conn.close()
            return expense_id
        except sqlite3.Error as e:
            print(f"Database error in add_expense: {e}")
            return None
        except Exception as e:
            print(f"Error in add_expense: {e}")
            return None

    def get_expenses_by_date(self, target_date: str = None) -> List[Dict]:
        """
        Retrieves all expenses for a specific date.

        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. 
                                       If None, uses current date.

        Returns:
            List[Dict]: A list of dictionaries, each representing an expense.
        """
        if target_date is None:
            target_date = datetime.now().strftime('%Y-%m-%d')
        
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            query = """
                SELECT expense_id, expense_name, expense_cost, expense_type
                FROM expense
                WHERE DATE(date) = ?
                ORDER BY expense_id DESC
            """
            cursor.execute(query, (target_date,))
            results = cursor.fetchall()
            
            expenses = []
            for row in results:
                expenses.append({
                    "id": row[0],
                    "name": row[1],
                    "amount": float(row[2]),
                    "category": row[3]
                })
            
            cursor.close()
            conn.close()
            return expenses
        except sqlite3.Error as e:
            print(f"Database error in get_expenses_by_date: {e}")
            return []
        except Exception as e:
            print(f"Error in get_expenses_by_date: {e}")
            return []

    def update_expense(self, expense_id: int, name: str, amount: float, category: str) -> bool:
        """
        Updates an existing expense record in the database.

        Args:
            expense_id (int): The ID of the expense to update.
            name (str): The new name of the expense.
            amount (float): The new cost of the expense.
            category (str): The new type of expense.

        Returns:
            bool: True if the update was successful, False otherwise.
        """
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            query = """
                UPDATE expense
                SET expense_name = ?, expense_cost = ?, expense_type = ?
                WHERE expense_id = ?
            """
            cursor.execute(query, (name, amount, category, expense_id))
            conn.commit()
            
            cursor.close()
            conn.close()
            return True
        except sqlite3.Error as e:
            print(f"Database error in update_expense: {e}")
            return False
        except Exception as e:
            print(f"Error in update_expense: {e}")
            return False

    def delete_expense(self, expense_id: int) -> bool:
        """
        Deletes an expense record from the database.

        Args:
            expense_id (int): The ID of the expense to delete.

        Returns:
            bool: True if the deletion was successful, False otherwise.
        """
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            query = "DELETE FROM expense WHERE expense_id = ?"
            cursor.execute(query, (expense_id,))
            conn.commit()
            
            cursor.close()
            conn.close()
            return True
        except sqlite3.Error as e:
            print(f"Database error in delete_expense: {e}")
            return False
        except Exception as e:
            print(f"Error in delete_expense: {e}")
            return False

    def get_total_expenses_by_type(self, target_date: str = None, expense_type: str = None) -> float:
        """
        Calculates the total amount of expenses for a specific date and expense type.

        Args:
            target_date (str, optional): Date in 'YYYY-MM-DD' format. If None, uses current date.
            expense_type (str, optional): The type of expense ('CASH' or 'NON-CASH').

        Returns:
            float: The total expense amount for the specified type and date.
        """
        if target_date is None:
            target_date = datetime.now().strftime('%Y-%m-%d')
        
        try:
            conn = self.get_db_connection()
            cursor = conn.cursor()
            
            query = """
                SELECT SUM(expense_cost)
                FROM expense
                WHERE DATE(date) = ? AND expense_type = ?
            """
            cursor.execute(query, (target_date, expense_type))
            result = cursor.fetchone()
            
            cursor.close()
            conn.close()
            return float(result[0]) if result[0] is not None else 0.00
        except sqlite3.Error as e:
            print(f"Database error in get_total_expenses_by_type: {e}")
            return 0.00
        except Exception as e:
            print(f"Error in get_total_expenses_by_type: {e}")
            return 0.00
