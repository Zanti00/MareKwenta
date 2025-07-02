import customtkinter as ctk
import os
from .components.product_btn import ProductButton
from PIL import Image
import sys

# Add the inventory module to the path
sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'inventory'))
from inventory.product_controller import ProductController

class ProductPanel(ctk.CTkFrame):
    def __init__(self, master, on_product_click=None, *args, **kwargs):
        super().__init__(master,*args, **kwargs, width=950, height=938, fg_color="#f2efea")

        self.on_product_click = on_product_click
        self.current_tab = "All"
        self.selected_tab = "All"  

        # Load products from database
        self.products = []
        self.load_products_from_db()
        
        self.filtered_products = []

        self.tab_buttons = []
        self.create_tabs()
        self.create_scroll_area()
        self.filter_products("All")

    def load_products_from_db(self):
        """Load products from the database grouped by product, not by variant"""
        try:
            db_products = ProductController.get_all_products()
            self.products = []
            
            for product in db_products:
                # Get all product types for this product to check if it has pricing
                product_types = ProductController.get_product_types_by_product_id(product['product_id'])
                
                if product_types:
                    # Product has variants with pricing - show as single product
                    # Calculate price range for display
                    prices = [ptype['selling_price'] for ptype in product_types if ptype['selling_price'] > 0]
                    if prices:
                        min_price = min(prices)
                        max_price = max(prices)
                        if min_price == max_price:
                            price_display = f"₱{min_price:.2f}"
                        else:
                            price_display = f"₱{min_price:.2f} - ₱{max_price:.2f}"
                    else:
                        price_display = "No pricing set"
                        
                    self.products.append({
                        "name": product['name'],
                        "image": product.get('image', 'default.png'),
                        "category": product['category'],
                        "type": product['category'],
                        "price_display": price_display,
                        "has_variants": len(product_types) > 1 or (product['category'] in ["Coffee", "Non-Coffee"]),
                        "product_id": product['product_id'],
                        "product_types": product_types
                    })
                else:
                    # Product with no types yet - show as unavailable
                    self.products.append({
                        "name": product['name'],
                        "image": product.get('image', 'default.png'),
                        "category": product['category'],
                        "type": product['category'],
                        "price_display": "No pricing set",
                        "has_variants": False,
                        "product_id": product['product_id'],
                        "product_types": []
                    })
                    
        except Exception as e:
            print(f"Error loading products from database: {e}")
            self.products = []

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
            # Use default image if product image is not available
            image_filename = product.get("image", "default.png")
            if not image_filename or image_filename == "":
                image_filename = "default.png"
                
            image_path = os.path.join(os.path.dirname(__file__), "..", "assets", image_filename)
            
            # Create product button with price range display
            btn = ProductButton(self.product_container,
                                product_name=product["name"],
                                product_image_path=image_path,
                                product_type=product["type"],
                                price_display=product["price_display"],
                                has_variants=product["has_variants"],
                                command=lambda p=product: self.handle_product_click(p))
            btn.grid(row=row, column=col, padx=5, pady=10)
            col += 1
            if col >= max_cols:
                col = 0
                row += 1

    def handle_product_click(self, product):
        """Handle product click - show modifier popup for beverages, quantity popup for food"""
        if not product["product_types"]:
            # No pricing available
            return
        
        # Check inventory availability before allowing selection
        try:
            # Import here to avoid circular imports
            import sys
            import os
            sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'inventory'))
            from inventory.recipe_controller import RecipeController
            
            # Create a test cart item to check inventory
            test_item = {
                "product_type_id": product["product_types"][0]["product_type_id"],
                "quantity": 1
            }
            
            has_enough, error_msg = RecipeController.check_inventory_availability([test_item])
            if not has_enough:
                messagebox.showwarning("Low Inventory", f"Warning: {error_msg}\n\nYou can still proceed, but check inventory levels.")
        except Exception as e:
            print(f"Error checking inventory: {e}")
            # Continue anyway if inventory check fails
            
        if product["category"] in ["Coffee", "Non-Coffee"]:
            # Show modifier popup for beverages
            self.show_modifier_popup(product)
        else:
            # Food item - show quantity selection popup
            food_type = product["product_types"][0]  # Food should have only one type
            if food_type and food_type['selling_price'] > 0:
                self.show_food_quantity_popup(product, food_type)

    def show_food_quantity_popup(self, product, food_type):
        """Show quantity selection popup for food items"""
        from .components.food_quantity_popup import FoodQuantityPopup
        
        def on_food_submit(product_name, quantity):
            cart_item = {
                "name": product_name,
                "quantity": quantity,
                "size": "",
                "temperature": "",
                "extras": [],
                "extras_cost": 0,
                "unit_price": food_type['selling_price'],
                "product_type_id": food_type['product_type_id']
            }
            if self.on_product_click:
                self.on_product_click(cart_item)
        
        FoodQuantityPopup(
            self.master,
            product_name=product["name"],
            on_submit=on_food_submit
        )

    def show_modifier_popup(self, product):
        """Show modifier popup for beverage selection"""
        from .components.modifier_popup import ModifierPopup
        
        def on_modifier_submit(product_name, quantity, size, temperature, extras):
            # Find the matching product type based on size and temperature
            selected_type = None
            for ptype in product["product_types"]:
                if ptype['size'] == size and ptype['temperature'] == temperature:
                    selected_type = ptype
                    break
            
            if selected_type:
                # Calculate extras pricing
                extra_shots = extras.get("extra_shots", 0)
                whip_cream = extras.get("whip_cream", 0)
                extras_cost = (extra_shots * 15) + (whip_cream * 5)
                
                # Format extras for display
                extras_list = []
                if extra_shots > 0:
                    extras_list.append(f"Extra Shot x{extra_shots}")
                if whip_cream > 0:
                    extras_list.append(f"Whip Cream x{whip_cream}")
                
                cart_item = {
                    "name": product_name,
                    "quantity": quantity,
                    "size": size,
                    "temperature": temperature,
                    "extras": extras_list,
                    "extras_cost": extras_cost,
                    "unit_price": selected_type['selling_price'],
                    "product_type_id": selected_type['product_type_id']
                }
                if self.on_product_click:
                    self.on_product_click(cart_item)
        
        ModifierPopup(
            self.master, 
            product_name=product["name"],
            product_type=product["type"],
            product_types=product["product_types"],
            on_submit=on_modifier_submit
        )

    def refresh_products(self):
        """Refresh the product list from database"""
        self.load_products_from_db()
        self.filter_products(self.current_tab)
