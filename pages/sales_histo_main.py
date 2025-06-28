import customtkinter as ctk
import tkinter as tk
import json
from datetime import datetime, timedelta

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
    def __init__(self):
        super().__init__()
        self.geometry("1240x1024")
        self.configure(fg_color="#f2efea")

        self.selected_receipt = None

        # === MAIN WRAPPER FRAME ===
        main_frame = ctk.CTkFrame(self, fg_color="transparent")
        main_frame.pack(fill="both", expand=True)

        # === LEFT COLUMN (Header + Product Panel) ===
        left_column = ctk.CTkFrame(main_frame, fg_color="transparent", width=400)
        left_column.pack(side="left", fill="y", padx=(20, 20), pady=30)

        # === SALES HISTORY HEADER ===
        history_label = ctk.CTkLabel(left_column, text="Sales History", font=("Unbounded", 28, "bold"), text_color="#4e2d18")
        history_label.pack(anchor="w", pady=(0, 10))

        # === RECEIPT LIST ===
        self.receipt_list_frame = ctk.CTkScrollableFrame(left_column, fg_color="#ffffff", corner_radius=15, width=350)
        self.receipt_list_frame.pack(side="left", fill="y", pady=(0, 20))

        self.populate_receipt_list()

        # === RIGHT PANEL WRAPPER (for centering) ===
        right_wrapper = ctk.CTkFrame(main_frame, fg_color="transparent")
        right_wrapper.pack(side="right", fill="both", expand=True, padx=(0, 40), pady=30)
        right_wrapper.pack_propagate(False)

        # Inner wrapper to center content vertically and horizontally
        center_frame = ctk.CTkFrame(right_wrapper, fg_color="transparent")
        center_frame.pack(expand=True)  # This will center inside right_wrapper

        self.right_panel = ctk.CTkFrame(center_frame, fg_color="#ffffff", corner_radius=15, width=500)
        # Don't pack initially - will be shown when receipt is selected

        # Create a placeholder label for when no receipt is selected
        self.placeholder_label = ctk.CTkLabel(center_frame, text="Select a receipt to view details", 
                                             font=("Poppins", 18), text_color="#8B7355")
        self.placeholder_label.pack(expand=True)

        # Create a frame for the header details
        self.header_frame = ctk.CTkFrame(self.right_panel, fg_color="transparent", width=500)
        self.header_frame.pack(pady=20)

        # Order ID (big)
        self.order_id_label = ctk.CTkLabel(self.header_frame, text="", font=("Poppins", 24, "bold"), text_color="#4E2D18", width=500)
        self.order_id_label.pack()

        # "Order ID" label (smaller, different color)
        self.order_id_sublabel = ctk.CTkLabel(self.header_frame, text="Order ID", font=("Inter", 12), text_color="lightgray", width=500)
        self.order_id_sublabel.pack()

        # Cashier name (same size as order ID, left aligned)
        self.cashier_label = ctk.CTkLabel(self.header_frame, text="", font=("Inter", 16), text_color="#4e2d18", width=500, anchor="w")
        self.cashier_label.pack(pady=(10, 0),padx=20)

        # Divider after header
        self.header_divider = ctk.CTkFrame(self.right_panel, fg_color="#E0E0E0")
        self.header_divider.pack(fill="x", padx=20, pady=5)
        self.header_divider.configure(height=2)

        self.items_frame = ctk.CTkFrame(self.right_panel, fg_color="transparent", width=500)
        self.items_frame.pack(fill="both", expand=True, padx=20)

        # Divider after items
        self.items_divider = ctk.CTkFrame(self.right_panel, fg_color="#E0E0E0")
        self.items_divider.pack(fill="x", padx=20, pady=5)
        self.items_divider.configure(height=2)

        # Total frame (created in __init__ but populated in select_receipt)
        self.total_frame = ctk.CTkFrame(self.right_panel, fg_color="transparent")
        self.total_frame.pack(fill="x", padx=20, pady=20)

        # Divider after total
        self.total_divider = ctk.CTkFrame(self.right_panel, fg_color="#E0E0E0")
        self.total_divider.pack(fill="x", padx=20, pady=5)
        self.total_divider.configure(height=2)

        # payment breakdown
        self.payment_frame = ctk.CTkFrame(self.right_panel, fg_color="transparent")
        self.payment_frame.pack(fill="x", padx=20, pady=(10, 20))

    def populate_receipt_list(self):
        # Clear any existing widgets first
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
            header.pack(anchor="w", padx=15, pady=(10, 5))

            for receipt in receipts:
                receipt_frame = ctk.CTkFrame(self.receipt_list_frame, fg_color="#ffffff", border_color="#d9d9d9", border_width=2, corner_radius=10, height=80)
                receipt_frame.pack(fill="x", padx=(5,10), pady=5)
                receipt_frame.pack_propagate(False)

                # Left side - Amount and Time
                left_info = ctk.CTkFrame(receipt_frame, fg_color="transparent")
                left_info.pack(side="left", fill="both", expand=True, padx=(15, 10), pady=12)

                amount_label = ctk.CTkLabel(left_info, text=f"₱{receipt['totalAmount']:.2f}", font=("Inter", 16, "bold"), text_color="#4e2d18")
                amount_label.pack(anchor="w")

                time_str = receipt['dateTime'].split()[-2] + " " + receipt['dateTime'].split()[-1]  # e.g. "3:00 PM"
                time_label = ctk.CTkLabel(left_info, text=time_str, font=("Inter", 12), text_color="#666666")
                time_label.pack(anchor="w")

                # Right side - Order ID
                right_info = ctk.CTkFrame(receipt_frame, fg_color="transparent")
                right_info.pack(side="right", fill="y", padx=(10, 15), pady=5)

                order_id_label = ctk.CTkLabel(right_info, text=receipt['orderId'], font=("Inter", 18, "bold"), text_color="#4e2d18")
                order_id_label.pack(anchor="e", pady=18)

                # Bind all widgets to select
                for widget in [receipt_frame, left_info, right_info, amount_label, time_label, order_id_label]:
                    widget.bind("<Button-1>", lambda event, r=receipt: self.select_receipt(r))

    def select_receipt(self, receipt):
        self.selected_receipt = receipt
        
        # Show the right panel and hide placeholder
        self.right_panel.pack()
        self.placeholder_label.pack_forget()
        
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
        for item in items:
            # Create a frame for each item
            item_frame = ctk.CTkFrame(self.items_frame, fg_color="transparent")
            item_frame.pack(fill="x", pady=5)
            
            # Left side - Item details
            left_details = ctk.CTkFrame(item_frame, fg_color="transparent")
            left_details.pack(side="left", fill="both", expand=True)
            
            name_qty = f"{item['name']} x{item.get('qty', 1)}"
            name_label = ctk.CTkLabel(left_details, text=name_qty, anchor="w", font=("Poppins", 14, "bold"), text_color="#4e2d18")
            name_label.pack(anchor="w")
            
            details = []
            if item.get("temperature"):
                details.append(item["temperature"])
            if item.get("size"):
                details.append(item["size"])
            if item.get("extras"):
                details.append("Extras: " + ", ".join(item["extras"]))

            if details:
                full_details = ", ".join(details)
                details_label = ctk.CTkLabel(left_details, text=full_details, anchor="w", font=("Poppins", 12), text_color="#666666")
                details_label.pack(anchor="w")
            
            # Right side - Price
            right_price = ctk.CTkFrame(item_frame, fg_color="transparent")
            right_price.pack(side="right", fill="y")
            
            subtotal = item.get("price", 0) * item.get("qty", 1)
            price_label = ctk.CTkLabel(right_price, text=f"₱{subtotal:.2f}", anchor="e", font=("Poppins", 14, "bold"), text_color="#4e2d18")
            price_label.pack(anchor="e")

        # Total amount (after items)
        total_label = ctk.CTkLabel(self.total_frame, text="Total:", font=("Inter", 18, "bold"), text_color="#4E2D18", anchor="w")
        total_label.pack(side="left")
        
        total_value = ctk.CTkLabel(self.total_frame, text=f"₱{receipt['totalAmount']:.2f}", font=("Inter", 18, "bold"), text_color="#4E2D18", anchor="e")
        total_value.pack(side="right")

        # === Payment Breakdown ===
        if receipt.get("discount", 0) > 0:
            discount_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
            discount_frame.pack(fill="x", pady=2)
            
            discount_label = ctk.CTkLabel(discount_frame, text="Discount:", font=("Inter", 14), text_color="#5C4033", anchor="w")
            discount_label.pack(side="left")
            
            discount_value = ctk.CTkLabel(discount_frame, text=f"₱{receipt['discount']:.2f}", font=("Inter", 14), text_color="#5C4033", anchor="e")
            discount_value.pack(side="right")

        # Payment Mode
        payment_mode_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
        payment_mode_frame.pack(fill="x", pady=2)
        
        mode_label = ctk.CTkLabel(payment_mode_frame, text="Payment Mode:", font=("Inter", 14), text_color="#4e2d18", anchor="w")
        mode_label.pack(side="left")
        
        mode_text = ""
        if receipt.get("paymentMode") == "Split" and receipt.get("paymentBreakdown"):
            mode_text = receipt['paymentBreakdown']
        else:
            mode_text = receipt['paymentMode']
        
        mode_value = ctk.CTkLabel(payment_mode_frame, text=mode_text, font=("Inter", 14), text_color="#4e2d18", anchor="e")
        mode_value.pack(side="right")

        # DateTime
        datetime_frame = ctk.CTkFrame(self.payment_frame, fg_color="transparent")
        datetime_frame.pack(fill="x", pady=(5, 0))
        
        datetime_label = ctk.CTkLabel(datetime_frame, text="Date & Time:", font=("Inter", 12), text_color="#888", anchor="w")
        datetime_label.pack(side="left")
        
        datetime_value = ctk.CTkLabel(datetime_frame, text=receipt.get("dateTime", ""), font=("Inter", 12), text_color="#888", anchor="e")
        datetime_value.pack(side="right")

if __name__ == "__main__":
    app = SalesHistoryMain()
    app.mainloop()