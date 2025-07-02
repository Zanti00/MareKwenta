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
from .inventory_controller import InventoryController
from .recipe_controller import RecipeController

class AddProductDialog:
    def __init__(self, parent, on_save=None):
        self.result = None
        self.on_save = on_save
        self.dialog = ctk.CTkToplevel(parent)
        self.dialog.title("Add Product")
        self.dialog.geometry("420x400")  # Reduced height since removing price field
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
        h = 400  # Updated height
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

        # Buttons
        button_frame = ctk.CTkFrame(card, fg_color="transparent")
        button_frame.grid(row=card_row, column=0, pady=18)
        save_button = ctk.CTkButton(button_frame, text="Save", width=110, height=38, 
                                   font=ctk.CTkFont("Inter", 14, "bold"), fg_color="#4e2d18", 
                                   hover_color="#3a1f0d", corner_radius=12, command=self.save_product)
        save_button.grid(row=0, column=0, padx=(0, 10))
        cancel_button = ctk.CTkButton(button_frame, text="Cancel", width=110, height=38, 
                                     font=ctk.CTkFont("Inter", 14), fg_color="#666666", 
                                     hover_color="#555555", corner_radius=12, command=self.cancel)
        cancel_button.grid(row=0, column=1)

    def save_product(self):
        name = self.name_entry.get().strip()
        category = self.category.get()
        
        if not name:
            messagebox.showerror("Error", "Please enter a product name")
            return
        if not category:
            messagebox.showerror("Error", "Please select a category")
            return

        # Save to database without price
        success = ProductController.add_product(name, 0, category, None)  # Pass 0 as dummy price
        if success:
            self.result = {"name": name, "category": category, "image_path": None}
            if self.on_save:
                self.on_save(self.result)
            messagebox.showinfo("Success", f"Product '{name}' added successfully!")
            self.dialog.destroy()
        else:
            messagebox.showerror("Error", "Failed to save product to database")

    def cancel(self):
        self.dialog.destroy()

