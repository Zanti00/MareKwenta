import customtkinter as ctk
import tkinter as tk
from .item_detail import ItemDetail
from .split_popup import SplitPopup

class TicketPanel(ctk.CTkFrame):
    def __init__(self, master, on_split_popup=None, *args, **kwargs):
        super().__init__(master, width=440, fg_color="#f2efea", border_width=1, border_color="lightgray", *args, **kwargs)
        self.grid_rowconfigure(1, weight=1)  # Make the item list expandable
        self.grid_columnconfigure(0, weight=1)

        self.on_split_popup = on_split_popup
        self.selected_tab = tk.IntVar(value=0)
        self.cart = []
        self.discount_value = 0
        self.discount_type = "percent"
        self.cash_received = 0
        self.current_total = 0.0
        self.items = []

        # === Header ===
        header_frame = ctk.CTkFrame(self, fg_color="transparent")
        header_frame.grid(row=0, column=0, sticky="ew", pady=(20, 10), padx=20)
        ctk.CTkLabel(header_frame, text="Ticket", font=("Unbounded", 24), text_color="#4d2d18").pack(anchor="w")

        # === Item List ===
        self.item_list_scroll = ctk.CTkScrollableFrame(self, fg_color="transparent")
        self.item_list_scroll.grid(row=1, column=0, sticky="nsew", padx=10, pady=(0, 10))
        
        # Use the scrollable frame for new items
        self.scrollable_frame = self.item_list_scroll

        # === Subtotal ===
        subtotal_frame = ctk.CTkFrame(self, fg_color="transparent")
        subtotal_frame.grid(row=2, column=0, sticky="ew", padx=26, pady=(0, 10))
        ctk.CTkLabel(subtotal_frame, text="SubTotal", font=("Unbounded", 20), text_color="#4e2d18").pack(side="left",anchor="e")
        self.total_display = ctk.CTkLabel(subtotal_frame, text="₱ 0.00", font=("Poppins", 20, "bold"), text_color="#4d6443", width=149)
        self.total_display.pack(side="right")
        
        # Keep reference for new functionality
        self.total_label = self.total_display

        # === Tabs (Change / Discount) ===
        self.tab_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.tab_frame.grid(row=3, column=0, sticky="ew", pady=(10, 5))

        self.change_tab_btn = ctk.CTkButton(self.tab_frame, text="Change", width=100,
                                            command=lambda: self.switch_tab(0), hover_color="#e8e4df",
                                            font=("Unbounded", 14), fg_color="#f2efea", text_color="#4e2d18")
        self.change_tab_btn.grid(row=0, column=0, padx=10)

        self.discount_tab_btn = ctk.CTkButton(self.tab_frame, text="Discount", width=100,
                                              command=lambda: self.switch_tab(1), hover_color="#e8e4df",
                                              font=("Unbounded", 14), fg_color="#f2efea", text_color="#4e2d18")
        self.discount_tab_btn.grid(row=0, column=1, padx=10)

        self.tab_content_container = ctk.CTkFrame(self, fg_color="transparent")
        self.tab_content_container.grid(row=4, column=0, sticky="ew", padx=0, pady=(0, 5))  # Remove padx here too
        self.tab_content_container.grid_columnconfigure(0, weight=1)  # Make sure container stretches

        # === Change Panel ===
        self.change_frame = ctk.CTkFrame(self.tab_content_container, fg_color="transparent")
        self.change_frame.grid(row=0, column=0, sticky="ew", pady=(0, 5))

        # Configure columns to distribute evenly with no extra space
        for i in range(4):
            self.change_frame.grid_columnconfigure(i, weight=1, uniform="cash_col")

        cash_buttons = [
            ("P20", 20, "#f8961e"),
            ("P50", 50, "#c30e0e"),
            ("P100", 100, "#5c0099"),
            ("P200", 200, "#87a70a"),
            ("P500", 500, "#ffd500"),
            ("P1000", 1000, "#0091f7"),
            ("Clear", 0, "#9e2b2b")
        ]

        for idx, (label, value, color) in enumerate(cash_buttons):
            cmd = self.clear_cash if label == "Clear" else lambda v=value: self.add_cash(v)
            btn = ctk.CTkButton(self.change_frame, text=label, height=40,
                                font=("Unbounded", 13), text_color=color,
                                border_color=color, fg_color="#f2efea",
                                border_width=2, corner_radius=8, hover_color="#e8e4df",
                                command=cmd)
            btn.grid(row=idx//4, column=idx%4, padx=1, pady=2, sticky="ew")  # Remove width, use sticky="ew"

        # Entry placed beside last button - also remove fixed width
        self.change_amount_entry = ctk.CTkEntry(self.change_frame, placeholder_text="Amount",
                                                height=40, font=("Inter", 13),
                                                text_color="#4e2d18", border_color="#f2efea")
        self.change_amount_entry.grid(row=1, column=3, padx=1, pady=2, sticky="ew")

        # === Discount Panel (Hidden by Default) ===
        self.discount_frame = ctk.CTkFrame(self.tab_content_container, fg_color="transparent")

        discount_buttons = [
            ("5%", 5, "#f8961e"),
            ("10%", 10, "#c30e0e"),
            ("20%", 20, "#5c0099"),
            ("50%", 50, "#ffd500"),
            ("100%", 100, "#87a70a"),
            ("Clear", 0, "#9e2b2b")
        ]

        for idx, (label, value, color) in enumerate(discount_buttons):
            mode = "percent"
            cmd = lambda v=value: self.apply_discount(v, mode)
            if label == "Clear":
                cmd = lambda: self.apply_discount(0, "percent")

            btn = ctk.CTkButton(self.discount_frame, text=label, width=90, height=40,
                                font=("Unbounded", 13), text_color=color,
                                border_color=color, fg_color="#f2efea",
                                border_width=2, corner_radius=8, hover_color="#e8e4df",
                                command=cmd)
            btn.grid(row=0 if idx < 4 else 1, column=idx % 4, padx=5, pady=5)

        # === Move entry fields to row=1, column=4 and column=5 (next to buttons)
        self.peso_input = ctk.CTkEntry(self.discount_frame, placeholder_text="₱ Amount", width=90, height=40,
                                    font=("Inter", 13), text_color="#4e2d18", border_color="#f2efea")
        self.peso_input.grid(row=1, column=2, padx=5, pady=5)

        self.percent_input = ctk.CTkEntry(self.discount_frame, placeholder_text="% Amount", width=90, height=40,
                                        font=("Inter", 13), text_color="#4e2d18", border_color="#f2efea")
        self.percent_input.grid(row=1, column=3, padx=5, pady=5)

        # Show change_frame by default
        self.change_frame.tkraise()

        # === Cash and Change Display ===
        self.cash_change_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.cash_change_frame.grid(row=5, column=0, sticky="ew", padx=24, pady=(5, 0))  # Reduced padding

        cash_column = ctk.CTkFrame(self.cash_change_frame, fg_color="transparent")
        cash_column.pack(side="left", expand=True)
        ctk.CTkLabel(cash_column, text="Cash Received", font=("Unbounded", 12), text_color="#4e2d18").pack(anchor="center")
        self.cash_received_display = ctk.CTkLabel(cash_column, text="₱ 0", font=("Unbounded", 24), text_color="#4d6443")
        self.cash_received_display.pack(anchor="center")

        change_column = ctk.CTkFrame(self.cash_change_frame, fg_color="transparent")
        change_column.pack(side="right", expand=True)
        ctk.CTkLabel(change_column, text="Change", font=("Unbounded", 12), text_color="#4e2d18").pack(anchor="center")
        self.change_display = ctk.CTkLabel(change_column, text="₱ 0", font=("Unbounded", 24), text_color="#4d6443")
        self.change_display.pack(anchor="center")

        # === Payment Buttons ===
        self.payment_buttons_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.payment_buttons_frame.grid(row=6, column=0, sticky="ew", padx=0, pady=(5, 10))  # Remove padx

        # Configure columns for single row - 4 columns with equal weight
        for i in range(4):
            self.payment_buttons_frame.grid_columnconfigure(i, weight=1)

        payment_methods = [
            ("GCash", "#0091f7"),
            ("Maya", "#9aca1f"), 
            ("Split", "#708a2e"),
            ("Charge", "#708a2e")
        ]

        # Place all buttons in row 0 with no padding between buttons
        for i, (method, color) in enumerate(payment_methods):
            if method == "GCash":
                command = self.handle_gcash
            elif method == "Maya":
                command = self.handle_maya
            elif method == "Split":
                command = self.open_split_popup
            else:  # Charge
                command = self.handle_charge
                
            btn = ctk.CTkButton(
                self.payment_buttons_frame,
                text=method,
                height=40,
                font=ctk.CTkFont("Inter", size=14, weight="bold"),
                fg_color=color,
                text_color="#ffffff",
                corner_radius=8,
                command=command
            )
            btn.grid(row=0, column=i, padx=1, pady=2, sticky="ew")  # Minimal padx

        self.charge_btn = ctk.CTkButton(self.payment_buttons_frame, text="Charge", width=140, height=40,
                                        font=("Unbounded", 16, "bold"), fg_color="#708a2e", text_color="#f2efea", hover_color="#5c7324",
                                        corner_radius=8, command=self.handle_charge)
        self.charge_btn.grid(row=0, column=3)

    def switch_tab(self, tab_index):
        self.selected_tab.set(tab_index)
        self.change_frame.grid_remove()
        self.discount_frame.grid_remove()

        if tab_index == 0:
            self.change_frame.grid()
        else:
            self.discount_frame.grid(row=0, column=0, sticky="ew", pady=(0, 5))

    def add_item_detail(self, name, quantity, size, item_info, extras, price):
        """Legacy method for backward compatibility"""
        item = ItemDetail(self.item_list_scroll, name, quantity, size, item_info, extras, price)
        item.pack(fill="x", pady=5)

    def add_cash(self, value):
        self.cash_received += value
        self.cash_received_display.configure(text=f"₱ {self.cash_received}")
        self.update_change()

    def clear_cash(self):
        self.cash_received = 0
        self.cash_received_display.configure(text="₱ 0")
        self.update_change()

    def apply_discount(self, value, mode):
        self.discount_value = value
        self.discount_type = mode
        # Add logic to update total

    def update_change(self):
        # Use actual total instead of dummy value
        change = self.cash_received - self.current_total
        self.change_display.configure(text=f"₱ {max(0, change)}")

    def open_split_popup(self, total=None):
        # Open the SplitPopup window when split button is clicked
        if total is None:
            total = self.current_total  # Use actual total
        SplitPopup(self, total_amount=total)

    # New methods for compatibility with the updated ticket system
    def add_item(self, item_detail):
        """Add an item to the ticket"""
        try:
            self.items.append(item_detail)
            item_detail.pack(fill="x", padx=5, pady=5)
            print(f"Item added to ticket panel. Total items: {len(self.items)}")
        except Exception as e:
            print(f"Error adding item to ticket panel: {e}")

    def update_total(self, new_total):
        """Update the total amount displayed"""
        try:
            self.current_total = new_total
            self.total_display.configure(text=f"₱ {new_total:.2f}")
            self.update_change()  # Update change when total changes
            print(f"Total updated to: ₱{new_total:.2f}")
        except Exception as e:
            print(f"Error updating total: {e}")

    def clear_items(self):
        """Clear all items from the ticket"""
        try:
            for item in self.items:
                item.destroy()
            self.items.clear()
            self.update_total(0.0)
        except Exception as e:
            print(f"Error clearing items: {e}")
            print(f"Error clearing items: {e}")

    def handle_gcash(self):
        """Handle GCash payment button click"""
        if hasattr(self, 'on_charge_callback') and self.on_charge_callback:
            # For digital payments, assume full payment (no change)
            charge_data = {
                "total_amount": self.current_total,
                "cash_received": self.current_total,  # Full payment via GCash
                "change": 0,  # No change for digital payments
                "discount": 0,
                "payment_type": "GCash"
            }
            self.on_charge_callback(charge_data)
        else:
            print("No charge callback set")

    def handle_maya(self):
        """Handle Maya payment button click"""
        if hasattr(self, 'on_charge_callback') and self.on_charge_callback:
            # For digital payments, assume full payment (no change)
            charge_data = {
                "total_amount": self.current_total,
                "cash_received": self.current_total,  # Full payment via Maya
                "change": 0,  # No change for digital payments
                "discount": 0,
                "payment_type": "Maya"
            }
            self.on_charge_callback(charge_data)
        else:
            print("No charge callback set")

    def handle_charge(self):
        """Handle charge button click - create ticket and show receipt"""
        if hasattr(self, 'on_charge_callback') and self.on_charge_callback:
            # Calculate change
            change = max(0, self.cash_received - self.current_total)
            
            charge_data = {
                "total_amount": self.current_total,
                "cash_received": self.cash_received,
                "change": change,
                "discount": 0,
                "payment_type": "Cash"  # Default to Cash for charge button
            }
            self.on_charge_callback(charge_data)
        else:
            print("No charge callback set")

    def set_charge_callback(self, callback):
        """Set the callback function for charge button"""
        self.on_charge_callback = callback
