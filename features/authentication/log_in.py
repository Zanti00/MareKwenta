import customtkinter as ctk
from tkinter import CENTER
import sys
from inventory.inventory_page import InventoryManagement

class LoginWindow(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.setup_window()
        self.setup_ui()
        self.setup_bindings()
        
        # Focus on username field
        self.after(100, lambda: self.username.focus())
    
    def setup_window(self):
        """Configure the login window"""
        self.title("MareKwenta POS")
        self.configure(fg_color="#CABA9C")
        taskbar_height = 70  # Adjust this value as needed
        screen_width = self.winfo_screenwidth()
        screen_height = self.winfo_screenheight()
        usable_height = screen_height - taskbar_height
        self.geometry(f"{screen_width}x{usable_height}+0+0")
    
    def setup_ui(self):
        """Create the login window UI elements"""
        
        # Create main frame (fills entire screen)
        main_frame = ctk.CTkFrame(self, fg_color="#CABA9C", corner_radius=0)
        main_frame.pack(fill="both", expand=True)
        
        # Center container frame
        center_frame = ctk.CTkFrame(main_frame, fg_color="#CABA9C", corner_radius=0)
        center_frame.place(relx=0.5, rely=0.5, anchor=CENTER)
        
        # MAREKWENTA LABEL
        title_label = ctk.CTkLabel(
            center_frame,
            text="MareKwenta",
            font=("Unbounded", 36, "bold"),
            text_color="#4D2D18",
            fg_color="transparent"
        )
        title_label.grid(row=0, column=0, padx=20, pady=20)
        
        # Custom separator (using Frame as line)
        separator = ctk.CTkFrame(center_frame, height=2, fg_color="#4D2D18", corner_radius=0)
        separator.grid(row=1, column=0, sticky="ew", padx=40, pady=5)
        
        # POS LABEL
        pos_label = ctk.CTkLabel(
            center_frame,
            text="POS",
            font=("Unica One", 30, "normal"),
            text_color="#4D2D18",
            fg_color="transparent"
        )
        pos_label.grid(row=2, column=0, pady=(10, 20))
        
        # LOGIN FRAME
        login_frame = ctk.CTkFrame(
            center_frame,
            fg_color="#F2EFEA",
            corner_radius=12,
            border_width=2,
            border_color="#D4C4A8",
            width=400,
            height=280
        )
        login_frame.grid(row=3, column=0, pady=(10, 20), padx=20)
        login_frame.grid_propagate(False)  # Maintain fixed size
        
        # Configure login frame grid
        login_frame.grid_columnconfigure(0, weight=1)
        
        # Username Label
        username_label = ctk.CTkLabel(
            login_frame,
            text="Username",
            font=("Inter", 12, "normal"),
            text_color="#4D2D18",
            fg_color="transparent"
        )
        username_label.grid(row=0, column=0, sticky="w", padx=30, pady=(25, 5))
        
        # Username Entry
        self.username = ctk.CTkEntry(
            login_frame,
            font=("Inter", 12),
            fg_color="white",
            text_color="#333333",
            border_color="#CCCCCC",
            corner_radius=6,
            height=35,
            width=290
        )
        self.username.grid(row=1, column=0, padx=30, pady=(0, 15))
        
        # Password Label
        password_label = ctk.CTkLabel(
            login_frame,
            text="Password",
            font=("Inter", 12, "normal"),
            text_color="#4D2D18",
            fg_color="transparent"
        )
        password_label.grid(row=2, column=0, sticky="w", padx=30, pady=(0, 5))
        
        # Password Entry
        self.password = ctk.CTkEntry(
            login_frame,
            show="*",
            font=("Inter", 12),
            fg_color="white",
            text_color="#333333",
            border_color="#CCCCCC",
            corner_radius=6,
            height=35,
            width=290
        )
        self.password.grid(row=3, column=0, padx=30, pady=(0, 20))
        
        # Login Button
        login_btn = ctk.CTkButton(
            login_frame,
            text="Log In",
            width=140,
            height=40,
            font=("Inter", 12, "bold"),
            fg_color="#5E3921",
            hover_color="#4D2D18",
            text_color="white",
            corner_radius=6,
            command=self.handle_login
        )
        login_btn.grid(row=4, column=0, pady=(0, 25))
    
    def setup_bindings(self):
        """Setup keyboard bindings"""
        self.bind("<Escape>", lambda e: self.exit_app())  # ESC to exit
        self.bind("<F11>", lambda e: self.toggle_fullscreen())  # F11 to toggle fullscreen
        self.bind("<Return>", lambda e: self.handle_login())  # Enter to login
    
    def make_fullscreen(self):
        """Make window fullscreen using multiple methods for compatibility"""
        try:
            # Method 1: Try state zoomed (works on Windows)
            self.state('zoomed')
        except:
            try:
                # Method 2: Try fullscreen attribute
                self.attributes('-fullscreen', True)
            except:
                try:
                    # Method 3: Try zoomed attribute (Linux/Mac)
                    self.attributes('-zoomed', True)
                except:
                    # Method 4: Manual fullscreen using geometry
                    self.update_idletasks()
                    screen_width = self.winfo_screenwidth()
                    screen_height = self.winfo_screenheight()
                    self.geometry(f"{screen_width}x{screen_height}+0+0")
    
    def toggle_fullscreen(self):
        """Toggle between fullscreen and windowed mode"""
        if self.attributes('-fullscreen'):
            self.attributes('-fullscreen', False)
        else:
            self.attributes('-fullscreen', True)
    
    def handle_login(self):
        """Handle login button click"""
        username = self.username.get()
        password = self.password.get()
        
        # Basic validation
        if not username or not password:
            print("Please enter both username and password")
            return
        
        # Add your login validation logic here
        print(f"Login attempted with username: {username}")
        
        # Simple role-based authentication (you can replace this with your actual authentication logic)
        user_role = self.authenticate_user(username, password)
        
        if user_role:
            print(f"Login successful! User role: {user_role}")
            self.inventory_page(user_role)
        else:
            print("Invalid credentials")

    def authenticate_user(self, username, password):
        """Simple authentication logic - replace with your actual authentication system"""
        # Example credentials (in a real app, this would be in a database)
        users = {
            "owner": {"password": "owner123", "role": "admin"},
            "employee": {"password": "emp123", "role": "employee"},
            "admin": {"password": "admin123", "role": "admin"},
            "staff": {"password": "staff123", "role": "employee"}
        }
        
        if username in users and users[username]["password"] == password:
            return users[username]["role"]
        return None

    def inventory_page(self, user_role):
        """Navigate to main app with user role"""
        self.destroy()
        from main_app import MainApp
        app = MainApp(user_role=user_role)
        app.mainloop()
    
    def exit_app(self):
        """Exit the application"""
        sys.exit()