import customtkinter as ctk
from tkinter import ttk, messagebox
import tkinter as tk
from nav_bar import Navbar
import threading
import time
from .add_quantity import AddQuantityPopup
from .edit import EditInventoryPopup
from .inventory_controller import InventoryController

from staff.staff_admin import StaffPageAdmin
from staff.staff_employee import StaffPageEmployee

class InventoryManagement(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="admin"):
        super().__init__(parent)
        self.main_app = main_app
        self.user_role = user_role
        # Sample data for demonstration
        self.inventory_data = []
        
        # Performance tracking
        self.is_updating = False
        self.update_queue = []
        self.configure(fg_color="#f2efea")
        self.setup_ui()
        self.load_inventory_from_db()  # <-- Add this line
    
    def on_closing(self):
        """Handle window closing"""
        try:
            self.quit()
            self.destroy()
        except:
            pass
        
    def setup_ui(self):
        # Main frame for content
        self.main_frame = ctk.CTkFrame(self, fg_color="#f2efea")
        self.main_frame.place(relx=0.5, rely=0.5, anchor="center", relwidth=0.9, relheight=0.9)
        self.setup_inventory_content()

    def setup_inventory_content(self):
        self.setup_hello_user()
        self.setup_navigation()
        self.setup_create_ingredient()
        self.setup_inventory_list()

    def setup_hello_user(self):
        header_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        header_frame.grid(row=0, column=0, sticky="w", pady=(10, 5))
        self.header_label = ctk.CTkLabel(
            header_frame,
            text="Inventory",
            font=ctk.CTkFont("Unbounded", size=36, weight="bold"),
            text_color="#4e2d18"
        )
        self.header_label.grid(row=0, column=0, sticky="w")

    def setup_navigation(self):
        self.nav_frame = ctk.CTkFrame(self.main_frame, fg_color="#f2efea")
        self.nav_frame.grid(row=1, column=0, sticky="ew", pady=(0, 15))
        self.nav_frame.grid_columnconfigure(0, weight=1)
        nav_container = ctk.CTkFrame(self.nav_frame, fg_color="transparent")
        nav_container.grid(row=0, column=0, pady=0)
        inventory_tab_frame = ctk.CTkFrame(nav_container, fg_color="transparent")
        inventory_tab_frame.grid(row=0, column=0)
        self.inventory_tab = ctk.CTkLabel(
            inventory_tab_frame,
            text="Inventory",
            font=ctk.CTkFont("Unbounded", size=28, weight="bold"),
            text_color="#4e2d18"
        )
        self.inventory_tab.pack()
        separator = ctk.CTkFrame(inventory_tab_frame, width=200, height=4, fg_color="#4e2d18")
        separator.pack(pady=(2, 0))
        self.link_ingredients_tab = ctk.CTkButton(
            nav_container,
            text="Link Ingredient",
            font=ctk.CTkFont("Unbounded", size=28, weight="bold"),
            text_color="#4e2d18",
            fg_color="transparent",
            hover_color="#e0e0e0",
            corner_radius=8,
            command=self.link_ingredients_clicked
        )
        self.link_ingredients_tab.grid(row=0, column=1, padx=(60, 0))

    def setup_create_ingredient(self):
        self.create_frame = ctk.CTkFrame(
            self.main_frame,
            fg_color="#ffffff",
            corner_radius=16
        )
        self.create_frame.grid(row=2, column=0, sticky="ew", pady=(0, 30), padx=40)
        self.create_frame.grid_columnconfigure(0, weight=1)
        self.create_frame.grid_columnconfigure(1, weight=0)
        self.create_frame.grid_columnconfigure(2, weight=1)
        inner_frame = ctk.CTkFrame(
            self.create_frame,
            fg_color="transparent"
        )
        inner_frame.grid(row=0, column=1, sticky="", pady=20)
        for i in range(6):
            inner_frame.grid_columnconfigure(i, weight=1, uniform="col")
        title_label = ctk.CTkLabel(
            inner_frame,
            text="Create Ingredient",
            font=ctk.CTkFont("Unbounded", size=16, weight="bold"),
            text_color="#4e2d18"
        )
        title_label.grid(row=0, column=0, columnspan=6, pady=(0, 20))
        entry_padx = 10
        self.ingredient_name_entry = ctk.CTkEntry(
            inner_frame,
            height=32,
            width=140,
            placeholder_text="Ingredient Name",
            font=ctk.CTkFont("Inter", size=12),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.ingredient_name_entry.grid(row=1, column=0, padx=(35, 10), pady=(0, 20))
        self.amount_stock_entry = ctk.CTkEntry(
            inner_frame,
            height=32,
            width=120,
            placeholder_text="Amount in Stock",
            font=ctk.CTkFont("Inter", size=12),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.amount_stock_entry.grid(row=1, column=1, padx=entry_padx, pady=(0, 20))
        self.cost_entry = ctk.CTkEntry(
            inner_frame,
            height=32,
            width=80,
            placeholder_text="Cost",
            font=ctk.CTkFont("Inter", size=12),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.cost_entry.grid(row=1, column=2, padx=entry_padx, pady=(0, 20))
        self.restock_point_entry = ctk.CTkEntry(
            inner_frame,
            height=32,
            width=130,
            placeholder_text="Restock Point",
            font=ctk.CTkFont("Inter", size=12),
            fg_color="#ffffff",
            border_color="#d1d5db",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.restock_point_entry.grid(row=1, column=3, padx=entry_padx, pady=(0, 20))
        self.measurement_combo = ctk.CTkOptionMenu(
            inner_frame,
            height=32,
            width=130,
            values=["mg", "ml", "grams", "oz", "pcs"],
            font=ctk.CTkFont("Inter", size=12),
            fg_color="#ffffff",
            button_color="#d1d5db",
            button_hover_color="#9ca3af",
            dropdown_fg_color="#ffffff",
            corner_radius=8,
            text_color="#4e2d18"
        )
        self.measurement_combo.grid(row=1, column=4, padx=entry_padx, pady=(0, 20))
        self.measurement_combo.set("Unit")
        plus_btn = ctk.CTkButton(
            inner_frame,
            width=90,
            height=40,
            text="Save",
            font=ctk.CTkFont("Inter", size=13, weight="bold"),
            fg_color="#4e2d18",
            hover_color="#3d2414",
            corner_radius=16,
            command=self.save_ingredient
        )
        plus_btn.grid(row=1, column=5, padx=(10, 20), pady=(0, 20))

    def setup_inventory_list(self):
        self.list_frame = ctk.CTkFrame(
            self.main_frame,
            fg_color="#ffffff",
            corner_radius=16
        )
        self.list_frame.grid(row=3, column=0, sticky="nsew", padx=40)
        self.list_frame.grid_columnconfigure(0, weight=1)
        self.list_frame.grid_rowconfigure(2, weight=1)
        self.main_frame.grid_rowconfigure(3, weight=1)
        self.header_padx = 10
        headers_frame = ctk.CTkFrame(self.list_frame, fg_color="transparent")
        headers_frame.grid(row=0, column=0, sticky="ew", pady=(20, 10))
        for i in range(5):
            headers_frame.grid_columnconfigure(i, weight=1, uniform="col")
        headers = ["Ingredient", "Quantity", "Measurement", "Status", "Action"]
        for i, text in enumerate(headers):
            header = ctk.CTkLabel(
                headers_frame,
                text=text,
                font=ctk.CTkFont("Unbounded", size=16, weight="bold"),
                text_color="#4e2d18",
                anchor="center"
            )
            header.grid(row=0, column=i, pady=5, padx=self.header_padx, sticky="ew")
        separator1 = ctk.CTkFrame(self.list_frame, height=2, fg_color="#222222")
        separator1.grid(row=1, column=0, sticky="ew", pady=(0, 15))
        self.inventory_container = ctk.CTkScrollableFrame(
            self.list_frame,
            fg_color="#ffffff"
        )
        self.inventory_container.grid(row=2, column=0, sticky="nsew", pady=(0, 20))
        self.inventory_container.grid_rowconfigure(0, weight=1)
        for i in range(5):
            self.inventory_container.grid_columnconfigure(i, weight=1, uniform="col")
        self.display_inventory_items()

    def display_inventory_items(self):
        try:
            if self.is_updating:
                return
            self.is_updating = True
            try:
                for widget in self.inventory_container.winfo_children():
                    widget.destroy()
            except Exception as e:
                print(f"Error clearing widgets: {e}")
                return
            
            for i, item in enumerate(self.inventory_data):
                try:
                    ingredient_label = ctk.CTkLabel(
                        self.inventory_container,
                        text=item["ingredient"],
                        font=ctk.CTkFont("Inter", size=15, weight="normal"),
                        text_color="#222222",
                        anchor="center"
                    )
                    ingredient_label.grid(row=2*i, column=0, pady=8, padx=self.header_padx, sticky="ew")
                    
                    quantity_label = ctk.CTkLabel(
                        self.inventory_container,
                        text=item["quantity"],
                        font=ctk.CTkFont("Inter", size=15, weight="normal"),
                        text_color="#222222",
                        anchor="center"
                    )
                    quantity_label.grid(row=2*i, column=1, pady=8, padx=self.header_padx, sticky="ew")
                    
                    measurement_label = ctk.CTkLabel(
                        self.inventory_container,
                        text=item["measurement"],
                        font=ctk.CTkFont("Inter", size=15, weight="normal"),
                        text_color="#222222",
                        anchor="center"
                    )
                    measurement_label.grid(row=2*i, column=2, pady=8, padx=self.header_padx, sticky="ew")
                    
                    status_label = ctk.CTkLabel(
                        self.inventory_container,
                        text=item["status"],
                        font=ctk.CTkFont("Inter", size=12, weight="bold"),
                        text_color=item["color"],
                        anchor="center"
                    )
                    status_label.grid(row=2*i, column=3, pady=8, padx=self.header_padx, sticky="ew")
                    
                    action_combo = ctk.CTkOptionMenu(
                        self.inventory_container,
                        height=32,
                        width=100,
                        values=["Add Quantity", "Edit", "Delete"],
                        font=ctk.CTkFont("Inter", size=13),
                        fg_color="#ffffff",
                        button_color="#919191",
                        button_hover_color="#808080",
                        dropdown_fg_color="#ffffff",
                        text_color="#4e2d18",
                        command=lambda choice, idx=i: self.handle_action(choice, idx)
                    )
                    action_combo.grid(row=2*i, column=4, pady=8, padx=self.header_padx, sticky="")
                    action_combo.set("Action")
                    
                    if i < len(self.inventory_data) - 1:
                        separator = ctk.CTkFrame(self.inventory_container, height=1, fg_color="#e0e0e0")
                        separator.grid(row=2*i+1, column=0, columnspan=5, sticky="ew", pady=(0, 0), padx=self.header_padx)
                    
                except Exception as e:
                    print(f"Error creating item {i}: {e}")
                    continue
                    
        except Exception as e:
            print(f"Error in display_inventory_items: {e}")
            messagebox.showerror("Error", f"Failed to display inventory items: {e}")
        finally:
            self.is_updating = False
    
    def save_ingredient(self):
        """Handle save ingredient button click with validation and error handling"""
        try:
            ingredient_name = self.ingredient_name_entry.get().strip()
            amount_stock = self.amount_stock_entry.get().strip()
            cost = self.cost_entry.get().strip()
            restock_point = self.restock_point_entry.get().strip()
            measurement = self.measurement_combo.get()
            restock_point = self.restock_point_entry.get().strip()

            # Validate input
            if not ingredient_name:
                messagebox.showwarning("Validation Error", "Please enter an ingredient name")
                return
            if not amount_stock:
                messagebox.showwarning("Validation Error", "Please enter amount in stock")
                return
            if not cost:
                messagebox.showwarning("Validation Error", "Please enter cost")
                return
            if measurement == "Unit":
                messagebox.showwarning("Validation Error", "Please select a unit of measurement")
                return
            if not restock_point:
                messagebox.showwarning("Validation Error", "Please enter restock point")
                return

            # Validate numeric values
            try:
                float(amount_stock)
                float(cost)
                int(restock_point)
            except ValueError:
                messagebox.showerror("Validation Error", "Amount, cost, and restock point must be valid numbers")
                return

            # Add new ingredient to database via controller
            success = InventoryController.add_inventory(
                ingredient_name, amount_stock, measurement, cost, restock_point
            )
            if success:
                self.clear_input_fields()
                self.load_inventory_from_db()  # Reload from DB
                messagebox.showinfo("Success", f"Ingredient '{ingredient_name}' saved successfully!")
            else:
                messagebox.showerror("Error", "Failed to save ingredient to database.")

        except Exception as e:
            print(f"Error saving ingredient: {e}")
            messagebox.showerror("Error", f"Failed to save ingredient: {e}")
    
    def clear_input_fields(self):
        """Clear all input fields"""
        try:
            self.ingredient_name_entry.delete(0, 'end')
            self.amount_stock_entry.delete(0, 'end')
            self.cost_entry.delete(0, 'end')
            self.measurement_combo.set("Unit")
            self.restock_point_entry.delete(0, 'end')
        except Exception as e:
            print(f"Error clearing input fields: {e}")
    
    def handle_action(self, action, index):
        """Handle action dropdown selection with error handling"""
        try:
            if not (0 <= index < len(self.inventory_data)):
                messagebox.showerror("Error", "Invalid item index")
                return
                
            if action == "Add Quantity":
                def on_save(qty):
                    try:
                        if not qty:
                            messagebox.showwarning("Validation Error", "Please enter a quantity")
                            return
                        try:
                            qty_val = float(qty)
                        except ValueError:
                            messagebox.showerror("Validation Error", "Quantity must be a valid number")
                            return
                        current_qty = self.inventory_data[index]["quantity"]
                        try:
                            current_qty_val = float(current_qty)
                        except ValueError:
                            current_qty_val = 0
                        new_qty = current_qty_val + qty_val

                        inventory_id = self.inventory_data[index].get("inventory_id")
                        if inventory_id is not None:
                            success = InventoryController.update_quantity_by_id(inventory_id, new_qty)
                            if success:
                                self.load_inventory_from_db()
                                messagebox.showinfo("Success", "Quantity updated successfully!")
                            else:
                                messagebox.showerror("Error", "Failed to update quantity in database.")
                        else:
                            messagebox.showerror("Error", "No inventory_id found for this item.")
                    except Exception as e:
                        print(f"Error updating quantity: {e}")
                        messagebox.showerror("Error", f"Failed to update quantity: {e}")

                AddQuantityPopup(self, on_save=on_save)
            elif action == "Edit":
                item_data = self.inventory_data[index].copy()
                def on_edit_save(name, qty, measurement, cost, restock_point):
                    inventory_id = self.inventory_data[index].get("inventory_id")
                    if inventory_id is not None:
                        success = InventoryController.update_inventory_by_id(
                            inventory_id, name, qty, measurement, cost, restock_point
                        )
                        if success:
                            self.load_inventory_from_db()
                            messagebox.showinfo("Success", f"Ingredient '{name}' updated successfully!")
                        else:
                            messagebox.showerror("Error", "Failed to update ingredient in database.")
                    else:
                        messagebox.showerror("Error", "No inventory_id found for this item.")
                EditInventoryPopup(self, item_data, on_save=on_edit_save)
            elif action == "Delete":
                result = messagebox.askyesno(
                    "Confirm Delete",
                    f"Are you sure you want to delete '{self.inventory_data[index]['ingredient']}'?"
                )
                if result:
                    inventory_id = self.inventory_data[index].get("inventory_id")
                    if inventory_id is not None:
                        success = InventoryController.delete_inventory_by_id(inventory_id)
                        if success:
                            print(f"Deleted ingredient with id {inventory_id}")
                            self.inventory_data.pop(index)
                            self.display_inventory_items()
                            messagebox.showinfo("Success", "Ingredient deleted successfully!")
                        else:
                            messagebox.showerror("Error", "Failed to delete ingredient from database.")
                    else:
                        messagebox.showerror("Error", "No inventory_id found for this item.")
        except Exception as e:
            print(f"Error handling action: {e}")
            messagebox.showerror("Error", f"Failed to perform action: {e}")
    
    def link_ingredients_clicked(self):
        from .link_ingredients import LinkIngredientsPage
        self.main_app.show_frame("link_ingredients")
    
    def show_ticket(self):
        self.main_app.show_frame("ticket")
    
    def show_receipt(self):
        self.main_app.show_frame("receipt")
    
    def show_cashbox(self):
        self.main_app.show_frame("cashbox")
    
    def show_inventory(self):
        self.main_app.show_frame("inventory")
    
    def show_staff(self):
        self.main_app.show_frame("staff")
    
    def show_dashboard(self):
        from dashboard.sales_dashboard import SalesDashboard
        self.destroy()
        SalesDashboard(user_role=self.user_role).mainloop()
    
    def run(self):
        """Start the application with error handling"""
        try:
            print("Starting Inventory Management Application...")
            self.mainloop()
        except Exception as e:
            print(f"Error running application: {e}")
            messagebox.showerror("Fatal Error", f"Application failed to start: {e}")
        finally:
            try:
                self.destroy()
            except:
                pass
    
    def mainloop(self):
        """Alternative method name for compatibility"""
        self.run()

    def load_inventory_from_db(self):
        """Fetch inventory from DB and update the UI."""
        try:
            raw_data = InventoryController.get_all_inventory()
            self.inventory_data = []
            for item in raw_data:
                try:
                    qty = float(item["quantity"])
                    rpoint = float(item["restock_point"])
                    if qty < rpoint:
                        status = "Restock Needed"
                        color = "#f73e3e"
                    elif rpoint <= qty <= rpoint + (rpoint * 0.3):
                        status = "Low Stock"
                        color = "#e8bb6d"
                    else:
                        status = "In Stock"
                        color = "#0a8a06"
                    item["status"] = status
                    item["color"] = color
                    self.inventory_data.append(item)
                except Exception as e:
                    print(f"Error computing status/color: {e}")
                    item["status"] = "Unknown"
                    item["color"] = "#a00"
                    self.inventory_data.append(item)
            self.display_inventory_items()
        except Exception as e:
            print(f"Error loading inventory from DB: {e}")
            messagebox.showerror("Error", f"Failed to load inventory from database: {e}")

    def refresh(self):
        """Refresh the inventory page by reloading data from the database"""
        try:
            print("InventoryManagement: Refreshing inventory data...")
            self.load_inventory_from_db()
            print("InventoryManagement: Inventory data refreshed successfully")
            # Force update the UI
            self.update_idletasks()
        except Exception as e:
            print(f"Error refreshing inventory page: {e}")

    def force_refresh(self):
        """Force a complete refresh of the inventory page - useful after inventory deductions"""
        try:
            print("InventoryManagement: Force refreshing inventory data...")
            # Clear current data
            self.inventory_data = []
            # Reload from database
            self.load_inventory_from_db()
            print("InventoryManagement: Force refresh completed")
        except Exception as e:
            print(f"Error force refreshing inventory page: {e}")
