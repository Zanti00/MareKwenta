import customtkinter as ctk
from .product_panel import ProductPanel
from .ticket_panel import TicketPanel
from .components.modifier_popup import ModifierPopup
import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(__file__)))  # Add view folder to path
from nav_bar import Navbar

class TicketMainPage(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="employee"):
        super().__init__(parent)
        self.main_app = main_app
        self.user_role = user_role

        # === MAIN WRAPPER FRAME ===
        self.configure(fg_color="#f2efea")

        # Use grid for main layout
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(0, weight=1)

        main_frame = ctk.CTkFrame(self, fg_color="transparent")
        main_frame.grid(row=0, column=0, sticky="nsew", padx=30, pady=30)
        main_frame.grid_rowconfigure(0, weight=1)
        main_frame.grid_columnconfigure(0, weight=1, minsize=650)  # Left column (product)
        main_frame.grid_columnconfigure(1, weight=1)  # Right column (ticket)

        # === LEFT COLUMN (Header + Product Panel) ===
        left_column = ctk.CTkFrame(main_frame, fg_color="transparent")
        left_column.grid(row=0, column=0, sticky="nsew", padx=(0, 20), pady=0)
        left_column.grid_rowconfigure(1, weight=1)

        # === HEADER ===
        header_frame = ctk.CTkFrame(left_column, fg_color="transparent")
        header_frame.grid(row=0, column=0, sticky="ew", padx=20, pady=(0, 10))

        hello_label = ctk.CTkLabel(header_frame, text="Hello,", font=("Unbounded", 36), text_color="#4e2d18")
        hello_label.pack(side="left")

        self.user_label = ctk.CTkLabel(header_frame, text="User", font=("Unbounded", 36), text_color="#4e2d18")
        self.user_label.pack(side="left", padx=(10, 0))

        # === PRODUCT PANEL ===
        self.product_panel = ProductPanel(left_column, on_product_click=self.handle_product_click)
        self.product_panel.grid(row=1, column=0, sticky="nsew")

        # === RIGHT PANEL ===
        self.ticket_panel = TicketPanel(main_frame, on_split_popup=self.handle_split_popup)
        self.ticket_panel.grid(row=0, column=1, sticky="nsew", padx=(0, 0))
        self.ticket_panel.grid_propagate(False)
        self.ticket_panel.configure(width=350)  # Set a max width for ticket panel

    # Navigation methods now use main_app.show_frame
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

    def handle_product_click(self, product_name, product_type):
        print(f"Clicked: {product_name} ({product_type})")
        try:
            ModifierPopup(self, product_name=product_name, product_type=product_type, on_submit=self.handle_modifier_submit)
        except Exception as e:
            print(f"Error opening modifier popup: {e}")

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

