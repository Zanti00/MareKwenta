import customtkinter as ctk

class ModifierPopup(ctk.CTkToplevel):
    def __init__(self, master, product_name="Selected Product", product_type="", product_types=[], on_submit=None):
        super().__init__(master)
        self.title("Modify Product")
        self.geometry("400x600")  # Increased height for new layout
        self.configure(fg_color="#f2efea")
        self.resizable(False, False)

        # Props
        self.product_name = product_name
        self.product_type = product_type
        self.product_types = product_types
        self.selected_quantity = 1
        self.selected_size = ""
        self.selected_temperature = ""
        self.extra_shots = 0
        self.whip_cream = 0
        self.on_submit = on_submit

        # Get available sizes and temperatures from product types
        self.available_sizes = list(set(pt['size'] for pt in product_types if pt['size']))
        self.available_temperatures = list(set(pt['temperature'] for pt in product_types if pt['temperature']))
        
        # Sort them properly
        size_order = {"Grande": 1, "Venti": 2}
        temp_order = {"Hot": 1, "Iced": 2}
        self.available_sizes.sort(key=lambda x: size_order.get(x, 999))
        self.available_temperatures.sort(key=lambda x: temp_order.get(x, 999))

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

        # Size selection
        if self.available_sizes:
            ctk.CTkLabel(self, text="Size", text_color="#4e2d18",
                         font=("Unbounded", 18), anchor="w").pack(pady=(10, 0), padx=10, anchor="w")
            size_frame = ctk.CTkFrame(self, fg_color="transparent")
            size_frame.pack(pady=5)
            self.size_buttons = []
            for size in self.available_sizes:
                btn = self.create_toggle_button(size_frame, size, "size")
                self.size_buttons.append(btn)

        # Temperature selection
        if self.available_temperatures:
            ctk.CTkLabel(self, text="Hot/Iced", text_color="#4e2d18",
                         font=("Unbounded", 18), anchor="w").pack(pady=(10, 0), padx=10, anchor="w")
            temp_frame = ctk.CTkFrame(self, fg_color="transparent")
            temp_frame.pack(pady=5)
            self.temp_buttons = []
            for temp in self.available_temperatures:
                btn = self.create_toggle_button(temp_frame, temp, "temp")
                self.temp_buttons.append(btn)

        # Extras section
        if self.product_type != "Food":
            ctk.CTkLabel(self, text="Extras", text_color="#4e2d18",
                         font=("Unbounded", 18), anchor="w").pack(pady=(15, 5), padx=10, anchor="w")
            
            extras_container = ctk.CTkFrame(self, fg_color="transparent")
            extras_container.pack(pady=5, padx=25, fill="x")
            
            # Extra Shot section
            extra_shot_frame = ctk.CTkFrame(extras_container, fg_color="#ffffff", corner_radius=10)
            extra_shot_frame.pack(fill="x", pady=5)
            extra_shot_frame.grid_columnconfigure(1, weight=1)
            
            ctk.CTkLabel(extra_shot_frame, text="Extra Shot (₱15 each):", 
                        font=("Inter", 14, "bold"), text_color="#4e2d18").grid(row=0, column=0, sticky="w", padx=10, pady=10)
            
            shot_controls = ctk.CTkFrame(extra_shot_frame, fg_color="transparent")
            shot_controls.grid(row=0, column=1, sticky="e", padx=10, pady=10)
            
            ctk.CTkButton(shot_controls, text="-", width=30, height=30, 
                         font=("Inter", 16, "bold"), fg_color="#e0e0e0", text_color="#4e2d18",
                         command=self.decrease_shots).pack(side="left", padx=2)
            
            self.shots_label = ctk.CTkLabel(shot_controls, text="0", width=40,
                                           font=("Inter", 16, "bold"), text_color="#4e2d18")
            self.shots_label.pack(side="left", padx=5)
            
            ctk.CTkButton(shot_controls, text="+", width=30, height=30,
                         font=("Inter", 16, "bold"), fg_color="#4e2d18", text_color="#ffffff",
                         command=self.increase_shots).pack(side="left", padx=2)
            
            # Whip Cream section
            whip_cream_frame = ctk.CTkFrame(extras_container, fg_color="#ffffff", corner_radius=10)
            whip_cream_frame.pack(fill="x", pady=5)
            whip_cream_frame.grid_columnconfigure(1, weight=1)
            
            ctk.CTkLabel(whip_cream_frame, text="Whip Cream (₱5 each):", 
                        font=("Inter", 14, "bold"), text_color="#4e2d18").grid(row=0, column=0, sticky="w", padx=10, pady=10)
            
            whip_controls = ctk.CTkFrame(whip_cream_frame, fg_color="transparent")
            whip_controls.grid(row=0, column=1, sticky="e", padx=10, pady=10)
            
            ctk.CTkButton(whip_controls, text="-", width=30, height=30,
                         font=("Inter", 16, "bold"), fg_color="#e0e0e0", text_color="#4e2d18",
                         command=self.decrease_whip).pack(side="left", padx=2)
            
            self.whip_label = ctk.CTkLabel(whip_controls, text="0", width=40,
                                          font=("Inter", 16, "bold"), text_color="#4e2d18")
            self.whip_label.pack(side="left", padx=5)
            
            ctk.CTkButton(whip_controls, text="+", width=30, height=30,
                         font=("Inter", 16, "bold"), fg_color="#4e2d18", text_color="#ffffff",
                         command=self.increase_whip).pack(side="left", padx=2)

        # Quantity section
        ctk.CTkLabel(self, text="Quantity", text_color="#4e2d18",
                     font=("Unbounded", 18), anchor="w").pack(pady=(15, 0), padx=10, anchor="w")
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
                # Update all size buttons
                for btn in getattr(self, 'size_buttons', []):
                    btn.configure(fg_color="transparent", text_color="#4e2d18")
            elif category == "temp":
                self.selected_temperature = label
                # Update all temp buttons
                for btn in getattr(self, 'temp_buttons', []):
                    btn.configure(fg_color="transparent", text_color="#4e2d18")
            
            button.configure(fg_color="#4e2d18", text_color="#f2efea")

        button = ctk.CTkButton(parent, text=label, width=180, height=40,
                               corner_radius=8, fg_color="transparent",
                               border_color="#4e2d18", border_width=2,
                               text_color="#4e2d18", hover=False, font=("Inter", 14),
                               command=toggle)
        button.pack(side="left", padx=5)
        return button

    def increase_shots(self):
        self.extra_shots += 1
        self.shots_label.configure(text=str(self.extra_shots))

    def decrease_shots(self):
        if self.extra_shots > 0:
            self.extra_shots -= 1
            self.shots_label.configure(text=str(self.extra_shots))

    def increase_whip(self):
        self.whip_cream += 1
        self.whip_label.configure(text=str(self.whip_cream))

    def decrease_whip(self):
        if self.whip_cream > 0:
            self.whip_cream -= 1
            self.whip_label.configure(text=str(self.whip_cream))

    def increase_quantity(self):
        self.selected_quantity += 1
        self.qty_label.configure(text=str(self.selected_quantity))

    def decrease_quantity(self):
        if self.selected_quantity > 1:
            self.selected_quantity -= 1
            self.qty_label.configure(text=str(self.selected_quantity))

    def submit(self):
        # Validation for beverages
        if self.available_sizes and not self.selected_size:
            ctk.CTkMessagebox(title="Selection Required", message="Please select a size", icon="warning")
            return
        if self.available_temperatures and not self.selected_temperature:
            ctk.CTkMessagebox(title="Selection Required", message="Please select temperature", icon="warning")
            return
            
        if self.on_submit:
            self.on_submit(
                self.product_name,
                self.selected_quantity,
                self.selected_size,
                self.selected_temperature,
                {"extra_shots": self.extra_shots, "whip_cream": self.whip_cream}
            )
        self.destroy()
