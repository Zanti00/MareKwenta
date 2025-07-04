import customtkinter as ctk
import tkinter as tk
from .item_detail import ItemDetail
from .split_popup import SplitPopup

class TicketPanel(ctk.CTkFrame):
    def __init__(self, master, on_split_popup=None, *args, **kwargs):
        super().__init__(master, width=400, fg_color="#f2efea", border_width=1, border_color="lightgray", *args, **kwargs)
        self.grid_propagate(False)  # Prevent expansion to fit children
        self.grid_rowconfigure(1, weight=1)  # Make the item list expandable
        self.grid_columnconfigure(0, weight=1)

        self.on_split_popup = on_split_popup
        self.selected_tab = tk.IntVar(value=0)
        self.cart = []
        self.discount_value = 0
        self.discount_type = "percent"
        self.applied_discount = 0  # Initialize applied discount
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
        # Add empty columns to center the buttons inside tab_frame
        self.tab_frame.grid_columnconfigure(0, weight=1)
        self.tab_frame.grid_columnconfigure(1, weight=0)
        self.tab_frame.grid_columnconfigure(2, weight=0)
        self.tab_frame.grid_columnconfigure(3, weight=1)

        self.change_tab_btn = ctk.CTkButton(self.tab_frame, text="Change", width=100,
                                            command=lambda: self.switch_tab(0), hover_color="#e8e4df",
                                            font=("Unbounded", 14), fg_color="#f2efea", text_color="#4e2d18")
        self.change_tab_btn.grid(row=0, column=1, padx=10)

        self.discount_tab_btn = ctk.CTkButton(self.tab_frame, text="Discount", width=100,
                                              command=lambda: self.switch_tab(1), hover_color="#e8e4df",
                                              font=("Unbounded", 14), fg_color="#f2efea", text_color="#4e2d18")
        self.discount_tab_btn.grid(row=0, column=2, padx=10)

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

        # Configure columns for discount frame
        for i in range(4):
            self.discount_frame.grid_columnconfigure(i, weight=1, uniform="discount_col")

        discount_buttons = [
            ("5%", 5, "#f8961e"),
            ("10%", 10, "#c30e0e"),
            ("20%", 20, "#5c0099"),
            ("50%", 50, "#ffd500"),
            ("100%", 100, "#87a70a"),
            ("Clear", 0, "#9e2b2b")
        ]

        for idx, (label, value, color) in enumerate(discount_buttons):
            if label == "Clear":
                cmd = self.clear_discount
            else:
                cmd = lambda v=value: self.apply_discount(v, "percent")

            btn = ctk.CTkButton(self.discount_frame, text=label, height=40,
                                font=("Unbounded", 13), text_color=color,
                                border_color=color, fg_color="#f2efea",
                                border_width=2, corner_radius=8, hover_color="#e8e4df",
                                command=cmd)
            btn.grid(row=0 if idx < 4 else 1, column=idx % 4, padx=1, pady=2, sticky="ew")

        # Custom discount input fields
        self.peso_input = ctk.CTkEntry(self.discount_frame, placeholder_text="₱ Amount", height=40,
                                    font=("Inter", 13), text_color="#4e2d18", border_color="#f2efea")
        self.peso_input.grid(row=1, column=2, padx=1, pady=2, sticky="ew")
        self.peso_input.bind("<KeyRelease>", self.on_peso_input_change)

        self.percent_input = ctk.CTkEntry(self.discount_frame, placeholder_text="% Amount", height=40,
                                        font=("Inter", 13), text_color="#4e2d18", border_color="#f2efea")
        self.percent_input.grid(row=1, column=3, padx=1, pady=2, sticky="ew")
        self.percent_input.bind("<KeyRelease>", self.on_percent_input_change)

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
        """Apply discount to the current total"""
        try:
            if self.current_total <= 0:
                print("No items in cart to apply discount")
                return
                
            # Store discount info
            self.discount_value = value
            self.discount_type = mode
            
            # Calculate discount amount
            if mode == "percent":
                discount_amount = (self.current_total * value) / 100
            else:  # fixed amount
                discount_amount = min(value, self.current_total)  # Don't exceed total
            
            # Apply discount to total
            discounted_total = max(0, self.current_total - discount_amount)
            
            # Update display
            self.total_display.configure(text=f"₱ {discounted_total:.2f}")
            self.update_change()
            
            # Store the actual discount amount applied
            self.applied_discount = discount_amount
            
            print(f"Applied {mode} discount: {value}{'%' if mode == 'percent' else ''} = ₱{discount_amount:.2f}")
            
        except Exception as e:
            print(f"Error applying discount: {e}")

    def clear_discount(self):
        """Clear any applied discount"""
        try:
            # Reset discount values
            self.discount_value = 0
            self.discount_type = "percent"
            self.applied_discount = 0
            
            # Clear input fields
            self.peso_input.delete(0, 'end')
            self.percent_input.delete(0, 'end')
            
            # Restore original total
            self.total_display.configure(text=f"₱ {self.current_total:.2f}")
            self.update_change()
            
            print("Discount cleared")
            
        except Exception as e:
            print(f"Error clearing discount: {e}")

    def on_peso_input_change(self, event=None):
        """Handle custom peso amount input"""
        try:
            peso_value = self.peso_input.get().strip()
            if peso_value:
                amount = float(peso_value)
                self.apply_discount(amount, "fixed")
            else:
                self.clear_discount()
        except ValueError:
            # Invalid input, ignore
            pass
        except Exception as e:
            print(f"Error processing peso input: {e}")

    def on_percent_input_change(self, event=None):
        """Handle custom percentage input"""
        try:
            percent_value = self.percent_input.get().strip()
            if percent_value:
                percentage = float(percent_value)
                if 0 <= percentage <= 100:  # Validate percentage range
                    self.apply_discount(percentage, "percent")
                else:
                    print("Percentage must be between 0 and 100")
            else:
                self.clear_discount()
        except ValueError:
            # Invalid input, ignore
            pass
        except Exception as e:
            print(f"Error processing percent input: {e}")

    def update_change(self):
        """Update change calculation with discount consideration"""
        try:
            # Get the current displayed total (which includes discount)
            displayed_total_text = self.total_display.cget("text")
            displayed_total = float(displayed_total_text.replace("₱ ", "").replace(",", ""))
            
            change = self.cash_received - displayed_total
            self.change_display.configure(text=f"₱ {max(0, change):.2f}")
        except Exception as e:
            print(f"Error updating change: {e}")
            # Fallback to original calculation
            change = self.cash_received - self.current_total
            self.change_display.configure(text=f"₱ {max(0, change):.2f}")

    def update_total(self, new_total):
        """Update the total amount and recalculate discount if any"""
        try:
            self.current_total = new_total
            
            # If there's an active discount, reapply it
            if hasattr(self, 'discount_value') and self.discount_value > 0:
                if self.discount_type == "percent":
                    discount_amount = (new_total * self.discount_value) / 100
                else:  # fixed amount
                    discount_amount = min(self.discount_value, new_total)
                
                discounted_total = max(0, new_total - discount_amount)
                self.total_display.configure(text=f"₱ {discounted_total:.2f}")
                self.applied_discount = discount_amount
            else:
                self.total_display.configure(text=f"₱ {new_total:.2f}")
                self.applied_discount = 0
            
            self.update_change()  # Update change when total changes
            print(f"Total updated to: ₱{new_total:.2f}, Applied discount: ₱{self.applied_discount:.2f}")
            
        except Exception as e:
            print(f"Error updating total: {e}")

    def clear_items(self):
        """Clear all items from the ticket"""
        try:
            for item in self.items:
                item.destroy()
            self.items.clear()
            # Reset discount when clearing items
            self.clear_discount()
            self.update_total(0.0)
        except Exception as e:
            print(f"Error clearing items: {e}")

    def handle_charge(self):
        """Handle charge button click - include discount in payment data"""
        if hasattr(self, 'on_charge_callback') and self.on_charge_callback:
            # Get the displayed total (after discount)
            displayed_total_text = self.total_display.cget("text")
            displayed_total = float(displayed_total_text.replace("₱ ", "").replace(",", ""))
            
            # Calculate change based on displayed (discounted) total
            change = max(0, self.cash_received - displayed_total)
            
            charge_data = {
                "total_amount": displayed_total,  # Final amount after discount
                "cash_received": self.cash_received,
                "change": change,
                "discount": getattr(self, 'applied_discount', 0),  # Actual discount amount
                "payment_type": "Cash"
            }
            
            print(f"Charge - Total: {displayed_total}, Original: {self.current_total}, Discount: {charge_data['discount']}")
            self.on_charge_callback(charge_data)
        else:
            print("No charge callback set")

    def handle_gcash(self):
        """Handle GCash payment button click - include discount"""
        if hasattr(self, 'on_charge_callback') and self.on_charge_callback:
            displayed_total_text = self.total_display.cget("text")
            displayed_total = float(displayed_total_text.replace("₱ ", "").replace(",", ""))
            
            charge_data = {
                "total_amount": displayed_total,
                "cash_received": displayed_total,  # Full payment via GCash
                "change": 0,
                "discount": getattr(self, 'applied_discount', 0),
                "payment_type": "GCash"
            }
            print(f"GCash - Total: {displayed_total}, Discount: {charge_data['discount']}")
            self.on_charge_callback(charge_data)
        else:
            print("No charge callback set")

    def handle_maya(self):
        """Handle Maya payment button click - include discount"""
        if hasattr(self, 'on_charge_callback') and self.on_charge_callback:
            displayed_total_text = self.total_display.cget("text")
            displayed_total = float(displayed_total_text.replace("₱ ", "").replace(",", ""))
            
            charge_data = {
                "total_amount": displayed_total,
                "cash_received": displayed_total,  # Full payment via Maya
                "change": 0,
                "discount": getattr(self, 'applied_discount', 0),
                "payment_type": "Maya"
            }
            print(f"Maya - Total: {displayed_total}, Discount: {charge_data['discount']}")
            self.on_charge_callback(charge_data)
        else:
            print("No charge callback set")

    def open_split_popup(self, total=None):
        # Open the SplitPopup window when split button is clicked
        if total is None:
            displayed_total_text = self.total_display.cget("text")
            total = float(displayed_total_text.replace("₱ ", "").replace(",", ""))
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

    def set_charge_callback(self, callback):
        """Set the callback function for charge button"""
        self.on_charge_callback = callback

    def clear_cart(self):
        """Alias for clear_items for compatibility with TicketMainPage."""
        self.clear_items()
