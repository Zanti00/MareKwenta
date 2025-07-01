import customtkinter as ctk
from tkinter import messagebox
import tkinter as tk
from nav_bar import Navbar
import os
from staff.staff_admin import StaffPageAdmin
from staff.staff_employee import StaffPageEmployee
import tkinter.filedialog as fd
from PIL import Image, ImageTk
from .product_controller import ProductController

class AddProductDialog:
    def __init__(self, parent, on_save=None):
        self.result = None
        self.on_save = on_save
        self.dialog = ctk.CTkToplevel(parent)
        self.dialog.title("Add Product")
        self.dialog.geometry("420x480")
        self.dialog.configure(fg_color="#f2efea")
        self.dialog.transient(parent)
        self.dialog.grab_set()
        self.dialog.update_idletasks()
        self.center_popup(parent)
        self.image_path = None
        self.category = tk.StringVar(value=None)
        self.setup_form()
        self.dialog.wait_window()

    def center_popup(self, parent):
        self.dialog.update_idletasks()
        w = 420
        h = 480
        x = parent.winfo_rootx() + (parent.winfo_width() // 2) - (w // 2)
        y = parent.winfo_rooty() + (parent.winfo_height() // 2) - (h // 2)
        self.dialog.geometry(f"{w}x{h}+{x}+{y}")

    def setup_form(self):
        self.dialog.grid_columnconfigure(0, weight=1)
        card = ctk.CTkFrame(self.dialog, fg_color="#ffffff", corner_radius=20)
        card.grid(row=0, column=0, padx=24, pady=24, sticky="nsew")
        card.grid_columnconfigure(0, weight=1)
        card_row = 0

        # Note about image (since CTK image is having issues)
        note_label = ctk.CTkLabel(card, text="(Image upload temporarily disabled)", 
                                 font=ctk.CTkFont("Inter", size=11), text_color="#666666")
        note_label.grid(row=card_row, column=0, pady=(18, 16))
        card_row += 1

        # Category selection
        cat_label = ctk.CTkLabel(card, text="Category", font=ctk.CTkFont("Unbounded", 15, "bold"), text_color="#4d2d18")
        cat_label.grid(row=card_row, column=0, sticky="w", padx=16, pady=(8, 2))
        card_row += 1
        cat_frame = ctk.CTkFrame(card, fg_color="transparent")
        cat_frame.grid(row=card_row, column=0, sticky="w", padx=16, pady=(0, 10))
        for cat in ["Coffee", "Non-Coffee", "Food"]:
            ctk.CTkRadioButton(cat_frame, text=cat, variable=self.category, value=cat, 
                             font=ctk.CTkFont("Inter", 13), text_color="#4e2d18").pack(side="left", padx=8)
        card_row += 1

        # Product name
        name_label = ctk.CTkLabel(card, text="Product Name", font=ctk.CTkFont("Unbounded", 15, "bold"), text_color="#4d2d18")
        name_label.grid(row=card_row, column=0, sticky="w", padx=16, pady=(8, 2))
        card_row += 1
        self.name_entry = ctk.CTkEntry(card, width=300, height=38, font=ctk.CTkFont("Inter", 14), 
                                      corner_radius=10, fg_color="#f7f3ee")
        self.name_entry.grid(row=card_row, column=0, padx=16, pady=(0, 10), sticky="ew")
        card_row += 1

        # Selling price
        price_label = ctk.CTkLabel(card, text="Selling Price", font=ctk.CTkFont("Unbounded", 15, "bold"), text_color="#4d2d18")
        price_label.grid(row=card_row, column=0, sticky="w", padx=16, pady=(8, 2))
        card_row += 1
        self.price_entry = ctk.CTkEntry(card, width=300, height=38, font=ctk.CTkFont("Inter", 14), 
                                       corner_radius=10, fg_color="#f7f3ee")
        self.price_entry.grid(row=card_row, column=0, padx=16, pady=(0, 10), sticky="ew")
        card_row += 1

        # Buttons
        button_frame = ctk.CTkFrame(card, fg_color="transparent")
        button_frame.grid(row=card_row, column=0, pady=18)
        save_button = ctk.CTkButton(button_frame, text="Save", width=110, height=38, 
                                   font=ctk.CTkFont("Inter", 14, "bold"), fg_color="#4e2d18", 
                                   hover_color="#3a1f0f", corner_radius=12, command=self.save_product)
        save_button.grid(row=0, column=0, padx=(0, 10))
        cancel_button = ctk.CTkButton(button_frame, text="Cancel", width=110, height=38, 
                                     font=ctk.CTkFont("Inter", 14), fg_color="#666666", 
                                     hover_color="#555555", corner_radius=12, command=self.cancel)
        cancel_button.grid(row=0, column=1)

    def save_product(self):
        name = self.name_entry.get().strip()
        price_str = self.price_entry.get().strip()
        category = self.category.get()
        
        if not name:
            messagebox.showerror("Error", "Please enter a product name")
            return
        if not category:
            messagebox.showerror("Error", "Please select a category")
            return
        try:
            price = float(price_str)
            if price <= 0:
                raise ValueError("Price must be positive")
        except ValueError:
            messagebox.showerror("Error", "Please enter a valid positive price")
            return

        # Save to database
        success = ProductController.add_product(name, price, category, None)
        if success:
            self.result = {"name": name, "price": price, "category": category, "image_path": None}
            if self.on_save:
                self.on_save(self.result)
            messagebox.showinfo("Success", f"Product '{name}' added successfully!")
            self.dialog.destroy()
        else:
            messagebox.showerror("Error", "Failed to save product to database")

    def cancel(self):
        self.dialog.destroy()

class SizeTempPopup(ctk.CTkToplevel):
    def __init__(self, parent, on_next, disabled_combinations=None):
        super().__init__(parent)
        self.title("Select Size & Temperature")
        self.geometry("300x260")
        self.configure(fg_color="#f2efea")
        self.transient(parent)
        self.grab_set()
        self.resizable(False, False)
        self.center_popup(parent)
        self.size = tk.StringVar(value=None)
        self.temp = tk.StringVar(value=None)
        self.disabled_combinations = disabled_combinations or []
        ctk.CTkLabel(self, text="Select Size", font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4e2d18").pack(pady=(18, 4))
        size_frame = ctk.CTkFrame(self, fg_color="transparent")
        size_frame.pack(pady=2)
        for s in ["Grande", "Venti"]:
            ctk.CTkRadioButton(size_frame, text=s, variable=self.size, value=s, font=ctk.CTkFont("Inter", 14), text_color="#4e2d18").pack(side="left", padx=12)
        ctk.CTkLabel(self, text="Select Temperature", font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4e2d18").pack(pady=(16, 4))
        temp_frame = ctk.CTkFrame(self, fg_color="transparent")
        temp_frame.pack(pady=2)
        for t in ["Hot", "Iced"]:
            ctk.CTkRadioButton(temp_frame, text=t, variable=self.temp, value=t, font=ctk.CTkFont("Inter", 14), text_color="#4e2d18").pack(side="left", padx=12)
        btn = ctk.CTkButton(self, text="Next", fg_color="#4e2d18", text_color="#fff", width=120, height=36, corner_radius=10, command=self._on_next)
        btn.pack(pady=18)
        self.on_next = on_next
    def center_popup(self, parent):
        self.update_idletasks()
        w, h = 300, 260
        x = parent.winfo_rootx() + (parent.winfo_width() // 2) - (w // 2)
        y = parent.winfo_rooty() + (parent.winfo_height() // 2) - (h // 2)
        self.geometry(f"{w}x{h}+{x}+{y}")
    def _on_next(self):
        if not self.size.get() or not self.temp.get():
            messagebox.showwarning("Required", "Please select both size and temperature.")
            return
        if (self.size.get(), self.temp.get()) in self.disabled_combinations:
            messagebox.showwarning("Already Linked", "This size and temperature combination is already linked.")
            return
        self.on_next(self.size.get(), self.temp.get())
        self.destroy()

class LinkIngredientFinalPopup(ctk.CTkToplevel):
    def __init__(self, parent, product_name, summary, inventory_list, on_save_link=None):
        super().__init__(parent)
        self.title("Link Ingredients")
        self.geometry("500x600")
        self.configure(fg_color="#f2efea")
        self.transient(parent)
        self.grab_set()
        self.resizable(False, False)
        self.center_popup(parent)
        self.inventory_list = inventory_list
        self.entries = []
        self.product_name = product_name
        self.summary = summary
        self.on_save_link = on_save_link
        self.grid_rowconfigure(1, weight=1)
        self.grid_columnconfigure(0, weight=1)
        ctk.CTkLabel(self, text=summary, font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4d2d18").grid(row=0, column=0, pady=(18, 10), sticky="n")
        self.entries_scroll = ctk.CTkScrollableFrame(self, fg_color="#ffffff", corner_radius=14, width=440, height=340)
        self.entries_scroll.grid(row=1, column=0, padx=18, pady=10, sticky="nsew")
        self.add_entry_row()
        plus_btn_frame = ctk.CTkFrame(self, fg_color="transparent")
        plus_btn_frame.grid(row=2, column=0, sticky="ew", padx=18)
        plus_btn = ctk.CTkButton(plus_btn_frame, text="+", width=36, height=36, font=ctk.CTkFont("Unbounded", 18, "bold"), fg_color="#4e2d18", text_color="#fff", corner_radius=18, command=self.add_entry_row)
        plus_btn.pack(side="right", pady=(8, 0))
        save_btn = ctk.CTkButton(self, text="Save", fg_color="#4e2d18", text_color="#fff", width=140, height=48, corner_radius=12, font=ctk.CTkFont("Unbounded", 16, "bold"), command=self._on_save)
        save_btn.grid(row=3, column=0, pady=18)

    def center_popup(self, parent):
        self.update_idletasks()
        w, h = 480, 420
        x = parent.winfo_rootx() + (parent.winfo_width() // 2) - (w // 2)
        y = parent.winfo_rooty() + (parent.winfo_height() // 2) - (h // 2)
        self.geometry(f"{w}x{h}+{x}+{y}")

    def add_entry_row(self):
        row = len(self.entries)
        row_frame = ctk.CTkFrame(self.entries_scroll, fg_color="transparent")
        row_frame.pack(pady=4, anchor="center")
        qty_entry = ctk.CTkEntry(row_frame, width=80, height=32, font=ctk.CTkFont("Inter", 13), placeholder_text="Qty")
        qty_entry.pack(side="left", padx=(0, 10))
        ingredient_combo = ctk.CTkOptionMenu(row_frame, values=self.inventory_list, width=180, height=32, font=ctk.CTkFont("Inter", 13),
            fg_color="#4e2d18", button_color="#4e2d18", button_hover_color="#3d2414", dropdown_fg_color="#ffffff", dropdown_text_color="#4e2d18", text_color="#ffffff", corner_radius=8)
        ingredient_combo.pack(side="left")
        ingredient_combo.set(self.inventory_list[0] if self.inventory_list else "")
        self.entries.append((qty_entry, ingredient_combo))
    def _on_save(self):
        # Collect the data and call on_save_link
        ingredients = []
        for qty_entry, ingredient_combo in self.entries:
            qty = qty_entry.get().strip()
            ingredient = ingredient_combo.get().strip()
            if qty and ingredient:
                ingredients.append((qty, ingredient))
        if self.on_save_link and ingredients:
            self.on_save_link(self.product_name, self.summary, ingredients)
        self.destroy()

class ViewLinkedIngredientsPopup(ctk.CTkToplevel):
    def __init__(self, parent, product_name, linked_data):
        super().__init__(parent)
        self.title(f"Linked Ingredients for {product_name}")
        self.geometry("500x500")
        self.configure(fg_color="#f2efea")
        self.transient(parent)
        self.grab_set()
        self.resizable(False, False)
        self.center_popup(parent)
        ctk.CTkLabel(self, text=product_name, font=ctk.CTkFont("Unbounded", 18, "bold"), text_color="#4d2d18").pack(pady=(18, 10))
        scroll = ctk.CTkScrollableFrame(self, fg_color="#ffffff", corner_radius=14, width=440, height=400)
        scroll.pack(padx=18, pady=10, fill="both", expand=True)
        if not linked_data:
            ctk.CTkLabel(scroll, text="No linked ingredients.", font=ctk.CTkFont("Inter", 14), text_color="#4e2d18").pack(pady=20)
        else:
            for group in linked_data:
                ctk.CTkLabel(scroll, text=group['summary'], font=ctk.CTkFont("Unbounded", 15, "bold"), text_color="#4d2d18").pack(anchor="w", pady=(12, 2), padx=10)
                for qty, ingredient in group['ingredients']:
                    row = f"{qty:<8} {ingredient}"
                    ctk.CTkLabel(scroll, text=row, font=ctk.CTkFont("Inter", 14), text_color="#4e2d18", anchor="w").pack(anchor="w", padx=30)
    
    def center_popup(self, parent):
        self.update_idletasks()
        w, h = 500, 500
        x = parent.winfo_rootx() + (parent.winfo_width() // 2) - (w // 2)
        y = parent.winfo_rooty() + (parent.winfo_height() // 2) - (h // 2)
        self.geometry(f"{w}x{h}+{x}+{y}")

class EditLinkedIngredientsPopup(ctk.CTkToplevel):
    def __init__(self, parent, product_name, summary, inventory_list, initial_ingredients, on_save_edit=None):
        super().__init__(parent)
        self.title("Edit Linked Ingredients")
        self.geometry("500x600")
        self.configure(fg_color="#f2efea")
        self.transient(parent)
        self.grab_set()
        self.resizable(False, False)
        self.center_popup(parent)
        self.inventory_list = inventory_list
        self.entries = []
        self.product_name = product_name
        self.summary = summary
        self.on_save_edit = on_save_edit
        self.grid_rowconfigure(1, weight=1)
        self.grid_columnconfigure(0, weight=1)
        ctk.CTkLabel(self, text=summary, font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4d2d18").grid(row=0, column=0, pady=(18, 10), sticky="n")
        self.entries_scroll = ctk.CTkScrollableFrame(self, fg_color="#ffffff", corner_radius=14, width=440, height=340)
        self.entries_scroll.grid(row=1, column=0, padx=18, pady=10, sticky="nsew")
        for qty, ingredient in initial_ingredients:
            self.add_entry_row(qty, ingredient)
        if not initial_ingredients:
            self.add_entry_row()
        plus_btn_frame = ctk.CTkFrame(self, fg_color="transparent")
        plus_btn_frame.grid(row=2, column=0, sticky="ew", padx=18)
        plus_btn = ctk.CTkButton(plus_btn_frame, text="+", width=36, height=36, font=ctk.CTkFont("Unbounded", 18, "bold"), fg_color="#4e2d18", text_color="#fff", corner_radius=18, command=self.add_entry_row)
        plus_btn.pack(side="right", pady=(8, 0))
        save_btn = ctk.CTkButton(self, text="Save", fg_color="#4e2d18", text_color="#fff", width=140, height=48, corner_radius=12, font=ctk.CTkFont("Unbounded", 16, "bold"), command=self._on_save)
        save_btn.grid(row=3, column=0, pady=18)
    def add_entry_row(self, qty_val="", ingredient_val=None):
        row_frame = ctk.CTkFrame(self.entries_scroll, fg_color="transparent")
        row_frame.pack(pady=4, anchor="center")
        qty_entry = ctk.CTkEntry(row_frame, width=80, height=32, font=ctk.CTkFont("Inter", 13), placeholder_text="Qty")
        qty_entry.pack(side="left", padx=(0, 10))
        if qty_val:
            qty_entry.insert(0, qty_val)
        ingredient_combo = ctk.CTkOptionMenu(row_frame, values=self.inventory_list, width=180, height=32, font=ctk.CTkFont("Inter", 13),
            fg_color="#4e2d18", button_color="#4e2d18", button_hover_color="#3d2414", dropdown_fg_color="#ffffff", dropdown_text_color="#4e2d18", text_color="#ffffff", corner_radius=8)
        ingredient_combo.pack(side="left")
        if ingredient_val:
            ingredient_combo.set(ingredient_val)
        else:
            ingredient_combo.set(self.inventory_list[0] if self.inventory_list else "")
        self.entries.append((qty_entry, ingredient_combo))
    def _on_save(self):
        ingredients = []
        for qty_entry, ingredient_combo in self.entries:
            qty = qty_entry.get().strip()
            ingredient = ingredient_combo.get().strip()
            if qty and ingredient:
                ingredients.append((qty, ingredient))
        if self.on_save_edit:
            self.on_save_edit(self.product_name, self.summary, ingredients)
        self.destroy()
    def center_popup(self, parent):
        self.update_idletasks()
        w, h = 500, 600
        x = parent.winfo_rootx() + (parent.winfo_width() // 2) - (w // 2)
        y = parent.winfo_rooty() + (parent.winfo_height() // 2) - (h // 2)
        self.geometry(f"{w}x{h}+{x}+{y}")

class LinkIngredientsPage:
    def __init__(self, user_role="admin"):
        self.root = ctk.CTk()
        self.root.title("MareKwenta POS")
        taskbar_height = 70
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()
        usable_height = screen_height - taskbar_height
        self.root.geometry(f"{screen_width}x{usable_height}+0+0")
        self.root.configure(fg_color="#f2efea")
        self.user_role = user_role
        ctk.set_appearance_mode("light")
        ctk.set_default_color_theme("blue")
        self.root.grid_columnconfigure(1, weight=1)
        self.root.grid_rowconfigure(0, weight=1)
        self.root.protocol("WM_DELETE_WINDOW", self.on_closing)
        self.products = []  # Will be loaded from database
        self.linked_ingredients = {}
        self.setup_ui()
        self.load_products_from_db()

    def on_closing(self):
        try:
            self.root.quit()
            self.root.destroy()
        except:
            pass

    def setup_ui(self):
        self.navbar = Navbar(self.root, width=124, user_role=self.user_role, active_tab="inventory")
        self.navbar.grid(row=0, column=0, sticky="ns", padx=(0, 0), pady=0)
        self.navbar.set_nav_callback("ticket", self.show_ticket)
        self.navbar.set_nav_callback("receipt", self.show_receipt)
        self.navbar.set_nav_callback("inventory", self.show_inventory)
        self.navbar.set_nav_callback("staff", self.show_staff)
        self.navbar.set_nav_callback("cashbox", self.show_cashbox)
        self.navbar.set_nav_callback("dashboard", self.show_dashboard)
        self.main_frame = ctk.CTkFrame(self.root, fg_color="#f2efea", width=700, corner_radius=24)
        self.main_frame.grid(row=0, column=1, sticky="nsew", padx=(0, 0), pady=20)
        self.root.grid_columnconfigure(1, weight=1)
        self.main_frame.grid_columnconfigure(0, weight=1)
        self.setup_header()
        self.setup_navigation()
        self.setup_product_list()
        self.setup_fab()

    def setup_header(self):
        header_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        header_frame.grid(row=0, column=0, sticky="w", pady=(10, 5))
        header_label = ctk.CTkLabel(
            header_frame,
            text="Link Ingredient",
            font=ctk.CTkFont("Unbounded", size=36, weight="bold"),
            text_color="#4d2d18"
        )
        header_label.grid(row=0, column=0, sticky="w")

    def setup_navigation(self):
        nav_frame = ctk.CTkFrame(self.main_frame, fg_color="#f2efea")
        nav_frame.grid(row=1, column=0, sticky="ew", pady=(0, 15))
        nav_frame.grid_columnconfigure(0, weight=1)
        nav_container = ctk.CTkFrame(nav_frame, fg_color="transparent")
        nav_container.grid(row=0, column=0, pady=0)
        # Inventory tab as button
        inventory_tab = ctk.CTkButton(
            nav_container,
            text="Inventory",
            font=ctk.CTkFont("Unbounded", size=28, weight="bold"),
            text_color="#4e2d18",
            fg_color="transparent",
            hover_color="#e0e0e0",
            corner_radius=8,
            command=self.show_inventory
        )
        inventory_tab.grid(row=0, column=0)
        # Link Ingredients tab (active)
        link_ingredients_tab_frame = ctk.CTkFrame(nav_container, fg_color="transparent")
        link_ingredients_tab_frame.grid(row=0, column=1, padx=(60, 0))
        link_ingredients_tab = ctk.CTkLabel(
            link_ingredients_tab_frame,
            text="Link Ingredient",
            font=ctk.CTkFont("Unbounded", size=28, weight="bold"),
            text_color="#4e2d18"
        )
        link_ingredients_tab.pack()
        separator = ctk.CTkFrame(link_ingredients_tab_frame, width=270, height=4, fg_color="#4e2d18")
        separator.pack(pady=(2, 0))

    def setup_product_list(self):
        if hasattr(self, 'list_frame'):
            self.list_frame.destroy()
        self.list_frame = ctk.CTkFrame(self.main_frame, fg_color="#f2efea", corner_radius=16)
        self.list_frame.grid(row=2, column=0, sticky="nsew", padx=0, pady=(0, 20))
        self.list_frame.grid_columnconfigure(0, weight=1)
        self.main_frame.grid_rowconfigure(2, weight=1)
        
        self.scrollable = ctk.CTkScrollableFrame(self.list_frame, fg_color="#f2efea", height=500, width=950)
        self.scrollable.grid(row=0, column=0, sticky="n", pady=(20, 20))
        self.scrollable.grid_columnconfigure(0, weight=1)
        self.refresh_product_list()

    def refresh_product_list(self):
        for widget in self.scrollable.winfo_children():
            widget.destroy()
            
        if not self.products:
            # Show message when no products
            no_products_label = ctk.CTkLabel(
                self.scrollable,
                text="No products found. Click the + button to add a product.",
                font=ctk.CTkFont("Inter", size=16),
                text_color="#666666"
            )
            no_products_label.grid(row=0, column=0, pady=50)
            return
            
        for idx, product in enumerate(self.products):
            container = ctk.CTkFrame(self.scrollable, fg_color="#ffffff", corner_radius=16)
            container.grid(row=idx, column=0, sticky="ew", pady=8, padx=10)
            container.grid_columnconfigure(0, weight=1)
            container.grid_rowconfigure(0, minsize=100)
            
            # Product info frame
            info_frame = ctk.CTkFrame(container, fg_color="transparent")
            info_frame.grid(row=0, column=0, sticky="w", padx=(20, 10), pady=10)
            
            name_label = ctk.CTkLabel(
                info_frame,
                text=product["name"],
                font=ctk.CTkFont("Unbounded", size=16, weight="bold"),
                text_color="#4e2d18"
            )
            name_label.grid(row=0, column=0, sticky="w")
            
            # Category and price info
            details_label = ctk.CTkLabel(
                info_frame,
                text=f"{product['category']} • ₱{product['selling_price']:.2f}",
                font=ctk.CTkFont("Inter", size=12),
                text_color="#666666"
            )
            details_label.grid(row=1, column=0, sticky="w", pady=(2, 0))
            
            action_combo = ctk.CTkOptionMenu(
                container,
                values=["Link Ingredients", "View", "Edit", "Delete"],
                font=ctk.CTkFont("Inter", size=14, weight="bold"),
                fg_color="#4e2d18",
                button_color="#4e2d18",
                button_hover_color="#3d2414",
                dropdown_fg_color="#ffffff",
                dropdown_text_color="#4e2d18",
                text_color="#ffffff",
                width=120,
                height=36,
                corner_radius=8,
                command=lambda action, p=product: self.handle_action(p, action)
            )
            action_combo.set("Action")
            action_combo.grid(row=0, column=1, padx=(10, 20), pady=0)

    def load_products_from_db(self):
        """Load products from database"""
        try:
            self.products = ProductController.get_all_products()
            self.refresh_product_list()
        except Exception as e:
            print(f"Error loading products: {e}")
            messagebox.showerror("Error", f"Failed to load products: {e}")

    def setup_fab(self):
        # Floating Action Button (FAB) with a plus sign
        self.fab = ctk.CTkButton(
            self.root,
            text="+",
            font=ctk.CTkFont("Unbounded", size=36, weight="bold"),
            fg_color="#4e2d18",
            hover_color="#3d2414",
            text_color="#ffffff",
            width=40,
            height=40,
            corner_radius=20,
            command=self.on_fab_click
        )
        # Place at bottom right, above padding
        self.fab.place(relx=0.97, rely=0.96, anchor="se")

    def on_fab_click(self):
        def on_save(product):
            self.load_products_from_db()  # Reload from database
        AddProductDialog(self.root, on_save=on_save)

    def handle_action(self, product, action):
        if action == "Link Ingredients":
            category = product.get("category", "")
            if category in ["Coffee", "Non-Coffee"]:
                linked_data = self.linked_ingredients.get(product['name'], [])
                disabled_combos = []
                for group in linked_data:
                    parts = group['summary'].split()
                    if len(parts) >= 4:
                        size = parts[-2]
                        temp = parts[-1]
                        disabled_combos.append((size, temp))
                def after_size_temp(size, temp):
                    summary = f"{product['name']} | {category} {size} {temp}"
                    inventory_list = ["Milk", "Sugar", "Espresso"]
                    LinkIngredientFinalPopup(self.root, product['name'], summary, inventory_list, on_save_link=self.save_linked_ingredients)
                SizeTempPopup(self.root, after_size_temp, disabled_combinations=disabled_combos)
            else:
                summary = f"{product['name']} | {category}"
                inventory_list = ["Milk", "Sugar", "Espresso"]
                LinkIngredientFinalPopup(self.root, product['name'], summary, inventory_list, on_save_link=self.save_linked_ingredients)
        elif action == "View":
            linked_data = self.linked_ingredients.get(product['name'], [])
            ViewLinkedIngredientsPopup(self.root, product['name'], linked_data)
        elif action == "Edit":
            # TODO: Implement edit product functionality
            messagebox.showinfo("Edit", f"Edit functionality for '{product['name']}' will be implemented next")
        elif action == "Delete":
            result = messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete '{product['name']}'?")
            if result:
                success = ProductController.delete_product_by_id(product['product_id'])
                if success:
                    self.load_products_from_db()
                    messagebox.showinfo("Success", "Product deleted successfully!")
                else:
                    messagebox.showerror("Error", "Failed to delete product from database")

    def show_inventory(self):
        self.root.destroy()
        from .inventory_page import InventoryManagement
        InventoryManagement(user_role=self.user_role).run()

    def show_staff(self):
        self.root.destroy()
        if self.user_role == "admin":
            StaffPageAdmin(user_role="admin").run()
        else:
            StaffPageEmployee(user_role="employee").run()

    def show_receipt(self):
        from receipt.sales_history import SalesHistoryMain
        self.root.destroy()
        SalesHistoryMain(user_role=self.user_role).mainloop()

    def show_cashbox(self):
        self.root.destroy()
        from cash_box.cashbox_page import CashBoxApp
        CashBoxApp(user_role=self.user_role).mainloop()

    def show_ticket(self):
        from ticket.ticket_main import TicketMainPage
        self.root.destroy()
        TicketMainPage(user_role=self.user_role).mainloop()

    def show_dashboard(self):
        from dashboard.sales_dashboard import SalesDashboard
        self.root.destroy()
        SalesDashboard(user_role=self.user_role).mainloop()

    def run(self):
        try:
            self.root.mainloop()
        except Exception as e:
            print(f"Error running LinkIngredientsPage: {e}")
            messagebox.showerror("Fatal Error", f"Application failed to start: {e}")
        finally:
            try:
                self.root.destroy()
            except:
                pass
    
    def mainloop(self):
        self.root.mainloop()

    def save_linked_ingredients(self, product_name, summary, ingredients):
        if product_name not in self.linked_ingredients:
            self.linked_ingredients[product_name] = []
        self.linked_ingredients[product_name].append({
            'summary': summary,
            'ingredients': ingredients
        })