class SizeTempPopup(ctk.CTkToplevel):
    def __init__(self, parent, product, on_next, disabled_combinations=None):
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
        self.product = product
        self.disabled_combinations = disabled_combinations or []
        self.on_next = on_next
        
        ctk.CTkLabel(self, text="Select Size", font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4e2d18").pack(pady=(18, 4))
        size_frame = ctk.CTkFrame(self, fg_color="transparent")
        size_frame.pack(pady=2)
        for s in ["Grande", "Venti"]:  # Grande first, then Venti
            ctk.CTkRadioButton(size_frame, text=s, variable=self.size, value=s, font=ctk.CTkFont("Inter", 14), text_color="#4e2d18").pack(side="left", padx=12)
        
        ctk.CTkLabel(self, text="Select Temperature", font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4e2d18").pack(pady=(16, 4))
        temp_frame = ctk.CTkFrame(self, fg_color="transparent")
        temp_frame.pack(pady=2)
        for t in ["Hot", "Iced"]:  # Hot first, then Iced
            ctk.CTkRadioButton(temp_frame, text=t, variable=self.temp, value=t, font=ctk.CTkFont("Inter", 14), text_color="#4e2d18").pack(side="left", padx=12)
        
        btn = ctk.CTkButton(self, text="Next", fg_color="#4e2d18", text_color="#fff", width=120, height=36, corner_radius=10, command=self._on_next)
        btn.pack(pady=18)

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
            
        # Check if this combination already exists in database
        existing_types = ProductController.get_product_types_by_product_id(self.product['product_id'])
        for ptype in existing_types:
            if ptype['size'] == self.size.get() and ptype['temperature'] == self.temp.get():
                messagebox.showwarning("Already Exists", "This size and temperature combination already exists.")
                return
                
        self.on_next(self.size.get(), self.temp.get())
        self.destroy()

class LinkIngredientFinalPopup(ctk.CTkToplevel):
    def __init__(self, parent, product, size=None, temperature=None, on_save_link=None):
        super().__init__(parent)
        self.title("Link Ingredients")
        self.geometry("500x700")  # Increased height for price fields
        self.configure(fg_color="#f2efea")
        self.transient(parent)
        self.grab_set()
        self.resizable(False, False)
        self.center_popup(parent)
        self.product = product
        self.size = size
        self.temperature = temperature
        self.entries = []
        self.on_save_link = on_save_link
        self.grid_rowconfigure(1, weight=1)
        self.grid_columnconfigure(0, weight=1)
        
        # Load inventory from database
        self.inventory_list = self.load_inventory()
        
        # Create summary text
        if size and temperature:
            summary = f"{product['name']} | {product['category']} {size} {temperature}"
        else:
            summary = f"{product['name']} | {product['category']}"
            
        ctk.CTkLabel(self, text=summary, font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4d2d18").grid(row=0, column=0, pady=(18, 10), sticky="n")
        
        # Price fields
        price_frame = ctk.CTkFrame(self, fg_color="#ffffff", corner_radius=14)
        price_frame.grid(row=1, column=0, padx=18, pady=(0, 10), sticky="ew")
        price_frame.grid_columnconfigure(0, weight=1)
        price_frame.grid_columnconfigure(1, weight=1)
        
        # Unit Price
        unit_price_label = ctk.CTkLabel(price_frame, text="Unit Price (Cost)", font=ctk.CTkFont("Inter", 14, "bold"), text_color="#4d2d18")
        unit_price_label.grid(row=0, column=0, padx=10, pady=(10, 5), sticky="w")
        self.unit_price_entry = ctk.CTkEntry(price_frame, width=150, height=32, font=ctk.CTkFont("Inter", 13), 
                                           placeholder_text="0.00", corner_radius=8, fg_color="#f7f3ee")
        self.unit_price_entry.grid(row=1, column=0, padx=10, pady=(0, 10), sticky="ew")
        
        # Selling Price
        selling_price_label = ctk.CTkLabel(price_frame, text="Selling Price", font=ctk.CTkFont("Inter", 14, "bold"), text_color="#4d2d18")
        selling_price_label.grid(row=0, column=1, padx=10, pady=(10, 5), sticky="w")
        self.selling_price_entry = ctk.CTkEntry(price_frame, width=150, height=32, font=ctk.CTkFont("Inter", 13), 
                                              placeholder_text="0.00", corner_radius=8, fg_color="#f7f3ee")
        self.selling_price_entry.grid(row=1, column=1, padx=10, pady=(0, 10), sticky="ew")
        
        self.entries_scroll = ctk.CTkScrollableFrame(self, fg_color="#ffffff", corner_radius=14, width=440, height=300)
        self.entries_scroll.grid(row=2, column=0, padx=18, pady=10, sticky="nsew")
        self.add_entry_row()
        plus_btn_frame = ctk.CTkFrame(self, fg_color="transparent")
        plus_btn_frame.grid(row=3, column=0, sticky="ew", padx=18)
        plus_btn = ctk.CTkButton(plus_btn_frame, text="+", width=36, height=36, font=ctk.CTkFont("Unbounded", 18, "bold"), fg_color="#4e2d18", text_color="#fff", corner_radius=18, command=self.add_entry_row)
        plus_btn.pack(side="right", pady=(8, 0))
        save_btn = ctk.CTkButton(self, text="Save", fg_color="#4e2d18", text_color="#fff", width=140, height=48, corner_radius=12, font=ctk.CTkFont("Unbounded", 16, "bold"), command=self._on_save)
        save_btn.grid(row=4, column=0, pady=18)

    def center_popup(self, parent):
        self.update_idletasks()
        w, h = 500, 700
        x = parent.winfo_rootx() + (parent.winfo_width() // 2) - (w // 2)
        y = parent.winfo_rooty() + (parent.winfo_height() // 2) - (h // 2)
        self.geometry(f"{w}x{h}+{x}+{y}")

    def load_inventory(self):
        """Load inventory names from database"""
        try:
            inventory_data = InventoryController.get_all_inventory()
            return [item['ingredient'] for item in inventory_data] if inventory_data else ["No ingredients available"]
        except Exception as e:
            print(f"Error loading inventory: {e}")
            return ["Error loading inventory"]

    def add_entry_row(self):
        row_frame = ctk.CTkFrame(self.entries_scroll, fg_color="transparent")
        row_frame.pack(pady=4, anchor="center")
        
        qty_entry = ctk.CTkEntry(row_frame, width=80, height=32, font=ctk.CTkFont("Inter", 13), placeholder_text="Qty")
        qty_entry.pack(side="left", padx=(0, 10))
        
        # Add 'Choose Ingredient' as the first option
        values = ["Choose Ingredient"] + self.inventory_list if self.inventory_list else ["Choose Ingredient"]
        ingredient_combo = ctk.CTkOptionMenu(row_frame, values=values, width=180, height=32, font=ctk.CTkFont("Inter", 13),
            fg_color="#4e2d18", button_color="#4e2d18", button_hover_color="#3d2414", dropdown_fg_color="#ffffff", dropdown_text_color="#4e2d18", text_color="#ffffff", corner_radius=8)
        ingredient_combo.pack(side="left", padx=(0, 10))
        ingredient_combo.set("Choose Ingredient")
        
        # Add X button to remove row
        remove_btn = ctk.CTkButton(row_frame, text="✕", width=30, height=30, font=ctk.CTkFont("Inter", 14, "bold"), 
                                  fg_color="#dc3545", hover_color="#c82333", corner_radius=15,
                                  command=lambda: self.remove_entry_row(row_frame, qty_entry, ingredient_combo))
        remove_btn.pack(side="left")
        
        self.entries.append((qty_entry, ingredient_combo))

    def remove_entry_row(self, row_frame, qty_entry, ingredient_combo):
        """Remove an ingredient row"""
        if len(self.entries) > 1:  # Keep at least one row
            row_frame.destroy()
            self.entries.remove((qty_entry, ingredient_combo))
        else:
            messagebox.showwarning("Cannot Remove", "At least one ingredient must remain.")

    def _on_save(self):
        # Validate price fields
        unit_price_str = self.unit_price_entry.get().strip()
        selling_price_str = self.selling_price_entry.get().strip()
        
        if not unit_price_str:
            messagebox.showerror("Error", "Please enter unit price")
            return
        if not selling_price_str:
            messagebox.showerror("Error", "Please enter selling price")
            return
            
        try:
            unit_price = float(unit_price_str)
            selling_price = float(selling_price_str)
            if unit_price < 0 or selling_price < 0:
                raise ValueError("Prices must be positive")
        except ValueError:
            messagebox.showerror("Error", "Please enter valid positive prices")
            return
        
        ingredients = []
        used_ingredients = set()
        
        for qty_entry, ingredient_combo in self.entries:
            qty = qty_entry.get().strip()
            ingredient = ingredient_combo.get().strip()
            
            if qty and ingredient:
                # Validate quantity is numeric
                try:
                    float(qty)
                except ValueError:
                    messagebox.showerror("Error", f"Invalid quantity: {qty}")
                    return
                
                # Check for duplicate ingredients
                if ingredient in used_ingredients:
                    messagebox.showerror("Duplicate Ingredient", f"Ingredient '{ingredient}' is already added. Please remove duplicates.")
                    return
                
                used_ingredients.add(ingredient)
                ingredients.append((qty, ingredient))
        
        if not ingredients:
            messagebox.showwarning("No Ingredients", "Please add at least one ingredient with quantity.")
            return
            
        if self.on_save_link:
            self.on_save_link(self.product, self.size, self.temperature, ingredients, unit_price, selling_price)
        self.destroy()

class EditLinkedIngredientsPopup(ctk.CTkToplevel):
    def __init__(self, parent, product_name, summary, inventory_list, initial_ingredients, product_type_data, on_save_edit=None):
        super().__init__(parent)
        self.title("Edit Linked Ingredients")
        self.geometry("500x700")  # Increased height for price fields
        self.configure(fg_color="#f2efea")
        self.transient(parent)
        self.grab_set()
        self.resizable(False, False)
        self.center_popup(parent)
        self.inventory_list = inventory_list
        self.entries = []
        self.product_name = product_name
        self.summary = summary
        self.product_type_data = product_type_data
        self.on_save_edit = on_save_edit
        self.grid_rowconfigure(1, weight=1)
        self.grid_columnconfigure(0, weight=1)
        
        ctk.CTkLabel(self, text=summary, font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4d2d18").grid(row=0, column=0, pady=(18, 10), sticky="n")
        
        # Price fields
        price_frame = ctk.CTkFrame(self, fg_color="#ffffff", corner_radius=14)
        price_frame.grid(row=1, column=0, padx=18, pady=(0, 10), sticky="ew")
        price_frame.grid_columnconfigure(0, weight=1)
        price_frame.grid_columnconfigure(1, weight=1)
        
        # Unit Price
        unit_price_label = ctk.CTkLabel(price_frame, text="Unit Price (Cost)", font=ctk.CTkFont("Inter", 14, "bold"), text_color="#4d2d18")
        unit_price_label.grid(row=0, column=0, padx=10, pady=(10, 5), sticky="w")
        self.unit_price_entry = ctk.CTkEntry(price_frame, width=150, height=32, font=ctk.CTkFont("Inter", 13), 
                                           placeholder_text="0.00", corner_radius=8, fg_color="#f7f3ee")
        self.unit_price_entry.grid(row=1, column=0, padx=10, pady=(0, 10), sticky="ew")
        self.unit_price_entry.insert(0, str(product_type_data.get('unit_price', 0)))
        
        # Selling Price
        selling_price_label = ctk.CTkLabel(price_frame, text="Selling Price", font=ctk.CTkFont("Inter", 14, "bold"), text_color="#4d2d18")
        selling_price_label.grid(row=0, column=1, padx=10, pady=(10, 5), sticky="w")
        self.selling_price_entry = ctk.CTkEntry(price_frame, width=150, height=32, font=ctk.CTkFont("Inter", 13), 
                                              placeholder_text="0.00", corner_radius=8, fg_color="#f7f3ee")
        self.selling_price_entry.grid(row=1, column=1, padx=10, pady=(0, 10), sticky="ew")
        self.selling_price_entry.insert(0, str(product_type_data.get('selling_price', 0)))
        
        self.entries_scroll = ctk.CTkScrollableFrame(self, fg_color="#ffffff", corner_radius=14, width=440, height=300)
        self.entries_scroll.grid(row=2, column=0, padx=18, pady=10, sticky="nsew")
        
        for qty, ingredient in initial_ingredients:
            self.add_entry_row(qty, ingredient)
        if not initial_ingredients:
            self.add_entry_row()
            
        plus_btn_frame = ctk.CTkFrame(self, fg_color="transparent")
        plus_btn_frame.grid(row=3, column=0, sticky="ew", padx=18)
        plus_btn = ctk.CTkButton(plus_btn_frame, text="+", width=36, height=36, font=ctk.CTkFont("Unbounded", 18, "bold"), fg_color="#4e2d18", text_color="#fff", corner_radius=18, command=self.add_entry_row)
        plus_btn.pack(side="right", pady=(8, 0))
        save_btn = ctk.CTkButton(self, text="Save", fg_color="#4e2d18", text_color="#fff", width=140, height=48, corner_radius=12, font=ctk.CTkFont("Unbounded", 16, "bold"), command=self._on_save)
        save_btn.grid(row=4, column=0, pady=18)

    def center_popup(self, parent):
        self.update_idletasks()
        w, h = 500, 700
        x = parent.winfo_rootx() + (parent.winfo_width() // 2) - (w // 2)
        y = parent.winfo_rooty() + (parent.winfo_height() // 2) - (h // 2)
        self.geometry(f"{w}x{h}+{x}+{y}")

    def add_entry_row(self, qty_val="", ingredient_val=None):
        row_frame = ctk.CTkFrame(self.entries_scroll, fg_color="transparent")
        row_frame.pack(pady=4, anchor="center")
        
        qty_entry = ctk.CTkEntry(row_frame, width=80, height=32, font=ctk.CTkFont("Inter", 13), placeholder_text="Qty")
        qty_entry.pack(side="left", padx=(0, 10))
        if qty_val:
            qty_entry.insert(0, qty_val)
            
        ingredient_combo = ctk.CTkOptionMenu(row_frame, values=self.inventory_list, width=180, height=32, font=ctk.CTkFont("Inter", 13),
            fg_color="#4e2d18", button_color="#4e2d18", button_hover_color="#3d2414", dropdown_fg_color="#ffffff", dropdown_text_color="#4e2d18", text_color="#ffffff", corner_radius=8)
        ingredient_combo.pack(side="left", padx=(0, 10))
        if ingredient_val:
            ingredient_combo.set(ingredient_val)
        else:
            ingredient_combo.set(self.inventory_list[0] if self.inventory_list else "")
            
        # Add X button to remove row
        remove_btn = ctk.CTkButton(row_frame, text="✕", width=30, height=30, font=ctk.CTkFont("Inter", 14, "bold"), 
                                  fg_color="#dc3545", hover_color="#c82333", corner_radius=15,
                                  command=lambda: self.remove_entry_row(row_frame, qty_entry, ingredient_combo))
        remove_btn.pack(side="left")
        
        self.entries.append((qty_entry, ingredient_combo))

    def remove_entry_row(self, row_frame, qty_entry, ingredient_combo):
        """Remove an ingredient row"""
        if len(self.entries) > 1:  # Keep at least one row
            row_frame.destroy()
            self.entries.remove((qty_entry, ingredient_combo))
        else:
            messagebox.showwarning("Cannot Remove", "At least one ingredient must remain.")

    def _on_save(self):
        # Validate price fields
        unit_price_str = self.unit_price_entry.get().strip()
        selling_price_str = self.selling_price_entry.get().strip()
        
        if not unit_price_str:
            messagebox.showerror("Error", "Please enter unit price")
            return
        if not selling_price_str:
            messagebox.showerror("Error", "Please enter selling price")
            return
            
        try:
            unit_price = float(unit_price_str)
            selling_price = float(selling_price_str)
            if unit_price < 0 or selling_price < 0:
                raise ValueError("Prices must be positive")
        except ValueError:
            messagebox.showerror("Error", "Please enter valid positive prices")
            return
        
        ingredients = []
        used_ingredients = set()
        
        for qty_entry, ingredient_combo in self.entries:
            qty = qty_entry.get().strip()
            ingredient = ingredient_combo.get().strip()
            
            if qty and ingredient:
                # Validate quantity is numeric
                try:
                    float(qty)
                except ValueError:
                    messagebox.showerror("Error", f"Invalid quantity: {qty}")
                    return
                
                # Check for duplicate ingredients
                if ingredient in used_ingredients:
                    messagebox.showerror("Duplicate Ingredient", f"Ingredient '{ingredient}' is already added. Please remove duplicates.")
                    return
                
                used_ingredients.add(ingredient)
                ingredients.append((qty, ingredient))
        
        if not ingredients:
            messagebox.showwarning("No Ingredients", "Please add at least one ingredient with quantity.")
            return
            
        if self.on_save_edit:
            self.on_save_edit(self.product_name, self.summary, ingredients, unit_price, selling_price)
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
                # Display summary (product name with size/temperature)
                ctk.CTkLabel(scroll, text=group['summary'], font=ctk.CTkFont("Unbounded", 15, "bold"), text_color="#4d2d18").pack(anchor="w", pady=(12, 2), padx=10)
                # Display ingredients
                for qty, ingredient in group['ingredients']:
                    row = f"{qty:<8} {ingredient}"
                    ctk.CTkLabel(scroll, text=row, font=ctk.CTkFont("Inter", 14), text_color="#4d2d18", anchor="w").pack(anchor="w", padx=30)
    
    def center_popup(self, parent):
        self.update_idletasks()
        w, h = 500, 500
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
        separator = ctk.CTkFrame(link_ingredients_tab_frame, width=270, height=4, fg_color="#4d2d18")
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
                text_color="#4d2d18"
            )
            name_label.grid(row=0, column=0, sticky="w")
            
            # Get all product types for this product to show pricing info
            product_types = ProductController.get_product_types_by_product_id(product['product_id'])
            
            if product_types:
                # Show all variants with their prices
                price_info_parts = []
                for ptype in product_types:
                    if ptype['size'] and ptype['temperature']:
                        price_info_parts.append(f"{ptype['size']} {ptype['temperature']}: ₱{ptype['selling_price']:.2f}")
                    else:
                        price_info_parts.append(f"₱{ptype['selling_price']:.2f}")
                
                price_display = f"{product['category']} • " + " | ".join(price_info_parts)
            else:
                price_display = f"{product['category']} • No pricing set"
            
            # Category and price info
            details_label = ctk.CTkLabel(
                info_frame,
                text=price_display,
                font=ctk.CTkFont("Inter", size=12),
                text_color="#666666"
            )
            details_label.grid(row=1, column=0, sticky="w", pady=(2, 0))
            
            def action_callback(action, p=product, combo_ref=None):
                self.handle_action(p, action)
                if combo_ref:
                    combo_ref.set("Action")
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
                command=lambda action, p=product, combo_ref=None: action_callback(action, p, action_combo)
            )
            action_combo.set("Action")
            action_combo.grid(row=0, column=1, padx=(10, 20), pady=0)

    def handle_action(self, product, action):
        """Handle actions with specific product type context"""
        if action == "Link Ingredients":
            category = product.get("category", "")
            if category in ["Coffee", "Non-Coffee"]:
                if product_type:
                    # If we already have a specific product type, check if it has recipes
                    existing_recipes = RecipeController.get_recipes_by_product_type_id(product_type['product_type_id'])
                    if existing_recipes:
                        messagebox.showwarning(
                            "Already Linked", 
                            f"This variant '{product['name']} {product_type['size']} {product_type['temperature']}' already has linked ingredients. Use 'Edit' to modify them."
                        )
                        return
                    else:
                        # Link ingredients for this specific variant
                        LinkIngredientFinalPopup(self.root, product, product_type['size'], product_type['temperature'], on_save_link=self.save_linked_ingredients)
                else:
                    # No product type yet, show size/temp selection
                    def after_size_temp(size, temp):
                        LinkIngredientFinalPopup(self.root, product, size, temp, on_save_link=self.save_linked_ingredients)
                    SizeTempPopup(self.root, product, after_size_temp)
            else:  # Food category
                if product_type:
                    existing_recipes = RecipeController.get_recipes_by_product_type_id(product_type['product_type_id'])
                    if existing_recipes:
                        messagebox.showwarning(
                            "Already Linked", 
                            f"This food item '{product['name']}' already has linked ingredients. Use 'Edit' to modify them."
                        )
                        return
                
                # If no existing recipes, proceed with linking
                LinkIngredientFinalPopup(self.root, product, on_save_link=self.save_linked_ingredients)
                
        elif action == "View":
            # Get linked data from database for this specific product
            linked_data = self.get_linked_data_from_db(product)
            ViewLinkedIngredientsPopup(self.root, product['name'], linked_data)
            
        elif action == "Edit":
            if product_type:
                # Edit this specific product type
                existing_recipes = RecipeController.get_recipes_by_product_type_id(product_type['product_type_id'])
                if existing_recipes:
                    if product_type['size'] and product_type['temperature']:
                        summary = f"{product['name']} | {product['category']} {product_type['size']} {product_type['temperature']}"
                    else:
                        summary = f"{product['name']} | {product['category']}"
                    
                    inventory_data = InventoryController.get_all_inventory()
                    inventory_list = [item['ingredient'] for item in inventory_data]
                    
                    def on_save_edit(product_name, summary, ingredients, unit_price, selling_price):
                        self.update_recipe_ingredients(product_type['product_type_id'], ingredients, unit_price, selling_price)
                    
                    EditLinkedIngredientsPopup(
                        self.root, product['name'], summary, inventory_list, 
                        existing_recipes, product_type, on_save_edit=on_save_edit
                    )
                else:
                    messagebox.showinfo("No Data", f"No ingredients linked for this variant")
            else:
                # No product type selected, use original edit logic
                self.handle_action(product, action)

        elif action == "Delete":
            if product_type:
                # Delete this specific product type
                if product_type['size'] and product_type['temperature']:
                    variant_name = f"{product['name']} {product_type['size']} {product_type['temperature']}"
                else:
                    variant_name = product['name']
                    
                result = messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete '{variant_name}'?")
                if result:
                    # Delete the product type and its recipes
                    success = self.delete_product_type(product_type['product_type_id'])
                    if success:
                        self.load_products_from_db()
                        messagebox.showinfo("Success", "Product variant deleted successfully!")
                    else:
                        messagebox.showerror("Error", "Failed to delete product variant")
            else:
                # Delete entire product
                self.handle_action(product, action)

    def delete_product_type(self, product_type_id):
        """Delete a specific product type and its associated recipes"""
        try:
            # First delete associated recipes
            RecipeController.delete_recipes_by_product_type_id(product_type_id)
            
            # Then delete the product type
            conn = ProductController.connect_db()
            if conn:
                cursor = conn.cursor()
                cursor.execute("DELETE FROM product_type WHERE product_type_id = ?", (product_type_id,))
                conn.commit()
                cursor.close()
                conn.close()
                return True
            return False
        except Exception as e:
            print(f"Error deleting product type: {e}")
            return False

    def show_inventory(self):
        try:
            from inventory.inventory_page import InventoryManagement
            self.root.withdraw()  # Hide current window first
            self.root.after(100, lambda: self._delayed_inventory_launch())  # Delay the launch
        except Exception as e:
            print(f"Error navigating to inventory: {e}")
            messagebox.showerror("Navigation Error", f"Failed to open inventory page: {e}")

    def _delayed_inventory_launch(self):
        """Launch inventory page with delay to prevent image conflicts"""
        try:
            from inventory.inventory_page import InventoryManagement
            self.root.destroy()  # Destroy after withdrawal
            inventory_page = InventoryManagement(self.user_role)
            inventory_page.run()
        except Exception as e:
            print(f"Error launching inventory page: {e}")
            messagebox.showerror("Navigation Error", f"Failed to launch inventory page: {e}")
        
    def show_ticket(self):
        try:
            from ticket.ticket_main import TicketMainPage
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_ticket_launch())
        except Exception as e:
            print(f"Error navigating to ticket: {e}")

    def _delayed_ticket_launch(self):
        try:
            from ticket.ticket_main import TicketMainPage
            self.root.destroy()
            ticket_page = TicketMainPage(self.user_role)
            ticket_page.run()
        except Exception as e:
            print(f"Error launching ticket page: {e}")
        
    def show_receipt(self):
        try:
            from receipt.sales_history import SalesHistoryMain
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_receipt_launch())
        except Exception as e:
            print(f"Error navigating to receipt: {e}")

    def _delayed_receipt_launch(self):
        try:
            from receipt.sales_history import SalesHistoryMain
            self.root.destroy()
            receipt_page = SalesHistoryMain(self.user_role)
            receipt_page.run()
        except Exception as e:
            print(f"Error launching receipt page: {e}")
        
    def show_staff(self):
        try:
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_staff_launch())
        except Exception as e:
            print(f"Error navigating to staff: {e}")

    def _delayed_staff_launch(self):
        try:
            self.root.destroy()
            if self.user_role == "admin":
                StaffPageAdmin(user_role="admin").run()
            else:
                StaffPageEmployee(user_role="employee").run()
        except Exception as e:
            print(f"Error launching staff page: {e}")
        
    def show_cashbox(self):
        try:
            from cash_box.cashbox_page import CashBoxApp
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_cashbox_launch())
        except Exception as e:
            print(f"Error navigating to cashbox: {e}")

    def _delayed_cashbox_launch(self):
        try:
            from cash_box.cashbox_page import CashBoxApp
            self.root.destroy()
            cashbox_page = CashBoxApp(self.user_role)
            cashbox_page.run()
        except Exception as e:
            print(f"Error launching cashbox page: {e}")
        
    def show_dashboard(self):
        try:
            from dashboard.sales_dashboard import SalesDashboard
            self.root.withdraw()
            self.root.after(100, lambda: self._delayed_dashboard_launch())
        except Exception as e:
            print(f"Error navigating to dashboard: {e}")

    def _delayed_dashboard_launch(self):
        try:
            from dashboard.sales_dashboard import SalesDashboard
            self.root.destroy()
            dashboard_page = SalesDashboard(self.user_role)
            dashboard_page.run()
        except Exception as e:
            print(f"Error launching dashboard page: {e}")

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

    def get_linked_data_from_db(self, product):
        """Get linked ingredients data from database"""
        try:
            product_types = ProductController.get_product_types_by_product_id(product['product_id'])
            linked_data = []
            
            for ptype in product_types:
                if ptype['size'] and ptype['temperature']:
                    summary = f"{product['name']} | {product['category']} {ptype['size']} {ptype['temperature']}"
                else:
                    summary = f"{product['name']} | {product['category']}"
                    
                ingredients = RecipeController.get_recipes_by_product_type_id(ptype['product_type_id'])
                
                if ingredients:
                    linked_data.append({
                        'summary': summary,
                        'ingredients': ingredients
                    })
            
            return linked_data
        except Exception as e:
            print(f"Error getting linked data: {e}")
            return []

    def save_linked_ingredients(self, product, size, temperature, ingredients, unit_price, selling_price):
        """Save linked ingredients to database"""
        try:
            # Create product_type entry
            if size and temperature:
                product_type_id = ProductController.create_product_type(
                    product['product_id'], size, temperature, selling_price
                )
                # Update unit_price separately
                ProductController.update_product_type_prices(product_type_id, unit_price, selling_price)
            else:
                # For Food items, find the existing product_type with NULL size/temp
                product_types = ProductController.get_product_types_by_product_id(product['product_id'])
                product_type_id = None
                for ptype in product_types:
                    if ptype['size'] is None and ptype['temperature'] is None:
                        product_type_id = ptype['product_type_id']
                        # Update prices
                        ProductController.update_product_type_prices(product_type_id, unit_price, selling_price)
                        break
                        
            if not product_type_id:
                messagebox.showerror("Error", "Failed to create or find product type")
                return
                
            # Prepare ingredients data for recipe
            ingredients_data = []
            for qty, ingredient_name in ingredients:
                inventory_id = RecipeController.get_inventory_id_by_name(ingredient_name)
                if inventory_id:
                    ingredients_data.append((float(qty), inventory_id))
                else:
                    messagebox.showerror("Error", f"Ingredient '{ingredient_name}' not found in inventory")
                    return
                    
            # Save recipe ingredients
            success = RecipeController.add_recipe_ingredients(product_type_id, ingredients_data)
            
            if success:
                if size and temperature:
                    summary = f"{product['name']} | {product['category']} {size} {temperature}"
                else:
                    summary = f"{product['name']} | {product['category']}"
                messagebox.showinfo("Success", f"Ingredients linked successfully for {summary}!")
            else:
                messagebox.showerror("Error", "Failed to save recipe ingredients")
                
        except Exception as e:
            print(f"Error saving linked ingredients: {e}")
            messagebox.showerror("Error", f"Failed to save linked ingredients: {e}")

    def update_recipe_ingredients(self, product_type_id, ingredients, unit_price, selling_price):
        """Update recipe ingredients in database"""
        try:
            # Update prices first
            success = ProductController.update_product_type_prices(product_type_id, unit_price, selling_price)
            if not success:
                messagebox.showerror("Error", "Failed to update prices")
                return
                
            # Prepare ingredients data for recipe
            ingredients_data = []
            for qty, ingredient_name in ingredients:
                inventory_id = RecipeController.get_inventory_id_by_name(ingredient_name)
                if inventory_id:
                    ingredients_data.append((float(qty), inventory_id))
                else:
                    messagebox.showerror("Error", f"Ingredient '{ingredient_name}' not found in inventory")
                    return
            
            # Update recipe ingredients in database
            success = RecipeController.update_recipe_ingredients(product_type_id, ingredients_data)
            
            if success:
                messagebox.showinfo("Success", "Ingredients and prices updated successfully!")
            else:
                messagebox.showerror("Error", "Failed to update recipe ingredients")
                
        except Exception as e:
            print(f"Error updating recipe ingredients: {e}")
            messagebox.showerror("Error", f"Failed to update ingredients: {e}")

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
        # Center horizontally at the bottom right, with margin
        self.fab.place(relx=0.95, rely=0.96, anchor="se")

    def on_fab_click(self):
        def on_save(product):
            self.load_products_from_db()  # Reload from database
        AddProductDialog(self.root, on_save=on_save)

    def handle_action(self, product, action):
        """Original handle_action method for fallback"""
        if action == "Link Ingredients":
            category = product.get("category", "")
            if category in ["Coffee", "Non-Coffee"]:
                def after_size_temp(size, temp):
                    LinkIngredientFinalPopup(self.root, product, size, temp, on_save_link=self.save_linked_ingredients)
                SizeTempPopup(self.root, product, after_size_temp)
            else:  # Food category
                # Check if this Food product already has linked ingredients
                product_types = ProductController.get_product_types_by_product_id(product['product_id'])
                food_type = None
                for ptype in product_types:
                    if ptype['size'] is None and ptype['temperature'] is None:
                        food_type = ptype
                        break
                
                if food_type:
                    # Check if this product_type already has recipe ingredients
                    existing_recipes = RecipeController.get_recipes_by_product_type_id(food_type['product_type_id'])
                    if existing_recipes:
                        messagebox.showwarning(
                            "Already Linked", 
                            f"This food item '{product['name']}' already has linked ingredients. Use 'View' to see them or 'Edit' to modify them."
                        )
                        return
                
                # If no existing recipes, proceed with linking
                LinkIngredientFinalPopup(self.root, product, on_save_link=self.save_linked_ingredients)
                
        elif action == "View":
            # Get linked data from database
            linked_data = self.get_linked_data_from_db(product)
            ViewLinkedIngredientsPopup(self.root, product['name'], linked_data)
            
        elif action == "Edit":
            # Get all product types for this product
            product_types = ProductController.get_product_types_by_product_id(product['product_id'])
            
            if not product_types:
                messagebox.showinfo("No Data", f"No ingredient links found for '{product['name']}'")
                return
            
            # If it's a food item, directly edit the single recipe
            if product['category'] == "Food":
                # Get the default product_type (index 0) since Food only has one
                food_type = product_types[0] if product_types else None
                
                if food_type:
                    existing_recipes = RecipeController.get_recipes_by_product_type_id(food_type['product_type_id'])
                    if existing_recipes:
                        summary = f"{product['name']} | {product['category']}"
                        inventory_data = InventoryController.get_all_inventory()
                        inventory_list = [item['ingredient'] for item in inventory_data]
                        
                        def on_save_edit(product_name, summary, ingredients, unit_price, selling_price):
                            self.update_recipe_ingredients(food_type['product_type_id'], ingredients, unit_price, selling_price)
                        
                        EditLinkedIngredientsPopup(
                            self.root, product['name'], summary, inventory_list, 
                            existing_recipes, food_type, on_save_edit=on_save_edit
                        )
                    else:
                        messagebox.showinfo("No Data", f"No ingredients linked for '{product['name']}'")
                else:
                    messagebox.showinfo("No Data", f"No product type found for '{product['name']}'")
            
            # If it's Coffee/Non-Coffee, show size/temperature selection first
            else:
                variants_with_recipes = []
                for ptype in product_types:
                    if ptype['size'] and ptype['temperature']:
                        recipes = RecipeController.get_recipes_by_product_type_id(ptype['product_type_id'])
                        if recipes:
                            variants_with_recipes.append({
                                'product_type': ptype,
                                'recipes': recipes,
                                'summary': f"{product['name']} | {product['category']} {ptype['size']} {ptype['temperature']}"
                            })
                
                if not variants_with_recipes:
                    messagebox.showinfo("No Data", f"No ingredients linked for any variant of '{product['name']}'")
                    return
                
                # Show size/temperature selection popup for editing
                def after_size_temp_for_edit(size, temp):
                    # Find the matching variant
                    target_variant = None
                    for variant in variants_with_recipes:
                        ptype = variant['product_type']
                        if ptype['size'] == size and ptype['temperature'] == temp:
                            target_variant = variant
                            break
                    
                    if target_variant:
                        inventory_data = InventoryController.get_all_inventory()
                        inventory_list = [item['ingredient'] for item in inventory_data]
                        
                        def on_save_edit(product_name, summary, ingredients, unit_price, selling_price):
                            self.update_recipe_ingredients(target_variant['product_type']['product_type_id'], ingredients, unit_price, selling_price)
                        
                        EditLinkedIngredientsPopup(
                            self.root, product['name'], target_variant['summary'], 
                            inventory_list, target_variant['recipes'], target_variant['product_type'], 
                            on_save_edit=on_save_edit
                        )
                    else:
                        messagebox.showerror("Error", f"No ingredients found for {product['name']} {size} {temp}")
                
                # Create a custom SizeTempPopup that only shows variants with recipes
                self.show_size_temp_for_edit(product, variants_with_recipes, after_size_temp_for_edit)

        elif action == "Delete":
            result = messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete '{product['name']}'?")
            if result:
                success = ProductController.delete_product_by_id(product['product_id'])
                if success:
                    self.load_products_from_db()
                    messagebox.showinfo("Success", "Product deleted successfully!")
                else:
                    messagebox.showerror("Error", "Failed to delete product from database")

    def show_size_temp_for_edit(self, product, variants_with_recipes, on_next):
        """Show size/temperature selection popup for editing, only showing variants with recipes"""
        popup = ctk.CTkToplevel(self.root)
        popup.title("Select Size & Temperature to Edit")
        popup.geometry("300x260")
        popup.configure(fg_color="#f2efea")
        popup.transient(self.root)
        popup.grab_set()
        popup.resizable(False, False)
        
        # Center the popup
        popup.update_idletasks()
        w, h = 300, 260
        x = self.root.winfo_rootx() + (self.root.winfo_width() // 2) - (w // 2)
        y = self.root.winfo_rooty() + (self.root.winfo_height() // 2) - (h // 2)
        popup.geometry(f"{w}x{h}+{x}+{y}")
        
        size_var = tk.StringVar(value=None)
        temp_var = tk.StringVar(value=None)
        
        ctk.CTkLabel(popup, text="Select Size", font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4e2d18").pack(pady=(18, 4))
        size_frame = ctk.CTkFrame(popup, fg_color="transparent")
        size_frame.pack(pady=2)
        
        # Get unique sizes from variants with recipes and sort them properly
        available_sizes = list(set(variant['product_type']['size'] for variant in variants_with_recipes))
        # Sort sizes: Grande first, then Venti
        size_order = {"Grande": 1, "Venti": 2}
        available_sizes.sort(key=lambda x: size_order.get(x, 999))
        
        for s in available_sizes:
            ctk.CTkRadioButton(size_frame, text=s, variable=size_var, value=s, font=ctk.CTkFont("Inter", 14), text_color="#4e2d18").pack(side="left", padx=12)
        
        ctk.CTkLabel(popup, text="Select Temperature", font=ctk.CTkFont("Unbounded", 16, "bold"), text_color="#4e2d18").pack(pady=(16, 4))
        temp_frame = ctk.CTkFrame(popup, fg_color="transparent")
        temp_frame.pack(pady=2)
        
        # Get unique temperatures from variants with recipes and sort them properly
        available_temps = list(set(variant['product_type']['temperature'] for variant in variants_with_recipes))
        # Sort temperatures: Hot first, then Iced
        temp_order = {"Hot": 1, "Iced": 2}
        available_temps.sort(key=lambda x: temp_order.get(x, 999))
        
        for t in available_temps:
            ctk.CTkRadioButton(temp_frame, text=t, variable=temp_var, value=t, font=ctk.CTkFont("Inter", 14), text_color="#4e2d18").pack(side="left", padx=12)
        
        def on_next_click():
            if not size_var.get() or not temp_var.get():
                messagebox.showwarning("Required", "Please select both size and temperature.")
                return
                
            # Check if this combination has recipes
            has_recipes = any(
                variant['product_type']['size'] == size_var.get() and 
                variant['product_type']['temperature'] == temp_var.get() 
                for variant in variants_with_recipes
            )
            
            if not has_recipes:
                messagebox.showwarning("No Recipes", "No ingredients found for this size and temperature combination.")
                return
                
            on_next(size_var.get(), temp_var.get())
            popup.destroy()
        
        btn = ctk.CTkButton(popup, text="Next", fg_color="#4e2d18", text_color="#fff", width=120, height=36, corner_radius=10, command=on_next_click)
        btn.pack(pady=18)