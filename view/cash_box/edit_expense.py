import customtkinter as ctk
from tkinter import messagebox

class EditExpenseDialog:
    def __init__(self, parent, expense_data, on_save=None):
        self.result = None
        self.on_save = on_save
        self.dialog = ctk.CTkToplevel(parent)
        self.dialog.title("Edit Expense")
        self.dialog.geometry("400x300")
        self.dialog.configure(fg_color="#f2efea")
        self.dialog.transient(parent)
        self.dialog.grab_set()
        self.dialog.update_idletasks()
        x = (self.dialog.winfo_screenwidth() // 2) - (400 // 2)
        y = (self.dialog.winfo_screenheight() // 2) - (300 // 2)
        self.dialog.geometry(f"400x300+{x}+{y}")
        self.setup_form(expense_data)
        self.dialog.wait_window()

    def setup_form(self, expense_data):
        title_label = ctk.CTkLabel(
            self.dialog,
            text="Edit Expense",
            font=ctk.CTkFont(family="Arial", size=20, weight="bold"),
            text_color="#4e2d18"
        )
        title_label.pack(pady=20)
        name_label = ctk.CTkLabel(
            self.dialog,
            text="Expense Name:",
            font=ctk.CTkFont(family="Inter", size=14),
            text_color="#4d2d18"
        )
        name_label.pack(pady=(10, 5))
        self.name_entry = ctk.CTkEntry(
            self.dialog,
            width=300,
            height=35,
            font=ctk.CTkFont(family="Inter", size=14)
        )
        self.name_entry.pack(pady=(0, 10))
        self.name_entry.insert(0, expense_data["name"])
        amount_label = ctk.CTkLabel(
            self.dialog,
            text="Amount:",
            font=ctk.CTkFont(family="Inter", size=14),
            text_color="#4d2d18"
        )
        amount_label.pack(pady=(10, 5))
        self.amount_entry = ctk.CTkEntry(
            self.dialog,
            width=300,
            height=35,
            font=ctk.CTkFont(family="Inter", size=14)
        )
        self.amount_entry.pack(pady=(0, 10))
        self.amount_entry.insert(0, str(expense_data["amount"]))
        category_label = ctk.CTkLabel(
            self.dialog,
            text="Category:",
            font=ctk.CTkFont(family="Inter", size=14),
            text_color="#4d2d18"
        )
        category_label.pack(pady=(10, 5))
        self.category_combo = ctk.CTkComboBox(
            self.dialog,
            width=300,
            height=35,
            values=["CASH", "GCASH", "MAYA"],
            font=ctk.CTkFont(family="Inter", size=14)
        )
        self.category_combo.pack(pady=(0, 20))
        self.category_combo.set(expense_data["category"])
        button_frame = ctk.CTkFrame(self.dialog, fg_color="transparent")
        button_frame.pack(pady=10)
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
        save_button.pack(side="left", padx=(0, 10))
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
        cancel_button.pack(side="left")

    def save_expense(self):
        name = self.name_entry.get().strip()
        amount_str = self.amount_entry.get().strip()
        category = self.category_combo.get()
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
