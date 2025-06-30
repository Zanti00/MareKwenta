import customtkinter as ctk
import tkinter as tk
import json
from datetime import datetime, timedelta
from nav_bar import Navbar

sample_receipts = [
    {
        "orderId": "#1-3001",
        "dateTime": "June 23, 2025 3:00 PM",
        "totalAmount": 210.00,
        "cashier": "Aliah",
        "paymentMode": "Split",
        "discount": 10.00,
        "paymentBreakdown": "Cash ₱100.00 + Card ₱110.00",
        "itemsJson": '[{"name":"Americano","qty":2,"temperature":"Hot","size":"Grande","price":45.00, "extras":["Solo Shot"]},{"name":"Frappe Mocha","qty":1,"size":"Venti","price": 120.00,"extras":["Double Shot","Whip Cream"]}]',
    },
        {
        "orderId": "#1-3001",
        "dateTime": "June 24, 2025 3:00 PM",
        "totalAmount": 210.00,
        "cashier": "Aliah",
        "paymentMode": "Split",
        "discount": 10.00,
        "paymentBreakdown": "Cash ₱100.00 + Card ₱110.00",
        "itemsJson": '[{"name":"Americano","qty":2,"temperature":"Hot","size":"Grande","price":45.00, "extras":["Solo Shot"]},{"name":"Croissant","qty":1, "price": 20.00},{"name":"Frappe Mocha","qty":1,"size":"Venti","price": 120.00,"extras":["Double Shot","Whip Cream"]}]',
    },
    {
        "orderId": "#1-3002",
        "dateTime": "June 24, 2025 5:00 PM",
        "totalAmount": 135.00,
        "cashier": "Jane",
        "paymentMode": "Cash",
        "discount": 0.00,
        "paymentBreakdown": "",
        "itemsJson": '[{"name":"Latte","qty":2,"temperature":"Cold","size":"Venti", "price": 60.00},{"name":"Bagel","qty":2, "price":50.00}]'
    }
]

