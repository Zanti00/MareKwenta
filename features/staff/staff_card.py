from tkinter import messagebox
import customtkinter as ctk
from datetime import datetime, timedelta
from typing import Optional

class StaffTimeCard(ctk.CTkFrame):
    def __init__(self, master, employee_id, employee_name, initial_time_in, initial_time_out, initial_break_in, initial_break_out, on_time_update_callback, verify_password_callback, **kwargs):
        super().__init__(master, **kwargs, fg_color="#ffffff", corner_radius=20, height=120)
        self.pack_propagate(False)

        self.employee_id = employee_id
        self.employee_name = employee_name
        self._on_time_update_callback = on_time_update_callback
        self._verify_password_callback = verify_password_callback

        self.login_time = None # This will store the datetime object for actual calculation if needed later

        # Initialize times from fetched data
        self.time_in = self._format_time_for_display(initial_time_in)
        self.time_out = self._format_time_for_display(initial_time_out)
        self.break_in = self._format_time_for_display(initial_break_in)
        self.break_out = self._format_time_for_display(initial_break_out)

        # State flags
        self.has_timed_in = (self.time_in != "--")
        self.has_timed_out = (self.time_out != "--")
        # is_on_break: True if employee is currently on break (break_in recorded, but break_out not yet)
        self.is_on_break = (initial_break_in != '--' and initial_break_out == '--')

        # Configure grid weights
        self.grid_columnconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=0)

        # Left side - Employee info
        self.left_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.left_frame.grid(row=0, column=0, sticky="nsew", padx=20, pady=15)
        self.left_frame.grid_columnconfigure(0, weight=1)

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

        # Break info label
        # This label will show either "Break In: HH:MM AM/PM" (if break started) or "Break: --" (if break ended/not started)
        self.break_label = ctk.CTkLabel(self.time_frame,
                                        text=self._get_break_display_text(),
                                        font=("Inter", 14),
                                        text_color="#b38f00",
                                        anchor="w")
        self.break_label.grid(row=0, column=1, sticky="w", padx=(0, 20))


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

        self.button_frame = ctk.CTkFrame(self.right_frame, fg_color="transparent")
        self.button_frame.pack(expand=True)

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

        self._update_button_states() # Initialize button states

    def _format_time_for_display(self, time_str: Optional[str]) -> str:
        """
        Formats a time string (e.g., 'HH:MM:SS') into 'HH:MM AM/PM' format for display.
        Returns '--' if the input is None, empty, or '00:00:00'.
        """
        if not time_str or time_str == '00:00:00' or time_str == '--':
            return "--"
        try:
            dummy_datetime = datetime.strptime(time_str, "%H:%M:%S")
            return dummy_datetime.strftime("%I:%M %p")
        except ValueError:
            return "--"

    def _get_break_display_text(self) -> str:
        """Determines the text for the break label."""
        if self.is_on_break:
            return f"Break In: {self.break_in}"
        elif self.break_in != "--" and self.break_out != "--":
            # Assuming one break per day, this shows the completed break duration
            # You might want to calculate the duration here or just show the start/end
            return f"Break: {self.break_in} - {self.break_out}"
        else:
            return "Break: --"

    def _update_button_states(self):
        """Internal helper to set button states based on current attendance status."""
        if not self.has_timed_in:
            # Not timed in yet
            self.in_button.configure(state="normal", fg_color="#d4ffda", text_color="#03590f")
            self.break_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.out_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
        elif self.has_timed_out:
            # Timed out for the day
            self.in_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.break_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.out_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
        elif self.is_on_break:
            # Currently on break
            self.in_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.out_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            
            # Break button becomes "End Break"
            self.break_button.configure(state="normal", text="END BREAK",
                                        fg_color="#fadddd", text_color="#860707",
                                        border_color="#860707", hover_color="#f0c8c8")
        else:
            # Timed in, not on break, not timed out
            self.in_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.out_button.configure(state="normal", fg_color="#fadddd", text_color="#860707")
            
            # Enable break button only if no open break AND no completed break for the day.
            # This logic assumes only one break cycle (in/out) per attendance_id.
            # If multiple breaks allowed, this logic needs to change.
            if self.break_in == "--" or (self.break_in != "--" and self.break_out != "--"): # Allow if no break started or a previous break completed
                self.break_button.configure(state="normal", text="BREAK",
                                            fg_color="#fff7cc", text_color="#b38f00",
                                            border_color="#b38f00", hover_color="#ffe066")
            else: # A full break cycle has been recorded (break_in and break_out are present)
                self.break_button.configure(state="disabled", text="BREAK",
                                            fg_color="#e0e0e0", text_color="#888888")


    def on_in(self):
        if self.has_timed_in:
            return
        self.show_password_popup("clock in", self._do_time_in)

    def _do_time_in(self):
        current_time = datetime.now()
        success = self._on_time_update_callback(self.employee_id, 'time_in', current_time)
        if success:
            self.time_in = self._format_time_for_display(current_time.strftime("%H:%M:%S"))
            self.time_in_label.configure(text=f"In: {self.time_in}")
            self.has_timed_in = True
            self._update_button_states()
        else:
            print("Failed to clock in.")

    def on_out(self):
        # Cannot out if not timed in, already timed out, or currently on break
        if not self.has_timed_in or self.has_timed_out or self.is_on_break: 
            return
        self.show_password_popup("clock out", self._do_time_out)

    def _do_time_out(self):
        current_time = datetime.now()
        success = self._on_time_update_callback(self.employee_id, 'time_out', current_time)
        if success:
            self.time_out = self._format_time_for_display(current_time.strftime("%H:%M:%S"))
            self.time_out_label.configure(text=f"Out: {self.time_out}")
            self.has_timed_out = True
            self._update_button_states()
        else:
            print("Failed to clock out.")

    def on_break(self):
        # Prevent starting break if not timed in or already timed out
        if not self.has_timed_in or self.has_timed_out:
            return

        if self.is_on_break:
            self.show_password_popup("end break", self._do_end_break)
        else:
            if self.break_in == "--" or (self.break_in != "--" and self.break_out != "--"): # Allow if no break started or a previous break completed
                self.show_password_popup("start break", self._do_start_break)
            else:
                self._update_button_states() # Ensure button is disabled if break already completed

    def _do_start_break(self):
        current_time = datetime.now()
        success = self._on_time_update_callback(self.employee_id, 'break_in', current_time)
        if success:
            self.break_in = self._format_time_for_display(current_time.strftime("%H:%M:%S"))
            self.is_on_break = True
            self.break_label.configure(text=self._get_break_display_text())
            self._update_button_states()
        else:
            messagebox.showwarning("Failed to start break.")

    def _do_end_break(self):
        current_time = datetime.now()
        success = self._on_time_update_callback(self.employee_id, 'break_out', current_time)
        if success:
            self.break_out = self._format_time_for_display(current_time.strftime("%H:%M:%S"))
            self.is_on_break = False
            self.break_label.configure(text=self._get_break_display_text())
            self._update_button_states()
        else:
            messagebox.showwarning("Failed to end break.")


    def show_password_popup(self, action, on_success_callback):
        """Show password popup for clock in/out/break actions. Calls on_success_callback if password is correct."""
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
        password_entry.focus()

        # Button frame
        button_frame = ctk.CTkFrame(popup, fg_color="transparent")
        button_frame.pack(pady=(0, 20))

        def submit_password():
            password = password_entry.get().strip()
            if not password:
                error_label.configure(text="Please enter a password")
                return

            if self._verify_password_callback(self.employee_id, password):
                print(f"Password accepted for {self.employee_name} to {action}")
                popup.destroy()
                on_success_callback()
            else:
                error_label.configure(text="Incorrect password")

        def cancel():
            popup.destroy()

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

        error_label = ctk.CTkLabel(popup, 
                                  text="", 
                                  font=("Inter", 12), 
                                  text_color="#ff0000")
        error_label.pack(pady=(10, 0))

        password_entry.bind("<Return>", lambda event: submit_password())
        popup.bind("<Escape>", lambda event: cancel())

    def set_enabled(self, enabled):
        """
        Enable or disable the IN/OUT/BREAK buttons based on 'enabled' status (for current/past date).
        Also re-evaluates internal state based on current attendance data.
        """
        if enabled:
            # Re-evaluate states for the current day based on existing data
            self.has_timed_in = (self.time_in != "--")
            self.has_timed_out = (self.time_out != "--")
            # If break_in is present but break_out is not, assume employee is on break
            self.is_on_break = (self.break_in != "--" and self.break_out == "--")
            
            self._update_button_states()
        else:
            # Disable all buttons for past dates
            self.in_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.out_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")
            self.break_button.configure(state="disabled", fg_color="#e0e0e0", text_color="#888888")

    def update_time_label(self, time_in="--", time_out="--", break_in="--", break_out="--"):
        """
        Updates the time labels on the card and re-evaluates button states.
        This is called by the parent (StaffPageEmployee) when refreshing cards.
        """
        self.time_in = self._format_time_for_display(time_in)
        self.time_out = self._format_time_for_display(time_out)
        self.break_in = self._format_time_for_display(break_in)
        self.break_out = self._format_time_for_display(break_out)

        self.time_in_label.configure(text=f"In: {self.time_in}")
        self.time_out_label.configure(text=f"Out: {self.time_out}")
        self.break_label.configure(text=self._get_break_display_text())

        # Update internal state flags
        self.has_timed_in = (self.time_in != "--")
        self.has_timed_out = (self.time_out != "--")
        self.is_on_break = (self.break_in != "--" and self.break_out == "--")

        self._update_button_states()