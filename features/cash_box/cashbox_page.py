import customtkinter as ctk
from tkinter import messagebox
from datetime import datetime
import tkinter as tk
import math
from nav_bar import Navbar
from cash_box.cashbox_controller import CashboxController
from .add_expense import AddExpenseDialog
from .edit_expense import EditExpenseDialog

class CashBoxApp(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="employee"):
        super().__init__(parent)
        self.configure(fg_color="#f2efea")
        self.main_app = main_app
        self.user_role = user_role
        # For now, using a hardcoded employee_id. In a real app, this would come from login.
        self.employee_id = 1 

        self.controller = CashboxController()
        self.current_date = datetime.now().strftime('%Y-%m-%d')
        self.update_cashbox_data()
        
        # Configure grid weights for main layout
        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # Bind window close event
        # self.protocol("WM_DELETE_WINDOW", self.on_closing)
        
        self.setup_ui()
        self.refresh_expense_list() # Initial load of expenses
        
    def update_cashbox_data(self):
        """Fetches and updates all cashbox related data from the controller."""
        cashbox_data = self.controller.get_cashbox_summary_by_date(self.current_date)
        self.cash_amount = cashbox_data['cash_amount']
        self.gcash_amount = cashbox_data['gcash_amount'] 
        self.maya_amount = cashbox_data['maya_amount']
        self.petty_cash_amount = 1000.00 # This might still be hardcoded or managed differently
        self.cash_sales_amount = cashbox_data['cash_sales_amount']
        self.cash_expenses_amount = cashbox_data['cash_expenses_amount']
        self.non_cash_expenses_amount = cashbox_data['non_cash_expenses_amount']
        # Calculate net profit as: (cash + gcash + maya) - (cash expenses + non-cash expenses)
        # This will be displayed as "NET PROFIT" in the UI
        self.net_profit = (self.cash_amount + self.gcash_amount + self.maya_amount) - (self.cash_expenses_amount + self.non_cash_expenses_amount)
        self.expenses = self.controller.get_expenses_by_date(self.current_date)

    def on_closing(self):
        """Handle window closing"""
        try:
            self.quit()
            self.destroy()
        except:
            pass
        
    def setup_ui(self):
        self.main_frame = ctk.CTkFrame(self, fg_color="#f2efea")
        self.main_frame.grid(row=0, column=1, sticky="nsew", padx=(20, 20), pady=20)
        self.main_frame.grid_columnconfigure(0, weight=1)
        self.main_frame.grid_rowconfigure(1, weight=1)
        self.setup_header()
        self.setup_content()

    def setup_header(self):
        header_frame = ctk.CTkFrame(
            self.main_frame, 
            fg_color="#f2efea",
            corner_radius=20,
            border_width=0
        )
        header_frame.grid(row=0, column=0, sticky="ew", padx=20, pady=20)
        header_frame.grid_columnconfigure(0, weight=1)
        header_frame.grid_columnconfigure(1, weight=0)
        header_label = ctk.CTkLabel(
            header_frame,
            text="Cash Box",
            font=ctk.CTkFont(family="Unbounded", size=36, weight="bold"),
            text_color="#4d2d18"
        )
        header_label.grid(row=0, column=0, sticky="w", padx=30, pady=20)
        date_frame = ctk.CTkFrame(
            header_frame,
            width=283,
            height=48,
            fg_color="#f2efea",
            border_width=1,
            border_color="#4d2d18",
            corner_radius=10
        )
        date_frame.grid(row=0, column=1, padx=30, pady=20, sticky="e")
        date_frame.grid_propagate(False)
        current_date_formatted = datetime.now().strftime("%B %d, %Y")
        date_label = ctk.CTkLabel(
            date_frame,
            text="DATE:",
            font=ctk.CTkFont(family="Inter", size=18),
            text_color="#4d2d18"
        )
        date_label.place(x=8, y=11)
        date_value_label = ctk.CTkLabel(
            date_frame,
            text=current_date_formatted,
            font=ctk.CTkFont(family="Inter", size=18, weight="bold"),
            text_color="#4d2d18"
        )
        date_value_label.place(x=70, y=11)
        
    def setup_content(self):
        content_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        content_frame.grid(row=1, column=0, sticky="nsew", padx=20, pady=(0, 20))
        content_frame.grid_columnconfigure(0, weight=1)
        content_frame.grid_columnconfigure(1, weight=1)
        content_frame.grid_rowconfigure(0, weight=1)
        
        self.setup_payment_cards(content_frame)
        self.setup_expense_section(content_frame)
        
    def setup_payment_cards(self, parent):
        # Container for payment cards with soft shadow and rounded corners
        cards_container = ctk.CTkFrame(
            parent,
            fg_color="#f7f3ee",
            corner_radius=24,
            border_width=2,
            border_color="#e0ded8"
        )
        cards_container.grid(row=0, column=0, sticky="nsew", padx=(0, 16), pady=(10, 10))
        cards_container.grid_propagate(False)
        cards_container.grid_rowconfigure(0, weight=1)
        cards_container.grid_columnconfigure(0, weight=1)
        # Inner grid for cards: 2 columns, 4 rows
        cards_frame = ctk.CTkFrame(cards_container, fg_color="transparent")
        cards_frame.grid(row=0, column=0, sticky="nsew", padx=24, pady=24)
        for i in range(4):
            cards_frame.grid_rowconfigure(i, weight=1, uniform="row")
        for i in range(2):
            cards_frame.grid_columnconfigure(i, weight=1, uniform="col")
        
        # Update payment methods with current data
        payment_methods = [
            ("CASH", self.cash_amount, "#6B3F19", "cash.png"),
            ("GCASH", self.gcash_amount, "#0091f7", "gcash.png"),
            ("PETTY CASH", self.petty_cash_amount, "#6B3F19", "cash.png"),
            ("MAYA", self.maya_amount, "#00894c", "maya.png"),
            ("NET PROFIT", self.net_profit, "#6B3F19", "cash.png"),
            ("CASH EXPENSES", self.cash_expenses_amount, "#6B3F19", "cash.png"),
            ("NON - CASH EXPENSES", self.non_cash_expenses_amount, "#6B3F19", "cash.png"),
        ]
        # Arrange as 2 columns: first 6 cards in rows 0-2
        for idx, (method, amount, color, icon_file) in enumerate(payment_methods[:6]):
            row = idx // 2
            col = idx % 2
            self.create_soft_card(cards_frame, row, col, method, amount, color, icon_file)
        # Last card (NON - CASH EXPENSES) spans both columns in last row
        self.create_soft_card(cards_frame, 3, 0, payment_methods[6][0], payment_methods[6][1], payment_methods[6][2], payment_methods[6][3], colspan=2)

    def create_soft_card(self, parent, row, col, title, amount, color, icon_file, colspan=1):
        import os
        from PIL import Image
        from customtkinter import CTkImage
        card_frame = ctk.CTkFrame(
            parent,
            fg_color="#fff",
            border_width=1,
            border_color="#e0ded8",
            corner_radius=16,
            width=320,
            height=90
        )
        card_frame.grid(row=row, column=col, columnspan=colspan, sticky="nsew", padx=14, pady=10)
        card_frame.grid_propagate(False)
        card_frame.grid_rowconfigure(0, weight=1)
        card_frame.grid_rowconfigure(1, weight=2)
        card_frame.grid_columnconfigure(0, weight=1)
        card_frame.grid_columnconfigure(1, weight=0)
        # Icon (right, top)
        icon_img = None
        icon_label = None
        try:
            assets_dir = os.path.join(os.path.dirname(__file__), "../assets")
            icon_path = os.path.join(assets_dir, icon_file)
            if os.path.exists(icon_path):
                img = Image.open(icon_path).resize((22, 22))
                icon_img = CTkImage(light_image=img, dark_image=img, size=(22, 22))
                icon_label = ctk.CTkLabel(card_frame, image=icon_img, text="", width=22)
                icon_label.grid(row=0, column=1, sticky="ne", padx=(0, 16), pady=(12, 0))
        except Exception:
            pass
        # Title (left, top)
        title_label = ctk.CTkLabel(
            card_frame,
            text=title,
            font=ctk.CTkFont(family="Inter", size=16, weight="bold"),
            text_color="#6B3F19",
            anchor="w"
        )
        title_label.grid(row=0, column=0, sticky="nw", padx=(18, 0), pady=(14, 0))
        # Amount (centered, big)
        amount_label = ctk.CTkLabel(
            card_frame,
            text=f"₱ {amount:,.2f}",
            font=ctk.CTkFont(family="Inter", size=23, weight="bold"),
            text_color=color,
            anchor="center",
            fg_color="transparent"
        )
        amount_label.grid(row=1, column=0, columnspan=2, sticky="nsew", padx=18, pady=(0, 12))
        
    def setup_expense_section(self, parent):
        # Main expense container with border and rounded corners
        expense_container = ctk.CTkFrame(
            parent,
            fg_color="#f2efea",
            corner_radius=16,
            border_width=1,  
            border_color="#4d2d18"
        )
        expense_container.grid(row=0, column=1, sticky="nsew", padx=(16, 0), pady=(10, 10))
        expense_container.grid_columnconfigure(0, weight=1)
        expense_container.grid_rowconfigure(1, weight=1)

        # Header section with title and add button
        header_frame = ctk.CTkFrame(expense_container, fg_color="transparent", border_width=0)
        header_frame.grid(row=0, column=0, sticky="ew", padx=20, pady=(20, 10))
        header_frame.grid_columnconfigure(0, weight=1)
        header_frame.grid_columnconfigure(1, weight=0)

        expense_header = ctk.CTkLabel(
            header_frame,
            text="EXPENSE ADDED",
            font=ctk.CTkFont(family="Inter", size=16, weight="bold"),
            text_color="#4d2d18",
            anchor="w"
        )
        expense_header.grid(row=0, column=0, sticky="w")
        add_button = ctk.CTkButton(
            header_frame,
            text="+",
            width=40,
            height=40,
            font=ctk.CTkFont(family="Unbounded", size=17, weight="bold"),
            fg_color="#f2efea",
            text_color="#4d2d18",
            border_width=2,
            border_color="#4d2d18",
            corner_radius=20,
            hover_color="#f8f8f8",
            command=self.add_expense_clicked
        )
        add_button.grid(row=0, column=1, sticky="e")

        # Expense list container
        self.expense_list_frame = ctk.CTkScrollableFrame(
            expense_container,
            fg_color="transparent",
            border_width=0,  # Ensure no border
            corner_radius=0,
            width=370  # Set fixed width to prevent overlap
        )
        self.expense_list_frame.grid(row=1, column=0, sticky="nsew", padx=10, pady=(0, 20))  # Add horizontal padding
        self.expense_list_frame.grid_columnconfigure(0, weight=1)
        self.refresh_expense_list()
        
    def refresh_expense_list(self):
        # Clear existing widgets
        for widget in self.expense_list_frame.winfo_children():
            widget.destroy()
        
        # Fetch latest expenses from DB
        self.expenses = self.controller.get_expenses_by_date(self.current_date)

        # Populate with new data
        for i, expense in enumerate(self.expenses):
            self.create_expense_item(i, expense)
        
        self.update_totals() # Update totals after refreshing the list

    def create_expense_item(self, index, expense):
        item_frame = ctk.CTkFrame(
            self.expense_list_frame,
            height=80,
            fg_color="#ffffff",
            border_width=0,  # Remove border to avoid extra lines
            corner_radius=12
        )
        item_frame.grid(row=index, column=0, sticky="ew", padx=12, pady=10)
        item_frame.grid_propagate(False)
        item_frame.grid_columnconfigure(0, weight=0)
        item_frame.grid_columnconfigure(1, weight=1)
        item_frame.grid_columnconfigure(2, weight=0)
        item_frame.grid_rowconfigure(0, weight=1)

        # Action buttons (delete, edit) in a horizontal row, vertically centered, fixed size
        action_frame = ctk.CTkFrame(item_frame, fg_color="transparent", width=80, height=80)
        action_frame.grid(row=0, column=0, sticky="nsew", padx=(16, 0), pady=0)
        action_frame.grid_rowconfigure(0, weight=1)
        action_frame.grid_columnconfigure(0, weight=1)
        action_frame.grid_columnconfigure(1, weight=1)
        
        delete_btn = ctk.CTkButton(
            action_frame,
            text="🗑",
            width=40,
            height=40,
            font=ctk.CTkFont(family="Unbounded", size=16, weight="bold"),
            fg_color="#ffeaea",
            text_color="#ff6b6b",
            border_width=2,
            border_color="#ff6b6b",
            corner_radius=8,
            hover_color="#fff5f5",
            command=lambda exp_id=expense["id"]: self.delete_expense(exp_id)
        )
        delete_btn.grid(row=0, column=0, padx=(0, 6), pady=0, sticky="")
        
        edit_btn = ctk.CTkButton(
            action_frame,
            text="✎",
            width=40,
            height=40,
            font=ctk.CTkFont(family="Unbounded", size=16, weight="bold"),
            fg_color="#eaffea",
            text_color="#4caf50",
            border_width=2,
            border_color="#4caf50",
            corner_radius=8,
            hover_color="#f5fff5",
            command=lambda exp_data=expense: self.edit_expense(exp_data)
        )
        edit_btn.grid(row=0, column=1, padx=0, pady=0, sticky="")

        # Expense details (name and category), vertically centered and expanding
        details_frame = ctk.CTkFrame(item_frame, fg_color="transparent", width=200, height=80)
        details_frame.grid(row=0, column=1, sticky="nsew", padx=(18, 0), pady=0)
        details_frame.grid_columnconfigure(0, weight=1)
        details_frame.grid_rowconfigure(0, weight=1)
        details_frame.grid_rowconfigure(1, weight=1)
        name_label = ctk.CTkLabel(
            details_frame,
            text=expense["name"],
            font=ctk.CTkFont(family="Inter", size=16, weight="bold"),
            text_color="#4d2d18",
            anchor="w"
        )
        name_label.grid(row=0, column=0, sticky="sw", pady=(8, 0))
        category_label = ctk.CTkLabel(
            details_frame,
            text=expense["category"],
            font=ctk.CTkFont(family="Inter", size=12),
            text_color="#00894c",
            anchor="w"
        )
        category_label.grid(row=1, column=0, sticky="nw", pady=(0, 8))

        # Amount (right side, vertically centered, no overflow)
        amount_label = ctk.CTkLabel(
            item_frame,
            text=f"₱ {expense['amount']:.2f}",
            font=ctk.CTkFont(family="Inter", size=18, weight="bold"),
            text_color="#4d2d18",
            anchor="e"
        )
        amount_label.grid(row=0, column=2, sticky="nsew", padx=(0, 24), pady=0)
        
    def add_expense_clicked(self):
        def on_save(expense_data):
            # Pass employee_id to the controller
            success = self.controller.add_expense(
                expense_data["name"], 
                expense_data["amount"], 
                expense_data["category"], 
                self.employee_id
            )
            if success:
                messagebox.showinfo("Success", "Expense added successfully!")
                self.refresh_expense_list()
            else:
                messagebox.showerror("Error", "Failed to add expense.")
        AddExpenseDialog(self, on_save=on_save)
    
    def delete_expense(self, expense_id):
        if messagebox.askyesno("Confirm Delete", "Are you sure you want to delete this expense?"):
            success = self.controller.delete_expense(expense_id)
            if success:
                messagebox.showinfo("Success", "Expense deleted successfully!")
                self.refresh_expense_list()
            else:
                messagebox.showerror("Error", "Failed to delete expense.")
        
    def edit_expense(self, expense_data):
        def on_save(updated_expense_data):
            success = self.controller.update_expense(
                updated_expense_data["id"],
                updated_expense_data["name"],
                updated_expense_data["amount"],
                updated_expense_data["category"]
            )
            if success:
                messagebox.showinfo("Success", "Expense updated successfully!")
                self.refresh_expense_list()
            else:
                messagebox.showerror("Error", "Failed to update expense.")
        EditExpenseDialog(self, expense_data, on_save=on_save)
    
    def update_totals(self):
        """Updates the cashbox summary and refreshes the payment cards."""
        self.update_cashbox_data()
        # Re-setup payment cards to reflect updated amounts
        # This will clear and recreate the cards with new values
        self.setup_payment_cards(self.main_frame.winfo_children()[1]) # Pass the content_frame
        
    # Navigation methods now use main_app.show_frame
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
        self.refresh()
    def refresh(self):
        """Refreshes the cashbox data and updates the UI."""
        print("Refreshing Cash Box data...")
        self.update_cashbox_data()
        self.update_totals() # This will re-setup payment cards and refresh expenses
        self.refresh_expense_list()
    def show_dashboard(self):
        self.main_app.show_frame("dashboard")