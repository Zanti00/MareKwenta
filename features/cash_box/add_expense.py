import customtkinter as ctk
from tkinter import messagebox

class AddExpenseDialog:
    def __init__(self, parent, on_save=None):
        self.result = None
        self.on_save = on_save
        self.dialog = ctk.CTkToplevel(parent)
        self.dialog.title("Add Expense")
        self.dialog.geometry("400x400")
        self.dialog.configure(fg_color="#f2efea")
        self.dialog.transient(parent)
        self.dialog.grab_set()
        self.dialog.update_idletasks()
        self.setup_form()
        self.dialog.wait_window()

    def setup_form(self):
        self.dialog.grid_columnconfigure(0, weight=1)
        row = 0
        title_label = ctk.CTkLabel(
            self.dialog,
            text="Add Expense",
            font=ctk.CTkFont(family="Unbounded", size=20, weight="bold"),
            text_color="#4e2d18"
        )
        title_label.grid(row=row, column=0, pady=(18, 10), sticky="n")
        row += 1
        name_label = ctk.CTkLabel(
            self.dialog,
            text="Expense Name:",
            font=ctk.CTkFont(family="Inter", size=14),
            text_color="#4d2d18"
        )
        name_label.grid(row=row, column=0, sticky="w", padx=40, pady=(8, 2))
        row += 1
        self.name_entry = ctk.CTkEntry(
            self.dialog,
            width=300,
            height=35,
            font=ctk.CTkFont(family="Inter", size=14)
        )
        self.name_entry.grid(row=row, column=0, padx=40, pady=(0, 8), sticky="ew")
        row += 1
        amount_label = ctk.CTkLabel(
            self.dialog,
            text="Amount:",
            font=ctk.CTkFont(family="Inter", size=14),
            text_color="#4d2d18"
        )
        amount_label.grid(row=row, column=0, sticky="w", padx=40, pady=(8, 2))
        row += 1
        self.amount_entry = ctk.CTkEntry(
            self.dialog,
            width=300,
            height=35,
            font=ctk.CTkFont(family="Inter", size=14)
        )
        self.amount_entry.grid(row=row, column=0, padx=40, pady=(0, 8), sticky="ew")
        row += 1
        category_label = ctk.CTkLabel(
            self.dialog,
            text="Category:",
            font=ctk.CTkFont(family="Unbounded", size=14, weight="bold"),
            text_color="#4d2d18"
        )
        category_label.grid(row=row, column=0, sticky="w", padx=40, pady=(8, 2))
        row += 1
        # Radio buttons for category
        self.category_var = ctk.StringVar(value="CASH")
        radio_frame = ctk.CTkFrame(self.dialog, fg_color="transparent")
        radio_frame.grid(row=row, column=0, sticky="w", padx=40, pady=(0, 8))
        cash_radio = ctk.CTkRadioButton(
            radio_frame, text="Cash", variable=self.category_var, value="CASH",
            font=ctk.CTkFont(family="Inter", size=13), text_color="#4d2d18"
        )
        cash_radio.grid(row=0, column=0, padx=(0, 20), pady=0)
        noncash_radio = ctk.CTkRadioButton(
            radio_frame, text="Non-Cash", variable=self.category_var, value="NON-CASH",
            font=ctk.CTkFont(family="Inter", size=13), text_color="#4d2d18"
        )
        noncash_radio.grid(row=0, column=1, padx=0, pady=0)
        row += 1
        # Button frame
        button_frame = ctk.CTkFrame(self.dialog, fg_color="transparent")
        button_frame.grid(row=row, column=0, pady=16)
        save_button = ctk.CTkButton(
            button_frame,
            text="Save",
            width=100,
            height=35,
            font=ctk.CTkFont(family="Inter", size=14, weight="bold"),
            fg_color="#4e2d18",
            hover_color="#3a1f0f",
            command=self.save_expense
        )
        save_button.grid(row=0, column=0, padx=(0, 10))
        cancel_button = ctk.CTkButton(
            button_frame,
            text="Cancel",
            width=100,
            height=35,
            font=ctk.CTkFont(family="Inter", size=14),
            fg_color="#666666",
            hover_color="#555555",
            command=self.cancel
        )
        cancel_button.grid(row=0, column=1)

    def save_expense(self):
        name = self.name_entry.get().strip()
        amount_str = self.amount_entry.get().strip()
        category = self.category_var.get()
        if not name:
            messagebox.showerror("Error", "Please enter an expense name")
            return
        try:
            amount = float(amount_str)
            if amount <= 0:
                raise ValueError("Amount must be positive")
        except ValueError:
            messagebox.showerror("Error", "Please enter a valid positive amount")
            return
        self.result = {
            "name": name,
            "amount": amount,
            "category": category
        }
        if self.on_save:
            self.on_save(self.result)
        self.dialog.destroy()

    def cancel(self):
        self.dialog.destroy()
    
    def run(self):
        self.mainloop()
    
    def mainloop(self):
        self.dialog.mainloop()