class SalesHistoryMain(ctk.CTk):
    def __init__(self, user_role="employee"):
        super().__init__()
        taskbar_height = 70  # Adjust this value as needed
        screen_width = self.winfo_screenwidth()
        screen_height = self.winfo_screenheight()
        usable_height = screen_height - taskbar_height
        self.geometry(f"{screen_width}x{usable_height}+0+0")
        self.configure(fg_color="#f2efea")
        
        # Store user role
        self.user_role = user_role

        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)

        self.navbar = Navbar(self, width=124, user_role=self.user_role, active_tab="receipt")
        self.navbar.grid(row=0, column=0, sticky="ns", padx=(0, 0), pady=0)
        self.navbar.set_nav_callback("ticket", self.show_ticket)
        self.navbar.set_nav_callback("receipt", self.show_receipt)
        self.navbar.set_nav_callback("inventory", self.show_inventory)
        self.navbar.set_nav_callback("staff", self.show_staff)
        self.navbar.set_nav_callback("cashbox", self.show_cashbox)
        self.navbar.set_nav_callback("dashboard", self.show_dashboard)

        main_frame = ctk.CTkFrame(self, fg_color="transparent")
        main_frame.grid(row=0, column=1, sticky="nsew", padx=(0, 0), pady=0)
        main_frame.grid_rowconfigure(0, weight=1)
        main_frame.grid_columnconfigure(0, weight=0)
        main_frame.grid_columnconfigure(1, weight=1)

        self.selected_receipt = None

        # === LEFT COLUMN (Header + Product Panel) ===
        left_column = ctk.CTkFrame(main_frame, fg_color="transparent", width=300)
        left_column.grid(row=0, column=0, sticky="ns", padx=(20, 20), pady=40)
        left_column.grid_rowconfigure(2, weight=1)

        # === SALES HISTORY HEADER ===
        history_label = ctk.CTkLabel(left_column, text="Sales History", font=("Unbounded", 28, "bold"), text_color="#4e2d18")
        history_label.grid(row=0, column=0, sticky="w", pady=(0, 10))

        # === RECEIPT LIST ===
        self.receipt_list_frame = ctk.CTkScrollableFrame(left_column, fg_color="#ffffff", corner_radius=15, width=250, height=600)
        self.receipt_list_frame.grid(row=1, column=0, sticky="ns", pady=(0, 20))
        left_column.grid_rowconfigure(1, weight=1)

        self.populate_receipt_list()

        # === RIGHT PANEL WRAPPER (for centering) ===
        right_wrapper = ctk.CTkFrame(main_frame, fg_color="transparent")
        right_wrapper.grid(row=0, column=1, sticky="nsew", padx=(0, 40), pady=40)
        right_wrapper.grid_rowconfigure(0, weight=1)
        right_wrapper.grid_columnconfigure(0, weight=1)

        # Inner wrapper to center content vertically and horizontally
        center_frame = ctk.CTkFrame(right_wrapper, fg_color="transparent")
        center_frame.grid(row=0, column=0, sticky="nsew")
        center_frame.grid_rowconfigure(0, weight=1)  # top spacer
        center_frame.grid_rowconfigure(1, weight=0)  # right_panel
        center_frame.grid_rowconfigure(2, weight=1)  # bottom spacer
        center_frame.grid_columnconfigure(0, weight=1)  # left spacer
        center_frame.grid_columnconfigure(1, weight=0)  # right_panel
        center_frame.grid_columnconfigure(2, weight=1)  # right spacer

        self.right_panel = ctk.CTkFrame(center_frame, fg_color="#ffffff", corner_radius=15, width=380)
        self.right_panel.grid(row=1, column=1, sticky="n", padx=0)

        self.placeholder_label = ctk.CTkLabel(center_frame, text="Select a receipt to view details", 
                                             font=("Poppins", 18), text_color="#8B7355")
        self.placeholder_label.grid(row=1, column=1, sticky="n")

        self.header_frame = ctk.CTkFrame(self.right_panel, fg_color="transparent", width=500)
        self.header_frame.grid(row=0, column=0, pady=20, sticky="ew")

        # Order ID (big)
        self.order_id_label = ctk.CTkLabel(self.header_frame, text="", font=("Poppins", 24, "bold"), text_color="#4E2D18", width=500)
        self.order_id_label.grid(row=0, column=0, sticky="ew")

        # "Order ID" label 
        self.order_id_sublabel = ctk.CTkLabel(self.header_frame, text="Order ID", font=("Inter", 12), text_color="lightgray", width=500)
        self.order_id_sublabel.grid(row=1, column=0, sticky="ew")

        # Cashier name 
        self.cashier_label = ctk.CTkLabel(self.header_frame, text="", font=("Inter", 16), text_color="#4e2d18", width=500, anchor="w")
        self.cashier_label.grid(row=2, column=0, sticky="ew", pady=(10, 0), padx=20)

        # Divider after header
        self.header_divider = ctk.CTkFrame(self.right_panel, fg_color="#E0E0E0", height=2)
        self.header_divider.grid(row=1, column=0, sticky="ew", padx=20, pady=5)

        self.items_frame = ctk.CTkFrame(self.right_panel, fg_color="transparent", width=500)
        self.items_frame.grid(row=2, column=0, sticky="nsew", padx=20)
        self.right_panel.grid_rowconfigure(2, weight=1)

        # Divider after items
        self.items_divider = ctk.CTkFrame(self.right_panel, fg_color="#E0E0E0", height=2)
        self.items_divider.grid(row=3, column=0, sticky="ew", padx=20, pady=5)

        # Total frame (created in __init__ but populated in select_receipt)
        self.total_frame = ctk.CTkFrame(self.right_panel, fg_color="transparent")
        self.total_frame.grid(row=4, column=0, sticky="ew", padx=20, pady=20)

        # Divider after total
        self.total_divider = ctk.CTkFrame(self.right_panel, fg_color="#E0E0E0", height=2)
        self.total_divider.grid(row=5, column=0, sticky="ew", padx=20, pady=5)

        # payment breakdown
        self.payment_frame = ctk.CTkFrame(self.right_panel, fg_color="transparent")
        self.payment_frame.grid(row=6, column=0, sticky="ew", padx=20, pady=(10, 20))

    def populate_receipt_list(self):
        for widget in self.receipt_list_frame.winfo_children():
            widget.destroy()

        def get_date_label(date_str):
            receipt_date = datetime.strptime(date_str, "%B %d, %Y %I:%M %p").date()
            today = datetime.today().date()
            if receipt_date == today:
                return "Today"
            elif receipt_date == today - timedelta(days=1):
                return "Yesterday"
            else:
                return receipt_date.strftime("%B %d, %Y")

        # Group receipts by date label
        grouped = {}
        for receipt in sample_receipts:
            label = get_date_label(receipt["dateTime"])
            grouped.setdefault(label, []).append(receipt)

        # Sort groups by datetime (descending)
        sorted_groups = sorted(grouped.items(), key=lambda x: datetime.strptime(x[1][0]["dateTime"], "%B %d, %Y %I:%M %p"), reverse=True)

        for date_label, receipts in sorted_groups:
            # Sort receipts within each group by time (latest first)
            receipts.sort(key=lambda x: datetime.strptime(x["dateTime"], "%B %d, %Y %I:%M %p"), reverse=True)
            
            # Date header
            header = ctk.CTkLabel(self.receipt_list_frame, text=date_label, font=("Inter", 14, "bold"), text_color="#708a2e")
            header.grid(row=len(self.receipt_list_frame.winfo_children()), column=0, sticky="w", padx=15, pady=(10, 5))

            for receipt in receipts:
                receipt_frame = ctk.CTkFrame(self.receipt_list_frame, fg_color="#ffffff", border_color="#d9d9d9", border_width=2, corner_radius=10, height=80)
                receipt_frame.grid(row=len(self.receipt_list_frame.winfo_children()), column=0, sticky="ew", padx=(5,10), pady=5)

                # Left side - Amount and Time
                left_info = ctk.CTkFrame(receipt_frame, fg_color="transparent")
                left_info.grid(row=0, column=0, sticky="nsew", padx=(15, 10), pady=12)

                amount_label = ctk.CTkLabel(left_info, text=f"₱{receipt['totalAmount']:.2f}", font=("Inter", 16, "bold"), text_color="#4e2d18")
                amount_label.grid(row=0, column=0, sticky="w")

                time_str = receipt['dateTime'].split()[-2] + " " + receipt['dateTime'].split()[-1]  # e.g. "3:00 PM"
                time_label = ctk.CTkLabel(left_info, text=time_str, font=("Inter", 12), text_color="#666666")
                time_label.grid(row=0, column=1, sticky="w")

                # Right side - Order ID
                right_info = ctk.CTkFrame(receipt_frame, fg_color="transparent")
                right_info.grid(row=0, column=1, sticky="ns", padx=(10, 15), pady=5)

                order_id_label = ctk.CTkLabel(right_info, text=receipt['orderId'], font=("Inter", 18, "bold"), text_color="#4e2d18")
                order_id_label.grid(row=0, column=0, sticky="e", pady=18)

                # Bind all widgets to select
                for widget in [receipt_frame, left_info, right_info, amount_label, time_label, order_id_label]:
                    widget.bind("<Button-1>", lambda event, r=receipt: self.select_receipt(r))

    def select_receipt(self, receipt):
        self.selected_receipt = receipt
        
        # Show the right panel and hide placeholder
        self.right_panel.grid()
        self.placeholder_label.grid_forget()
        
        self.order_id_label.configure(text=receipt['orderId'])
        self.cashier_label.configure(text=f"Employee Name: {receipt['cashier']}")

        # Clear old items
        for widget in self.items_frame.winfo_children():
            widget.destroy()
        for widget in self.payment_frame.winfo_children():
            widget.destroy()
        for widget in self.total_frame.winfo_children():
            widget.destroy()

        items = json.loads(receipt.get("itemsJson", "[]"))
        for idx, item in enumerate(items):
            # Create a frame for each item
            item_frame = ctk.CTkFrame(self.items_frame, fg_color="transparent")
            item_frame.grid(row=idx, column=0, sticky="ew", pady=(5,0))
            item_frame.grid_columnconfigure(0, weight=1)
            item_frame.grid_columnconfigure(1, weight=0)

            # Row 1: Name xQty (left), Price (right)
            name_qty = f"{item['name']} x{item.get('qty', 1)}"
            name_label = ctk.CTkLabel(item_frame, text=name_qty, font=("Poppins", 14, "bold"), text_color="#4e2d18", anchor="w")
            name_label.grid(row=0, column=0, sticky="w")

            subtotal = item.get("price", 0) * item.get("qty", 1)
            price_label = ctk.CTkLabel(item_frame, text=f"₱{subtotal:.2f}", font=("Poppins", 14, "bold"), text_color="#4e2d18", anchor="e")
            price_label.grid(row=0, column=1, sticky="e")

            # Row 2: Details/extras (if any)
            details = []
            if item.get("temperature"):
                details.append(item["temperature"])
            if item.get("size"):
                details.append(item["size"])
            if item.get("extras"):
                details.append("Extras: " + ", ".join(item["extras"]))
            if details:
                full_details = ", ".join(details)
                details_label = ctk.CTkLabel(item_frame, text=full_details, font=("Poppins", 12), text_color="#666666", anchor="w")
                details_label.grid(row=1, column=0, columnspan=2, sticky="w", pady=(0, 2))

        # Total amount 
        total_label = ctk.CTkLabel(self.total_frame, text="Total:", font=("Inter", 18, "bold"), text_color="#4E2D18", anchor="w")
        total_label.grid(row=0, column=0, sticky="w")
        
        total_value = ctk.CTkLabel(self.total_frame, text=f"₱{receipt['totalAmount']:.2f}", font=("Inter", 18, "bold"), text_color="#4E2D18", anchor="e")
        total_value.grid(row=0, column=1, sticky="e")

        # === Payment Breakdown ===
        if receipt.get("discount", 0) > 0:
            discount_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
            discount_frame.grid(row=0, column=0, sticky="ew", pady=2)
            
            discount_label = ctk.CTkLabel(discount_frame, text="Discount:", font=("Inter", 14), text_color="#5C4033", anchor="w")
            discount_label.grid(row=0, column=0, sticky="w")
            
            discount_value = ctk.CTkLabel(discount_frame, text=f"₱{receipt['discount']:.2f}", font=("Inter", 14), text_color="#5C4033", anchor="e")
            discount_value.grid(row=0, column=1, sticky="e")

        # Payment Mode
        payment_mode_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
        payment_mode_frame.grid(row=1, column=0, sticky="ew", pady=2)
        
        mode_label = ctk.CTkLabel(payment_mode_frame, text="Payment Mode:", font=("Inter", 14), text_color="#4e2d18", anchor="w")
        mode_label.grid(row=0, column=0, sticky="w")
        
        mode_text = ""
        if receipt.get("paymentMode") == "Split" and receipt.get("paymentBreakdown"):
            mode_text = receipt['paymentBreakdown']
        else:
            mode_text = receipt['paymentMode']
        
        mode_value = ctk.CTkLabel(payment_mode_frame, text=mode_text, font=("Inter", 14), text_color="#4e2d18", anchor="e")
        mode_value.grid(row=0, column=1, sticky="e")

        # DateTime
        datetime_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
        datetime_frame.grid(row=2, column=0, sticky="ew", pady=(5, 0))
        
        datetime_label = ctk.CTkLabel(datetime_frame, text="Date & Time:", font=("Inter", 12), text_color="#888", anchor="w")
        datetime_label.grid(row=0, column=0, sticky="w")
        
        datetime_value = ctk.CTkLabel(datetime_frame, text=receipt.get("dateTime", ""), font=("Inter", 12), text_color="#888", anchor="e")
        datetime_value.grid(row=0, column=1, sticky="e")

    def show_ticket(self):
        from ticket.ticket_main import TicketMainPage
        self.destroy()
        TicketMainPage(user_role=self.user_role).mainloop()

    def show_receipt(self):
        pass  # Already on this page, do nothing!

    def show_inventory(self):
        from inventory.inventory_page import InventoryManagement
        self.destroy()
        InventoryManagement(user_role=self.user_role).mainloop()

    def show_staff(self):
        self.destroy()
        # TODO: Implement StaffMainPage

    def show_cashbox(self):
        from cash_box.cashbox_page import CashBoxApp
        self.destroy()
        CashBoxApp(user_role=self.user_role).run()

    def show_dashboard(self):
        self.destroy()
        # TODO: Implement DashboardMainPage
