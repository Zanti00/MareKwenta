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
        self.frames["cashbox"] = CashBoxApp(self.container, main_app=self, user_role=self.user_role)
        self.frames["dashboard"] = SalesDashboard(self.container, main_app=self, user_role=self.user_role)
        self.frames["receipt"] = SalesHistoryMain(self.container, main_app=self, user_role=self.user_role)
        self.frames["link_ingredients"] = LinkIngredientsPage(self.container, main_app=self, user_role=self.user_role)

        for frame in self.frames.values():
            frame.grid(row=0, column=0, sticky="nsew")

        if self.user_role == "admin":
            self.show_frame("inventory")
        else:
            self.show_frame("ticket")

    def show_frame(self, page_name):
        frame = self.frames[page_name]
        frame.tkraise()
        # Call refresh method if it exists on the frame
        if hasattr(frame, 'refresh') and callable(getattr(frame, 'refresh')):
            frame.refresh()
        self.navbar.active_tab = page_name
        for name, btn in self.navbar.nav_buttons.items():
            btn.configure(fg_color="#D5C8B0" if name == page_name else "#f7f3ee") 