import customtkinter as ctk
from tkinter import ttk, messagebox
import tkinter as tk
from nav_bar import Navbar
import threading
import time
from .add_quantity import AddQuantityPopup
from .edit import EditInventoryPopup
from staff.staff_admin import StaffPageAdmin
from staff.staff_employee import StaffPageEmployee
from .inventory_controller import InventoryController


class InventoryManagement:
    def __init__(self, user_role="admin"):
        # Initialize the main window
        self.root = ctk.CTk()
        self.root.title("MareKwenta POS")
        taskbar_height = 70  # Adjust this value as needed
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()
        usable_height = screen_height - taskbar_height
        self.root.geometry(f"{screen_width}x{usable_height}+0+0")
        self.root.configure(fg_color="#f2efea")
        
        # Store user role
        self.user_role = user_role
        
        # Configure appearance
        ctk.set_appearance_mode("light")
        ctk.set_default_color_theme("blue")
        
        # Sample data for demonstration
        self.inventory_data = []
        
        # Performance tracking
        self.is_updating = False
        self.update_queue = []
        
        # Configure grid weights for main layout
        self.root.grid_columnconfigure(1, weight=1)  # Content area expands
        self.root.grid_rowconfigure(0, weight=1)
        
        # Bind window close event
        self.root.protocol("WM_DELETE_WINDOW", self.on_closing)
        
        self.setup_ui()
        self.load_inventory_from_db()  # <-- Add this line
    
    def on_closing(self):
        """Handle window closing"""
        try:
            self.root.quit()
            self.root.destroy()
        except:
            pass
        
    def setup_ui(self):
        # Create navbar with user role
        self.navbar = Navbar(self.root, width=124, user_role=self.user_role, active_tab="inventory")
        self.navbar.grid(row=0, column=0, sticky="ns", padx=(0, 0), pady=0)
        self.navbar.set_nav_callback("ticket", self.show_ticket)
        self.navbar.set_nav_callback("receipt", self.show_receipt)
        self.navbar.set_nav_callback("inventory", self.show_inventory)
        self.navbar.set_nav_callback("staff", self.show_staff)
        self.navbar.set_nav_callback("cashbox", self.show_cashbox)
        self.navbar.set_nav_callback("dashboard", self.show_dashboard)
        self.main_frame = ctk.CTkFrame(self.root, fg_color="#f2efea")
        self.main_frame.grid(row=0, column=1, sticky="nsew", padx=(20, 20), pady=20)
        
        # Configure main frame grid
        self.main_frame.grid_columnconfigure(0, weight=1)
        
        # Setup inventory content
        self.setup_inventory_content()
        
    def setup_inventory_content(self):
        # Hello User section
        self.setup_hello_user()
        
        # Navigation section
        self.setup_navigation()
        
        # Create ingredient section
        self.setup_create_ingredient()
        
        # Inventory list section
        self.setup_inventory_list()
        
    def setup_hello_user(self):
        # Replace Hello User with Inventory header in Unbounded font
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
        # Navigation frame with minimal padding
        self.nav_frame = ctk.CTkFrame(self.main_frame, fg_color="#f2efea")
        self.nav_frame.grid(row=1, column=0, sticky="ew", pady=(0, 15))
        self.nav_frame.grid_columnconfigure(0, weight=1)
        nav_container = ctk.CTkFrame(self.nav_frame, fg_color="transparent")
        nav_container.grid(row=0, column=0, pady=0)
        # Inventory tab (active) in its own frame for vertical stacking
        inventory_tab_frame = ctk.CTkFrame(nav_container, fg_color="transparent")
        inventory_tab_frame.grid(row=0, column=0)
        self.inventory_tab = ctk.CTkLabel(
            inventory_tab_frame,
            text="Inventory",
            font=ctk.CTkFont("Unbounded", size=28, weight="bold"),
            text_color="#4e2d18"
        )
        self.inventory_tab.pack()
        # Underline for active tab
        separator = ctk.CTkFrame(inventory_tab_frame, width=200, height=4, fg_color="#4e2d18")
        separator.pack(pady=(2, 0))
        # Link Ingredients tab as a button
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
        self.create_frame.grid(row=2, column=0, sticky="ew", pady=(0, 30), padx=80)
    
        # Configure main frame columns for centering
        self.create_frame.grid_columnconfigure(0, weight=1)  # Left spacer
        self.create_frame.grid_columnconfigure(1, weight=0)  # Content container
        self.create_frame.grid_columnconfigure(2, weight=1)  # Right spacer
    
        # Create inner container for the form
        inner_frame = ctk.CTkFrame(
            self.create_frame,
            fg_color="transparent"
        )
        inner_frame.grid(row=0, column=1, sticky="", pady=20)
    
        # Configure inner frame columns with even spacing
        for i in range(6):
            inner_frame.grid_columnconfigure(i, weight=1, uniform="col")

        # Title
        title_label = ctk.CTkLabel(
            inner_frame,
            text="Create Ingredient",
            font=ctk.CTkFont("Unbounded", size=16, weight="bold"),
            text_color="#4e2d18"
     )
        title_label.grid(row=0, column=0, columnspan=6, pady=(0, 20))
    
        # Input fields with consistent spacing
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
        self.ingredient_name_entry.grid(row=1, column=0, padx=entry_padx, pady=(0, 20))
    
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
        plus_btn.grid(row=1, column=5, padx=entry_padx, pady=(0, 20))
        
    def setup_inventory_list(self):
        self.list_frame = ctk.CTkFrame(
            self.main_frame,
            fg_color="#ffffff",
            corner_radius=16
        )
        self.list_frame.grid(row=3, column=0, sticky="nsew", padx=80)
        self.list_frame.grid_columnconfigure(0, weight=1)
        self.list_frame.grid_rowconfigure(2, weight=1)
        self.main_frame.grid_rowconfigure(3, weight=1)

        # Responsive headers frame
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
                        anchor="center"  # Center align like create ingredient panel
                    )
                    ingredient_label.grid(row=2*i, column=0, pady=8, padx=self.header_padx, sticky="ew")
                    
                    quantity_label = ctk.CTkLabel(
                        self.inventory_container,
                        text=item["quantity"],
                        font=ctk.CTkFont("Inter", size=15, weight="normal"),
                        text_color="#222222",
                        anchor="center"  # Center align like create ingredient panel
                    )
                    quantity_label.grid(row=2*i, column=1, pady=8, padx=self.header_padx, sticky="ew")
                    
                    measurement_label = ctk.CTkLabel(
                        self.inventory_container,
                        text=item["measurement"],
                        font=ctk.CTkFont("Inter", size=15, weight="normal"),
                        text_color="#222222",
                        anchor="center"  # Center align like create ingredient panel
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
                    # Center the combo box in its column
                    action_combo.grid(row=2*i, column=4, pady=8, padx=self.header_padx, sticky="")
                    action_combo.set("Action")
                    
                    # Insert a thin separator after each row except the last
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

                AddQuantityPopup(self.root, on_save=on_save)
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
                EditInventoryPopup(self.root, item_data, on_save=on_edit_save)
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
        self.root.destroy()
        LinkIngredientsPage(user_role=self.user_role).mainloop()
    
    # Navigation callback methods with error handling
    def show_inventory(self):
        pass  # Already on this page, do nothing!
    
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
        """Start the application with error handling"""
        try:
            print("Starting Inventory Management Application...")
            self.root.mainloop()
        except Exception as e:
            print(f"Error running application: {e}")
            messagebox.showerror("Fatal Error", f"Application failed to start: {e}")
        finally:
            try:
                self.root.destroy()
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
