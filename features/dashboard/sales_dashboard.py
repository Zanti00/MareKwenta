import customtkinter as ctk
from tkinter import StringVar
import datetime
import calendar
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
from nav_bar import Navbar
from sales_dashboard_controller import SalesDashboardController


class SalesDashboard(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="admin"):
        super().__init__(parent)
        self.main_app = main_app
        self.user_role = user_role
        self.controller = SalesDashboardController()
        
        taskbar_height = 70
        screen_width = self.winfo_screenwidth()
        screen_height = self.winfo_screenheight()
        usable_height = screen_height - taskbar_height
        self.configure(fg_color="#f2efea")

        # Title Label
        self.title_label = ctk.CTkLabel(
            self, text="Dashboard", font=("Unbounded", 36, "bold"), text_color="#4e2d18"
        )
        self.title_label.pack(anchor="nw", padx=30, pady=(10, 0))

        # Filter Frame
        self.filter_frame = ctk.CTkFrame(self, fg_color="#f2efea")
        self.filter_frame.pack(anchor="nw", padx=30, pady=(20, 0))

        self.sales_type_var = StringVar(value="Sales Summary")
        self.sales_type_combo = ctk.CTkComboBox(
            self.filter_frame,
            values=["Sales Summary", "Sales by Category", "Sales by Product"],
            variable=self.sales_type_var,
            width=209, height=40, border_color="lightgray", border_width=2,
            corner_radius=8, fg_color="#f2efea", button_color="lightgray",
            button_hover_color="#6b3b1f",
            dropdown_fg_color="#f2efea", dropdown_hover_color="#f0f0f0",
            dropdown_text_color="#4e2d18",
            text_color="#4e2d18", font=("Inter", 13),
            command=self.on_sales_type_change
        )
        self.sales_type_combo.grid(row=0, column=0, padx=(20))

        self.periodicity_var = StringVar(value="Daily")
        self.periodicity_combo = ctk.CTkComboBox(
            self.filter_frame,
            values=["Daily", "Weekly", "Monthly", "Yearly"],
            variable=self.periodicity_var,
            width=209,height=40, border_color="lightgray", border_width=2,
            corner_radius=8, fg_color="#f2efea",
            button_color="lightgray", button_hover_color="#6b3b1f",
            dropdown_fg_color="#f2efea", dropdown_hover_color="#f0f0f0",
            dropdown_text_color="#4e2d18", text_color="#4e2d18",
            font=("Inter", 13),
            command=self.on_periodicity_change
        )
        self.periodicity_combo.grid(row=0, column=1, padx=(20))

        self.date_var = StringVar(value="Select Date")
        self.date_combo = ctk.CTkComboBox(
            self.filter_frame,
            values=[],
            variable=self.date_var,
            width=209, height=40, border_color="lightgray", border_width=2,
            corner_radius=8, fg_color="#f2efea", button_color="lightgray", button_hover_color="#6b3b1f",
            dropdown_fg_color="#f2efea", dropdown_hover_color="#f0f0f0", dropdown_text_color="#4e2d18",
            text_color="#4e2d18",
            font=("Inter", 13)
        )
        self.date_combo.grid(row=0, column=2, padx=(20))

        self.generate_button = ctk.CTkButton(
            self.filter_frame,
            text="Generate",
            width=129, height=40, fg_color="#4e2d18", hover_color="#3b1f11",
            text_color="#f2efea", font=("Inter", 13, "bold"), corner_radius=8,
            command=self.on_generate
        )
        self.generate_button.grid(row=0, column=3, padx=20)

        # Main Panel 
        self.dashboard_panel = ctk.CTkFrame(self, fg_color="#f2efea", corner_radius=20)
        self.dashboard_panel.pack(fill="both", expand=True, padx=0, pady=0)

        # --- Summary Cards  ---
        self.cards_frame = ctk.CTkFrame(self.dashboard_panel, fg_color="#fff")
        self.cards_frame.place(relx=0.5, rely=0.08, anchor="n", relwidth=0.85)

        self.card_data = [
            {"label": "Revenue", "value": "₱ 287.00", "change": "+₱287.00 (+100%)", "color": "#4e2d18", "change_color": "#7a9c33"},
            {"label": "Net Profit", "value": "₱ 200.00", "change": "+₱20,000.00", "color": "#4e2d18", "change_color": "#7a9c33"},
            {"label": "Expenses", "value": "₱ 0.00", "change": "No data", "color": "#4e2d18", "change_color": "#4e2d18"},
        ]
        self.card_labels = []
        self.card_title_labels = []  # Store references to card title labels
        for i, card in enumerate(self.card_data):
            self.cards_frame.grid_columnconfigure(i, weight=1)  # Make each column expand
            card_frame = ctk.CTkFrame(self.cards_frame, fg_color="#fff", corner_radius=16, height=80)
            card_frame.grid(row=0, column=i, padx=10, pady=5, sticky="nsew")
            value_label = ctk.CTkLabel(card_frame, text=card["value"], font=("Poppins", 20, "bold"), text_color=card["color"])
            value_label.pack(pady=(10, 0))
            label_label = ctk.CTkLabel(card_frame, text=card["label"], font=("Poppins", 12, "bold"), text_color=card["color"])
            label_label.pack()
            change_label = ctk.CTkLabel(card_frame, text=card["change"], font=("Poppins", 10), text_color=card["change_color"])
            change_label.pack()
            self.card_labels.append((value_label, change_label))
            self.card_title_labels.append(label_label)

        # --- Chart  ---
        chart_frame = ctk.CTkFrame(self.dashboard_panel, fg_color="#fff")
        chart_frame.place(relx=0.5, rely=0.2, anchor="n", relwidth=0.85, relheight=0.75)

        self.fig = Figure(figsize=(7, 3), dpi=100)
        self.ax = self.fig.add_subplot(111)
        x_labels = ["Month, 01", "Month, 02", "Month, 03", "Month, 04", "Month, 05"]
        y_values = [0, 100, 0, 200, 50]
        self.ax.plot(x_labels, y_values, marker='o', color="#4e2d18")
        self.ax.set_title("Gross Sales")
        self.ax.set_ylabel("₱")
        self.ax.grid(True, linestyle='--', alpha=0.5)
        self.canvas = FigureCanvasTkAgg(self.fig, master=chart_frame)
        self.canvas.draw()
        self.canvas.get_tk_widget().pack(fill="both", expand=True)
 
        # Initialize the dashboard with current data
        self.on_periodicity_change("Daily")
        
        # Load real data immediately after initialization
        # Wait a brief moment for the UI to be fully initialized, then update with real data
        self.after(100, self.update_data)

    def update_data(self):
        """Update dashboard data including revenue, net profit, and expenses from database"""
        category = self.sales_type_var.get()
        periodicity = self.periodicity_var.get()
        date = self.date_var.get()

        print(f"Generating report for {category}, {periodicity}, {date}")
        
        # Fetch comprehensive financial data from database
        sales_summary = self.controller.get_sales_summary(periodicity, date)
        revenue_comparison = self.controller.get_revenue_comparison(periodicity, date)
        expense_comparison = self.controller.get_expense_comparison(periodicity, date)
        net_profit_comparison = self.controller.get_net_profit_comparison(periodicity, date)
        
        # Format values for display
        revenue_value = self.controller.format_currency(sales_summary['total_revenue'])
        net_profit_value = self.controller.format_currency(sales_summary['net_profit'])
        expense_value = self.controller.format_currency(sales_summary['total_expenses'])
        
        # Format change displays
        revenue_change_text, revenue_change_color = self.controller.format_change_display(
            revenue_comparison['change_amount'], 
            revenue_comparison['change_percentage']
        )
        
        net_profit_change_text, net_profit_change_color = self.controller.format_change_display(
            net_profit_comparison['change_amount'], 
            net_profit_comparison['change_percentage']
        )
        
        expense_change_text, expense_change_color = self.controller.format_change_display(
            expense_comparison['change_amount'], 
            expense_comparison['change_percentage']
        )
        
        # Update card displays based on sales type selection
        if category == "Sales by Category":
            # Update card titles for category view
            self.card_title_labels[0].configure(text="Revenue")
            self.card_title_labels[1].configure(text="Items Sold")
            self.card_title_labels[2].configure(text="Expenses")
            
            # Get category data for card updates
            category_data = self.controller.get_sales_by_category(periodicity, date)
            if category_data['category_breakdown']:
                top_category = category_data['category_breakdown'][0]
                total_revenue = category_data['total_revenue']
                total_items = category_data['total_items']
                
                # Update cards with category-specific data
                self.card_labels[0][0].configure(text=self.controller.format_currency(total_revenue))  # Revenue
                self.card_labels[1][0].configure(text=f"{total_items}")  # Items sold instead of net profit
                self.card_labels[2][0].configure(text=expense_value)  # Expenses
                
                # Update change labels
                self.card_labels[0][1].configure(text=revenue_change_text, text_color=revenue_change_color)
                self.card_labels[1][1].configure(text=f"Top: {top_category['category']} ({top_category['revenue_percentage']:.1f}%)", text_color="#4e2d18")
                self.card_labels[2][1].configure(text=expense_change_text, text_color=expense_change_color)
                
        elif category == "Sales by Product":
            # Update card titles for product view
            self.card_title_labels[0].configure(text="Revenue")
            self.card_title_labels[1].configure(text="Items Sold")
            self.card_title_labels[2].configure(text="Expenses")
            
            # Get product data for card updates
            product_data = self.controller.get_sales_by_product(periodicity, date)
            if product_data['product_breakdown']:
                top_product = product_data['product_breakdown'][0]
                total_revenue = product_data['total_revenue']
                total_items = product_data['total_items']
                
                # Update cards with product-specific data
                self.card_labels[0][0].configure(text=self.controller.format_currency(total_revenue))  # Revenue
                self.card_labels[1][0].configure(text=f"{total_items}")  # Items sold instead of net profit
                self.card_labels[2][0].configure(text=expense_value)  # Expenses
                
                # Update change labels
                self.card_labels[0][1].configure(text=revenue_change_text, text_color=revenue_change_color)
                top_product_name = top_product['product_display'][:15] + "..." if len(top_product['product_display']) > 15 else top_product['product_display']
                self.card_labels[1][1].configure(text=f"Top: {top_product_name}", text_color="#4e2d18")
                self.card_labels[2][1].configure(text=expense_change_text, text_color=expense_change_color)
                
        else:  # Sales Summary
            # Update card titles for summary view
            self.card_title_labels[0].configure(text="Revenue")
            self.card_title_labels[1].configure(text="Net Profit")
            self.card_title_labels[2].configure(text="Expenses")
            
            # Update cards with comprehensive financial data
            self.card_labels[0][0].configure(text=revenue_value)  # Revenue value
            self.card_labels[1][0].configure(text=net_profit_value)  # Net Profit value
            self.card_labels[2][0].configure(text=expense_value)  # Expenses value
            
            # Update change labels with real data
            self.card_labels[0][1].configure(text=revenue_change_text, text_color=revenue_change_color)  # Revenue change
            self.card_labels[1][1].configure(text=net_profit_change_text, text_color=net_profit_change_color)  # Net Profit change
            self.card_labels[2][1].configure(text=expense_change_text, text_color=expense_change_color)  # Expenses change
        
        # Print financial details for debugging
        print(f"Financial summary for {periodicity} period '{date}':")
        print(f"Total Revenue: {revenue_value}")
        print(f"Total Expenses: {expense_value}")
        print(f"Net Profit: {net_profit_value}")
        print(f"Ticket Count: {sales_summary['ticket_count']}")
        print(f"Average Ticket Value: {self.controller.format_currency(sales_summary['avg_ticket_value'])}")
        print(f"Gross Profit: {self.controller.format_currency(sales_summary['gross_profit'])}")
        print(f"Gross Margin: {sales_summary['gross_margin']:.1f}%")
        print(f"Net Margin: {sales_summary['net_margin']:.1f}%")
        
        print(f"\nChanges from previous period:")
        print(f"Revenue change: {revenue_change_text}")
        print(f"Net Profit change: {net_profit_change_text}")
        print(f"Expense change: {expense_change_text}")
        
        if sales_summary['expense_data']['breakdown_by_type']:
            print("\nExpense breakdown by type:")
            for breakdown in sales_summary['expense_data']['breakdown_by_type']:
                print(f"  {breakdown['type']}: {self.controller.format_currency(breakdown['total'])} ({breakdown['count']} items)")
                
        if sales_summary['revenue_data']['category_breakdown']:
            print("\nRevenue breakdown by category:")
            for breakdown in sales_summary['revenue_data']['category_breakdown']:
                print(f"  {breakdown['category']}: {self.controller.format_currency(breakdown['revenue'])} ({breakdown['items_sold']} items)")
        
        # Update chart based on selected category using dedicated methods
        self.fig.clf()
        
        if category == "Sales by Product":
            self.create_product_chart(periodicity, date)
        elif category == "Sales by Category":
            self.create_category_chart(periodicity, date)
        else:  # Sales Summary
            self.create_sales_summary_chart(periodicity, date, sales_summary)
                
        # Apply font settings to all labels
        for label in self.ax.get_xticklabels() + self.ax.get_yticklabels():
            label.set_fontname('Poppins')
            label.set_fontsize(10)
        self.canvas.draw()

    def create_sales_summary_chart(self, periodicity, date, sales_summary):
        """Create chart for Sales Summary view"""
        self.ax = self.fig.add_subplot(111)
        lighter_brown = '#bfa074'
        
        try:
            # Get trend data from controller
            trend_data = self.controller.get_sales_trend(periodicity, date, periods=7)
            
            if trend_data['trend_data']:
                labels = [item['label'] for item in trend_data['trend_data']]
                revenues = [item['revenue'] for item in trend_data['trend_data']]
                
                # Create line chart
                self.ax.plot(labels, revenues, marker='o', color=lighter_brown, linewidth=2, markersize=6)
                self.ax.set_title("Revenue Trend", fontname='Poppins', fontsize=14, fontweight='bold')
                self.ax.set_ylabel("Revenue (₱)", fontname='Poppins', fontsize=12)
                self.ax.grid(True, linestyle='--', alpha=0.5)
                
                # Highlight current period
                if len(revenues) > 0:
                    current_revenue = revenues[-1]
                    self.ax.plot(labels[-1], current_revenue, marker='o', color='#c30e0e', markersize=8)
                
                # Format y-axis labels to show currency
                y_ticks = self.ax.get_yticks()
                self.ax.set_yticklabels([f"₱{int(tick):,}" for tick in y_ticks])
                
                # Rotate x-axis labels if too many
                if len(labels) > 5:
                    self.ax.tick_params(axis='x', rotation=45)
                
                print(f"\nRevenue trend for {periodicity} period:")
                for item in trend_data['trend_data']:
                    print(f"  {item['label']}: {self.controller.format_currency(item['revenue'])} ({item['tickets']} tickets)")
                    
            else:
                # Fallback chart with current period data
                self.ax.bar(['Current Period'], [sales_summary['total_revenue']], color=lighter_brown)
                self.ax.set_title("Current Period Revenue", fontname='Poppins', fontsize=14, fontweight='bold')
                self.ax.set_ylabel("Revenue (₱)", fontname='Poppins', fontsize=12)
                
                # Format y-axis
                y_ticks = self.ax.get_yticks()
                self.ax.set_yticklabels([f"₱{int(tick):,}" for tick in y_ticks])
                
        except Exception as e:
            print(f"Error creating sales summary chart: {e}")
            # Simple fallback
            self.ax.bar(['Current'], [sales_summary['total_revenue']], color=lighter_brown)
            self.ax.set_title("Revenue", fontname='Poppins', fontsize=14, fontweight='bold')
            self.ax.set_ylabel("₱", fontname='Poppins', fontsize=12)

    def create_category_chart(self, periodicity, date):
        """Create chart for Sales by Category view"""
        self.ax = self.fig.add_subplot(111)
        lighter_brown = '#bfa074'
        
        # Fetch real category sales data
        category_data = self.controller.get_sales_by_category(periodicity, date)
        
        if category_data['category_breakdown']:
            categories = [cat['category'] for cat in category_data['category_breakdown']]
            revenues = [cat['total_revenue'] for cat in category_data['category_breakdown']]
            items_sold = [cat['items_sold'] for cat in category_data['category_breakdown']]
            
            # Create bar chart
            bars = self.ax.bar(categories, items_sold, color=lighter_brown)
            self.ax.set_title("Sales by Category", fontname='Poppins', fontsize=14, fontweight='bold')
            self.ax.set_ylabel("Items Sold", fontname='Poppins', fontsize=12)
            self.ax.grid(axis='y', linestyle='--', alpha=0.5)
            
            # Add value labels on bars
            for bar, revenue, items in zip(bars, revenues, items_sold):
                height = bar.get_height()
                self.ax.text(bar.get_x() + bar.get_width()/2., height + height*0.01,
                           f'{items}\n{self.controller.format_currency(revenue)}',
                           ha='center', va='bottom', fontname='Poppins', fontsize=9)
            
            # Print category details
            print(f"\nSales by category for {periodicity} period '{date}':")
            for cat in category_data['category_breakdown']:
                print(f"  {cat['category']}: {self.controller.format_currency(cat['total_revenue'])} ({cat['items_sold']} items, {cat['gross_margin']:.1f}% margin)")
        else:
            # Fallback if no data
            self.ax.text(0.5, 0.5, 'No category sales data available', 
                       horizontalalignment='center', verticalalignment='center',
                       fontname='Poppins', fontsize=14)
            self.ax.set_title("Sales by Category", fontname='Poppins', fontsize=14, fontweight='bold')

    def create_product_chart(self, periodicity, date):
        """Create chart for Sales by Product view"""
        self.ax = self.fig.add_subplot(111)
        
        # Fetch real product sales data
        product_data = self.controller.get_sales_by_product(periodicity, date)
        
        if product_data['top_products']:
            # Get top 8 products for the pie chart
            top_products = product_data['top_products'][:8]
            labels = [product['product_display'] for product in top_products]
            sizes = [product['revenue_percentage'] for product in top_products]
            
            # Generate colors for products
            colors = ["#4e2d18", "#7a9c33", "#c30e0e", "#0091f7", "#ff6b6b", "#4ecdc4", "#45b7d1", "#96ceb4"]
            
            # Create pie chart
            wedges, texts, autotexts = self.ax.pie(
                sizes, labels=labels, colors=colors[:len(labels)], 
                autopct='%1.1f%%', startangle=140, 
                textprops={'fontname': 'Poppins', 'fontsize': 10}
            )
            self.ax.set_title("Sales by Product", fontname='Poppins', fontsize=14, fontweight='bold')
            
            # Print product details
            print(f"\nTop selling products for {periodicity} period '{date}':")
            for product in top_products:
                print(f"  {product['product_display']}: {self.controller.format_currency(product['total_revenue'])} ({product['items_sold']} sold)")
        else:
            # Fallback if no data
            self.ax.text(0.5, 0.5, 'No product sales data available', 
                       horizontalalignment='center', verticalalignment='center',
                       fontname='Poppins', fontsize=14)
            self.ax.set_title("Sales by Product", fontname='Poppins', fontsize=14, fontweight='bold')

    # ...existing code...

    def on_periodicity_change(self, value):
        periodicity = self.periodicity_var.get()
        today = datetime.date.today()
        options = []
        if periodicity == "Daily":
            year = today.year
            month = today.month
            num_days = calendar.monthrange(year, month)[1]
            options = [today.replace(day=day).strftime("%B %d, %Y") for day in range(1, num_days+1)]
        elif periodicity == "Weekly":
            year = today.year
            month = today.month
            first_day = today.replace(day=1)
            last_day = today.replace(day=calendar.monthrange(year, month)[1])
            weeks = []
            current = first_day
            while current <= last_day:
                week_num = ((current.day - 1) // 7) + 1
                week_label = f"Week {week_num} ({current.strftime('%b %d')})"
                if week_label not in weeks:
                    weeks.append(week_label)
                current += datetime.timedelta(days=7 - current.weekday())
            options = weeks
        elif periodicity == "Monthly":
            year = today.year
            options = [datetime.date(year, m, 1).strftime("%B %Y") for m in range(1, 13)]
        elif periodicity == "Yearly":
            current_year = today.year
            options = [str(y) for y in range(2020, current_year+1)]
        else:
            options = ["Select Date"]
        self.date_combo.configure(values=options)
        if options:
            self.date_var.set(options[0])
        else:
            self.date_var.set("Select Date")

    def on_generate(self):
        """Handle generate button click - fetch and display expense data"""
        self.update_data()
        print("Generate button clicked")
        print(f"Sales Type: {self.sales_type_var.get()}")
        print(f"Periodicity: {self.periodicity_var.get()}")
        print(f"Date: {self.date_var.get()}")

    def on_sales_type_change(self, value):
        """Handle sales type dropdown change - automatically update the view"""
        print(f"Sales type changed to: {value}")
        # Automatically update the display when sales type changes
        self.update_data()

    def show_ticket(self):
        self.main_app.show_frame("ticket")

    def show_receipt(self):
        self.main_app.show_frame("receipt")

    def show_inventory(self):
        self.main_app.show_frame("inventory")

    def show_staff(self):
        self.main_app.show_frame("staff")

    def show_cashbox(self):
        self.main_app.show_frame("cashbox")

    def show_dashboard(self):
        self.main_app.show_frame("dashboard")


if __name__ == "__main__":
    import tkinter as tk
    root = tk.Tk()
    # Replace 'main_app' with 'root' as parent, and pass 'root' as main_app if needed
    app = SalesDashboard(parent=root, main_app=root)
    app.pack(fill="both", expand=True)
    root.mainloop()