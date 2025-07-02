# navbar.py
import customtkinter as ctk
import os
from PIL import Image

class Navbar(ctk.CTkFrame):
    def __init__(self, parent, width=100, user_role="employee", active_tab=None, **kwargs):
        super().__init__(parent, width=width, corner_radius=0, **kwargs)
        
        # Configure the navbar
        self.configure(fg_color="#f7f3ee")
        self.grid_propagate(False)  # Maintain fixed width
        
        # Store user role and callbacks for navigation
        self.user_role = user_role
        self.nav_callbacks = {}
        
        # Store reference to parent window for logout functionality
        self.parent_window = parent
        
        # Setup the navbar layout
        self.active_tab = active_tab or ("inventory" if user_role == "owner" else "ticket")
        self.icon_images = {}
        self.grid_rowconfigure(1, weight=1)  # Center nav buttons vertically
        self.setup_header()
        self.setup_navigation_buttons()
        self.setup_logout_button()
        
    def load_icon(self, filename, size=(28, 28)):
        path = os.path.join(os.path.dirname(__file__), "assets", filename)
        img = Image.open(path).resize(size, Image.Resampling.LANCZOS)
        return ctk.CTkImage(light_image=img, dark_image=img, size=size)
    
    def setup_header(self):
        """Create the header section with logo"""
        # Header frame
        self.header_frame = ctk.CTkFrame(
            self, 
            height=80, 
            fg_color="transparent"
        )
        self.header_frame.grid(row=0, column=0, sticky="ew", pady=(18, 0))
        self.header_frame.grid_propagate(False)
        
        # Logo text
        self.logo_label = ctk.CTkLabel(
            self.header_frame,
            text="MK",
            font=ctk.CTkFont(family="Arial", size=28, weight="bold"),
            text_color="#4d2d18"
        )
        self.logo_label.pack(anchor="center", pady=(10, 5))
        
        # Decorative line under logo
        self.line_frame = ctk.CTkFrame(
            self.header_frame,
            height=2,
            width=40,
            fg_color="#4d2d18"
        )
        self.line_frame.pack(anchor="center")
        
    def setup_navigation_buttons(self):
        # Add a vertical spacer above and below the nav buttons for centering
        self.grid_rowconfigure(1, weight=1)  # Top spacer
        self.grid_rowconfigure(2, weight=0)  # Nav buttons
        self.grid_rowconfigure(3, weight=1)  # Bottom spacer
        self.buttons_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.buttons_frame.grid(row=2, column=0, sticky="ns", pady=0)
        
        # Define all possible navigation buttons
        all_nav_buttons = [
            {"name": "inventory", "text": "Inventory", "icon": "inventory.png"},
            {"name": "staff", "text": "Staff", "icon": "staff.png"},
            {"name": "receipt", "text": "Receipts", "icon": "receipt.png"},
            {"name": "cashbox", "text": "Cash Box", "icon": "cashbox.png"},
            {"name": "ticket", "text": "Ticket", "icon": "Ticket.png"},
            {"name": "dashboard", "text": "Dashboard", "icon": "dashboard.png"}
        ]
        
        # Filter buttons based on user role
        if self.user_role in ["employee"]:
            # Employees can only access: ticket, staff, receipts, cashbox
            nav_buttons = [
                {"name": "ticket", "text": "Ticket", "icon": "Ticket.png"},
                {"name": "staff", "text": "Staff", "icon": "staff.png"},
                {"name": "receipt", "text": "Receipts", "icon": "receipt.png"},
                {"name": "cashbox", "text": "Cash Box", "icon": "cashbox.png"}
            ]
        else:
            # Owners/admins can access all buttons
            nav_buttons = all_nav_buttons
        
        self.nav_buttons = {}
        for i, button_data in enumerate(nav_buttons):
            icon = self.load_icon(button_data["icon"], size=(28, 28))
            is_active = self.active_tab == button_data["name"]
            btn = ctk.CTkButton(
                self.buttons_frame,
                text=button_data["text"],
                image=icon,
                compound="top",
                fg_color="#D5C8B0" if is_active else "#f7f3ee",
                hover_color="#ede3d2",
                text_color="#4d2d18",
                font=ctk.CTkFont(family="Arial", size=12, weight="bold"),
                corner_radius=16,
                width=90,
                height=70,
                border_width=0,  # Always no border
                command=lambda n=button_data["name"]: self.on_nav_click(n)
            )
            btn.grid(row=i, column=0, pady=(0, 8), padx=0, sticky="ew")
            self.nav_buttons[button_data["name"]] = btn
    
    def setup_logout_button(self):
        icon = self.load_icon("Log out.png", size=(24, 24))
        # Set row 4 to weight 0, and row 3 (spacer) to weight 1 to push logout to bottom
        self.grid_rowconfigure(3, weight=1)  # Spacer
        self.grid_rowconfigure(4, weight=0)  # Log out
        self.logout_btn = ctk.CTkButton(
            self,
            text="Log Out",
            image=icon,
            compound="left",
            anchor="w",
            width=90,
            height=40,
            fg_color="#fff0f0",
            text_color="#d32f2f",
            font=ctk.CTkFont(family="Arial", size=15, weight="bold"),
            hover_color="#ffeaea",
            corner_radius=8,
            command=self.logout_clicked
        )
        self.logout_btn.grid(row=4, column=0, sticky="ew", padx=0, pady=(0, 18))
    
    def on_nav_click(self, nav_name):
        """Handle navigation button clicks"""
        if nav_name == self.active_tab:
            return  # Prevent recursion if already on this tab
        self.active_tab = nav_name
        for name, btn in self.nav_buttons.items():
            if name == nav_name:
                btn.configure(fg_color="#ede3d2")
            else:
                btn.configure(fg_color="#f7f3ee")
        if nav_name in self.nav_callbacks:
            self.nav_callbacks[nav_name]()
    
    def set_nav_callback(self, nav_name, callback):
        """Set callback function for navigation button"""
        self.nav_callbacks[nav_name] = callback
    
    def logout_clicked(self):
        """Handle logout button click - destroy current window and show login"""
        try:
            from tkinter import messagebox
            
            # Show confirmation dialog
            result = messagebox.askyesno(
                "Logout Confirmation", 
                "Are you sure you want to log out?",
                icon='question'
            )
            
            if result:
                # Get the top-level window (root window)
                root_window = self.parent_window
                while hasattr(root_window, 'master') and root_window.master:
                    root_window = root_window.master
                
                # Import login window here to avoid circular imports
                try:
                    # First try to import from the current directory structure
                    from log_in import LoginWindow
                except ImportError:
                    try:
                        # Try alternative import paths
                        from authentication.log_in import LoginWindow
                    except ImportError:
                        try:
                            # Try another common structure
                            import sys
                            import os
                            sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
                            from log_in import LoginWindow
                        except ImportError:
                            messagebox.showerror("Error", "Could not import login window. Please restart the application.")
                            return
                
                # Destroy the current window
                root_window.destroy()
                
                # Create and show the login window
                login_window = LoginWindow()
                login_window.mainloop()
                
        except Exception as e:
            print(f"Error during logout: {e}")
            # Fallback: just destroy the current window
            try:
                root_window = self.parent_window
                while hasattr(root_window, 'master') and root_window.master:
                    root_window = root_window.master
                root_window.destroy()
            except:
                pass
    
    def get_root_window(self):
        """Helper method to get the root window"""
        root = self.parent_window
        while hasattr(root, 'master') and root.master:
            root = root.master
        return root