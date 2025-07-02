import customtkinter as ctk
import datetime
from .staff_card import StaffTimeCard
from nav_bar import Navbar
from staff.staff_employee_controller import StaffEmployeeController
from staff.staff_admin import StaffPageAdmin

class StaffPageEmployee(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="employee"):
        super().__init__(parent)
        self.main_app = main_app
        self.user_role = user_role
        self.configure(fg_color="#f2efea")

        # Track selected date and employee cards
        self.selected_date = datetime.date.today()
        self.date_buttons = []
        self.employee_cards = []

        self.controller = StaffEmployeeController()

        # Header
        self.create_header()

        # Main layout
        self.create_main_layout()

        # Build content
        self.build_date_list()
        self.build_employee_view()

    def create_header(self):
        """Create the header with title and date"""
        header_frame = ctk.CTkFrame(self, fg_color="transparent")
        header_frame.place(relx=0.5, rely=0.1, anchor="center", relwidth=0.85, relheight=0.1)

        title_label = ctk.CTkLabel(header_frame, text="Staff", font=("Unbounded", 36, "bold"), text_color="#4e2d18")
        title_label.pack(side="left")

        date_str = datetime.date.today().strftime("%B %d, %Y")
        date_label = ctk.CTkLabel(header_frame, text=f"DATE: {date_str}", font=("Inter", 16, "bold"), text_color="#4e2d18")
        date_label.pack(side="right", pady=20)

    def create_main_layout(self):
        """Create the main layout with left and right panels"""
        # Main content frame for horizontal layout
        self.content_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.content_frame.place(relx=0.5, rely=0.55, anchor="center", relwidth=0.95, relheight=0.8)

        # Left Panel - Date selection
        self.left_panel = ctk.CTkFrame(self.content_frame, width=220, fg_color="#f2efea", corner_radius=0)
        self.left_panel.grid(row=0, column=0, sticky="ns", padx=(0, 20), pady=0)

        # Right Panel - Employee cards
        self.right_panel = ctk.CTkFrame(self.content_frame, fg_color="transparent", corner_radius=20)
        self.right_panel.grid(row=0, column=1, sticky="nsew")
        self.content_frame.grid_columnconfigure(1, weight=1)
        self.content_frame.grid_rowconfigure(0, weight=1)

    def build_date_list(self):
        today = datetime.date.today()
        for i in range(10):
            day = today - datetime.timedelta(days=i)
            label = day.strftime("%a, %b %d")
            
            is_selected = (day == self.selected_date)
            is_past_date = (day < today)
            
            btn = ctk.CTkButton(self.left_panel,
                               text=label,
                               fg_color="#4e2d18" if is_selected else "#f8f8f8",
                               hover_color="#6b3b1f" if not is_past_date else "#f2efea",
                               text_color="#f2efea" if is_selected else "#666666",
                               border_color="#4e2d18" if is_selected else "#e0e0e0",
                               border_width=2,
                               font=("Unbounded", 14),
                               corner_radius=18,
                               height=50,
                               width=200,
                               command=lambda d=day: self.select_date(d))
            btn.pack(pady=5)
            self.date_buttons.append((day, btn))

    def select_date(self, selected_date):
        self.selected_date = selected_date
        
        for date, btn in self.date_buttons:
            is_selected = (date == selected_date)
            is_current_date = (date == datetime.date.today())
            
            if is_selected:
                btn.configure(fg_color="#4e2d18", text_color="#f2efea", border_color="#4e2d18", hover_color="#6b3b1f")
            else:
                btn.configure(fg_color="#f8f8f8", text_color="#666666", border_color="#e0e0e0", hover_color="#6b3b1f" if is_current_date else "#f2efea")

        self.build_employee_view()

    def _on_card_time_update(self, employee_id: int, action_type: str, time_value: datetime.datetime) -> bool:
        success = self.controller.update_attendance_time(employee_id, action_type, time_value)
        if success:
            self.build_employee_view() # Rebuild all cards to reflect latest state
        return success

    def _verify_employee_password(self, employee_id: int, password: str) -> bool:
        return self.controller.verify_password(employee_id, password)

    def build_employee_view(self):
        # Clear existing cards
        for card in self.employee_cards:
            card.destroy()
        self.employee_cards = []

        employees_data = self.controller.fetch_all_employees(self.selected_date)
        
        if not employees_data:
            no_employee_label = ctk.CTkLabel(self.right_panel, text="No employees found.", font=("Inter", 16), text_color="#666666")
            no_employee_label.pack(pady=20)
            return

        is_current_date = (self.selected_date == datetime.date.today())

        for emp in employees_data:
            employee_name = f"{emp['first_name']} {emp['last_name']}"
            
            # Pass all relevant time data to the card
            card = StaffTimeCard(
                self.right_panel, 
                employee_id=emp['employee_id'],
                employee_name=employee_name,
                initial_time_in=emp.get('time_in'),
                initial_time_out=emp.get('time_out'),
                initial_break_in=emp.get('break_in'),    # Pass break_in
                initial_break_out=emp.get('break_out'),  # Pass break_out
                on_time_update_callback=self._on_card_time_update,
                verify_password_callback=self._verify_employee_password
            )
            card.pack(pady=10, fill="x", padx=10)
            self.employee_cards.append(card)
            
            card.set_enabled(is_current_date)


    # Navigation methods now use main_app.show_frame
    def show_ticket(self):
        self.main_app.show_frame("ticket")
    def show_receipt(self):
        self.main_app.show_frame("receipt")
    def show_inventory(self):
        self.main_app.show_frame("inventory")
    def show_staff(self):
        if self.user_role == "admin":
            self.destroy()
            StaffPageAdmin(user_role="admin").run()
        else:
            self.destroy()
            StaffPageEmployee(user_role="employee").run()
    def show_cashbox(self):
        self.main_app.show_frame("cashbox")
    def show_dashboard(self):
        self.main_app.show_frame("dashboard")

    def custom_messagebox(self, title, message):
        popup = ctk.CTkToplevel(self)
        popup.title(title)
        popup.geometry("350x150")
        popup.configure(fg_color="#f2efea")
        popup.grab_set()
        ctk.CTkLabel(popup, text=title, font=("Unbounded", 16, "bold"), text_color="#4e2d18").pack(pady=(20, 5))
        ctk.CTkLabel(popup, text=message, font=("Inter", 13), text_color="#4e2d18").pack(pady=(0, 20))
        ctk.CTkButton(popup, text="OK", fg_color="#4e2d18", text_color="#fff", command=popup.destroy).pack(pady=(0, 10))
        popup.wait_window()

    def run(self):
        self.mainloop()

if __name__ == "__main__":
    # You must provide the required arguments: parent and main_app
    # For standalone testing, you can use None or suitable mock objects
    app = StaffPageEmployee(parent=None, main_app=None)
    app.run()