import customtkinter as ctk
from PIL import Image, ImageTk
import os

class ProductButton(ctk.CTkFrame):
    def __init__(self, master, product_name="Product Name", product_image_path="", product_type="", command=None):
        super().__init__(master, width=173, height=213, corner_radius=16, fg_color="#ffffff")
        self.product_name = product_name
        self.product_image_path = product_image_path
        self.product_type = product_type
        self.command = command

        self.configure(border_width=1, border_color="#E0E0E0")
        self.bind("<Button-1>", self._on_click)

        self.create_widgets()

    def create_widgets(self):
        # Load image if valid
        image_label = ctk.CTkLabel(self, text="")
        image_label.place(relx=0.5, rely=0.40, anchor="center")

        if self.product_image_path and os.path.exists(self.product_image_path):
            image = Image.open(self.product_image_path)
            image = image.resize((int(self.winfo_reqwidth() * 0.9), int(self.winfo_reqheight() * 0.7)))
            self.tk_image = ImageTk.PhotoImage(image)
            image_label.configure(image=self.tk_image)

        # Product name label
        name_label = ctk.CTkLabel(self, text=self.product_name, text_color="#4e2d18",
                                  font=("Poppins", 15, "bold"), wraplength=150,
                                  anchor="nw", justify="left"
                                  , width=153, height=40)
        name_label.place(x=10, y=170)

        # Bind click events to child widgets to ensure clicks work everywhere
        image_label.bind("<Button-1>", self._on_click)
        name_label.bind("<Button-1>", self._on_click)

    def _on_click(self, event):
        print(f"ProductButton clicked: {self.product_name}")  # Debug print
        if self.command:
            self.command(self.product_name, self.product_type)
