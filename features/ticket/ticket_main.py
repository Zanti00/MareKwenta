from tkinter import messagebox
import customtkinter as ctk
from .product_panel import ProductPanel
from .ticket_panel import TicketPanel
from .components.modifier_popup import ModifierPopup
import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(__file__)))  # Add view folder to path
from nav_bar import Navbar
from .product_panel import ProductPanel
from .components.ticket_panel import TicketPanel
from .components.item_detail import ItemDetail
from .ticket_controller import TicketController
from .components.receipt_popup import ReceiptPopup

class TicketMainPage(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="employee", employee_id=None):
        super().__init__(parent)
        self.configure(fg_color="#f2efea")
        
        self.user_role = user_role
        self.main_app = main_app
        self.current_user_id = employee_id
        
        # Configure appearance
        # ctk.set_appearance_mode("light")
        # ctk.set_default_color_theme("blue")
        
        # Configure grid
        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # Bind window close event
        # self.root.protocol("WM_DELETE_WINDOW", self.on_closing)
        
        # Initialize cart items list
        self.cart_items = []
        self.current_total = 0.0
        
        
        
        self.setup_ui()

    def on_closing(self):
        """Handle window closing"""
        try:
            self.quit()
            self.destroy()
        except:
            pass

    def setup_ui(self):
        # Create navbar
        # self.navbar = Navbar(self, width=124, user_role=self.user_role, active_tab="ticket")
        # self.navbar.grid(row=0, column=0, sticky="ns")
        
        # # Set navigation callbacks
        # self.navbar.set_nav_callback("ticket", self.show_ticket)
        # self.navbar.set_nav_callback("receipt", self.show_receipt)
        # self.navbar.set_nav_callback("inventory", self.show_inventory)
        # self.navbar.set_nav_callback("staff", self.show_staff)
        # self.navbar.set_nav_callback("cashbox", self.show_cashbox)
        # self.navbar.set_nav_callback("dashboard", self.show_dashboard)
        
        # Main content area
        self.main_frame = ctk.CTkFrame(self, fg_color="#f2efea")
        self.main_frame.grid(row=0, column=1, sticky="nsew", padx=(0, 0), pady=0)
        self.main_frame.grid_columnconfigure(0, weight=2)  # Product panel takes more space
        self.main_frame.grid_columnconfigure(1, weight=1)  # Ticket panel
        self.main_frame.grid_rowconfigure(0, weight=1)
        
        # Product panel (left side)
        self.product_panel = ProductPanel(self.main_frame, on_product_click=self.handle_product_click)
        self.product_panel.grid(row=0, column=0, sticky="nsew", padx=(10, 5), pady=10)
        
        # Ticket panel (right side)
        self.ticket_panel = TicketPanel(self.main_frame)
        self.ticket_panel.grid(row=0, column=1, sticky="nsew", padx=(5, 10), pady=10)
        
        # Set charge callback
        self.ticket_panel.set_charge_callback(self.handle_charge)

    def handle_product_click(self, cart_item):
        """Handle product selection from product panel"""
        print(f"Product clicked: {cart_item}")  # Debug print
        
        try:
            # Check if this exact item already exists in cart
            existing_item_detail = self.find_existing_item(cart_item)
            
            if existing_item_detail:
                # Update existing item instead of creating new one
                self.update_existing_item(existing_item_detail, cart_item)
            else:
                # Create new item detail widget for display
                item_detail = ItemDetail(
                    self.ticket_panel.scrollable_frame,
                    product_name=cart_item["name"],
                    quantity=cart_item["quantity"],
                    size_drink=cart_item.get("size", ""),
                    item_info=cart_item.get("temperature", ""),
                    extras=cart_item.get("extras", []),
                    extras_cost=cart_item.get("extras_cost", 0),
                    unit_price=cart_item["unit_price"],
                    on_remove=self.remove_item
                )
                
                # Add to ticket panel
                self.ticket_panel.add_item(item_detail)
                
                # Add item to cart list
                self.cart_items.append(cart_item)
            
            # Update total (includes extras cost)
            item_total = (cart_item["quantity"] * cart_item["unit_price"]) + (cart_item["quantity"] * cart_item.get("extras_cost", 0))
            self.current_total += item_total
            self.ticket_panel.update_total(self.current_total)
            
            print(f"Item added/updated in cart. New total: ₱{self.current_total:.2f}")
            
        except Exception as e:
            print(f"Error adding item to cart: {e}")
            messagebox.showerror("Error", f"Failed to add item to cart: {e}")

    def find_existing_item(self, new_cart_item):
        """Find if an identical item already exists in the ticket panel"""
        try:
            for item_detail in self.ticket_panel.items:
                # Check if it's the same product with same specifications
                if (item_detail.product_name == new_cart_item["name"] and
                    item_detail.size_drink == new_cart_item.get("size", "") and
                    item_detail.item_info == new_cart_item.get("temperature", "") and
                    item_detail.extras == new_cart_item.get("extras", []) and
                    item_detail.extras_cost == new_cart_item.get("extras_cost", 0) and
                    item_detail.unit_price == new_cart_item["unit_price"]):
                    return item_detail
            return None
        except Exception as e:
            print(f"Error finding existing item: {e}")
            return None

    def update_existing_item(self, existing_item_detail, new_cart_item):
        """Update the quantity and total of an existing item"""
        try:
            # Update quantity
            new_quantity = existing_item_detail.quantity + new_cart_item["quantity"]
            existing_item_detail.quantity = new_quantity
            
            # Recalculate item total
            existing_item_detail.item_total = (new_quantity * existing_item_detail.unit_price) + (new_quantity * existing_item_detail.extras_cost)
            
            # Update the display
            self.refresh_item_detail_display(existing_item_detail)
            
            # Update the cart_items list
            for cart_item in self.cart_items:
                if (cart_item["name"] == new_cart_item["name"] and
                    cart_item.get("size", "") == new_cart_item.get("size", "") and
                    cart_item.get("temperature", "") == new_cart_item.get("temperature", "") and
                    cart_item.get("extras", []) == new_cart_item.get("extras", []) and
                    cart_item.get("extras_cost", 0) == new_cart_item.get("extras_cost", 0) and
                    cart_item["unit_price"] == new_cart_item["unit_price"]):
                    cart_item["quantity"] = new_quantity
                    break
            
            print(f"Updated existing item quantity to {new_quantity}")
            
        except Exception as e:
            print(f"Error updating existing item: {e}")

    def refresh_item_detail_display(self, item_detail):
        """Refresh the display of an ItemDetail widget"""
        try:
            # Clear the existing widgets
            for widget in item_detail.left_column.winfo_children():
                widget.destroy()
            for widget in item_detail.right_column.winfo_children():
                widget.destroy()
            
            # Recreate the content with updated data
            import customtkinter as ctk
            from PIL import Image
            import os
            
            # Left section: Product info (recreated)
            name = ctk.CTkLabel(item_detail.left_column, text=item_detail.product_name, font=("Unbounded", 16), text_color="#4e2d18")
            name.pack(anchor="w", pady=(7,0), ipady=0)

            details_lines = []
            if item_detail.size_drink:
                details_lines.append(f"Size: {item_detail.size_drink}")
            if item_detail.item_info:
                details_lines.append(f"Temperature: {item_detail.item_info}")
            if item_detail.extras:
                extras_str = ", ".join(item_detail.extras) if isinstance(item_detail.extras, list) else str(item_detail.extras)
                if item_detail.extras_cost > 0:
                    details_lines.append(f"Extras: {extras_str} (+₱{item_detail.extras_cost})")
                else:
                    details_lines.append(f"Extras: {extras_str}")
            details_lines.append(f"Quantity: {item_detail.quantity}")
            details_text = "\n".join(details_lines)
            details_label = ctk.CTkLabel(
                item_detail.left_column,
                text=details_text,
                font=("Inter", 12),
                text_color="#4e2d18",
                anchor="w",
                justify="left"
            )
            details_label.pack(anchor="w", pady=(0,10), ipady=0)

            # Right section: Total + Delete (recreated)
            assets_dir = os.path.join(os.path.dirname(__file__), '..', 'assets')
            icon_path = os.path.abspath(os.path.join(assets_dir, 'trash.png'))
            
            try:
                trash_icon = ctk.CTkImage(light_image=Image.open(icon_path))
                delete_btn = ctk.CTkButton(item_detail.right_column, width=20, height=20, text="",
                                           fg_color="transparent", hover_color="#f0f0f0",
                                           image=trash_icon,
                                           command=item_detail._remove_self)
            except:
                # Fallback if trash icon doesn't exist
                delete_btn = ctk.CTkButton(item_detail.right_column, width=20, height=20, text="✕",
                                           fg_color="transparent", hover_color="#f0f0f0",
                                           text_color="#dc3545",
                                           command=item_detail._remove_self)
            
            delete_btn.place(relx=1.0, rely=0.0, anchor="ne")

            total_text = ctk.CTkLabel(item_detail.right_column,
                                      text=f"\u20B1{item_detail.item_total:.2f}",
                                      font=("Unbounded", 16, "bold"),
                                      text_color="#708a2e")
            total_text.place(relx=1.0, rely=1.0, anchor="se")
            
        except Exception as e:
            print(f"Error refreshing item detail display: {e}")

    def remove_item(self, product_name, item_total):
        """Handle item removal from cart"""
        try:
            # Update total
            self.current_total -= item_total
            self.ticket_panel.update_total(self.current_total)

            # Remove from cart items list
            self.cart_items = [item for item in self.cart_items if not (
                item["name"] == product_name and 
                (item["quantity"] * item["unit_price"]) + (item["quantity"] * item.get("extras_cost", 0)) == item_total
            )]

            # Remove the corresponding ItemDetail from the ticket panel's items list
            self.ticket_panel.items = [
                item for item in self.ticket_panel.items
                if not (item.product_name == product_name and item.item_total == item_total)
            ]

            print(f"Item removed. New total: ₱{self.current_total:.2f}")

        except Exception as e:
            print(f"Error removing item: {e}")

    def handle_charge(self, charge_data):
        """Handle charge button click - create ticket in database"""
        try:
            if not self.cart_items:
                messagebox.showwarning("Empty Cart", "Cannot create ticket with empty cart")
                return
                
            # For digital payments, no cash validation needed
            payment_type = charge_data.get("payment_type", "Cash")
            
            if payment_type == "Cash":
                # Only validate cash for Cash payments
                if charge_data["cash_received"] < charge_data["total_amount"]:
                    messagebox.showwarning("Insufficient Payment", "Cash received is less than total amount")
                    return
            elif payment_type == "Split":
                # For split payment, show confirmation dialog
                split_payments = charge_data.get("split_payments", [])
                payment_summary = ", ".join([f"{p['payment_type']}: ₱{p['payment_amount']:.2f}" for p in split_payments])
                discount_text = f" (Discount: ₱{charge_data['discount']:.2f})" if charge_data['discount'] > 0 else ""
                
                result = messagebox.askyesno(
                    "Split Payment", 
                    f"Process split payment of ₱{charge_data['total_amount']:.2f}{discount_text}?\n\nPayment breakdown:\n{payment_summary}"
                )
                if not result:
                    return
            else:
                # For GCash/Maya, show confirmation dialog
                discount_text = f" (Discount: ₱{charge_data['discount']:.2f})" if charge_data['discount'] > 0 else ""
                result = messagebox.askyesno(
                    f"{payment_type} Payment", 
                    f"Process {payment_type} payment of ₱{charge_data['total_amount']:.2f}{discount_text}?"
                )
                if not result:
                    return
            
            print(f"Processing charge: {charge_data}")
            
            # Create ticket in database
            ticket_result = TicketController.create_ticket(
                employee_id=self.current_user_id,
                cart_items=self.cart_items,
                total_amount=charge_data["total_amount"],  # Final amount after discount
                cash_received=charge_data["cash_received"],
                change=charge_data["change"],
                discount=charge_data["discount"],  # Discount amount
                payment_type=payment_type,
                split_payments=charge_data.get("split_payments")  # Pass split payment data
            )
            
            # Handle the result (could be tuple or single value for backward compatibility)
            if isinstance(ticket_result, tuple):
                ticket_id, error_msg = ticket_result
            else:
                ticket_id = ticket_result
                error_msg = None
            
            if ticket_id:
                discount_info = f" with ₱{charge_data['discount']:.2f} discount" if charge_data['discount'] > 0 else ""
                if payment_type == "Split":
                    messagebox.showinfo("Success", f"Ticket #{ticket_id} created successfully with split payment{discount_info}!")
                else:
                    messagebox.showinfo("Success", f"Ticket #{ticket_id} created successfully with {payment_type} payment{discount_info}!")
                
                # Show receipt popup
                self.show_receipt_popup(ticket_id)
                
                # Clear cart after successful transaction
                self.clear_cart()
                
            else:
                if error_msg and "Insufficient inventory" in error_msg:
                    messagebox.showerror("Insufficient Inventory", error_msg)
                else:
                    messagebox.showerror("Error", error_msg or "Failed to create ticket")
                
        except Exception as e:
            print(f"Error handling charge: {e}")
            messagebox.showerror("Error", f"Failed to process charge: {e}")

    def show_receipt_popup(self, ticket_id):
        """Show receipt popup with ticket details"""
        try:
            print(f"Showing receipt for ticket ID: {ticket_id}")
            ticket_details = TicketController.get_ticket_details(ticket_id)
            if ticket_details:
                print("Ticket details retrieved successfully, creating receipt popup")
                ReceiptPopup(self, ticket_details)
            else:
                print("Failed to retrieve ticket details from database")
                messagebox.showerror("Error", "Failed to retrieve ticket details")
        except Exception as e:
            print(f"Error showing receipt: {e}")
            import traceback
            traceback.print_exc()
            messagebox.showerror("Error", f"Failed to show receipt: {e}")

    def clear_cart(self):
        """Clear the shopping cart"""
        try:
            # Clear cart items
            self.cart_items = []
            self.current_total = 0.0
            
            # Clear ticket panel
            self.ticket_panel.clear_items()
            self.ticket_panel.update_total(0.0)
            
            # Reset cash received
            self.ticket_panel.cash_received = 0
            self.ticket_panel.cash_received_display.configure(text="₱ 0")
            self.ticket_panel.update_change()
            
            print("Cart cleared successfully")
            
        except Exception as e:
            print(f"Error clearing cart: {e}")

    # Navigation methods
    def show_ticket(self):
        pass  # Already on this page, do nothing!

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

    def handle_split_popup(self, total):
        try:
            self.ticket_panel.open_split_popup(total)
        except Exception as e:
            print(f"Error opening split popup: {e}")

# Alternative entry point function to avoid recursion issues
def create_ticket_app(user_role="employee"):
    """Factory function to create the ticket application"""
    try:
        app = TicketMainPage(None, None, user_role=user_role)
        return app
    except Exception as e:
        print(f"Error creating ticket app: {e}")
        return None