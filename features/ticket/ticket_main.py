import customtkinter as ctk
from tkinter import messagebox
import sys
import os

# Add navigation imports
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
from nav_bar import Navbar

class TicketMainPage(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="employee"):
        super().__init__(parent)
        self.main_app = main_app
        self.user_role = user_role
        
        # Configure appearance
        ctk.set_appearance_mode("light")
        ctk.set_default_color_theme("blue")
        
        # Configure grid
        self.root.grid_columnconfigure(1, weight=1)
        self.root.grid_rowconfigure(0, weight=1)
        
        # Bind window close event
        self.root.protocol("WM_DELETE_WINDOW", self.on_closing)
        
        # Initialize cart items list
        self.cart_items = []
        self.current_total = 0.0
        
        self.setup_ui()

    def on_closing(self):
        """Handle window closing"""
        try:
            self.root.quit()
            self.root.destroy()
        except:
            pass

    def setup_ui(self):
        # Create navbar
        self.navbar = Navbar(self.root, width=124, user_role=self.user_role, active_tab="ticket")
        self.navbar.grid(row=0, column=0, sticky="ns")
        
        # Set navigation callbacks
        self.navbar.set_nav_callback("ticket", self.show_ticket)
        self.navbar.set_nav_callback("receipt", self.show_receipt)
        self.navbar.set_nav_callback("inventory", self.show_inventory)
        self.navbar.set_nav_callback("staff", self.show_staff)
        self.navbar.set_nav_callback("cashbox", self.show_cashbox)
        self.navbar.set_nav_callback("dashboard", self.show_dashboard)
        
        # Main content area
        self.main_frame = ctk.CTkFrame(self.root, fg_color="#f2efea")
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

    def handle_product_click(self, cart_item):
        """Handle product selection from product panel"""
        print(f"Product clicked: {cart_item}")  # Debug print
        
        try:
            # Add item to cart list
            self.cart_items.append(cart_item)
            
            # Create item detail widget for display
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
            
            # Update total (includes extras cost)
            item_total = (cart_item["quantity"] * cart_item["unit_price"]) + (cart_item["quantity"] * cart_item.get("extras_cost", 0))
            self.current_total += item_total
            self.ticket_panel.update_total(self.current_total)
            
            print(f"Item added to cart. New total: ₱{self.current_total:.2f}")
            
        except Exception as e:
            print(f"Error adding item to cart: {e}")
            messagebox.showerror("Error", f"Failed to add item to cart: {e}")

    def remove_item(self, product_name, item_total):
        """Handle item removal from cart"""
        try:
            # Update total
            self.current_total -= item_total
            self.ticket_panel.update_total(self.current_total)
            
            # Remove from cart items list
            self.cart_items = [item for item in self.cart_items if not (
                item["name"] == product_name and 
                (item["quantity"] * item["unit_price"]) == item_total
            )]
            
            print(f"Item removed. New total: ₱{self.current_total:.2f}")
            
        except Exception as e:
            print(f"Error removing item: {e}")

    # Navigation methods
    def show_ticket(self):
        """Already on ticket page"""
        pass

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

    def handle_product_click(self, product_name, product_type):
        print(f"Clicked: {product_name} ({product_type})")
        try:
            ModifierPopup(self, product_name=product_name, product_type=product_type, on_submit=self.handle_modifier_submit)
        except Exception as e:
            print(f"Error navigating to dashboard: {e}")

    def handle_modifier_submit(self, product_name, quantity, size, temperature, extras):
        print(f"Adding to cart: {product_name} - Qty: {quantity}, Size: {size}, Temp: {temperature}, Extras: {extras}")
        try:
            # TODO: Add the item to the cart in ticket_panel
            pass
        except Exception as e:
            print(f"Error adding item to cart: {e}")

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

