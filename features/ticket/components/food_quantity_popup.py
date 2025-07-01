import customtkinter as ctk

class FoodQuantityPopup(ctk.CTkToplevel):
    def __init__(self, master, product_name="Selected Product", on_submit=None):
        super().__init__(master)
        self.title("Select Quantity")
        self.geometry("400x300")
        self.configure(fg_color="#f2efea")
        self.resizable(False, False)

        # Props
        self.product_name = product_name
        self.selected_quantity = 1
        self.on_submit = on_submit

        # Layout
        self.create_widgets()

        # Make this window modal and appear at the top
        self.grab_set()
        self.focus_set()
        self.transient(master)

    def create_widgets(self):
        # Header
        header_frame = ctk.CTkFrame(self, fg_color="transparent")
        header_frame.pack(padx=25, pady=(25, 10), fill="x")

        title_label = ctk.CTkLabel(header_frame, text=self.product_name,
                                   font=("Unbounded", 20, "bold"), text_color="#4e2d18")
        title_label.pack(side="left", expand=True, anchor="w", padx=10)

        # Quantity section
        ctk.CTkLabel(self, text="Quantity", text_color="#4e2d18",
                     font=("Unbounded", 18), anchor="w").pack(pady=(20, 0), padx=10, anchor="w")
        qty_frame = ctk.CTkFrame(self, fg_color="transparent")
        qty_frame.pack(pady=20)

        minus_btn = ctk.CTkButton(qty_frame, text="-", width=40, height=40, font=("Unbounded", 20),
                                  fg_color="#f2efea", text_color="#4e2d18", hover_color="lightgray",
                                  command=self.decrease_quantity)
        minus_btn.pack(side="left", padx=5)

        self.qty_label = ctk.CTkLabel(qty_frame, text=str(self.selected_quantity),
                                      font=("Unbounded", 20), text_color="#7a9c33", width=50)
        self.qty_label.pack(side="left")

        plus_btn = ctk.CTkButton(qty_frame, text="+", width=40, height=40, font=("Unbounded", 20),
                                 fg_color="#f2efea", text_color="#4e2d18", hover_color="lightgray",
                                 command=self.increase_quantity)
        plus_btn.pack(side="left", padx=5)

        # Submit
        submit_btn = ctk.CTkButton(self, text="Add to Cart", width=150, height=40,
                                   fg_color="#4e2d18", text_color="#f2efea",
                                   font=("Unbounded", 14, "bold"), corner_radius=10,
                                   command=self.submit)
        submit_btn.pack(pady=(30, 10))

    def increase_quantity(self):
        self.selected_quantity += 1
        self.qty_label.configure(text=str(self.selected_quantity))

    def decrease_quantity(self):
        if self.selected_quantity > 1:
            self.selected_quantity -= 1
            self.qty_label.configure(text=str(self.selected_quantity))

    def submit(self):
        if self.on_submit:
            self.on_submit(self.product_name, self.selected_quantity)
        self.destroy()
