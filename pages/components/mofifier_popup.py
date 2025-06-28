import customtkinter as ctk

class ModifierPopup(ctk.CTkToplevel):
    def __init__(self, master, product_name="Selected Product", product_type="", on_submit=None):
        super().__init__(master)
        self.title("Modify Product")
        self.geometry("400x550")
        self.configure(fg_color="#f2efea")
        self.resizable(False, False)

        # Props
        self.product_name = product_name
        self.product_type = product_type
        self.selected_quantity = 1
        self.selected_size = ""
        self.selected_temperature = ""
        self.selected_extras = []
        self.on_submit = on_submit

        self.available_extras = ["Solo Shot", "Double Shot", "Whip Cream"]

        # Layout
        self.create_widgets()

        # Make this window modal and appear at the top
        self.grab_set()  # Makes the popup modal
        self.focus_set() # Focus on the popup
        self.transient(master)  # Set to be on top of the parent

    def create_widgets(self):
        # Header
        header_frame = ctk.CTkFrame(self, fg_color="transparent")
        header_frame.pack(padx=25, pady=(25, 10), fill="x")

        close_btn = ctk.CTkButton(header_frame, text="X", width=40, height=40,
                                  fg_color="transparent", hover_color="lightgray",
                                  text_color="#4e2d18", font=("Unbounded", 22, "bold"),
                                  command=self.destroy)
        close_btn.pack(side="left")

        title_label = ctk.CTkLabel(header_frame, text=self.product_name,
                                   font=("Unbounded", 20, "bold"), text_color="#4e2d18")
        title_label.pack(side="left", expand=True, anchor="w", padx=10)

        # Size selection
        if self.product_type in ["Coffee", "Matcha", "Chocolate", "Frappe"]:
            ctk.CTkLabel(self, text="Size", text_color="#4e2d18",
                         font=("Unbounded", 18), anchor="w").pack(pady=(10, 0), padx=10, anchor="w")
            size_frame = ctk.CTkFrame(self, fg_color="transparent")
            size_frame.pack(pady=5)
            self.create_toggle_button(size_frame, "Grande", "size")
            self.create_toggle_button(size_frame, "Venti", "size")

        # Temperature selection
        if self.product_type in ["Coffee", "Matcha", "Chocolate"]:
            ctk.CTkLabel(self, text="Hot/Iced", text_color="#4e2d18",
                         font=("Unbounded", 18), anchor="w").pack(pady=(10, 0), padx=10, anchor="w")
            temp_frame = ctk.CTkFrame(self, fg_color="transparent")
            temp_frame.pack(pady=5)
            self.create_toggle_button(temp_frame, "Hot", "temp")
            self.create_toggle_button(temp_frame, "Iced", "temp")

        # Extras
        if self.product_type != "Food":
            ctk.CTkLabel(self, text="Extras", text_color="#4e2d18",
                         font=("Unbounded", 18), anchor="w").pack(pady=(10, 0), padx=10, anchor="w")
            extras_frame = ctk.CTkFrame(self, fg_color="transparent")
            extras_frame.pack(pady=5)
            self.extra_buttons = []
            for i, extra in enumerate(self.available_extras):
                btn = ctk.CTkButton(extras_frame, text=extra,
                                    fg_color="transparent", border_color="#4e2d18", border_width=2,
                                    width=180, height=40, corner_radius=8, font=("Inter", 14),
                                    text_color="#4e2d18", hover=False,
                                    command=lambda e=extra: self.toggle_extra(e))
                if i == len(self.available_extras) - 1:  # Last button
                    btn.grid(row=i//2, column=0, columnspan=2, padx=5, pady=3)
                else:
                    btn.grid(row=i//2, column=i%2, padx=5, pady=3)
                self.extra_buttons.append((extra, btn))

        # Quantity
        ctk.CTkLabel(self, text="Quantity", text_color="#4e2d18",
                     font=("Unbounded", 18), anchor="w").pack(pady=(10, 0), padx=10, anchor="w")
        qty_frame = ctk.CTkFrame(self, fg_color="transparent")
        qty_frame.pack(pady=5)

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
        submit_btn.pack(pady=(20, 10))

    def create_toggle_button(self, parent, label, category):
        def toggle():
            if category == "size":
                self.selected_size = label
            elif category == "temp":
                self.selected_temperature = label
            # Refresh visuals
            for widget in parent.winfo_children():
                widget.configure(fg_color="transparent", text_color="#4e2d18")
            button.configure(fg_color="#4e2d18", text_color="#f2efea")

        button = ctk.CTkButton(parent, text=label, width=180, height=40,
                               corner_radius=8, fg_color="transparent",
                               border_color="#4e2d18", border_width=2,
                               text_color="#4e2d18", hover=False, font=("Inter", 14),
                               command=toggle)
        button.pack(side="left", padx=5)

    def toggle_extra(self, extra):
        if extra in self.selected_extras:
            self.selected_extras.remove(extra)
        else:
            self.selected_extras.append(extra)
        # Refresh visual states
        for e, btn in self.extra_buttons:
            if e in self.selected_extras:
                btn.configure(fg_color="#4e2d18", text_color="#f2efea")
            else:
                btn.configure(fg_color="transparent", text_color="#4e2d18")

    def increase_quantity(self):
        self.selected_quantity += 1
        self.qty_label.configure(text=str(self.selected_quantity))

    def decrease_quantity(self):
        if self.selected_quantity > 1:
            self.selected_quantity -= 1
            self.qty_label.configure(text=str(self.selected_quantity))

    def submit(self):
        if self.on_submit:
            self.on_submit(
                self.product_name,
                self.selected_quantity,
                self.selected_size,
                self.selected_temperature,
                self.selected_extras
            )
        self.destroy()
