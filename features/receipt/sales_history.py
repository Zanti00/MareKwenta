import customtkinter as ctk
import tkinter as tk
import json
from datetime import datetime, timedelta
from nav_bar import Navbar
from staff.staff_admin import StaffPageAdmin
from staff.staff_employee import StaffPageEmployee
from .receipt_controller import ReceiptController

class SalesHistoryMain(ctk.CTk):
    def __init__(self, user_role="employee"):
        super().__init__()
        taskbar_height = 70
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
        self.receipts_data = []  # Store fetched receipts

        # Load receipts from database
        self.load_receipts_from_db()

        # === LEFT COLUMN (Header + Product Panel) ===
        left_column = ctk.CTkFrame(main_frame, fg_color="transparent", width=300)
        left_column.grid(row=0, column=0, sticky="ns", padx=(20, 20), pady=40)
        left_column.grid_rowconfigure(2, weight=1)

        # === SALES HISTORY HEADER ===
        history_label = ctk.CTkLabel(left_column, text="Sales History", font=("Unbounded", 28, "bold"), text_color="#4e2d18")
        history_label.grid(row=0, column=0, sticky="w", pady=(0, 10))

        # === RECEIPT LIST ===
        self.receipt_list_frame = ctk.CTkScrollableFrame(left_column, fg_color="#ffffff", corner_radius=15, width=250, height=800)
        self.receipt_list_frame.grid(row=1, column=0, sticky="nsew", pady=(0, 20))
        left_column.grid_rowconfigure(1, weight=1)
        self.receipt_list_frame.grid_columnconfigure(0, weight=1)

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

        self.setup_right_panel()

    def load_receipts_from_db(self):
        """Load receipts from database"""
        try:
            self.receipts_data = ReceiptController.get_all_tickets()
            print(f"Loaded {len(self.receipts_data)} receipts from database")
        except Exception as e:
            print(f"Error loading receipts: {e}")
            self.receipts_data = []

    def setup_right_panel(self):
        """Setup the right panel components"""
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

        # Total frame
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

        if not self.receipts_data:
            # Show message when no receipts
            no_receipts_label = ctk.CTkLabel(
                self.receipt_list_frame,
                text="No receipts found",
                font=("Inter", 16),
                text_color="#666666"
            )
            no_receipts_label.grid(row=0, column=0, pady=50, padx=20)
            return

        def get_date_label(date_str):
            try:
                # Parse the database datetime format
                receipt_date = datetime.strptime(date_str, "%Y-%m-%d %H:%M:%S").date()
                today = datetime.today().date()
                if receipt_date == today:
                    return "Today"
                elif receipt_date == today - timedelta(days=1):
                    return "Yesterday"
                else:
                    return receipt_date.strftime("%B %d, %Y")
            except:
                return "Unknown Date"

        # Group receipts by date label
        grouped = {}
        for receipt in self.receipts_data:
            label = get_date_label(receipt["dateTime"])
            grouped.setdefault(label, []).append(receipt)

        # Sort groups by datetime (descending)
        sorted_groups = []
        for date_label, receipts in grouped.items():
            # Sort receipts within each group by time (latest first)
            try:
                receipts.sort(key=lambda x: datetime.strptime(x["dateTime"], "%Y-%m-%d %H:%M:%S"), reverse=True)
                # Use the first receipt's datetime for group sorting
                group_datetime = datetime.strptime(receipts[0]["dateTime"], "%Y-%m-%d %H:%M:%S")
                sorted_groups.append((date_label, receipts, group_datetime))
            except:
                sorted_groups.append((date_label, receipts, datetime.min))
        
        sorted_groups.sort(key=lambda x: x[2], reverse=True)

        for date_label, receipts, _ in sorted_groups:
            # Date header
            header = ctk.CTkLabel(self.receipt_list_frame, text=date_label, font=("Inter", 14, "bold"), text_color="#708a2e")
            header.grid(row=len(self.receipt_list_frame.winfo_children()), column=0, sticky="w", padx=15, pady=(10, 5))

            for receipt in receipts:
                receipt_frame = ctk.CTkFrame(self.receipt_list_frame, fg_color="#ffffff", border_color="#d9d9d9", border_width=2, corner_radius=10, height=80)
                receipt_frame.grid(row=len(self.receipt_list_frame.winfo_children()), column=0, sticky="ew", padx=(5,10), pady=5)
                receipt_frame.grid_columnconfigure(0, weight=1)
                receipt_frame.grid_columnconfigure(1, weight=0)

                # Left side - Amount and Time
                left_info = ctk.CTkFrame(receipt_frame, fg_color="transparent")
                left_info.grid(row=0, column=0, sticky="nsew", padx=(15, 10), pady=12)
                left_info.grid_rowconfigure(0, weight=1)
                left_info.grid_rowconfigure(1, weight=1)
                left_info.grid_columnconfigure(0, weight=1)

                amount_label = ctk.CTkLabel(left_info, text=f"₱{receipt['totalAmount']:.2f}", font=("Inter", 16, "bold"), text_color="#4e2d18")
                amount_label.grid(row=0, column=0, sticky="w")

                # Time below price
                try:
                    dt = datetime.strptime(receipt['dateTime'], "%Y-%m-%d %H:%M:%S")
                    time_str = dt.strftime("%I:%M %p")
                except:
                    time_str = "Unknown"
                time_label = ctk.CTkLabel(left_info, text=time_str, font=("Inter", 12), text_color="#666666")
                time_label.grid(row=1, column=0, sticky="w")

                # Right side - Order ID (always right-aligned)
                right_info = ctk.CTkFrame(receipt_frame, fg_color="transparent")
                right_info.grid(row=0, column=1, sticky="nsew", padx=(10, 15), pady=5)
                right_info.grid_rowconfigure(0, weight=1)
                right_info.grid_columnconfigure(0, weight=1)

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

        # Display items from database
        for idx, item in enumerate(receipt.get("items", [])):
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

            # Row 2: Details (size, temperature, extras)
            details = []
            if item.get("temperature"):
                details.append(item["temperature"])
            if item.get("size"):
                details.append(item["size"])
            
            # Add extras from database (extra_shots and whipped_cream) - only once
            extras_list = []
            if item.get("extra_shots", 0) > 0:
                extras_list.append(f"Extra Shot x{item['extra_shots']}")
            if item.get("whipped_cream", 0) > 0:
                extras_list.append(f"Whip Cream x{item['whipped_cream']}")
            
            # Format details to display vertically
            if details:
                # First line: size and temperature on same line
                size_temp_line = ", ".join(details)
                details_label = ctk.CTkLabel(item_frame, text=size_temp_line, font=("Poppins", 12), text_color="#666666", anchor="w")
                details_label.grid(row=1, column=0, columnspan=2, sticky="w", pady=(0, 2))
            
            # Second line: extras (if any) on separate line
            if extras_list:
                extras_text = f"Extras: {', '.join(extras_list)}"
                extras_label = ctk.CTkLabel(item_frame, text=extras_text, font=("Poppins", 12), text_color="#666666", anchor="w")
                if details:
                    extras_label.grid(row=2, column=0, columnspan=2, sticky="w", pady=(0, 2))
                else:
                    extras_label.grid(row=1, column=0, columnspan=2, sticky="w", pady=(0, 2))

        # Total amount 
        total_label = ctk.CTkLabel(self.total_frame, text="Total:", font=("Inter", 18, "bold"), text_color="#4E2D18", anchor="w")
        total_label.grid(row=0, column=0, sticky="w")
        
        total_value = ctk.CTkLabel(self.total_frame, text=f"₱{receipt['totalAmount']:.2f}", font=("Inter", 18, "bold"), text_color="#4E2D18", anchor="e")
        total_value.grid(row=0, column=1, sticky="e")

        # === Payment Breakdown ===
        row_count = 0
        
        if receipt.get("discount", 0) > 0:
            discount_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
            discount_frame.grid(row=row_count, column=0, sticky="ew", pady=2)
            discount_frame.grid_columnconfigure(0, weight=1)
            discount_frame.grid_columnconfigure(1, weight=0)
            
            discount_label = ctk.CTkLabel(discount_frame, text="Discount:", font=("Inter", 14), text_color="#5C4033", anchor="w")
            discount_label.grid(row=0, column=0, sticky="w")
            
            discount_value = ctk.CTkLabel(discount_frame, text=f"₱{receipt['discount']:.2f}", font=("Inter", 14), text_color="#5C4033", anchor="e")
            discount_value.grid(row=0, column=1, sticky="e")
            row_count += 1

        # Payment Mode
        payment_mode_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
        payment_mode_frame.grid(row=row_count, column=0, sticky="ew", pady=2)
        payment_mode_frame.grid_columnconfigure(0, weight=1)
        payment_mode_frame.grid_columnconfigure(1, weight=0)
        
        mode_label = ctk.CTkLabel(payment_mode_frame, text="Payment Mode:", font=("Inter", 14), text_color="#4e2d18", anchor="w")
        mode_label.grid(row=0, column=0, sticky="w")
        
        mode_text = ""
        if receipt.get("paymentMode") == "Split" and receipt.get("paymentBreakdown"):
            mode_text = receipt['paymentBreakdown']
        else:
            mode_text = receipt['paymentMode']
        
        mode_value = ctk.CTkLabel(payment_mode_frame, text=mode_text, font=("Inter", 14), text_color="#4e2d18", anchor="e")
        mode_value.grid(row=0, column=1, sticky="e")
        row_count += 1

        # DateTime
        datetime_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
        datetime_frame.grid(row=row_count, column=0, sticky="ew", pady=(5, 0))
        datetime_frame.grid_columnconfigure(0, weight=1)
        datetime_frame.grid_columnconfigure(1, weight=0)
        
        datetime_label = ctk.CTkLabel(datetime_frame, text="Date & Time:", font=("Inter", 12), text_color="#888", anchor="w")
        datetime_label.grid(row=0, column=0, sticky="w")
        
        # Format datetime for display
        try:
            dt = datetime.strptime(receipt['dateTime'], "%Y-%m-%d %H:%M:%S")
            formatted_datetime = dt.strftime("%B %d, %Y %I:%M %p")
        except:
            formatted_datetime = receipt.get("dateTime", "Unknown")
        
        datetime_value = ctk.CTkLabel(datetime_frame, text=formatted_datetime, font=("Inter", 12), text_color="#888", anchor="e")
        datetime_value.grid(row=0, column=1, sticky="e")

    def show_ticket(self):
        from ticket.ticket_main import TicketMainPage
        self.destroy()
        TicketMainPage(user_role=self.user_role).mainloop()

    def show_receipt(self):
        pass  # Already on this page

    def show_inventory(self):
        from inventory.inventory_page import InventoryManagement
        self.destroy()
        InventoryManagement(user_role=self.user_role).mainloop()

    def show_staff(self):
        self.destroy()
        if self.user_role == "admin":
            StaffPageAdmin(user_role="admin").run()
        else:
            StaffPageEmployee(user_role="employee").run()

    def show_cashbox(self):
        from cash_box.cashbox_page import CashBoxApp
        self.destroy()
        CashBoxApp(user_role=self.user_role).run()

    def show_dashboard(self):
        from dashboard.sales_dashboard import SalesDashboard
        self.destroy()
        SalesDashboard(user_role=self.user_role).mainloop()

    def run(self):
        """Start the application"""
        try:
            self.mainloop()
        except Exception as e:
            print(f"Error running SalesHistoryMain: {e}")
        finally:
            try:
                self.destroy()
            except:
                pass

    def mainloop(self):
        """Run the application"""
        super().mainloop()
