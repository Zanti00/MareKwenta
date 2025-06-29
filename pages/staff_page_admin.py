import customtkinter as ctk
import datetime

class StaffPageAdmin(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.geometry("1240x1420")
        self.configure(fg_color="#f2efea")
        
        # Initialize employee data structure for database integration
        self.employees = [
            {"id": 1, "first_name": "Aliah", "last_name": "Del Rosario", "time_in": "08:00 AM", "time_out": "05:00 PM"},
            {"id": 2, "first_name": "Jane", "last_name": "Doe", "time_in": "09:00 AM", "time_out": "--"}
        ]
        
        self.table_rows = []  # Store references to table row widgets
        self.table_container = None

        # Header
        header_frame = ctk.CTkFrame(self, fg_color="transparent")
        header_frame.pack(fill="x", padx=40, pady=(10, 0))

        title_label = ctk.CTkLabel(header_frame, text="Staff", font=("Unbounded", 36, "bold"), text_color="#4e2d18")
        title_label.pack(side="left")

        date_str = datetime.date.today().strftime("%B %d, %Y")
        date_label = ctk.CTkLabel(header_frame, text=f"DATE: {date_str}", font=("Inter", 16, "bold"), text_color="#4e2d18")
        date_label.pack(side="right",pady=20)

        # Main Panel
        container = ctk.CTkFrame(self, fg_color="#ffffff", corner_radius=20)
        container.pack(padx=40, pady=20, fill="both", expand=True)

        # Table Header
        table_header = ["First Name", "Last Name", "Time In", "Time Out"]

        # Create table container
        self.table_container = ctk.CTkFrame(container, fg_color="#ffffff")
        self.table_container.pack(fill="both", expand=True, padx=20, pady=(20, 10))

        # Create header row
        header_row = ctk.CTkFrame(self.table_container, fg_color="#f0f0f0", height=50)
        header_row.pack(fill="x", pady=(0, 2))
        header_row.pack_propagate(False)

        for i, col in enumerate(table_header):
            label = ctk.CTkLabel(header_row, text=col, font=("Inter", 14, "bold"), text_color="#4e2d18")
            label.grid(row=0, column=i, sticky="nsew", padx=10, pady=10)
            header_row.grid_columnconfigure(i, weight=1, uniform="col")

        # Initialize table with data
        self.refresh_table()

        # Buttons
        button_frame = ctk.CTkFrame(container, fg_color="transparent")
        button_frame.pack(fill="x", pady=(10, 20), padx=20, anchor="e")

        add_button = ctk.CTkButton(button_frame, text="➕", width=60, height=50, font=("Arial", 24), fg_color="#4e2d18", corner_radius=20, hover_color="lightgray", command=self.open_add_employee_popup)
        add_button.pack(side="right", padx=10)

        reset_button = ctk.CTkButton(button_frame, text="🔑", width=60, height=50, font=("Arial", 20), fg_color="#4e2d18", corner_radius=20,hover_color="lightgray",command=self.open_reset_password_popup)
        reset_button.pack(side="right", padx=10)

    def refresh_table(self):
        """Refresh the table display with current employee data"""
        # Clear existing table rows
        for row in self.table_rows:
            row.destroy()
        self.table_rows.clear()

        # Create data rows
        for row_idx, employee in enumerate(self.employees):
            row = ctk.CTkFrame(self.table_container, fg_color="#ffffff" if row_idx % 2 == 0 else "#f8f8f8", height=50)
            row.pack(fill="x", pady=1)
            row.pack_propagate(False)
            
            # Employee data cells
            data = [employee["first_name"], employee["last_name"], employee["time_in"], employee["time_out"]]
            for col_idx, cell in enumerate(data):
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
        ).pack(pady=(20, 5))

        ctk.CTkLabel(
            popup, text=message, font=("Inter", 14),
            text_color=fg_color, fg_color=bg_color
        ).pack(pady=(0, 20))

        btn_frame = ctk.CTkFrame(popup, fg_color=bg_color)
        btn_frame.pack(pady=(0, 20))

        def yes():
            result["value"] = True
            popup.destroy()
        def no():
            popup.destroy()

        ctk.CTkButton(btn_frame, text="Yes", fg_color=btn_color, text_color="#fff", command=yes).pack(side="left", padx=10)
        ctk.CTkButton(btn_frame, text="No", fg_color="#aaa", text_color="#fff", command=no).pack(side="left", padx=10)

        popup.wait_window()
        return result["value"]

    def add_employee(self, first_name, last_name, username, password):
        """Add a new employee to the data structure"""
        new_id = max([emp["id"] for emp in self.employees], default=0) + 1
        new_employee = {
            "id": new_id,
            "first_name": first_name,
            "last_name": last_name,
            "username": username,
            "time_in": "--",
            "time_out": "--",
            "password": password  # In real app, this should be hashed
        }
        self.employees.append(new_employee)
        self.refresh_table()
        # TODO: Add database insert here
        return new_employee

    def edit_employee(self, employee):
        """Edit an existing employee"""
        # TODO: Implement edit functionality
        self.custom_messagebox("Edit Employee", f"Edit functionality for {employee['first_name']} {employee['last_name']}")


    def open_add_employee_popup(self):
        popup = ctk.CTkToplevel(self)
        popup.title("Add Employee")
        popup.geometry("500x350")
        popup.configure(fg_color="#f2efea")
        popup.grab_set()

        # Name fields in a horizontal frame
        name_frame = ctk.CTkFrame(popup, fg_color="transparent")
        name_frame.pack(pady=(20, 0), padx=20, fill="x")

        # First Name (left side)
        first_name_frame = ctk.CTkFrame(name_frame, fg_color="transparent")
        first_name_frame.pack(side="left", fill="x", expand=True, padx=(0, 10))
        
        ctk.CTkLabel(first_name_frame, text="First Name:", font=("Inter", 12, "bold"), text_color="#4e2d18").pack(anchor="w")
        first_entry = ctk.CTkEntry(first_name_frame, 
                                  fg_color="#ffffff",
                                  text_color="#4e2d18",
                                  border_color="lightgray",
                                  border_width=2,
                                  corner_radius=6,
                                  height=35)
        first_entry.pack(pady=(5, 0), fill="x")

        # Last Name (right side)
        last_name_frame = ctk.CTkFrame(name_frame, fg_color="transparent")
        last_name_frame.pack(side="right", fill="x", expand=True, padx=(10, 0))
        
        ctk.CTkLabel(last_name_frame, text="Last Name:", font=("Inter", 12, "bold"), text_color="#4e2d18").pack(anchor="w")
        last_entry = ctk.CTkEntry(last_name_frame, 
                                 fg_color="#ffffff",
                                 text_color="#4e2d18",
                                 border_color="lightgray",
                                 border_width=2,
                                 corner_radius=6,
                                 height=35)
        last_entry.pack(pady=(5, 0), fill="x")

        # Username field
        ctk.CTkLabel(popup, text="Username:", font=("Inter", 12, "bold"), text_color="#4e2d18").pack(pady=(20, 0), padx=20, anchor="w")
        username_entry = ctk.CTkEntry(popup, 
                                     fg_color="#ffffff",
                                     text_color="#4e2d18",
                                     border_color="lightgray",
                                     border_width=2,
                                     corner_radius=6,
                                     height=35)
        username_entry.pack(pady=(5, 0), padx=20, fill="x")

        # Password field
        ctk.CTkLabel(popup, text="Password:", font=("Inter", 12, "bold"), text_color="#4e2d18").pack(pady=(15, 0), padx=20, anchor="w")
        pass_entry = ctk.CTkEntry(popup, 
                                 show="*", 
                                 fg_color="#ffffff",
                                 text_color="#4e2d18",
                                 border_color="lightgray",
                                 border_width=2,
                                 corner_radius=6,
                                 height=35)
        pass_entry.pack(pady=(5, 0), padx=20, fill="x")

        def submit():
            if (first_entry.get().strip() and last_entry.get().strip() and 
                username_entry.get().strip() and pass_entry.get().strip()):
                new_employee = self.add_employee(
                    first_entry.get().strip(), 
                    last_entry.get().strip(), 
                    username_entry.get().strip(),
                    pass_entry.get()
                )
                self.custom_messagebox("Employee Added", f"Added {new_employee['first_name']} {new_employee['last_name']}!")
                popup.destroy()
            else:
                self.custom_messagebox("Error", "All fields are required!")

        submit_btn = ctk.CTkButton(popup, text="Submit", 
                                   fg_color="green", 
                                   text_color="#ffffff", 
                                   hover_color="lightgray",
                                   height=35,
                                   corner_radius=8,
                                   font=("Inter", 12,"bold"),
                                   command=submit)
        submit_btn.pack(pady=20)

    def open_reset_password_popup(self):
        popup = ctk.CTkToplevel(self)
        popup.title("Reset Password")
        popup.geometry("400x250")
        popup.configure(fg_color="#f2efea")
        popup.grab_set()

        ctk.CTkLabel(popup, text="Employee Name:", font=("Inter", 12, "bold"), text_color="#4e2d18").pack(pady=(20, 0), padx=20, anchor="w")
        id_entry = ctk.CTkEntry(popup, 
                               fg_color="#ffffff",
                               text_color="#4e2d18",
                               border_color="lightgray",
                               border_width=2,
                               corner_radius=6,
                               height=35)
        id_entry.pack(pady=(5, 0), padx=20, fill="x")

        ctk.CTkLabel(popup, text="New Password:", font=("Inter", 12, "bold"), text_color="#4e2d18").pack(pady=(15, 0), padx=20, anchor="w")
        pass_entry = ctk.CTkEntry(popup, 
                                 show="*",
                                 fg_color="#ffffff",
                                 text_color="#4e2d18",
                                 border_color="lightgray",
                                 border_width=2,
                                 corner_radius=6,
                                 height=35)
        pass_entry.pack(pady=(5, 0), padx=20, fill="x")

        def reset():
            # TODO: Add database password reset here
            self.custom_messagebox("Password Reset", f"Password reset for {id_entry.get()}!")
            popup.destroy()

        reset_btn = ctk.CTkButton(popup, text="Reset", 
                                 fg_color="green", 
                                 text_color="#ffffff", 
                                 hover_color="lightgray",
                                 height=35,
                                 corner_radius=8,
                                 font=("Inter", 12, "bold"),
                                 command=reset)
        reset_btn.pack(pady=20)


if __name__ == "__main__":
    app = StaffPageAdmin()
    app.mainloop()
