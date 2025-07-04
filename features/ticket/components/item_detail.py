import customtkinter as ctk
from PIL import Image
import os

class ItemDetail(ctk.CTkFrame):
    def __init__(self, master, product_name="Default Product", quantity=1,
                 size_drink="", item_info="", extras="", extras_cost=0, unit_price=0.0,
                 on_remove=None, *args, **kwargs):
        super().__init__(master, width=160, fg_color="#ffffff", corner_radius=20, *args, **kwargs)

        self.product_name = product_name
        self.quantity = quantity
        self.size_drink = size_drink
        self.item_info = item_info
        self.extras = extras
        self.extras_cost = extras_cost
        self.unit_price = unit_price
        # Calculate total including extras cost
        self.item_total = (quantity * unit_price) + (quantity * extras_cost)
        self.on_remove = on_remove

        # Create the initial display
        self.create_display()

    def create_display(self):
        """Create the display elements"""
        # Single column for all content
        self.left_column = ctk.CTkFrame(self, fg_color="transparent")
        self.left_column.pack(fill="x", expand=False, padx=10, pady=2)

        # Delete button in top right of the main frame
        assets_dir = os.path.join(os.path.dirname(__file__), '..', '..', 'assets')
        icon_path = os.path.abspath(os.path.join(assets_dir, 'trash.png'))
        try:
            trash_icon = ctk.CTkImage(light_image=Image.open(icon_path))
            delete_btn = ctk.CTkButton(self, width=20, height=20, text="",
                                       fg_color="transparent", hover_color="#f0f0f0",
                                       image=trash_icon,
                                       command=self._remove_self)
        except:
            delete_btn = ctk.CTkButton(self, width=20, height=20, text="✕",
                                       fg_color="transparent", hover_color="#f0f0f0",
                                       text_color="#dc3545",
                                       command=self._remove_self)
        delete_btn.place(relx=1.0, rely=0.0, anchor="ne")

        self.update_display()

    def update_display(self):
        """Update the display with current data"""
        # Clear existing content
        for widget in self.left_column.winfo_children():
            widget.destroy()

        # Product name (slightly larger font)
        name = ctk.CTkLabel(self.left_column, text=self.product_name, font=("Unbounded", 15), text_color="#4e2d18")
        name.pack(anchor="w", pady=(5,0), ipady=0)

        # Details (slightly larger font)
        details_lines = []
        if self.size_drink:
            details_lines.append(f"Size: {self.size_drink}")
        if self.item_info:
            details_lines.append(f"Temperature: {self.item_info}")
        if self.extras:
            extras_str = ", ".join(self.extras) if isinstance(self.extras, list) else str(self.extras)
            if self.extras_cost > 0:
                details_lines.append(f"Extras: {extras_str} (+₱{self.extras_cost})")
            else:
                details_lines.append(f"Extras: {extras_str}")
        details_lines.append(f"Quantity: {self.quantity}")
        details_text = "\n".join(details_lines)
        details_label = ctk.CTkLabel(
            self.left_column,
            text=details_text,
            font=("Inter", 11),
            text_color="#4e2d18",
            anchor="w",
            justify="left"
        )
        details_label.pack(anchor="w", pady=(0,2), ipady=0)

        # Row for total (slightly larger font)
        total_row = ctk.CTkFrame(self.left_column, fg_color="transparent")
        total_row.pack(fill="x", pady=(0,2))
        total_text = ctk.CTkLabel(total_row,
                                  text=f"\u20B1{self.item_total:.2f}",
                                  font=("Unbounded", 14, "bold"),
                                  text_color="#708a2e")
        total_text.pack(side="right", padx=(0, 5))

    def _remove_self(self):
        if self.on_remove:
            self.on_remove(self.product_name, self.item_total)
        self.destroy()

    def update_quantity(self, new_quantity):
        """Update the quantity and refresh display"""
        self.quantity = new_quantity
        self.item_total = (self.quantity * self.unit_price) + (self.quantity * self.extras_cost)
        self.update_display()
