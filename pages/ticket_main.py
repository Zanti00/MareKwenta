import customtkinter as ctk
from product_panel import ProductPanel
from ticket_panel import TicketPanel
from components.mofifier_popup import ModifierPopup

class TicketMainPage(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.geometry("1400x1024")
        self.title("MareKwenta POS")
        self.configure(fg_color="#f2efea")

        # === MAIN WRAPPER FRAME ===
        main_frame = ctk.CTkFrame(self, fg_color="transparent")
        main_frame.pack(fill="both", expand=True)

        # === LEFT COLUMN (Header + Product Panel) ===
        left_column = ctk.CTkFrame(main_frame, fg_color="transparent")
        left_column.pack(side="left", fill="both", expand=True, padx=(40, 20), pady=30)

        # === HEADER ===
        header_frame = ctk.CTkFrame(left_column, fg_color="transparent")
        header_frame.pack(fill="x", pady=(0, 10))

        hello_label = ctk.CTkLabel(header_frame, text="Hello,", font=("Unbounded", 36), text_color="#4e2d18")
        hello_label.pack(side="left")

        self.user_label = ctk.CTkLabel(header_frame, text="User", font=("Unbounded", 36), text_color="#4e2d18")
        self.user_label.pack(side="left", padx=(10, 0))

        # === PRODUCT PANEL ===
        self.product_panel = ProductPanel(left_column, on_product_click=self.handle_product_click)
        self.product_panel.pack(fill="both", expand=True)

        # === RIGHT PANEL ===
        self.ticket_panel = TicketPanel(main_frame, on_split_popup=self.handle_split_popup)
        self.ticket_panel.pack(side="right", fill="y")

    def handle_product_click(self, product_name, product_type):
        print(f"Clicked: {product_name} ({product_type})")
        # Open modifier popup when product is clicked
        ModifierPopup(self, product_name=product_name, product_type=product_type, on_submit=self.handle_modifier_submit)

    def handle_modifier_submit(self, product_name, quantity, size, temperature, extras):
        print(f"Adding to cart: {product_name} - Qty: {quantity}, Size: {size}, Temp: {temperature}, Extras: {extras}")
        # TODO: Add the item to the cart in ticket_panel
        # self.ticket_panel.add_item_detail(product_name, quantity, size, temperature, extras, price)

    def handle_split_popup(self, total):
        self.ticket_panel.open_split_popup(total)

if __name__ == "__main__":
    app = TicketMainPage()
    app.mainloop()
