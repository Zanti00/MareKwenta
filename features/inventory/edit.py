import customtkinter as ctk

class EditInventoryPopup(ctk.CTkToplevel):
    def __init__(self, parent, item_data, on_save=None):
        super().__init__(parent)
        self.title("Edit Inventory Item")
        self.geometry("350x450")
        self.geometry("370x500")
        self.resizable(False, False)
        self.configure(fg_color="#f7f4f1", border_width=1, border_color="#7c5a3a")
        self.grab_set()  # Modal
        self.on_save = on_save

        # Main frame for padding
        main_frame = ctk.CTkFrame(self, fg_color="#f7f4f1")
        main_frame.grid(row=0, column=0, sticky="nsew", padx=18, pady=18)
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(0, weight=1)
        main_frame.grid_columnconfigure(0, weight=1)

        row = 0
        # Header
        header = ctk.CTkLabel(
            main_frame,
            text="Edit Inventory Item",
            font=ctk.CTkFont("Unbounded", size=24, weight="bold"),
            text_color="#4e2d18"
        )
        header.grid(row=row, column=0, sticky="w", pady=(0, 18))
        row += 1

        # Ingredient Name
        name_label = ctk.CTkLabel(
            main_frame,
            text="Ingredient Name",
            font=ctk.CTkFont("Inter", size=14, weight="bold"),
            text_color="#4e2d18"
        )
        name_label.grid(row=row, column=0, sticky="w")
        row += 1
        self.name_entry = ctk.CTkEntry(
            main_frame,
            placeholder_text="Ingredient Name",
            font=ctk.CTkFont("Inter", size=13),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.name_entry.grid(row=row, column=0, sticky="ew", pady=(0, 12))
        self.name_entry.insert(0, item_data.get("ingredient", ""))
        row += 1

        # Quantity
        qty_label = ctk.CTkLabel(
            main_frame,
            text="Quantity",
            font=ctk.CTkFont("Inter", size=14, weight="bold"),
            text_color="#4e2d18"
        )
        qty_label.grid(row=row, column=0, sticky="w")
        row += 1
        self.qty_entry = ctk.CTkEntry(
            main_frame,
            placeholder_text="Quantity",
            font=ctk.CTkFont("Inter", size=13),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.qty_entry.grid(row=row, column=0, sticky="ew", pady=(0, 12))
        self.qty_entry.insert(0, item_data.get("quantity", ""))
        row += 1

        # Measurement
        measurement_label = ctk.CTkLabel(
            main_frame,
            text="Measurement",
            font=ctk.CTkFont("Inter", size=14, weight="bold"),
            text_color="#4e2d18"
        )
        measurement_label.grid(row=row, column=0, sticky="w")
        row += 1
        self.measurement_combo = ctk.CTkOptionMenu(
            main_frame,
            values=["mg", "ml", "grams", "oz", "pcs"],
            font=ctk.CTkFont("Inter", size=13),
            fg_color="#ffffff",
            button_color="#d1d5db",
            button_hover_color="#9ca3af",
            dropdown_fg_color="#ffffff",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.measurement_combo.grid(row=row, column=0, sticky="ew", pady=(0, 12))
        self.measurement_combo.set(item_data.get("measurement", "Unit"))
        row += 1

        # Cost
        cost_label = ctk.CTkLabel(
            main_frame,
            text="Cost",
            font=ctk.CTkFont("Inter", size=14, weight="bold"),
            text_color="#4e2d18"
        )
        cost_label.grid(row=row, column=0, sticky="w")
        row += 1
        self.cost_entry = ctk.CTkEntry(
            main_frame,
            placeholder_text="Cost",
            font=ctk.CTkFont("Inter", size=13),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.cost_entry.grid(row=row, column=0, sticky="ew", pady=(0, 12))  # Reduced from (0, 24)
        self.cost_entry.insert(0, item_data.get("cost", ""))
        row += 1

        # Restock Point
        restock_label = ctk.CTkLabel(
            main_frame,
            text="Restock Point",
            font=ctk.CTkFont("Inter", size=14, weight="bold"),
            text_color="#4e2d18"
        )
        restock_label.grid(row=row, column=0, sticky="w")
        row += 1
        self.restock_entry = ctk.CTkEntry(
            main_frame,
            placeholder_text="Restock Point",
            font=ctk.CTkFont("Inter", size=13),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.restock_entry.grid(row=row, column=0, sticky="ew", pady=(0, 12))  # Reduced from (0, 24)
        self.restock_entry.insert(0, item_data.get("restock_point", ""))
        row += 1

        # Button frame
        btn_frame = ctk.CTkFrame(main_frame, fg_color="#f7f4f1")
        btn_frame.grid(row=row, column=0, sticky="ew", pady=(6, 0))  # Reduced top padding
        btn_frame.grid_columnconfigure(0, weight=1)
        btn_frame.grid_columnconfigure(1, weight=1)

        cancel_btn = ctk.CTkButton(
            btn_frame,
            text="Cancel",
            width=80,
            height=40,
            fg_color="#e0e0e0",
            text_color="#4e2d18",
            hover_color="#cccccc",
            corner_radius=6,
            command=self.destroy
        )
        cancel_btn.grid(row=0, column=0, padx=(0, 8), pady=0, sticky="ew")

        save_btn = ctk.CTkButton(
            btn_frame,
            text="Save",
            width=100,
            height=40,
            fg_color="#4e2d18",
            text_color="#ffffff",
            hover_color="#3a1e0a",
            corner_radius=6,
            command=self._on_save
        )
        save_btn.grid(row=0, column=1, padx=(8, 0), pady=0, sticky="ew")

    def _on_save(self):
        name = self.name_entry.get().strip()
        qty = self.qty_entry.get().strip()
        measurement = self.measurement_combo.get()
        cost = self.cost_entry.get().strip()
        restock_point = self.restock_entry.get().strip()
        if self.on_save:
            self.on_save(name, qty, measurement, cost, restock_point)
        self.destroy()
