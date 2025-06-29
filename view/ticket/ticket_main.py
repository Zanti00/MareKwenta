import customtkinter as ctk
from .product_panel import ProductPanel
from .ticket_panel import TicketPanel
from .components.modifier_popup import ModifierPopup
import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(__file__)))  # Add view folder to path
from nav_bar import Navbar

class TicketMainPage(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.geometry("1240x1440")
        self.title("MareKwenta POS")
        self.configure(fg_color="#f2efea")
        
        # Flag to prevent recursive calls
        self._switching_page = False

        # === MAIN WRAPPER FRAME ===
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)

        self.navbar = Navbar(self, width=124)
        self.navbar.grid(row=0, column=0, sticky="ns", padx=(0, 0), pady=0)
        self.navbar.set_nav_callback("ticket", self.show_ticket)
        self.navbar.set_nav_callback("receipt", self.show_receipt)
        self.navbar.set_nav_callback("inventory", self.show_inventory)
        self.navbar.set_nav_callback("staff", self.show_staff)
        self.navbar.set_nav_callback("cashbox", self.show_cashbox)
        self.navbar.set_nav_callback("dashboard", self.show_dashboard)

        main_frame = ctk.CTkFrame(self, fg_color="transparent")
        main_frame.grid(row=0, column=1, sticky="nsew", padx=(0, 0), pady=0)

        # === LEFT COLUMN (Header + Product Panel) ===
        left_column = ctk.CTkFrame(main_frame, fg_color="transparent")
        left_column.pack(side="left", fill="both", expand=True, padx=(5, 20), pady=30)

        # === HEADER ===
        header_frame = ctk.CTkFrame(left_column, fg_color="transparent")
        header_frame.pack(fill="x", pady=(0, 10),padx=20)

        hello_label = ctk.CTkLabel(header_frame, text="Hello,", font=("Unbounded", 36), text_color="#4e2d18")
        hello_label.pack(side="left")

        self.user_label = ctk.CTkLabel(header_frame, text="User", font=("Unbounded", 36), text_color="#4e2d18")
        self.user_label.pack(side="left", padx=(10, 0))

        # === PRODUCT PANEL ===
        self.product_panel = ProductPanel(left_column, on_product_click=self.handle_product_click)
        self.product_panel.pack(fill="both", expand=True)

        # === RIGHT PANEL ===
        self.ticket_panel = TicketPanel(main_frame, on_split_popup=self.handle_split_popup)
        self.ticket_panel.pack(side="right", fill="y")

    def show_ticket(self):
        pass  # Already on this page, do nothing!

    def show_receipt(self):
        if self._switching_page:
            return
        self._switching_page = True
        
        try:
            # Use after_idle to prevent recursion issues
            self.after_idle(self._switch_to_receipt)
        except Exception as e:
            print(f"Error switching to receipt: {e}")
            self._switching_page = False

    def _switch_to_receipt(self):
        try:
            from receipt.sales_history import SalesHistoryMain
            self.destroy()
            app = SalesHistoryMain()
            app.mainloop()
        except Exception as e:
            print(f"Error loading receipt page: {e}")

    def show_inventory(self):
        if self._switching_page:
            return
        self._switching_page = True
        
        try:
            self.after_idle(self._switch_to_inventory)
        except Exception as e:
            print(f"Error switching to inventory: {e}")
            self._switching_page = False

    def _switch_to_inventory(self):
        try:
            from inventory.inventory_page import InventoryManagement
            self.destroy()
            app = InventoryManagement()
            app.mainloop()
        except Exception as e:
            print(f"Error loading inventory page: {e}")

    def show_staff(self):
        if self._switching_page:
            return
        print("Staff page not yet implemented")
        # TODO: Implement StaffMainPage

    def show_cashbox(self):
        if self._switching_page:
            return
        print("Cashbox page not yet implemented")
        # TODO: Implement CashboxMainPage

    def show_dashboard(self):
        if self._switching_page:
            return
        print("Dashboard page not yet implemented")
        # TODO: Implement DashboardMainPage

    def handle_product_click(self, product_name, product_type):
        print(f"Clicked: {product_name} ({product_type})")
        try:
            # Open modifier popup when product is clicked
            ModifierPopup(self, product_name=product_name, product_type=product_type, on_submit=self.handle_modifier_submit)
        except Exception as e:
            print(f"Error opening modifier popup: {e}")

    def handle_modifier_submit(self, product_name, quantity, size, temperature, extras):
        print(f"Adding to cart: {product_name} - Qty: {quantity}, Size: {size}, Temp: {temperature}, Extras: {extras}")
        try:
            # TODO: Add the item to the cart in ticket_panel
            # self.ticket_panel.add_item_detail(product_name, quantity, size, temperature, extras, price)
            pass
        except Exception as e:
            print(f"Error adding item to cart: {e}")

    def handle_split_popup(self, total):
        try:
            self.ticket_panel.open_split_popup(total)
        except Exception as e:
            print(f"Error opening split popup: {e}")
        
    def run(self):
        """Start the application with error handling"""
        try:
            print("Starting Ticket Page Application...")
            self.mainloop()
        except Exception as e:
            print(f"Error running application: {e}")
        finally:
            try:
                if not self._switching_page:
                    self.destroy()
            except:
                pass
    
    def mainloop(self):
        """Override mainloop to handle recursion issues"""
        try:
            super().mainloop()
        except RecursionError as e:
            print(f"Recursion error caught: {e}")
            print("This usually indicates circular imports or infinite callback loops")
        except Exception as e:
            print(f"Error in mainloop: {e}")

# Alternative entry point function to avoid recursion issues
def create_ticket_app():
    """Factory function to create the ticket application"""
    try:
        app = TicketMainPage()
        return app
    except Exception as e:
        print(f"Error creating ticket app: {e}")
        return None

