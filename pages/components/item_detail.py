import customtkinter as ctk
from PIL import Image
import os

class ItemDetail(ctk.CTkFrame):
    def __init__(self, master, product_name="Default Product", quantity=1,
                 size_drink="Grande/Venti", item_info="Hot/Iced & Extra", extras="",unit_price=0.0,
                 on_remove=None, *args, **kwargs):
        super().__init__(master, width=447, height=111, fg_color="#ffffff", corner_radius=20, *args, **kwargs)

        self.product_name = product_name
        self.quantity = quantity
        self.size_drink = size_drink
        self.item_info = item_info
        self.extras = extras
        self.unit_price = unit_price
        self.item_total = quantity * unit_price
        self.on_remove = on_remove

        # Left section: Product info
        self.left_column = ctk.CTkFrame(self, fg_color="transparent")
        #self.left_column.place(relwidth=0.65, x=25, rely=0.0, anchor="nw")
        self.left_column.pack(side="left", fill="both", expand=True, padx=25, pady=2)

        name = ctk.CTkLabel(self.left_column, text=product_name, font=("Unbounded", 16), text_color="#4e2d18")
        name.pack(anchor="w", pady=(7,0), ipady=0)

        details_lines = []
        if size_drink:
            details_lines.append(f"Size: {size_drink}")
        if item_info:
            details_lines.append(f"Infos: {item_info}")
        if extras:
            details_lines.append(f"Extras: {extras}")
        details_lines.append(f"Quantity: {quantity}")
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

        # Right section: Total + Delete
        self.right_column = ctk.CTkFrame(self, fg_color="transparent", width=103, height=95)
        self.right_column.place(x=427, rely=0.5, anchor="e")
        
        trash_icon = ctk.CTkImage(light_image=Image.open("assets/trash.png"))
        
        delete_btn = ctk.CTkButton(self.right_column, width=20, height=20, text="",
                                   fg_color="transparent", hover_color="#f0f0f0",
                                   image=trash_icon,
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
