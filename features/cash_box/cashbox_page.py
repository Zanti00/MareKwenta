import customtkinter as ctk
from tkinter import messagebox
from datetime import datetime
import tkinter as tk
import math
from nav_bar import Navbar
from cash_box.cashbox_controller import CashboxController

class CashBoxApp:
    def __init__(self, user_role="employee"):
        # Initialize the main window
        self.root = ctk.CTk()
        self.root.title("MareKwenta POS")
        taskbar_height = 70  # Adjust this value as needed
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()
        usable_height = screen_height - taskbar_height
        self.root.geometry(f"{screen_width}x{usable_height}+0+0")
        self.root.configure(fg_color="#f2efea")
        
        # Store user role
        self.user_role = user_role

        self.controller = CashboxController()
        cashbox_data = self.controller.get_cashbox_summary_by_date()

        self.cash_amount = cashbox_data['cash_amount']
        self.gcash_amount = cashbox_data['gcash_amount'] 
        self.maya_amount = cashbox_data['maya_amount']
        self.petty_cash_amount = 1000.00
        self.cash_sales_amount = cashbox_data['cash_sales_amount']
        self.cash_expenses_amount = 3100.00
        self.non_cash_expenses_amount = 3100.00
        
        # Sample expense data
        self.expenses = [
            {"name": "1 Sack of Rice", "amount": 300.00, "category": "CASH"},
            {"name": "1 Sack of Rice", "amount": 300.00, "category": "CASH"},
            {"name": "1 Sack of Rice", "amount": 300.00, "category": "CASH"},
            {"name": "1 Sack of Rice", "amount": 300.00, "category": "CASH"},
            {"name": "1 Sack of Rice", "amount": 300.00, "category": "CASH"},
            {"name": "1 Sack of Rice", "amount": 300.00, "category": "CASH"},
            {"name": "1 Sack of Rice", "amount": 300.00, "category": "CASH"},
            {"name": "1 Sack of Rice", "amount": 300.00, "category": "CASH"}
        ]
        
        # Configure grid weights for main layout
        self.root.grid_columnconfigure(1, weight=1)
        self.root.grid_rowconfigure(0, weight=1)
        
        # Bind window close event
        self.root.protocol("WM_DELETE_WINDOW", self.on_closing)
        
        self.setup_ui()
        
        
    def on_closing(self):
        """Handle window closing"""
        try:
            self.root.quit()
            self.root.destroy()
        except:
            pass
        
    def setup_ui(self):
       # Create navbar with user role
        self.navbar = Navbar(self.root, width=124, user_role=self.user_role, active_tab="cashbox")
        self.navbar.grid(row=0, column=0, sticky="ns", padx=(0, 0), pady=0)
        self.navbar.set_nav_callback("ticket", self.show_ticket)
        self.navbar.set_nav_callback("receipt", self.show_receipt)
        self.navbar.set_nav_callback("inventory", self.show_inventory)
        self.navbar.set_nav_callback("staff", self.show_staff)
        self.navbar.set_nav_callback("cashbox", self.show_cashbox)
        self.navbar.set_nav_callback("dashboard", self.show_dashboard)
        
        # Main content frame
        self.main_frame = ctk.CTkFrame(self.root, fg_color="#f2efea")
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
        current_date = datetime.now().strftime("%B %d, %Y")
        date_label = ctk.CTkLabel(
            date_frame,
            text="DATE:",
            font=ctk.CTkFont(family="Inter", size=18),
            text_color="#4d2d18"
        )
        date_label.place(x=8, y=11)
        date_value_label = ctk.CTkLabel(
            date_frame,
            text=current_date,
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
        # Larger, visually separated container
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
        # Inner grid for cards
        cards_frame = ctk.CTkFrame(cards_container, fg_color="transparent")
        cards_frame.grid(row=0, column=0, sticky="nsew", padx=24, pady=24)
        for i in range(2):
            cards_frame.grid_columnconfigure(i, weight=1, uniform="col")
        for i in range(4):
            cards_frame.grid_rowconfigure(i, weight=1, uniform="row")
        payment_methods = [
            ("CASH", self.cash_amount, "#4d2d18", "cash.png"),
            ("GCASH", self.gcash_amount, "#0091f7", "gcash.png"),
            ("PETTY CASH", self.petty_cash_amount, "#4d2d18", "cash.png"),
            ("MAYA", self.maya_amount, "#00894c", "maya.png"),
            ("CASH SALES", self.cash_sales_amount, "#4d2d18", "cash.png"),
            ("CASH EXPENSES", self.cash_expenses_amount, "#4d2d18", "cash.png"),
            ("NON - CASH EXPENSES", self.non_cash_expenses_amount, "#4d2d18", "cash.png"),
        ]
        grid_positions = [(i, j) for i in range(4) for j in range(2)]
        for idx, (method, amount, color, icon_file) in enumerate(payment_methods):
            if idx < len(grid_positions):
                row, col = grid_positions[idx]
                self.create_soft_card(cards_frame, row, col, method, amount, color, icon_file)

    def create_soft_card(self, parent, row, col, title, amount, color, icon_file):
        import os
        from PIL import Image
        from customtkinter import CTkImage
        card_frame = ctk.CTkFrame(
            parent,
            fg_color="#fff",
            border_width=2,
            border_color="#e0ded8",
            corner_radius=16,
            width=350,
            height=110
        )
        card_frame.grid(row=row, column=col, sticky="nsew", padx=16, pady=14)
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
        # Title (left, top, clickable style)
        title_label = ctk.CTkLabel(
            card_frame,
            text=title,
            font=ctk.CTkFont(family="Inter", size=16, weight="bold"),
            text_color="#7a4d2d",
            anchor="w",
            cursor="hand2"
        )
        title_label.grid(row=0, column=0, sticky="nw", padx=(18, 0), pady=(14, 0))
        # Amount (centered, big) - Fixed to not overflow the border
        amount_label = ctk.CTkLabel(
            card_frame,
            text=f"₱ {amount:,.2f}",
            font=ctk.CTkFont(family="Inter", size=23, weight="bold"),
            text_color=color,
            anchor="center",
            fg_color="transparent"  # Make sure background is transparent
        )
        amount_label.grid(row=1, column=0, columnspan=2, sticky="nsew", padx=18, pady=(0, 12))
        
    def setup_expense_section(self, parent):
        # Main expense container with border and rounded corners like the image
        expense_container = ctk.CTkFrame(
            parent,
            fg_color="#f2efea",
            corner_radius=16,
            border_width=2,
            border_color="#d1d5db"
        )
        expense_container.grid(row=0, column=1, sticky="nsew", padx=(16, 0), pady=(10, 10))
        expense_container.grid_columnconfigure(0, weight=1)
        expense_container.grid_rowconfigure(1, weight=1)

        # Header section with title and add button
        header_frame = ctk.CTkFrame(expense_container, fg_color="transparent")
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
            border_width=0,
            corner_radius=0
        )
        self.expense_list_frame.grid(row=1, column=0, sticky="nsew", padx=0, pady=(0, 20))
        self.expense_list_frame.grid_columnconfigure(0, weight=1)
        self.refresh_expense_list()
        
    def refresh_expense_list(self):
        for widget in self.expense_list_frame.winfo_children():
            widget.destroy()
        for i, expense in enumerate(self.expenses):
            self.create_expense_item(i, expense)

    def create_expense_item(self, index, expense):
        item_frame = ctk.CTkFrame(
            self.expense_list_frame,
            height=100,
            fg_color="#ffffff",
            border_width=1,
            border_color="#e0ded8",
            corner_radius=8
        )
        item_frame.grid(row=index, column=0, sticky="ew", padx=12, pady=8)
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
            font=ctk.CTkFont(family="Unbounded", size=14),
            fg_color="#ffc9be",
            text_color="#ff6b6b",
            border_width=2,
            border_color="#ff6b6b",
            corner_radius=8,
            hover_color="#fff5f5",
            command=lambda idx=index: self.delete_expense(idx)
        )
        delete_btn.grid(row=0, column=0, padx=(0, 6), pady=0, sticky="")
        
        edit_btn = ctk.CTkButton(
            action_frame,
            text="✎",
            width=40,
            height=40,
            font=ctk.CTkFont(family="Unbounded", size=14),
            fg_color="#beffd0",
            text_color="#4caf50",
            border_width=2,
            border_color="#4caf50",
            corner_radius=8,
            hover_color="#f5fff5",
            command=lambda idx=index: self.edit_expense(idx)
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
            text_color="#a89b8a",
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
        from .add_expense import AddExpenseDialog
        def on_save(expense):
            self.expenses.append(expense)
            self.refresh_expense_list()
        AddExpenseDialog(self.root, on_save=on_save)
    
    def delete_expense(self, index):
        if messagebox.askyesno("Confirm Delete", "Are you sure you want to delete this expense?"):
            del self.expenses[index]
            self.refresh_expense_list()
            self.update_totals()
        
    def edit_expense(self, index):
        from .edit_expense import EditExpenseDialog
        def on_save(updated_expense):
            self.expenses[index] = updated_expense
            self.refresh_expense_list()
        EditExpenseDialog(self.root, self.expenses[index], on_save=on_save)
    
    def update_totals(self):
        # This method would update the payment method totals
        # Implementation depends on your business logic
        pass
        
    def run(self):
        """Start the application with error handling"""
        try:
            print("Starting Futuristic CashBox Application...")
            self.root.mainloop()
        except Exception as e:
            print(f"Error running application: {e}")
            messagebox.showerror("Fatal Error", f"Application failed to start: {e}")
        finally:
            try:
                self.root.destroy()
            except:
                pass
    
    # Navigation methods for navbar
    def show_inventory(self):
        from inventory.inventory_page import InventoryManagement
        self.root.destroy()
        InventoryManagement(user_role=self.user_role).mainloop()

    def show_staff(self):
        print("Staff page not yet implemented")

    def show_receipt(self):
        from receipt.sales_history import SalesHistoryMain
        self.root.destroy()
        SalesHistoryMain(user_role=self.user_role).mainloop()

    def show_cashbox(self):
        pass  # Already on this page

    def show_ticket(self):
        from ticket.ticket_main import TicketMainPage
        self.root.destroy()
        TicketMainPage(user_role=self.user_role).mainloop()

    def show_dashboard(self):
        from dashboard.sales_dashboard import SalesDashboard
        self.root.destroy()
        SalesDashboard(user_role=self.user_role).mainloop()
    
    def mainloop(self):
        """Alternative method name for compatibility"""
        self.run()