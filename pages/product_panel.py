import customtkinter as ctk
import os
from components.product_btn import ProductButton
from PIL import Image


class ProductPanel(ctk.CTkFrame):
    def __init__(self, master, on_product_click=None, *args, **kwargs):
        super().__init__(master,*args, **kwargs, width=800, height=938, fg_color="#f2efea")

        self.on_product_click = on_product_click
        self.current_tab = "All"
        self.selected_tab = "All"  

        self.products = [
            {"name": "Americano", "image": "assets/americano.png", "category": "Coffee", "type": "Coffee"},
            {"name": "Cafe Latte", "image": "assets/cafe_latte.png", "category": "Coffee", "type": "Coffee"},
            {"name": "Caramel Macchiato", "image": "assets/caramel_macc.png", "category": "Coffee", "type": "Coffee"},
            {"name": "Mocha", "image": "assets/mocha.png", "category": "Coffee", "type": "Coffee"},
            {"name": "Cappuccino", "image": "assets/cappuccino.png", "category": "Coffee", "type": "Coffee"},
            {"name": "Matcha Latte", "image": "assets/matcha.png", "category": "Non-Coffee", "type": "Matcha"},
            {"name": "Chocolate", "image": "assets/chocolate.png", "category": "Non-Coffee", "type": "Chocolate"},
            {"name": "Strawberry Frappe", "image": "assets/sb_frappe.png", "category": "Non-Coffee", "type": "Frappe"},
            {"name": "Caramel Frappe", "image": "assets/caramel_frappe.png", "category": "Non-Coffee", "type": "Frappe"},
            {"name": "Chocolate Chip Frappe", "image": "assets/choc_chip_frappe.png", "category": "Non-Coffee", "type": "Frappe"},
            {"name": "Tocilog", "image": "assets/tocilog.png", "category": "Food", "type": "Food"},
            {"name": "Garlic Rice", "image": "assets/garlic_rice.png", "category": "Food", "type": "Food"},
            {"name": "Pork Siomai Rice", "image": "assets/pork_siomai_rice.png", "category": "Food", "type": "Food"},
            {"name": "Hamsilog", "image": "assets/hamsilog.png", "category": "Food", "type": "Food"},
        ]

        self.filtered_products = []

        self.tab_buttons = []
        self.create_tabs()
        self.create_scroll_area()
        self.filter_products("All")

    def create_tabs(self):
        tab_frame = ctk.CTkFrame(self, fg_color="transparent", border_width=2, border_color="lightgray", height=40, corner_radius=25)
        tab_frame.pack(fill="x", padx=17, pady=(13, 5))

        for label in ["All", "Coffee", "Non-Coffee", "Food"]:
            btn = ctk.CTkButton(tab_frame, text=label, corner_radius=16, height=39,
                                font=("Unbounded", 15, "bold"), text_color="#4e2d18",
                                fg_color="transparent", hover=False,
                                command=lambda l=label: self.toggle_tab(l))
            btn.pack(side="left", padx=20, pady=2)
            self.tab_buttons.append(btn)
        
        # Set initial selected tab appearance
        self.update_tab_appearance()

    def toggle_tab(self, category):
        """Toggle to the selected tab and update appearance"""
        self.selected_tab = category
        self.update_tab_appearance()
        self.filter_products(category)

    def update_tab_appearance(self):
        """Update the appearance of tab buttons based on selected tab"""
        for btn in self.tab_buttons:
            if btn.cget("text") == self.selected_tab:
                # Selected tab - different color
                btn.configure(fg_color="#4e2d18", text_color="#f2efea")
            else:
                # Unselected tab - default color
                btn.configure(fg_color="transparent", text_color="#4e2d18")

    def create_scroll_area(self):
        self.scrollable = ctk.CTkScrollableFrame(self, fg_color="transparent", scrollbar_button_color="#bbbbbb", scrollbar_button_hover_color="#4e2d18",)
        self.scrollable.pack(fill="both", expand=True, padx=10, pady=(0, 0))
        self.product_container = self.scrollable

    def filter_products(self, category):
        self.current_tab = category
        
        self.filtered_products = [p for p in self.products if category == "All" or p["category"] == category]

        for widget in self.product_container.winfo_children():
            widget.destroy()

        row = 0
        col = 0
        max_cols = 4
        for product in self.filtered_products:
            btn = ProductButton(self.product_container,
                                product_name=product["name"],
                                product_image_path=product["image"],
                                product_type=product["type"],
                                command=self.handle_product_click)
            btn.grid(row=row, column=col, padx=5, pady=10)
            col += 1
            if col >= max_cols:
                col = 0
                row += 1

    def handle_product_click(self, name, type_):
        if self.on_product_click:
            self.on_product_click(name, type_)
