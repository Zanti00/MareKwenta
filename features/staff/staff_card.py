import customtkinter as ctk
from datetime import datetime

class StaffTimeCard(ctk.CTkFrame):
    def __init__(self, master, employee_name, **kwargs):
        super().__init__(master, **kwargs, fg_color="#ffffff", corner_radius=20, height=120)
        self.pack_propagate(False)  # Prevent frame from shrinking

        self.employee_name = employee_name
        self.login_time = None
        self.time_in = "--"
        self.time_out = "--"
        self.has_timed_in = False
        self.has_taken_break = False
        self.has_timed_out = False

        # Configure grid weights
        self.grid_columnconfigure(0, weight=1)  # Left side (name and time)
        self.grid_columnconfigure(1, weight=0)  # Right side (buttons)

        # Left side - Employee info
        self.left_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.left_frame.grid(row=0, column=0, sticky="nsew", padx=20, pady=15)
        self.left_frame.grid_columnconfigure(0, weight=1)

        # Employee name with big font
        self.name_label = ctk.CTkLabel(self.left_frame, 
                                      text=self.employee_name, 
                                      font=("Unbounded", 24, "bold"),
                                      text_color="#4e2d18",
                                      anchor="w")
        self.name_label.grid(row=0, column=0, sticky="w", pady=(0, 5))

        # Time info frame
        self.time_frame = ctk.CTkFrame(self.left_frame, fg_color="transparent")
        self.time_frame.grid(row=1, column=0, sticky="w")

        # Time in label
        self.time_in_label = ctk.CTkLabel(self.time_frame, 
                                         text=f"In: {self.time_in}", 
                                         font=("Inter", 14),
                                         text_color="#4e2d18",
                                         anchor="w")
        self.time_in_label.grid(row=0, column=0, sticky="w", padx=(0, 20))

        # Break label (initially hidden)
        self.break_time = None
        self.break_label = ctk.CTkLabel(self.time_frame, 
                                        text="", 
                                        font=("Inter", 14),
                                        text_color="#b38f00",
                                        anchor="w")
        self.break_label.grid(row=0, column=1, sticky="w", padx=(0, 20))
        self.break_label.grid_remove()

        # Time out label
        self.time_out_label = ctk.CTkLabel(self.time_frame, 
                                          text=f"Out: {self.time_out}", 
                                          font=("Inter", 14),
                                          text_color="#4e2d18",
                                          anchor="w")
        self.time_out_label.grid(row=0, column=2, sticky="w")

        # Right side - Buttons
        self.right_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.right_frame.grid(row=0, column=1, sticky="e", padx=20, pady=15)

        # Button frame for side-by-side buttons
        self.button_frame = ctk.CTkFrame(self.right_frame, fg_color="transparent")
        self.button_frame.pack(expand=True)

        # IN button
        self.in_button = ctk.CTkButton(self.button_frame, 
                                      text="IN", 
                                      width=80, 
                                      height=50,
                                      font=("Unbounded", 16, "bold"),
                                      fg_color="#d4ffda",
                                      text_color="#03590f",
                                      border_color="#03590f",
                                      border_width=2,
                                      corner_radius=25,
                                      hover_color="#b8e6c0",
                                      command=self.on_in)
        self.in_button.pack(side="left", padx=(0, 10))

        # BREAK button
        self.break_button = ctk.CTkButton(self.button_frame, 
                                      text="BREAK", 
                                      width=80, 
                                      height=50,
                                      font=("Unbounded", 16, "bold"),
                                      fg_color="#fff7cc",
                                      text_color="#b38f00",
                                      border_color="#b38f00",
                                      border_width=2,
                                      corner_radius=25,
                                      hover_color="#ffe066",
                                      command=self.on_break)
        self.break_button.pack(side="left", padx=(10, 10))

        # OUT button
        self.out_button = ctk.CTkButton(self.button_frame, 
                                       text="OUT", 
                                       width=80, 
                                       height=50,
                                       font=("Unbounded", 16, "bold"),
                                       fg_color="#fadddd",
                                       text_color="#860707",
                                       border_color="#860707",
                                       border_width=2,
                                       corner_radius=25,
                                       hover_color="#f0c8c8",
                                       command=self.on_out)
        self.out_button.pack(side="left", padx=(10, 0))

    def on_in(self):
        if self.has_timed_in:
            return  # Already timed in, do nothing
        self.show_password_popup("clock in")
        # In real logic: verify password then set time
        self.login_time = datetime.now()
        self.time_in = self.login_time.strftime("%I:%M %p")
        self.time_in_label.configure(text=f"Time In: {self.time_in}")
        self.has_timed_in = True
        self.in_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
        # Enable break and out buttons after timing in
        if not self.has_taken_break:
            self.break_button.configure(state="normal", fg_color="#fff7cc", text_color="#b38f00")
        if not self.has_timed_out:
            self.out_button.configure(state="normal", fg_color="#fadddd", text_color="#860707")

    def on_out(self):
        if not self.has_timed_in or self.has_timed_out:
            return  # Can't out before time in or more than once
        self.show_password_popup("clock out")
        if self.login_time:
            self.time_out = datetime.now().strftime("%I:%M %p")
            self.time_out_label.configure(text=f"Time Out: {self.time_out}")
            self.has_timed_out = True
            self.out_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            # Calculate duration
            duration = datetime.now() - self.login_time
            hrs, remainder = divmod(duration.total_seconds(), 3600)
            mins = remainder // 60
            print(f"Total time worked: {int(hrs)} hrs {int(mins)} mins")
        else:
            self.time_out_label.configure(text="Time Out: --")

    def on_break(self):
        if not self.has_timed_in or self.has_taken_break:
            return  # Can't break before time in or more than once
        # Toggle break label
        def after_password():
            self.break_time = datetime.now().strftime("%I:%M %p")
            self.break_label.configure(text=f"Break: {self.break_time}")
            self.break_label.grid()
            self.has_taken_break = True
            self.break_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
        self.show_password_popup("break", after_password)

    def show_password_popup(self, action, on_success=None):
        """Show password popup for clock in/out/break actions. Calls on_success if password is entered."""
        popup = ctk.CTkToplevel(self)
        popup.title(f"Enter Password to {action.title()}")
        popup.geometry("350x280")
        popup.configure(fg_color="#f2efea")
        popup.grab_set()  # Make popup modal
        popup.resizable(False, False)
        
        # Center the popup
        popup.update_idletasks()
        x = (popup.winfo_screenwidth() // 2) - (350 // 2)
        y = (popup.winfo_screenheight() // 2) - (280 // 2)
        popup.geometry(f"350x280+{x}+{y}")

        # Header
        header_label = ctk.CTkLabel(popup, 
                                   text=f"Enter Password to {action.title()}", 
                                   font=("Unbounded", 16, "bold"), 
                                   text_color="#4e2d18")
        header_label.pack(pady=(25, 15))

        # Employee name
        name_label = ctk.CTkLabel(popup, 
                                 text=f"Employee: {self.employee_name}", 
                                 font=("Inter", 12), 
                                 text_color="#4e2d18")
        name_label.pack(pady=(0, 25))

        # Password entry
        password_entry = ctk.CTkEntry(popup, 
                                     placeholder_text="Enter your password", 
                                     show="*", 
                                     width=250,
                                     fg_color="#ffffff",
                                     text_color="#4e2d18",
                                     border_color="lightgray",
                                     border_width=2,
                                     corner_radius=6,
                                     height=35)
        password_entry.pack(pady=(0, 25))
        password_entry.focus()  # Auto-focus on password field

        # Button frame
        button_frame = ctk.CTkFrame(popup, fg_color="transparent")
        button_frame.pack(pady=(0, 20))

        def submit_password():
            password = password_entry.get().strip()
            if password:
                # TODO: Add actual password verification here
                print(f"Password entered for {self.employee_name} to {action}")
                popup.destroy()
                if on_success:
                    on_success()
            else:
                # Show error message
                error_label.configure(text="Please enter a password")

        def cancel():
            popup.destroy()

        # Submit button
        submit_btn = ctk.CTkButton(button_frame, 
                                  text="Submit", 
                                  fg_color="green", 
                                  text_color="#ffffff", 
                                  hover_color="lightgray",
                                  height=35,
                                  corner_radius=8,
                                  font=("Inter", 12, "bold"),
                                  command=submit_password)
        submit_btn.pack(side="left", padx=(0, 10))

        # Cancel button
        cancel_btn = ctk.CTkButton(button_frame, 
                                  text="Cancel", 
                                  fg_color="#f2efea", 
                                  text_color="darkgray", 
                                  hover_color="red",
                                  border_color="darkgray",
                                  border_width=2,
                                  height=35,
                                  corner_radius=8,
                                  font=("Inter", 12, "bold"),
                                  command=cancel)
        cancel_btn.pack(side="left", padx=(10, 0))

        # Error label (initially empty)
        error_label = ctk.CTkLabel(popup, 
                                  text="", 
                                  font=("Inter", 12), 
                                  text_color="#ff0000")
        error_label.pack(pady=(10, 0))

        # Bind Enter key to submit
        password_entry.bind("<Return>", lambda event: submit_password())
        
        # Bind Escape key to cancel
        popup.bind("<Escape>", lambda event: cancel())

    def set_enabled(self, enabled):
        """Enable or disable the IN/OUT/BREAK buttons and reset state for a new day if enabled is True"""
        if enabled:
            # Reset state for a new day
            self.has_timed_in = False
            self.has_taken_break = False
            self.has_timed_out = False
            self.in_button.configure(state="normal", fg_color="#d4ffda", text_color="#03590f")
            self.break_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.out_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
        else:
            # Disable buttons - past date
            self.in_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.out_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.break_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")

    def update_time_label(self):
        self.time_in_label.configure(text="Time In: --")
        self.time_out_label.configure(text="Time Out: --")