import customtkinter as ctk
import tkinter as tk
from tkinter import messagebox

class SplitPopup(ctk.CTkToplevel):
    def __init__(self, master, total_amount=0, on_charge_callback=None):
        super().__init__(master, fg_color="#f2efea")
        self.geometry("400x500")
        self.title("Split Payment")
        self.total_amount = float(total_amount)  # Ensure it's a float
        self.payment_count = tk.IntVar(value=2)
        self.entered_total = tk.DoubleVar(value=0.0)  # Changed to DoubleVar for decimals
        self.valid_split = tk.BooleanVar(value=True)
        self.payment_methods = ["Cash", "GCash", "Maya"]
        self.on_charge_callback = on_charge_callback
        self.payment_entries = []

        self.configure(bg="#f2efea")

        self.init_ui()
        self.update_split_rows()

        self.grab_set()  # Makes the popup modal
        self.focus_set() # Focus on the popup
        self.transient(master)  # Set to be on top of the parent

    def init_ui(self):
        # Header
        header_frame = ctk.CTkFrame(self, fg_color="#f2efea")
        header_frame.pack(padx=20, pady=10, fill="x")

        back_button = ctk.CTkButton(header_frame, text="←", width=30, command=self.destroy, fg_color="transparent", text_color="#4e2d18")
        back_button.pack(side="left")

        title = ctk.CTkLabel(header_frame, text="Split", font=("Unbounded", 22, "bold"), text_color="#4e2d18")
        title.pack(side="left", padx=10)

        # Payments label
        payments_label = ctk.CTkLabel(self, text="Payments", font=("Inter", 16, "bold"), text_color="#4e2d18")
        payments_label.pack(pady=(0, 5))

        # Payment count controls
        counter_frame = ctk.CTkFrame(self, fg_color="#f2efea")
        counter_frame.pack(pady=5)

        ctk.CTkButton(counter_frame, text="−", width=30, border_color="#4D2D18", fg_color="#f2efea", text_color="#4D2D18", corner_radius=50,
                                border_width=2, hover_color="#e8e4df", command=self.decrease_payment_count).pack(side="left", padx=10)
        self.count_label = ctk.CTkLabel(counter_frame, textvariable=self.payment_count, font=("Unbounded", 18), text_color="#7a9c33")
        self.count_label.pack(side="left")
        ctk.CTkButton(counter_frame, text="+", width=30, border_color="#4D2D18", fg_color="#f2efea", text_color="#4D2D18", corner_radius=50,
                                border_width=2, hover_color="#e8e4df", command=self.increase_payment_count).pack(side="left", padx=10)

        # Separator
        separator = tk.Frame(self, height=1, bg="#ccc")
        separator.pack(fill="x", pady=10, padx=20)

        # Scrollable payment entry area
        self.scroll_frame = ctk.CTkScrollableFrame(self, height=230, fg_color="#f2efea")
        self.scroll_frame.pack(padx=20, pady=5, fill="both", expand=True)

        # Total display
        self.total_display = ctk.CTkLabel(self, text="", font=("Inter", 14), text_color="green")
        self.total_display.pack(pady=10)

        # Charge button
        self.charge_button = ctk.CTkButton(self, text="CHARGE", width=120, border_color="#4D2D18", fg_color="#f2efea", text_color="#4D2D18", 
                                border_width=2, hover_color="#e8e4df", command=self.submit_split, corner_radius=8)
        self.charge_button.pack(pady=(5, 15))

    def update_split_rows(self):
        for widget in self.scroll_frame.winfo_children():
            widget.destroy()
        self.payment_entries.clear()

        # Calculate split amounts with proper decimal handling
        base = self.total_amount / self.payment_count.get()
        remainder = self.total_amount % self.payment_count.get()

        for i in range(self.payment_count.get()):
            # For the last payment, add any remainder to avoid rounding issues
            if i == self.payment_count.get() - 1:
                amount = round(base + remainder, 2)
            else:
                amount = round(base, 2)
            self.add_payment_row(amount)

        self.check_total_amount()

    def add_payment_row(self, amount):
        row = ctk.CTkFrame(self.scroll_frame, fg_color="#f2efea")
        row.pack(fill="x", pady=5)

        ctk.CTkLabel(row, text="🧾").pack(side="left", padx=5)

        method_var = tk.StringVar(value=self.payment_methods[0])
        method_menu = ctk.CTkOptionMenu(row, values=self.payment_methods, variable=method_var,
                                       fg_color="#c0a891", text_color="#4D2D18",
                                       button_color="#c0a891", button_hover_color="#e8e4df")
        method_menu.pack(side="left", padx=5, fill="x", expand=True)

        # Use DoubleVar for decimal amounts and set with proper formatting
        amount_var = tk.DoubleVar(value=amount)
        amount_entry = ctk.CTkEntry(row, textvariable=amount_var, width=80)
        amount_entry.pack(side="right", padx=5)

        def on_amount_change(*_):
            self.check_total_amount()

        amount_entry.bind("<KeyRelease>", on_amount_change)
        self.payment_entries.append((method_var, amount_var))

    def check_total_amount(self):
        try:
            # Calculate total with proper decimal handling
            total = sum(var.get() for _, var in self.payment_entries)
            self.entered_total.set(total)
            
            # Check if totals match with small tolerance for floating point precision
            tolerance = 0.01
            difference = abs(total - self.total_amount)
            is_valid = difference < tolerance
            
            self.valid_split.set(is_valid)

            self.total_display.configure(
                text=f"Total Entered: ₱{total:.2f} / ₱{self.total_amount:.2f}",
                text_color="green" if is_valid else "red"
            )
            self.charge_button.configure(state="normal" if is_valid else "disabled")
            
        except Exception as e:
            print(f"Error checking total amount: {e}")
            self.valid_split.set(False)
            self.charge_button.configure(state="disabled")

    def decrease_payment_count(self):
        if self.payment_count.get() > 1:
            self.payment_count.set(self.payment_count.get() - 1)
            self.update_split_rows()

    def increase_payment_count(self):
        self.payment_count.set(self.payment_count.get() + 1)
        self.update_split_rows()

    def submit_split(self):
        """Submit split payment and process the transaction"""
        if not self.valid_split.get():
            messagebox.showwarning("Invalid Total", "Total entered does not match the order total.")
            return
            
        # Prepare payment data for each method
        payment_data = []
        for method, amount in self.payment_entries:
            amount_value = amount.get()
            if amount_value > 0:  # Only include payments with amount > 0
                payment_data.append({
                    "payment_type": method.get(),
                    "payment_amount": round(amount_value, 2)  # Round to 2 decimal places
                })
        
        # Create charge data structure for the main handler
        charge_data = {
            "total_amount": round(self.total_amount, 2),
            "cash_received": round(self.total_amount, 2),  # For split payment, total received equals total
            "change": 0,  # No change in split payment
            "discount": getattr(self.master, 'applied_discount', 0),  # Get discount from ticket panel
            "payment_type": "Split",
            "split_payments": payment_data  # Additional data for split payments
        }
        
        # Get the charge callback from the ticket panel
        if hasattr(self.master, 'on_charge_callback') and self.master.on_charge_callback:
            self.master.on_charge_callback(charge_data)
        
        self.destroy()

    def open_split_popup(self, total=None):
        # Open the SplitPopup window when split button is clicked
        if total is None:
            # Use the displayed total (which includes discount)
            displayed_total_text = self.total_display.cget("text")
            total = float(displayed_total_text.replace("₱ ", "").replace(",", ""))
        SplitPopup(self, total_amount=total)
