import customtkinter as ctk

class AddQuantityPopup(ctk.CTkToplevel):
    def __init__(self, parent, on_save=None):
        super().__init__(parent)
        self.title("Add Quantity")
        self.geometry("320x300")
        self.resizable(False, False)
        self.configure(fg_color="#f7f4f1", border_width=1, border_color="#7c5a3a")
        self.grab_set()  # Make modal

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
            text="Add Quantity",
            font=ctk.CTkFont("Unbounded", size=24, weight="bold"),
            text_color="#4e2d18"
        )
        header.grid(row=row, column=0, sticky="w", pady=(10, 18))
        row += 1

        # Quantity label and entry
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
            placeholder_text="Add quantity",
            width=150,
            height=40,
            font=ctk.CTkFont("Inter", size=13),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.qty_entry.grid(row=row, column=0, sticky="ew", pady=(0, 24))
        row += 1

        # Button frame
        btn_frame = ctk.CTkFrame(main_frame, fg_color="#f7f4f1")
        btn_frame.grid(row=row, column=0, sticky="ew", pady=(10, 0))
        btn_frame.grid_columnconfigure(0, weight=1)
        btn_frame.grid_columnconfigure(1, weight=1)

        # Cancel button
        cancel_btn = ctk.CTkButton(
            btn_frame,
            text="Cancel",
            width=80,
            fg_color="#e0e0e0",
            text_color="#4e2d18",
            hover_color="#cccccc",
            corner_radius=6,
            command=self.destroy
        )
        cancel_btn.grid(row=0, column=0, padx=(0, 8), pady=0, sticky="ew")

        # Save button
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
        qty = self.qty_entry.get().strip()
        if self.on_save:
            self.on_save(qty)
        self.destroy()
