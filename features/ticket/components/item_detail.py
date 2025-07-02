import customtkinter as ctk
from PIL import Image
import os

class ItemDetail(ctk.CTkFrame):
    def __init__(self, master, product_name="Default Product", quantity=1,
                 size_drink="", item_info="", extras="", extras_cost=0, unit_price=0.0,
                 on_remove=None, *args, **kwargs):
        super().__init__(master, width=440, height=111, fg_color="#ffffff", corner_radius=20, *args, **kwargs)

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
        # Left section: Product info
        self.left_column = ctk.CTkFrame(self, fg_color="transparent")
        self.left_column.pack(side="left", fill="both", expand=True, padx=15, pady=2)

        # Right section: Total + Delete
        self.right_column = ctk.CTkFrame(self, fg_color="transparent", width=90, height=95)
        self.right_column.place(x=385, rely=0.5, anchor="e")
        
        self.update_display()

    def update_display(self):
        """Update the display with current data"""
        # Clear existing content
        for widget in self.left_column.winfo_children():
            widget.destroy()
        for widget in self.right_column.winfo_children():
            widget.destroy()

        # Recreate content
        name = ctk.CTkLabel(self.left_column, text=self.product_name, font=("Unbounded", 16), text_color="#4e2d18")
        name.pack(anchor="w", pady=(7,0), ipady=0)

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
            font=("Inter", 12),
            text_color="#4e2d18",
            anchor="w",
            justify="left"
        )
        details_label.pack(anchor="w", pady=(0,10), ipady=0)

        # Get the absolute path to the assets folder relative to this file
        assets_dir = os.path.join(os.path.dirname(__file__), '..', '..', 'assets')
        icon_path = os.path.abspath(os.path.join(assets_dir, 'trash.png'))
        
        try:
            trash_icon = ctk.CTkImage(light_image=Image.open(icon_path))
            delete_btn = ctk.CTkButton(self.right_column, width=20, height=20, text="",
                                       fg_color="transparent", hover_color="#f0f0f0",
                                       image=trash_icon,
                                       command=self._remove_self)
        except:
            # Fallback if trash icon doesn't exist
            delete_btn = ctk.CTkButton(self.right_column, width=20, height=20, text="✕",
                                       fg_color="transparent", hover_color="#f0f0f0",
                                       text_color="#dc3545",
                                       command=self._remove_self)
        
        delete_btn.place(relx=1.0, rely=0.0, anchor="ne")

        total_text = ctk.CTkLabel(self.right_column,
                                  text=f"\u20B1{self.item_total:.2f}",
                                  font=("Unbounded", 16, "bold"),
                                  text_color="#708a2e")
        total_text.place(relx=1.0, rely=1.0, anchor="se")

    def _remove_self(self):
        if self.on_remove:
            self.on_remove(self.product_name, self.item_total)
        self.destroy()

    def update_quantity(self, new_quantity):
        """Update the quantity and refresh display"""
        self.quantity = new_quantity
        self.item_total = (self.quantity * self.unit_price) + (self.quantity * self.extras_cost)
        self.update_display()
