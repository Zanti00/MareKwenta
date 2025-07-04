import customtkinter as ctk
from PIL import Image
from PIL import ImageTk
from customtkinter import CTkImage
import os

class ProductButton(ctk.CTkFrame):
    def __init__(self, master, product_name="Product Name", product_image_path="", product_type="", price_display="", has_variants=False, command=None):
        super().__init__(master, width=173, corner_radius=16, fg_color="#ffffff")
        self.grid_propagate(True)  # Allow dynamic height
        self.configure(height=213)  # Set minimum height
        self.product_name = product_name
        self.product_image_path = product_image_path
        self.product_type = product_type
        self.price_display = price_display
        self.has_variants = has_variants
        self.command = command

        self.configure(border_width=1, border_color="#E0E0E0")
        self.bind("<Button-1>", self._on_click)

        self.create_widgets()

    def create_widgets(self):   
        # Load image if valid
        image_label = ctk.CTkLabel(self, text="")
        image_label.place(relx=0.5, rely=0.35, anchor="center")

        if self.product_image_path and os.path.exists(self.product_image_path):
            try:
                image = Image.open(self.product_image_path)
                image = image.resize((120, 120), Image.Resampling.LANCZOS)
                self.tk_image = ImageTk.PhotoImage(image)
                image_label.configure(image=self.tk_image)
            except Exception as e:
                print(f"Error loading image {self.product_image_path}: {e}")
                image_label.configure(text="No Image", font=ctk.CTkFont("Inter", 12), text_color="#666666")
        else:
            image_label.configure(text="No Image", font=ctk.CTkFont("Inter", 12), text_color="#666666")

        # Product name label
        name_label = ctk.CTkLabel(self, text=self.product_name, text_color="#4e2d18",
                                  font=("Unbounded", 14, "bold"), wraplength=150,
                                  anchor="center", justify="center")
        name_label.place(relx=0.5, rely=0.75, anchor="center")

        # Price display
        if "No pricing set" in self.price_display:
            price_color = "#999999"
        else:
            price_color = "#4e2d18"

        price_label = ctk.CTkLabel(self, text=self.price_display,
                                 font=ctk.CTkFont("Inter", 12, "bold"),
                                 text_color=price_color)
        price_label.place(relx=0.5, rely=0.88, anchor="center")

        # Bind click events to child widgets to ensure clicks work everywhere
        image_label.bind("<Button-1>", self._on_click)
        name_label.bind("<Button-1>", self._on_click)
        price_label.bind("<Button-1>", self._on_click)

    def _on_click(self, event=None):
        print(f"ProductButton clicked: {self.product_name}")  # Debug print
        if self.command and "No pricing set" not in self.price_display:
            self.command()
