import customtkinter as ctk
from tkinter import messagebox
import sys
import os

# Add navigation imports
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
from nav_bar import Navbar
from .product_panel import ProductPanel
from .components.ticket_panel import TicketPanel
from .components.item_detail import ItemDetail

class TicketMainPage:
    def __init__(self, user_role="admin"):
        self.root = ctk.CTk()
        self.root.title("MareKwenta POS")
        
        # Set window to fullscreen
        taskbar_height = 70
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()
        usable_height = screen_height - taskbar_height
        self.root.geometry(f"{screen_width}x{usable_height}+0+0")
        self.root.configure(fg_color="#f2efea")
        
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
        """Navigate to receipt page"""
        try:
            from receipt.sales_history import SalesHistoryMain
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_receipt_launch())
        except Exception as e:
            print(f"Error navigating to receipt: {e}")

    def _delayed_receipt_launch(self):
        try:
            from receipt.sales_history import SalesHistoryMain
            self.root.destroy()
            receipt_page = SalesHistoryMain(self.user_role)
            receipt_page.run()
        except Exception as e:
            print(f"Error launching receipt page: {e}")

    def show_inventory(self):
        """Navigate to inventory page"""
        try:
            from inventory.inventory_page import InventoryManagement
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_inventory_launch())
        except Exception as e:
            print(f"Error navigating to inventory: {e}")

    def _delayed_inventory_launch(self):
        try:
            from inventory.inventory_page import InventoryManagement
            self.root.destroy()
            inventory_page = InventoryManagement(self.user_role)
            inventory_page.run()
        except Exception as e:
            print(f"Error launching inventory page: {e}")

    def show_staff(self):
        """Navigate to staff page"""
        try:
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_staff_launch())
        except Exception as e:
            print(f"Error navigating to staff: {e}")

    def _delayed_staff_launch(self):
        try:
            self.root.destroy()
            if self.user_role == "admin":
                from staff.staff_admin import StaffPageAdmin
                StaffPageAdmin(user_role="admin").run()
            else:
                from staff.staff_employee import StaffPageEmployee
                StaffPageEmployee(user_role="employee").run()
        except Exception as e:
            print(f"Error launching staff page: {e}")

    def show_cashbox(self):
        """Navigate to cashbox page"""
        try:
            from cash_box.cashbox_page import CashBoxApp
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_cashbox_launch())
        except Exception as e:
            print(f"Error navigating to cashbox: {e}")

    def _delayed_cashbox_launch(self):
        try:
            from cash_box.cashbox_page import CashBoxApp
            self.root.destroy()
            cashbox_page = CashBoxApp(self.user_role)
            cashbox_page.run()
        except Exception as e:
            print(f"Error launching cashbox page: {e}")

    def show_dashboard(self):
        """Navigate to dashboard page"""
        try:
            from dashboard.sales_dashboard import SalesDashboard
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_dashboard_launch())
        except Exception as e:
            print(f"Error navigating to dashboard: {e}")

    def _delayed_dashboard_launch(self):
        try:
            from dashboard.sales_dashboard import SalesDashboard
            self.root.destroy()
            dashboard_page = SalesDashboard(self.user_role)
            dashboard_page.run()
        except Exception as e:
            print(f"Error launching dashboard page: {e}")

    def run(self):
        """Start the application"""
        try:
            self.root.mainloop()
        except Exception as e:
            print(f"Error running TicketMainPage: {e}")
            messagebox.showerror("Fatal Error", f"Application failed to start: {e}")
        finally:
            try:
                self.root.destroy()
            except:
                pass

    def mainloop(self):
        """Alternative method name for compatibility"""
        self.run()

