import sqlite3
import os
import datetime
from typing import List, Dict, Optional, Tuple

class SalesDashboardController:
    def __init__(self):
        # Go up three levels: dashboard -> features -> project root
        self.base_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        self.db_name = os.path.join(self.base_path, "mare_kwenta.db")
        print(f"DEBUG: Database path: {self.db_name}")
        print(f"DEBUG: Database exists: {os.path.exists(self.db_name)}")
        
    def _get_connection(self) -> sqlite3.Connection:
        """Get database connection"""
        return sqlite3.connect(self.db_name)
    
    def _parse_date_selection(self, periodicity: str, date_selection: str) -> Tuple[str, str]:
        """
        Parse the date selection based on periodicity and return start and end dates
        Returns tuple of (start_date, end_date) in 'YYYY-MM-DD' format
        """
        print(f"DEBUG: Parsing date - Periodicity: {periodicity}, Selection: {date_selection}")
        
        today = datetime.date.today()
        
        if periodicity == "Daily":
            # Parse "Month DD, YYYY" format
            try:
                selected_date = datetime.datetime.strptime(date_selection, "%B %d, %Y").date()
                result = selected_date.strftime("%Y-%m-%d"), selected_date.strftime("%Y-%m-%d")
                print(f"DEBUG: Daily date parsed - Start: {result[0]}, End: {result[1]}")
                return result
            except ValueError as e:
                print(f"DEBUG: Date parsing failed: {e}")
                fallback = today.strftime("%Y-%m-%d"), today.strftime("%Y-%m-%d")
                print(f"DEBUG: Using fallback - Start: {fallback[0]}, End: {fallback[1]}")
                return fallback
                
        elif periodicity == "Weekly":
            # Parse "Week X (Mon DD)" format and calculate week range
            try:
                # Extract the date part from "Week X (Mon DD)"
                import re
                match = re.search(r'\((\w{3} \d{1,2})\)', date_selection)
                if match:
                    date_str = match.group(1)
                    # Add current year
                    date_with_year = f"{date_str} {today.year}"
                    selected_date = datetime.datetime.strptime(date_with_year, "%b %d %Y").date()
                    
                    # Calculate start of week (Monday) and end of week (Sunday)
                    start_of_week = selected_date - datetime.timedelta(days=selected_date.weekday())
                    end_of_week = start_of_week + datetime.timedelta(days=6)
                    
                    result = start_of_week.strftime("%Y-%m-%d"), end_of_week.strftime("%Y-%m-%d")
                    print(f"DEBUG: Weekly date parsed - Start: {result[0]}, End: {result[1]}")
                    return result
            except (ValueError, AttributeError) as e:
                print(f"DEBUG: Weekly date parsing failed: {e}")
            fallback = today.strftime("%Y-%m-%d"), today.strftime("%Y-%m-%d")
            print(f"DEBUG: Using fallback - Start: {fallback[0]}, End: {fallback[1]}")
            return fallback
            
        elif periodicity == "Monthly":
            # Parse "Month YYYY" format
            try:
                selected_date = datetime.datetime.strptime(date_selection, "%B %Y").date()
                # First day of the month
                start_date = selected_date.replace(day=1)
                # Last day of the month
                if selected_date.month == 12:
                    end_date = selected_date.replace(year=selected_date.year + 1, month=1, day=1) - datetime.timedelta(days=1)
                else:
                    end_date = selected_date.replace(month=selected_date.month + 1, day=1) - datetime.timedelta(days=1)
                
                result = start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d")
                print(f"DEBUG: Monthly date parsed - Start: {result[0]}, End: {result[1]}")
                return result
            except ValueError as e:
                print(f"DEBUG: Monthly date parsing failed: {e}")
                # Default to current month
                start_date = today.replace(day=1)
                if today.month == 12:
                    end_date = today.replace(year=today.year + 1, month=1, day=1) - datetime.timedelta(days=1)
                else:
                    end_date = today.replace(month=today.month + 1, day=1) - datetime.timedelta(days=1)
                result = start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d")
                print(f"DEBUG: Using fallback - Start: {result[0]}, End: {result[1]}")
                return result
                
        elif periodicity == "Yearly":
            # Parse "YYYY" format
            try:
                year = int(date_selection)
                start_date = datetime.date(year, 1, 1)
                end_date = datetime.date(year, 12, 31)
                result = start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d")
                print(f"DEBUG: Yearly date parsed - Start: {result[0]}, End: {result[1]}")
                return result
            except ValueError as e:
                print(f"DEBUG: Yearly date parsing failed: {e}")
                # Default to current year
                start_date = datetime.date(today.year, 1, 1)
                end_date = datetime.date(today.year, 12, 31)
                result = start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d")
                print(f"DEBUG: Using fallback - Start: {result[0]}, End: {result[1]}")
                return result
        
        # Default fallback
        fallback = today.strftime("%Y-%m-%d"), today.strftime("%Y-%m-%d")
        print(f"DEBUG: Using default fallback - Start: {fallback[0]}, End: {fallback[1]}")
        return fallback
    
    def debug_database_content(self):
        """Debug function to check database content"""
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            # Check if table exists
            cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='expense'")
            table_exists = cursor.fetchone()
            print(f"DEBUG: Expense table exists: {table_exists is not None}")
            
            if table_exists:
                # Get all expenses
                cursor.execute("SELECT * FROM expense ORDER BY date DESC")
                all_expenses = cursor.fetchall()
                print(f"DEBUG: Total expense records: {len(all_expenses)}")
                
                for expense in all_expenses:
                    print(f"DEBUG: Expense record: {expense}")
                
                # Get table schema
                cursor.execute("PRAGMA table_info(expense)")
                schema = cursor.fetchall()
                print(f"DEBUG: Expense table schema: {schema}")
            
            conn.close()
            
        except sqlite3.Error as e:
            print(f"DEBUG: Database error during debug: {e}")
    
    def get_expenses_by_date_range(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Fetch expenses data based on periodicity and date selection
        Returns dictionary with total expenses and breakdown
        """
        print(f"\nDEBUG: ======== Getting expenses for {periodicity} - {date_selection} ========")
        
        # Debug database content first
        self.debug_database_content()
        
        start_date, end_date = self._parse_date_selection(periodicity, date_selection)
        
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            print(f"DEBUG: Querying expenses between {start_date} and {end_date}")
            
            # Get total expenses for the date range
            query = """
                SELECT 
                    COALESCE(SUM(expense_cost), 0) as total_expenses,
                    COUNT(*) as expense_count
                FROM expense 
                WHERE date BETWEEN ? AND ?
            """
            print(f"DEBUG: Executing query: {query}")
            print(f"DEBUG: Query parameters: {start_date}, {end_date}")
            
            cursor.execute(query, (start_date, end_date))
            result = cursor.fetchone()
            print(f"DEBUG: Query result: {result}")
            
            total_expenses = result[0] if result else 0
            expense_count = result[1] if result else 0
            
            print(f"DEBUG: Total expenses: {total_expenses}, Count: {expense_count}")
            
            # Get expenses breakdown by type
            cursor.execute("""
                SELECT 
                    expense_type,
                    SUM(expense_cost) as type_total,
                    COUNT(*) as type_count
                FROM expense 
                WHERE date BETWEEN ? AND ?
                GROUP BY expense_type
                ORDER BY type_total DESC
            """, (start_date, end_date))
            
            breakdown = cursor.fetchall()
            print(f"DEBUG: Breakdown by type: {breakdown}")
            
            # Get detailed expenses list
            cursor.execute("""
                SELECT 
                    expense_name,
                    expense_type,
                    expense_cost,
                    date,
                    employee_id
                FROM expense 
                WHERE date BETWEEN ? AND ?
                ORDER BY date DESC, expense_cost DESC
            """, (start_date, end_date))
            
            detailed_expenses = cursor.fetchall()
            print(f"DEBUG: Detailed expenses: {detailed_expenses}")
            
            conn.close()
            
            result_data = {
                'total_expenses': total_expenses,
                'expense_count': expense_count,
                'breakdown_by_type': [
                    {
                        'type': row[0],
                        'total': row[1],
                        'count': row[2]
                    } for row in breakdown
                ],
                'detailed_expenses': [
                    {
                        'name': row[0],
                        'type': row[1],
                        'cost': row[2],
                        'date': row[3],
                        'employee_id': row[4]
                    } for row in detailed_expenses
                ],
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                }
            }
            
            print(f"DEBUG: Final result data: {result_data}")
            return result_data
            
        except sqlite3.Error as e:
            print(f"DEBUG: Database error while fetching expenses: {e}")
            return {
                'total_expenses': 0,
                'expense_count': 0,
                'breakdown_by_type': [],
                'detailed_expenses': [],
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                },
                'error': str(e)
            }
    
    def get_revenue_by_date_range(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Fetch revenue data based on periodicity and date selection
        Returns dictionary with total revenue and breakdown
        """
        print(f"\nDEBUG: ======== Getting revenue for {periodicity} - {date_selection} ========")
        
        start_date, end_date = self._parse_date_selection(periodicity, date_selection)
        
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            print(f"DEBUG: Querying revenue between {start_date} and {end_date}")
            
            # Get total revenue for the date range
            query = """
                SELECT 
                    COALESCE(SUM(total_amount), 0) as total_revenue,
                    COUNT(*) as ticket_count,
                    COALESCE(AVG(total_amount), 0) as avg_ticket_value
                FROM ticket 
                WHERE DATE(ticket_date) BETWEEN ? AND ?
            """
            print(f"DEBUG: Executing revenue query: {query}")
            print(f"DEBUG: Query parameters: {start_date}, {end_date}")
            
            cursor.execute(query, (start_date, end_date))
            result = cursor.fetchone()
            print(f"DEBUG: Revenue query result: {result}")
            
            total_revenue = result[0] if result else 0
            ticket_count = result[1] if result else 0
            avg_ticket_value = result[2] if result else 0
            
            print(f"DEBUG: Total revenue: {total_revenue}, Ticket count: {ticket_count}, Avg ticket: {avg_ticket_value}")
            
            # Get revenue breakdown by payment method
            cursor.execute("""
                SELECT 
                    tp.payment_type,
                    SUM(tp.payment_amount) as payment_total,
                    COUNT(*) as payment_count
                FROM ticket_payment tp
                JOIN ticket t ON tp.ticket_id = t.ticket_id
                WHERE DATE(t.ticket_date) BETWEEN ? AND ?
                GROUP BY tp.payment_type
                ORDER BY payment_total DESC
            """, (start_date, end_date))
            
            payment_breakdown = cursor.fetchall()
            print(f"DEBUG: Payment breakdown: {payment_breakdown}")
            
            # Get revenue breakdown by product category
            cursor.execute("""
                SELECT 
                    p.category,
                    SUM(tl.unit_selling_price * tl.product_quantity) as category_revenue,
                    SUM(tl.product_quantity) as items_sold
                FROM ticket_line tl
                JOIN product_type pt ON tl.product_type_id = pt.product_type_id
                JOIN products p ON pt.product_id = p.product_id
                JOIN ticket t ON tl.ticket_id = t.ticket_id
                WHERE DATE(t.ticket_date) BETWEEN ? AND ?
                GROUP BY p.category
                ORDER BY category_revenue DESC
            """, (start_date, end_date))
            
            category_breakdown = cursor.fetchall()
            print(f"DEBUG: Category breakdown: {category_breakdown}")
            
            conn.close()
            
            result_data = {
                'total_revenue': float(total_revenue),
                'ticket_count': ticket_count,
                'avg_ticket_value': float(avg_ticket_value),
                'payment_breakdown': [
                    {
                        'payment_type': row[0],
                        'total': float(row[1]),
                        'count': row[2]
                    } for row in payment_breakdown
                ],
                'category_breakdown': [
                    {
                        'category': row[0],
                        'revenue': float(row[1]),
                        'items_sold': row[2]
                    } for row in category_breakdown
                ],
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                }
            }
            
            print(f"DEBUG: Final revenue data: {result_data}")
            return result_data
            
        except sqlite3.Error as e:
            print(f"DEBUG: Database error while fetching revenue: {e}")
            return {
                'total_revenue': 0,
                'ticket_count': 0,
                'avg_ticket_value': 0,
                'payment_breakdown': [],
                'category_breakdown': [],
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                },
                'error': str(e)
            }

    def get_costs_by_date_range(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Fetch cost data (COGS - Cost of Goods Sold) based on periodicity and date selection
        Returns dictionary with total costs and breakdown
        """
        print(f"\nDEBUG: ======== Getting costs for {periodicity} - {date_selection} ========")
        
        start_date, end_date = self._parse_date_selection(periodicity, date_selection)
        
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            print(f"DEBUG: Querying costs between {start_date} and {end_date}")
            
            # Get total cost of goods sold for the date range
            query = """
                SELECT 
                    COALESCE(SUM(pt.unit_price * tl.product_quantity), 0) as total_cogs
                FROM ticket_line tl
                JOIN product_type pt ON tl.product_type_id = pt.product_type_id
                JOIN ticket t ON tl.ticket_id = t.ticket_id
                WHERE DATE(t.ticket_date) BETWEEN ? AND ?
            """
            print(f"DEBUG: Executing COGS query: {query}")
            print(f"DEBUG: Query parameters: {start_date}, {end_date}")
            
            cursor.execute(query, (start_date, end_date))
            result = cursor.fetchone()
            print(f"DEBUG: COGS query result: {result}")
            
            total_cogs = result[0] if result else 0
            
            print(f"DEBUG: Total COGS: {total_cogs}")
            
            # Get COGS breakdown by product category
            cursor.execute("""
                SELECT 
                    p.category,
                    SUM(pt.unit_price * tl.product_quantity) as category_cogs,
                    SUM(tl.product_quantity) as items_sold
                FROM ticket_line tl
                JOIN product_type pt ON tl.product_type_id = pt.product_type_id
                JOIN products p ON pt.product_id = p.product_id
                JOIN ticket t ON tl.ticket_id = t.ticket_id
                WHERE DATE(t.ticket_date) BETWEEN ? AND ?
                GROUP BY p.category
                ORDER BY category_cogs DESC
            """, (start_date, end_date))
            
            cogs_breakdown = cursor.fetchall()
            print(f"DEBUG: COGS breakdown: {cogs_breakdown}")
            
            conn.close()
            
            result_data = {
                'total_cogs': float(total_cogs),
                'cogs_breakdown': [
                    {
                        'category': row[0],
                        'cogs': float(row[1]),
                        'items_sold': row[2]
                    } for row in cogs_breakdown
                ],
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                }
            }
            
            print(f"DEBUG: Final COGS data: {result_data}")
            return result_data
            
        except sqlite3.Error as e:
            print(f"DEBUG: Database error while fetching COGS: {e}")
            return {
                'total_cogs': 0,
                'cogs_breakdown': [],
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                },
                'error': str(e)
            }

    def get_sales_summary(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Get comprehensive sales summary including revenue, costs, expenses, and net profit
        Returns dictionary with all financial metrics
        """
        print(f"\nDEBUG: ======== Getting sales summary for {periodicity} - {date_selection} ========")
        
        # Fetch all data
        revenue_data = self.get_revenue_by_date_range(periodicity, date_selection)
        expense_data = self.get_expenses_by_date_range(periodicity, date_selection)
        costs_data = self.get_costs_by_date_range(periodicity, date_selection)
        
        # Calculate financial metrics
        total_revenue = revenue_data['total_revenue']
        total_cogs = costs_data['total_cogs']
        total_expenses = expense_data['total_expenses']
        
        # Gross Profit = Revenue - COGS
        gross_profit = total_revenue - total_cogs
        
        # Net Profit = Gross Profit - Operating Expenses
        net_profit = gross_profit - total_expenses
        
        # Calculate margins
        gross_margin = (gross_profit / total_revenue * 100) if total_revenue > 0 else 0
        net_margin = (net_profit / total_revenue * 100) if total_revenue > 0 else 0
        
        summary = {
            'total_revenue': total_revenue,
            'total_cogs': total_cogs,
            'total_expenses': total_expenses,
            'gross_profit': gross_profit,
            'net_profit': net_profit,
            'gross_margin': gross_margin,
            'net_margin': net_margin,
            'ticket_count': revenue_data['ticket_count'],
            'avg_ticket_value': revenue_data['avg_ticket_value'],
            'revenue_data': revenue_data,
            'expense_data': expense_data,
            'costs_data': costs_data,
            'date_range': {
                'start': revenue_data['date_range']['start'],
                'end': revenue_data['date_range']['end'],
                'periodicity': periodicity
            }
        }
        
        print(f"DEBUG: Sales summary calculated:")
        print(f"  Revenue: {self.format_currency(total_revenue)}")
        print(f"  COGS: {self.format_currency(total_cogs)}")
        print(f"  Expenses: {self.format_currency(total_expenses)}")
        print(f"  Gross Profit: {self.format_currency(gross_profit)} ({gross_margin:.1f}%)")
        print(f"  Net Profit: {self.format_currency(net_profit)} ({net_margin:.1f}%)")
        
        return summary

    def get_expense_comparison(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Get expense comparison with previous period
        Returns current vs previous period expenses
        """
        start_date, end_date = self._parse_date_selection(periodicity, date_selection)
        
        # Calculate previous period dates
        start_dt = datetime.datetime.strptime(start_date, "%Y-%m-%d").date()
        end_dt = datetime.datetime.strptime(end_date, "%Y-%m-%d").date()
        period_length = (end_dt - start_dt).days + 1
        
        prev_end_date = start_dt - datetime.timedelta(days=1)
        prev_start_date = prev_end_date - datetime.timedelta(days=period_length - 1)
        
        print(f"DEBUG: Comparison - Current: {start_date} to {end_date}, Previous: {prev_start_date.strftime('%Y-%m-%d')} to {prev_end_date.strftime('%Y-%m-%d')}")
        
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            # Current period expenses
            cursor.execute("""
                SELECT COALESCE(SUM(expense_cost), 0)
                FROM expense 
                WHERE date BETWEEN ? AND ?
            """, (start_date, end_date))
            current_expenses = cursor.fetchone()[0]
            
            # Previous period expenses
            cursor.execute("""
                SELECT COALESCE(SUM(expense_cost), 0)
                FROM expense 
                WHERE date BETWEEN ? AND ?
            """, (prev_start_date.strftime("%Y-%m-%d"), prev_end_date.strftime("%Y-%m-%d")))
            previous_expenses = cursor.fetchone()[0]
            
            conn.close()
            
            print(f"DEBUG: Comparison results - Current: {current_expenses}, Previous: {previous_expenses}")
            
            # Calculate change
            if previous_expenses > 0:
                change_amount = current_expenses - previous_expenses
                change_percentage = (change_amount / previous_expenses) * 100
            else:
                change_amount = current_expenses
                change_percentage = 100 if current_expenses > 0 else 0
            
            return {
                'current_expenses': current_expenses,
                'previous_expenses': previous_expenses,
                'change_amount': change_amount,
                'change_percentage': change_percentage,
                'current_period': f"{start_date} to {end_date}",
                'previous_period': f"{prev_start_date.strftime('%Y-%m-%d')} to {prev_end_date.strftime('%Y-%m-%d')}"
            }
            
        except sqlite3.Error as e:
            print(f"DEBUG: Database error while fetching expense comparison: {e}")
            return {
                'current_expenses': 0,
                'previous_expenses': 0,
                'change_amount': 0,
                'change_percentage': 0,
                'error': str(e)
            }
    
    def get_revenue_comparison(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Get revenue comparison with previous period
        Returns current vs previous period revenue
        """
        start_date, end_date = self._parse_date_selection(periodicity, date_selection)
        
        # Calculate previous period dates
        start_dt = datetime.datetime.strptime(start_date, "%Y-%m-%d").date()
        end_dt = datetime.datetime.strptime(end_date, "%Y-%m-%d").date()
        period_length = (end_dt - start_dt).days + 1
        
        prev_end_date = start_dt - datetime.timedelta(days=1)
        prev_start_date = prev_end_date - datetime.timedelta(days=period_length - 1)
        
        print(f"DEBUG: Revenue comparison - Current: {start_date} to {end_date}, Previous: {prev_start_date.strftime('%Y-%m-%d')} to {prev_end_date.strftime('%Y-%m-%d')}")
        
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            # Current period revenue
            cursor.execute("""
                SELECT COALESCE(SUM(total_amount), 0)
                FROM ticket 
                WHERE DATE(ticket_date) BETWEEN ? AND ?
            """, (start_date, end_date))
            current_revenue = cursor.fetchone()[0]
            
            # Previous period revenue
            cursor.execute("""
                SELECT COALESCE(SUM(total_amount), 0)
                FROM ticket 
                WHERE DATE(ticket_date) BETWEEN ? AND ?
            """, (prev_start_date.strftime("%Y-%m-%d"), prev_end_date.strftime("%Y-%m-%d")))
            previous_revenue = cursor.fetchone()[0]
            
            conn.close()
            
            print(f"DEBUG: Revenue comparison results - Current: {current_revenue}, Previous: {previous_revenue}")
            
            # Calculate change
            if previous_revenue > 0:
                change_amount = float(current_revenue) - float(previous_revenue)
                change_percentage = (change_amount / float(previous_revenue)) * 100
            else:
                change_amount = float(current_revenue)
                change_percentage = 100 if current_revenue > 0 else 0
            
            return {
                'current_revenue': float(current_revenue),
                'previous_revenue': float(previous_revenue),
                'change_amount': change_amount,
                'change_percentage': change_percentage,
                'current_period': f"{start_date} to {end_date}",
                'previous_period': f"{prev_start_date.strftime('%Y-%m-%d')} to {prev_end_date.strftime('%Y-%m-%d')}"
            }
            
        except sqlite3.Error as e:
            print(f"DEBUG: Database error while fetching revenue comparison: {e}")
            return {
                'current_revenue': 0,
                'previous_revenue': 0,
                'change_amount': 0,
                'change_percentage': 0,
                'error': str(e)
            }

    def get_net_profit_comparison(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Get net profit comparison with previous period
        Returns current vs previous period net profit
        """
        # Get current period summary
        current_summary = self.get_sales_summary(periodicity, date_selection)
        current_net_profit = current_summary['net_profit']
        
        # Calculate previous period dates
        start_date, end_date = self._parse_date_selection(periodicity, date_selection)
        start_dt = datetime.datetime.strptime(start_date, "%Y-%m-%d").date()
        end_dt = datetime.datetime.strptime(end_date, "%Y-%m-%d").date()
        period_length = (end_dt - start_dt).days + 1
        
        prev_end_date = start_dt - datetime.timedelta(days=1)
        prev_start_date = prev_end_date - datetime.timedelta(days=period_length - 1)
        
        # Create a date selection string for the previous period
        if periodicity == "Daily":
            prev_date_selection = prev_start_date.strftime("%B %d, %Y")
        elif periodicity == "Monthly":
            prev_date_selection = prev_start_date.strftime("%B %Y")
        elif periodicity == "Yearly":
            prev_date_selection = str(prev_start_date.year)
        else:
            # For weekly, use a simplified approach
            prev_date_selection = f"Week 1 ({prev_start_date.strftime('%b %d')})"
        
        try:
            # Get previous period summary
            prev_summary = self.get_sales_summary(periodicity, prev_date_selection)
            previous_net_profit = prev_summary['net_profit']
            
            print(f"DEBUG: Net profit comparison - Current: {current_net_profit}, Previous: {previous_net_profit}")
            
            # Calculate change
            if previous_net_profit != 0:
                change_amount = current_net_profit - previous_net_profit
                change_percentage = (change_amount / abs(previous_net_profit)) * 100
            else:
                change_amount = current_net_profit
                change_percentage = 100 if current_net_profit > 0 else 0
            
            return {
                'current_net_profit': current_net_profit,
                'previous_net_profit': previous_net_profit,
                'change_amount': change_amount,
                'change_percentage': change_percentage,
                'current_period': f"{start_date} to {end_date}",
                'previous_period': f"{prev_start_date.strftime('%Y-%m-%d')} to {prev_end_date.strftime('%Y-%m-%d')}"
            }
            
        except Exception as e:
            print(f"DEBUG: Error while calculating net profit comparison: {e}")
            return {
                'current_net_profit': current_net_profit,
                'previous_net_profit': 0,
                'change_amount': current_net_profit,
                'change_percentage': 100 if current_net_profit > 0 else 0,
                'error': str(e)
            }

    def get_sales_by_category(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Fetch sales data grouped by product category
        Returns dictionary with sales breakdown by category
        """
        print(f"\nDEBUG: ======== Getting sales by category for {periodicity} - {date_selection} ========")
        
        start_date, end_date = self._parse_date_selection(periodicity, date_selection)
        
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            print(f"DEBUG: Querying sales by category between {start_date} and {end_date}")
            
            # Get sales by category with detailed metrics
            query = """
                SELECT 
                    p.category,
                    COUNT(DISTINCT t.ticket_id) as tickets_count,
                    SUM(tl.product_quantity) as items_sold,
                    SUM(tl.unit_selling_price * tl.product_quantity) as total_revenue,
                    SUM(pt.unit_price * tl.product_quantity) as total_cogs,
                    AVG(tl.unit_selling_price) as avg_selling_price,
                    AVG(pt.unit_price) as avg_unit_cost
                FROM ticket_line tl
                JOIN product_type pt ON tl.product_type_id = pt.product_type_id
                JOIN products p ON pt.product_id = p.product_id
                JOIN ticket t ON tl.ticket_id = t.ticket_id
                WHERE DATE(t.ticket_date) BETWEEN ? AND ?
                GROUP BY p.category
                ORDER BY total_revenue DESC
            """
            print(f"DEBUG: Executing sales by category query: {query}")
            print(f"DEBUG: Query parameters: {start_date}, {end_date}")
            
            cursor.execute(query, (start_date, end_date))
            results = cursor.fetchall()
            print(f"DEBUG: Sales by category results: {results}")
            
            # Calculate totals for percentage calculations
            total_revenue = sum(row[3] for row in results)
            total_items = sum(row[2] for row in results)
            
            category_data = []
            for row in results:
                category, tickets_count, items_sold, revenue, cogs, avg_selling, avg_cost = row
                gross_profit = float(revenue) - float(cogs)
                gross_margin = (gross_profit / float(revenue) * 100) if revenue > 0 else 0
                revenue_percentage = (float(revenue) / total_revenue * 100) if total_revenue > 0 else 0
                items_percentage = (items_sold / total_items * 100) if total_items > 0 else 0
                
                category_data.append({
                    'category': category,
                    'tickets_count': tickets_count,
                    'items_sold': items_sold,
                    'total_revenue': float(revenue),
                    'total_cogs': float(cogs),
                    'gross_profit': gross_profit,
                    'gross_margin': gross_margin,
                    'avg_selling_price': float(avg_selling),
                    'avg_unit_cost': float(avg_cost),
                    'revenue_percentage': revenue_percentage,
                    'items_percentage': items_percentage
                })
            
            # Get top selling categories for chart
            top_categories = category_data[:5]  # Top 5 categories
            
            conn.close()
            
            result_data = {
                'category_breakdown': category_data,
                'top_categories': top_categories,
                'total_revenue': total_revenue,
                'total_items': total_items,
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                }
            }
            
            print(f"DEBUG: Final sales by category data: {result_data}")
            return result_data
            
        except sqlite3.Error as e:
            print(f"DEBUG: Database error while fetching sales by category: {e}")
            return {
                'category_breakdown': [],
                'top_categories': [],
                'total_revenue': 0,
                'total_items': 0,
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                },
                'error': str(e)
            }

    def get_sales_by_product(self, periodicity: str, date_selection: str) -> Dict[str, any]:
        """
        Fetch sales data grouped by specific products
        Returns dictionary with sales breakdown by individual products
        """
        print(f"\nDEBUG: ======== Getting sales by product for {periodicity} - {date_selection} ========")
        
        start_date, end_date = self._parse_date_selection(periodicity, date_selection)
        
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            print(f"DEBUG: Querying sales by product between {start_date} and {end_date}")
            
            # Get sales by individual products with detailed metrics
            query = """
                SELECT 
                    p.product_name,
                    p.category,
                    pt.size,
                    pt.temperature,
                    COUNT(DISTINCT t.ticket_id) as tickets_count,
                    SUM(tl.product_quantity) as items_sold,
                    SUM(tl.unit_selling_price * tl.product_quantity) as total_revenue,
                    SUM(pt.unit_price * tl.product_quantity) as total_cogs,
                    AVG(tl.unit_selling_price) as avg_selling_price,
                    AVG(pt.unit_price) as avg_unit_cost,
                    SUM(tl.extra_shots) as total_extra_shots,
                    SUM(tl.whipped_cream) as total_whipped_cream
                FROM ticket_line tl
                JOIN product_type pt ON tl.product_type_id = pt.product_type_id
                JOIN products p ON pt.product_id = p.product_id
                JOIN ticket t ON tl.ticket_id = t.ticket_id
                WHERE DATE(t.ticket_date) BETWEEN ? AND ?
                GROUP BY p.product_name, p.category, pt.size, pt.temperature, pt.product_type_id
                ORDER BY total_revenue DESC
            """
            print(f"DEBUG: Executing sales by product query: {query}")
            print(f"DEBUG: Query parameters: {start_date}, {end_date}")
            
            cursor.execute(query, (start_date, end_date))
            results = cursor.fetchall()
            print(f"DEBUG: Sales by product results: {results}")
            
            # Calculate totals for percentage calculations
            total_revenue = sum(row[6] for row in results)
            total_items = sum(row[5] for row in results)
            
            product_data = []
            for row in results:
                (product_name, category, size, temperature, tickets_count, items_sold, 
                 revenue, cogs, avg_selling, avg_cost, extra_shots, whipped_cream) = row
                
                gross_profit = float(revenue) - float(cogs)
                gross_margin = (gross_profit / float(revenue) * 100) if revenue > 0 else 0
                revenue_percentage = (float(revenue) / total_revenue * 100) if total_revenue > 0 else 0
                items_percentage = (items_sold / total_items * 100) if total_items > 0 else 0
                
                # Create product display name
                product_display = f"{product_name}"
                if size or temperature:
                    details = []
                    if size: details.append(size)
                    if temperature: details.append(temperature)
                    product_display += f" ({', '.join(details)})"
                
                product_data.append({
                    'product_name': product_name,
                    'product_display': product_display,
                    'category': category,
                    'size': size,
                    'temperature': temperature,
                    'tickets_count': tickets_count,
                    'items_sold': items_sold,
                    'total_revenue': float(revenue),
                    'total_cogs': float(cogs),
                    'gross_profit': gross_profit,
                    'gross_margin': gross_margin,
                    'avg_selling_price': float(avg_selling),
                    'avg_unit_cost': float(avg_cost),
                    'revenue_percentage': revenue_percentage,
                    'items_percentage': items_percentage,
                    'total_extra_shots': extra_shots,
                    'total_whipped_cream': whipped_cream
                })
            
            # Get top selling products for chart
            top_products = product_data[:10]  # Top 10 products
            
            conn.close()
            
            result_data = {
                'product_breakdown': product_data,
                'top_products': top_products,
                'total_revenue': total_revenue,
                'total_items': total_items,
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                }
            }
            
            print(f"DEBUG: Final sales by product data: {result_data}")
            return result_data
            
        except sqlite3.Error as e:
            print(f"DEBUG: Database error while fetching sales by product: {e}")
            return {
                'product_breakdown': [],
                'top_products': [],
                'total_revenue': 0,
                'total_items': 0,
                'date_range': {
                    'start': start_date,
                    'end': end_date,
                    'periodicity': periodicity
                },
                'error': str(e)
            }

    def get_sales_trend(self, periodicity: str, date_selection: str, periods: int = 7) -> Dict[str, any]:
        """
        Get sales trend data for chart display
        Returns revenue data for the specified number of periods
        """
        print(f"\nDEBUG: ======== Getting sales trend for {periodicity} - {date_selection} ========")
        
        try:
            conn = self._get_connection()
            cursor = conn.cursor()
            
            if periodicity == "Daily":
                # Get daily revenue for the last 'periods' days
                selected_date = datetime.datetime.strptime(date_selection, "%B %d, %Y").date()
                
                # Generate date range
                dates = [(selected_date - datetime.timedelta(days=i)) for i in range(periods-1, -1, -1)]
                
                trend_data = []
                for d in dates:
                    query = """
                        SELECT 
                            COALESCE(SUM(total_amount), 0) as daily_revenue,
                            COUNT(*) as daily_tickets
                        FROM ticket 
                        WHERE DATE(ticket_date) = ?
                    """
                    cursor.execute(query, (d.strftime("%Y-%m-%d"),))
                    result = cursor.fetchone()
                    
                    trend_data.append({
                        'date': d,
                        'label': d.strftime("%b %d"),
                        'revenue': float(result[0]) if result else 0,
                        'tickets': result[1] if result else 0
                    })
                    
            elif periodicity == "Monthly":
                # Get monthly revenue for the last 'periods' months
                selected_date = datetime.datetime.strptime(date_selection, "%B %Y").date()
                
                trend_data = []
                for i in range(periods-1, -1, -1):
                    # Calculate month
                    month_date = selected_date
                    if i > 0:
                        # Go back i months
                        year = selected_date.year
                        month = selected_date.month - i
                        while month <= 0:
                            month += 12
                            year -= 1
                        month_date = datetime.date(year, month, 1)
                    
                    # Get start and end of month
                    start_date = month_date.replace(day=1)
                    if month_date.month == 12:
                        end_date = month_date.replace(year=month_date.year + 1, month=1, day=1) - datetime.timedelta(days=1)
                    else:
                        end_date = month_date.replace(month=month_date.month + 1, day=1) - datetime.timedelta(days=1)
                    
                    query = """
                        SELECT 
                            COALESCE(SUM(total_amount), 0) as monthly_revenue,
                            COUNT(*) as monthly_tickets
                        FROM ticket 
                        WHERE DATE(ticket_date) BETWEEN ? AND ?
                    """
                    cursor.execute(query, (start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d")))
                    result = cursor.fetchone()
                    
                    trend_data.append({
                        'date': month_date,
                        'label': month_date.strftime("%b %Y"),
                        'revenue': float(result[0]) if result else 0,
                        'tickets': result[1] if result else 0
                    })
                    
            elif periodicity == "Yearly":
                # Get yearly revenue for the last 'periods' years
                selected_year = int(date_selection)
                
                trend_data = []
                for i in range(periods-1, -1, -1):
                    year = selected_year - i
                    
                    query = """
                        SELECT 
                            COALESCE(SUM(total_amount), 0) as yearly_revenue,
                            COUNT(*) as yearly_tickets
                        FROM ticket 
                        WHERE strftime('%Y', ticket_date) = ?
                    """
                    cursor.execute(query, (str(year),))
                    result = cursor.fetchone()
                    
                    trend_data.append({
                        'date': datetime.date(year, 1, 1),
                        'label': str(year),
                        'revenue': float(result[0]) if result else 0,
                        'tickets': result[1] if result else 0
                    })
                    
            else:  # Weekly - simplified approach
                # Get last few weeks of data
                selected_date = datetime.datetime.strptime(date_selection.split('(')[1].split(')')[0], "%b %d").date()
                selected_date = selected_date.replace(year=datetime.date.today().year)
                
                trend_data = []
                for i in range(periods-1, -1, -1):
                    week_start = selected_date - datetime.timedelta(weeks=i)
                    week_end = week_start + datetime.timedelta(days=6)
                    
                    query = """
                        SELECT 
                            COALESCE(SUM(total_amount), 0) as weekly_revenue,
                            COUNT(*) as weekly_tickets
                        FROM ticket 
                        WHERE DATE(ticket_date) BETWEEN ? AND ?
                    """
                    cursor.execute(query, (week_start.strftime("%Y-%m-%d"), week_end.strftime("%Y-%m-%d")))
                    result = cursor.fetchone()
                    
                    trend_data.append({
                        'date': week_start,
                        'label': f"Week {i+1}",
                        'revenue': float(result[0]) if result else 0,
                        'tickets': result[1] if result else 0
                    })
            
            conn.close()
            
            result_data = {
                'trend_data': trend_data,
                'total_revenue': sum(item['revenue'] for item in trend_data),
                'total_tickets': sum(item['tickets'] for item in trend_data),
                'avg_revenue': sum(item['revenue'] for item in trend_data) / len(trend_data) if trend_data else 0,
                'periodicity': periodicity,
                'periods': periods
            }
            
            print(f"DEBUG: Sales trend data: {result_data}")
            return result_data
            
        except Exception as e:
            print(f"DEBUG: Error while fetching sales trend: {e}")
            return {
                'trend_data': [],
                'total_revenue': 0,
                'total_tickets': 0,
                'avg_revenue': 0,
                'periodicity': periodicity,
                'periods': periods,
                'error': str(e)
            }

    def format_currency(self, amount: float) -> str:
        """Format amount as Philippine Peso currency"""
        return f"₱ {amount:,.2f}"
    
    def format_change_display(self, change_amount: float, change_percentage: float) -> Tuple[str, str]:
        """
        Format change display text and determine color
        Returns tuple of (change_text, color)
        """
        if change_amount > 0:
            change_text = f"+{self.format_currency(change_amount)} (+{change_percentage:.1f}%)"
            color = "#c30e0e"  # Red for increased expenses (negative for business)
        elif change_amount < 0:
            change_text = f"{self.format_currency(change_amount)} ({change_percentage:.1f}%)"
            color = "#7a9c33"  # Green for decreased expenses (positive for business)
        else:
            change_text = "No change"
            color = "#4e2d18"  # Neutral color
        
        return change_text, color