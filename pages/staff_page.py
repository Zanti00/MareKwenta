import customtkinter as ctk
import datetime
from components.staff_card import StaffTimeCard

class StaffPageUserView(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.title("Staff Page - User View")
        self.geometry("1240x1440")
        self.configure(fg_color="#f2efea")

        # Track selected date and employee cards
        self.selected_date = datetime.date.today()
        self.date_buttons = []
        self.employee_cards = []

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
        header_frame.pack(fill="x", padx=40, pady=(10, 0))

        title_label = ctk.CTkLabel(header_frame, text="Staff", font=("Unbounded", 36, "bold"), text_color="#4e2d18")
        title_label.pack(side="left")

        date_str = datetime.date.today().strftime("%B %d, %Y")
        date_label = ctk.CTkLabel(header_frame, text=f"DATE: {date_str}", font=("Inter", 16, "bold"), text_color="#4e2d18")
        date_label.pack(side="right", pady=20)

    def create_main_layout(self):
        """Create the main layout with left and right panels"""
        # Left Panel - Date selection
        self.left_panel = ctk.CTkFrame(self, width=220, fg_color="#f2efea", corner_radius=0)
        self.left_panel.pack(side="left", fill="y", padx=(20, 10), pady=(5, 20))

        # Right Panel - Employee cards
        self.right_panel = ctk.CTkFrame(self, fg_color="transparent", corner_radius=20)
        self.right_panel.pack(side="left", fill="both", expand=True, padx=(20,15), pady=(5, 20))

    def build_date_list(self):
        """Build the date selection buttons on the left panel"""
        today = datetime.date.today()
        for i in range(10):
            day = today - datetime.timedelta(days=i)
            label = day.strftime("%a, %b %d")
            
            # Determine initial button state
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
        """Handle date selection and update button states"""
        self.selected_date = selected_date
        
        # Update button appearances
        for date, btn in self.date_buttons:
            is_selected = (date == selected_date)
            is_past_date = (date < datetime.date.today())
            
            if is_selected:
                btn.configure(fg_color="#4e2d18", text_color="#f2efea", border_color="#4e2d18", hover_color="#6b3b1f")
            else:
                btn.configure(fg_color="#f8f8f8", text_color="#666666", border_color="#e0e0e0", hover_color="#6b3b1f" if not is_past_date else "#f2efea")
        
        # Update employee card states
        self.update_employee_card_states()

    def update_employee_card_states(self):
        """Enable/disable employee cards based on selected date"""
        is_current_date = (self.selected_date == datetime.date.today())
        
        for card in self.employee_cards:
            if hasattr(card, 'set_enabled'):
                card.set_enabled(is_current_date)

    def build_employee_view(self):
        """Build the employee time cards on the right panel"""
        # Example: 3 employee cards - in real app, this would load from database
        employee_names = ["John Doe", "Jane Smith", "Mike Johnson"]
        
        for name in employee_names:
            card = StaffTimeCard(self.right_panel, employee_name=name)
            card.pack(pady=10, fill="x", padx=10)
            self.employee_cards.append(card)
        
        # Set initial card states
        self.update_employee_card_states()


if __name__ == "__main__":
    app = StaffPageUserView()
    app.mainloop()
