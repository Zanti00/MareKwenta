import customtkinter as ctk
from nav_bar import Navbar
from ticket.ticket_main import TicketMainPage
from inventory.inventory_page import InventoryManagement
from staff.staff_admin import StaffPageAdmin
from staff.staff_employee import StaffPageEmployee
from cash_box.cashbox_page import CashBoxApp
from dashboard.sales_dashboard import SalesDashboard
from receipt.sales_history import SalesHistoryMain
from inventory.link_ingredients import LinkIngredientsPage

class MainApp(ctk.CTk):
    def __init__(self, user_role, employee_id=None):
        super().__init__()
        self.user_role = user_role
        self.employee_id = employee_id
        self.title("MareKwenta POS")
        self.geometry(f"{self.winfo_screenwidth()}x{self.winfo_screenheight()-70}+0+0")
        self.configure(fg_color="#f2efea")
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)

        # Navbar
        self.navbar = Navbar(self, width=124, user_role=self.user_role)
        self.navbar.grid(row=0, column=0, sticky="ns")
        self.navbar.set_nav_callback("ticket", lambda: self.show_frame("ticket"))
        self.navbar.set_nav_callback("receipt", lambda: self.show_frame("receipt"))
        self.navbar.set_nav_callback("inventory", lambda: self.show_frame("inventory"))
        self.navbar.set_nav_callback("staff", lambda: self.show_frame("staff"))
        self.navbar.set_nav_callback("cashbox", lambda: self.show_frame("cashbox"))
        self.navbar.set_nav_callback("dashboard", lambda: self.show_frame("dashboard"))

        # Main content area
        self.container = ctk.CTkFrame(self, fg_color="#f2efea")
        self.container.place_forget()
        self.container.grid(row=0, column=1, sticky="nsew")
        self.container.grid_rowconfigure(0, weight=1)
        self.container.grid_columnconfigure(0, weight=1)

        # Preload all pages
        self.frames = {}
        self.frames["ticket"] = TicketMainPage(self.container, main_app=self, user_role=self.user_role, employee_id=self.employee_id)
        self.frames["inventory"] = InventoryManagement(self.container, main_app=self, user_role=self.user_role)
        self.frames["staff"] = StaffPageAdmin(self.container, main_app=self, user_role=self.user_role) if self.user_role == "admin" else StaffPageEmployee(self.container, main_app=self, user_role=self.user_role)
        self.frames["cashbox"] = CashBoxApp(self.container, main_app=self, user_role=self.user_role, employee_id=self.employee_id)
        self.frames["dashboard"] = SalesDashboard(self.container, main_app=self, user_role=self.user_role)
        self.frames["receipt"] = SalesHistoryMain(self.container, main_app=self, user_role=self.user_role)
        self.frames["link_ingredients"] = LinkIngredientsPage(self.container, main_app=self, user_role=self.user_role)

        for frame in self.frames.values():
            frame.grid(row=0, column=0, sticky="nsew")

        if self.user_role == "admin":
            self.show_frame("inventory")
        else:
            self.show_frame("ticket")

    def refresh_inventory_after_transaction(self):
        """Refresh inventory data after a transaction (like ticket creation) to show updated quantities"""
        try:
            if "inventory" in self.frames:
                inventory_frame = self.frames["inventory"]
                if hasattr(inventory_frame, 'force_refresh') and callable(getattr(inventory_frame, 'force_refresh')):
                    inventory_frame.force_refresh()
                    print("Inventory force refreshed after transaction")
                elif hasattr(inventory_frame, 'refresh') and callable(getattr(inventory_frame, 'refresh')):
                    inventory_frame.refresh()
                    print("Inventory refreshed after transaction")
        except Exception as e:
            print(f"Error refreshing inventory after transaction: {e}")

    def show_frame(self, page_name):
        # Check if we're navigating away from inventory-related pages
        previous_tab = getattr(self.navbar, 'active_tab', None)
        inventory_related_pages = ["inventory", "link_ingredients"]
        
        frame = self.frames[page_name]
        frame.tkraise()
        
        # Special handling for inventory page - use force_refresh if available for better data accuracy
        if page_name == "inventory":
            if hasattr(frame, 'force_refresh') and callable(getattr(frame, 'force_refresh')):
                frame.force_refresh()
            elif hasattr(frame, 'refresh') and callable(getattr(frame, 'refresh')):
                frame.refresh()
        elif hasattr(frame, 'refresh') and callable(getattr(frame, 'refresh')):
            # Call refresh method if it exists on the frame
            frame.refresh()
        
        # If navigating away from inventory or link_ingredients pages, refresh the ticket page
        # This ensures the ticket page shows updated products after inventory changes
        if (previous_tab in inventory_related_pages and 
            page_name not in inventory_related_pages and 
            "ticket" in self.frames):
            ticket_frame = self.frames["ticket"]
            if hasattr(ticket_frame, 'refresh') and callable(getattr(ticket_frame, 'refresh')):
                ticket_frame.refresh()
                print(f"Ticket page refreshed after leaving {previous_tab}")
        
        # Also refresh ticket page when navigating to ticket page from inventory-related pages
        if (page_name == "ticket" and 
            previous_tab in inventory_related_pages):
            # The refresh above already handles this, but let's be explicit
            print(f"Ticket page refreshed when navigating from {previous_tab} to ticket")
        
        self.navbar.active_tab = page_name
        for name, btn in self.navbar.nav_buttons.items():
            btn.configure(fg_color="#D5C8B0" if name == page_name else "#f7f3ee")