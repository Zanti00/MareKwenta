import customtkinter as ctk
import datetime
from nav_bar import Navbar
from staff.staff_admin_controller import StaffAdminController

class StaffPageAdmin(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="admin"):
        super().__init__(parent)
        self.main_app = main_app
        self.user_role = user_role
        if self.user_role != "admin":
            raise PermissionError("Access denied: Admins only.")
        self.configure(fg_color="#f2efea")

        # Header frame (outside main_frame)
        header_frame = ctk.CTkFrame(self, fg_color="#f2efea", height=60)
        header_frame.place(relx=0.015, rely=0.03, relwidth=0.97)
        header_frame.grid_columnconfigure(0, weight=1)
        header_frame.grid_columnconfigure(1, weight=1)
        staff_label = ctk.CTkLabel(header_frame, text="Staff", font=("Unbounded", 36, "bold"), text_color="#4e2d18")
        staff_label.grid(row=0, column=0, sticky="w", padx=(20, 0))
        current_date = datetime.datetime.now().strftime("%B %d, %Y")
        date_label = ctk.CTkLabel(header_frame, text=current_date, font=("Unbounded", 20, "bold"), text_color="#4e2d18")
        date_label.grid(row=0, column=1, sticky="e", padx=(0, 20))

        # Main content container (wider)
        self.main_frame = ctk.CTkFrame(self, fg_color="#fff", corner_radius=24)
        self.main_frame.place(relx=0.015, rely=0.13, relwidth=0.97, relheight=0.82)
        self.main_frame.grid_rowconfigure(0, weight=1)
        self.main_frame.grid_columnconfigure(0, weight=1)

        self.employees = [] # This list will hold the fetched attendance data
        self.table_rows = []  # Store references to table row widgets
        self.table_container = None

        # Main Panel
        container = ctk.CTkFrame(self.main_frame, fg_color="#ffffff", corner_radius=20)
        container.grid(row=0, column=0, padx=40, pady=20, sticky="nsew")
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)

        # Table Header
        table_header = ["First Name", "Last Name", "Time In", "Time Out"]
        # Create table container
        self.table_container = ctk.CTkFrame(container, fg_color="#ffffff")
        self.table_container.grid(row=0, column=0, sticky="nsew", padx=20, pady=(20, 10))
        self.table_container.grid_columnconfigure(0, weight=1)
        # Create header row
        header_row = ctk.CTkFrame(self.table_container, fg_color="#f0f0f0", height=50)
        header_row.grid(row=0, column=0, sticky="ew", pady=(0, 2))
        header_row.grid_propagate(False)
        for i, col in enumerate(table_header):
            label = ctk.CTkLabel(header_row, text=col, font=("Inter", 14, "bold"), text_color="#4e2d18")
            label.grid(row=0, column=i, sticky="nsew", padx=10, pady=10)
            header_row.grid_columnconfigure(i, weight=1, uniform="col")
        
        # Initialize table with data by calling refresh_table
        self.refresh_table()

        # Buttons
        button_frame = ctk.CTkFrame(container, fg_color="transparent")
        button_frame.grid(row=1, column=0, sticky="ew", pady=(10, 20), padx=20)
        button_frame.grid_columnconfigure(0, weight=1)
        add_button = ctk.CTkButton(button_frame, text="➕", width=60, height=50, font=("Arial", 24), fg_color="#4e2d18", corner_radius=20, hover_color="lightgray", command=self.open_add_employee_popup)
        add_button.grid(row=0, column=1, padx=10, sticky="e")
        reset_button = ctk.CTkButton(button_frame, text="🔑", width=60, height=50, font=("Arial", 20), fg_color="#4e2d18", corner_radius=20,hover_color="lightgray",command=self.open_reset_password_popup)
        reset_button.grid(row=0, column=0, padx=10, sticky="e")

    def refresh_table(self):
        """Refresh the table display with current employee attendance data"""
        for row in self.table_rows:
            row.destroy()
        self.table_rows.clear()
        
        # Fetch data using the controller
        self.employees = StaffAdminController.get_all_staff_attendance() #

        for row_idx, employee in enumerate(self.employees):
            row = ctk.CTkFrame(self.table_container, fg_color="#ffffff" if row_idx % 2 == 0 else "#f8f8f8", height=50)
            row.grid(row=row_idx+1, column=0, sticky="ew", pady=1)
            row.grid_propagate(False)
            for col_idx, cell in enumerate([employee["first_name"], employee["last_name"], employee["time_in"], employee["time_out"]]):
                label = ctk.CTkLabel(row, text=cell, font=("Inter", 13), text_color="#4e2d18")
                label.grid(row=0, column=col_idx, sticky="nsew", padx=10, pady=10)
                row.grid_columnconfigure(col_idx, weight=1, uniform="col")
            self.table_rows.append(row)

    def custom_confirm(self, title, message, fg_color="#4e2d18", bg_color="#f2efea", btn_color="#4e2d18"):
        result = {"value": False}
        popup = ctk.CTkToplevel(self)
        popup.title(title)
        popup.geometry("350x180")
        popup.configure(fg_color=bg_color)
        popup.grab_set()
        ctk.CTkLabel(
            popup, text=title, font=("Unbounded", 18, "bold"),
            text_color=fg_color, fg_color=bg_color
        ).grid(row=0, column=0, columnspan=2, pady=(20, 5))
        ctk.CTkLabel(
            popup, text=message, font=("Inter", 14),
            text_color=fg_color, fg_color=bg_color
        ).grid(row=1, column=0, columnspan=2, pady=(0, 20))
        btn_frame = ctk.CTkFrame(popup, fg_color=bg_color)
        btn_frame.grid(row=2, column=0, columnspan=2, pady=(0, 20))
        def yes():
            result["value"] = True
            popup.destroy()
        def no():
            popup.destroy()
        ctk.CTkButton(btn_frame, text="Yes", fg_color=btn_color, text_color="#fff", command=yes).grid(row=0, column=0, padx=10)
        ctk.CTkButton(btn_frame, text="No", fg_color="#aaa", text_color="#fff", command=no).grid(row=0, column=1, padx=10)
        popup.wait_window()
        return result["value"]

    def custom_messagebox(self, title, message):
        popup = ctk.CTkToplevel(self)
        popup.title(title)
        popup.geometry("350x150")
        popup.configure(fg_color="#f2efea")
        popup.grab_set()
        ctk.CTkLabel(popup, text=title, font=("Unbounded", 16, "bold"), text_color="#4e2d18").grid(row=0, column=0, pady=(20, 5), padx=20)
        ctk.CTkLabel(popup, text=message, font=("Inter", 13), text_color="#4e2d18").grid(row=1, column=0, pady=(0, 20), padx=20)
        ctk.CTkButton(popup, text="OK", fg_color="#4e2d18", text_color="#fff", command=popup.destroy).grid(row=2, column=0, pady=(0, 10))
        popup.wait_window()

    # Navigation methods now use main_app.show_frame
    def show_ticket(self):
        self.main_app.show_frame("ticket")
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

    # The add_employee method now uses the controller
    def add_employee(self, first_name, last_name, username, password):
        """Add a new employee using the staff_admin_controller."""
        employee_id = StaffAdminController.add_new_employee(first_name, last_name, username, password)
        if employee_id:
            self.refresh_table() # Refresh table to show newly added employee (without attendance yet)
            return True
        else:
            return False

    def edit_employee(self, employee):
        """Edit an existing employee"""
        # TODO: Implement edit functionality (will also use the controller)
        self.custom_messagebox("Edit Employee", f"Edit functionality for {employee['first_name']} {employee['last_name']}")

    def open_add_employee_popup(self):
        popup = ctk.CTkToplevel(self)
        popup.title("Add Employee")
        popup.geometry("350x350")
        popup.configure(fg_color="#f2efea")
        popup.grab_set()

        # Name fields in a horizontal frame
        name_frame = ctk.CTkFrame(popup, fg_color="transparent")
        name_frame.grid(row=0, column=0, columnspan=2, pady=(20, 0), padx=20, sticky="ew")
        name_frame.grid_columnconfigure(0, weight=1)
        name_frame.grid_columnconfigure(1, weight=1)

        # First Name (left side)
        first_name_frame = ctk.CTkFrame(name_frame, fg_color="transparent")
        first_name_frame.grid(row=0, column=0, sticky="ew", padx=(0, 10))
        ctk.CTkLabel(first_name_frame, text="First Name:", font=("Inter", 12, "bold"), text_color="#4e2d18").grid(row=0, column=0, sticky="w")
        first_entry = ctk.CTkEntry(first_name_frame, 
                                  fg_color="#ffffff",
                                  text_color="#4e2d18",
                                  border_color="lightgray",
                                  border_width=2,
                                  corner_radius=6,
                                  height=35)
        first_entry.grid(row=1, column=0, pady=(5, 0), sticky="ew")

        # Last Name (right side)
        last_name_frame = ctk.CTkFrame(name_frame, fg_color="transparent")
        last_name_frame.grid(row=0, column=1, sticky="ew", padx=(10, 0))
        ctk.CTkLabel(last_name_frame, text="Last Name:", font=("Inter", 12, "bold"), text_color="#4e2d18").grid(row=0, column=0, sticky="w")
        last_entry = ctk.CTkEntry(last_name_frame, 
                                 fg_color="#ffffff",
                                 text_color="#4e2d18",
                                 border_color="lightgray",
                                 border_width=2,
                                 corner_radius=6,
                                 height=35)
        last_entry.grid(row=1, column=0, pady=(5, 0), sticky="ew")

        # Username field
        ctk.CTkLabel(popup, text="Username:", font=("Inter", 12, "bold"), text_color="#4e2d18").grid(row=1, column=0, sticky="w", padx=20, pady=(20, 0))
        username_entry = ctk.CTkEntry(popup, 
                                     fg_color="#ffffff",
                                     text_color="#4e2d18",
                                     border_color="lightgray",
                                     border_width=2,
                                     corner_radius=6,
                                     height=35)
        username_entry.grid(row=2, column=0, padx=20, pady=(5, 0), sticky="ew")

        # Password field
        ctk.CTkLabel(popup, text="Password:", font=("Inter", 12, "bold"), text_color="#4e2d18").grid(row=3, column=0, sticky="w", padx=20, pady=(15, 0))
        pass_entry = ctk.CTkEntry(popup, 
                                 show="*", 
                                 fg_color="#ffffff",
                                 text_color="#4e2d18",
                                 border_color="lightgray",
                                 border_width=2,
                                 corner_radius=6,
                                 height=35)
        pass_entry.grid(row=4, column=0, padx=20, pady=(5, 0), sticky="ew")

        def submit():
            first_name = first_entry.get().strip()
            last_name = last_entry.get().strip()
            username = username_entry.get().strip()
            password = pass_entry.get()

            if first_name and last_name and username and password:
                # Call the controller function to add the employee
                success = self.add_employee(first_name, last_name, username, password)
                if success:
                    self.custom_messagebox("Employee Added", f"Added {first_name} {last_name}!")
                    popup.destroy()
                else:
                    self.custom_messagebox("Error", "Failed to add employee. Username might already exist or a database error occurred.")
            else:
                self.custom_messagebox("Error", "All fields are required!")

        submit_btn = ctk.CTkButton(popup, text="Submit", 
                                   fg_color="green", 
                                   text_color="#ffffff", 
                                   hover_color="lightgray",
                                   height=35,
                                   width=120,
                                   corner_radius=8,
                                   font=("Inter", 12,"bold"),
                                   command=submit)
        submit_btn.grid(row=5, column=0, pady=20)
        popup.grid_columnconfigure(0, weight=1)
        popup.grid_columnconfigure(1, weight=1)

    def open_reset_password_popup(self):
        popup = ctk.CTkToplevel(self)
        popup.title("Reset Password")
        popup.geometry("300x250")
        popup.configure(fg_color="#f2efea")
        popup.grab_set()

        ctk.CTkLabel(popup, text="Employee Username:", font=("Inter", 12, "bold"), text_color="#4e2d18").grid(row=0, column=0, sticky="w", padx=20, pady=(20, 0))
        username_entry = ctk.CTkEntry(popup, 
                               fg_color="#ffffff",
                               text_color="#4e2d18",
                               border_color="lightgray",
                               border_width=2,
                               corner_radius=6,
                               width=200,
                               height=35)
        username_entry.grid(row=1, column=0, padx=20, pady=(5, 0), sticky="ew")

        ctk.CTkLabel(popup, text="New Password:", font=("Inter", 12, "bold"), text_color="#4e2d18").grid(row=2, column=0, sticky="w", padx=20, pady=(15, 0))
        pass_entry = ctk.CTkEntry(popup, 
                                 show="*",
                                 fg_color="#ffffff",
                                 text_color="#4e2d18",
                                 border_color="lightgray",
                                 border_width=2,
                                 corner_radius=6,
                                 width=200,
                                 height=35)
        pass_entry.grid(row=3, column=0, padx=20, pady=(5, 0), sticky="ew")

        def reset():
            username = username_entry.get().strip()
            new_password = pass_entry.get()

            if username and new_password:
                # Call the controller function to reset the password
                success = StaffAdminController.reset_employee_password(username, new_password)
                if success:
                    self.custom_messagebox("Password Reset", f"Password reset for {username}!")
                    popup.destroy()
                else:
                    self.custom_messagebox("Error", f"Username '{username}' not found or database error.")
            else:
                self.custom_messagebox("Error", "Both username and new password are required!")

        reset_btn = ctk.CTkButton(popup, text="Reset", 
                                 fg_color="green", 
                                 text_color="#ffffff", 
                                 hover_color="lightgray",
                                 height=35,
                                 corner_radius=8,
                                 font=("Inter", 12, "bold"),
                                 command=reset)
        reset_btn.grid(row=4, column=0, pady=20)

