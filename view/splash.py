import customtkinter as ctk
from tkinter import CENTER
import sys
from authentication.log_in import LoginWindow

class SplashScreen(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.setup_window()
        self.setup_ui()
        self.setup_bindings()
        
        self.after(4000, self.show_login)
    
    def setup_window(self):
        """Configure the splash window"""
        self.title("MareKwenta POS")
        self.geometry("1240x1440")
        self.configure(fg_color="#CABA9C")
    
    def setup_ui(self):
        """Create the splash screen UI elements"""
        # Create main frame
        main_frame = ctk.CTkFrame(self, fg_color="#CABA9C", corner_radius=0)
        main_frame.pack(fill="both", expand=True)
        
        # Inner frame for centering content
        inner_frame = ctk.CTkFrame(main_frame, fg_color="#CABA9C", corner_radius=0)
        inner_frame.place(relx=0.5, rely=0.5, anchor=CENTER)
        
        # MAREKWENTA LABEL
        label = ctk.CTkLabel(
            inner_frame,
            text="MareKwenta",
            font=("Unbounded", 36, "bold"),  
            text_color="#4D2D18",
            fg_color="transparent"
        )
        label.grid(row=0, column=0, padx=20, pady=20)
        
        # Custom separator (using Frame as line)
        separator = ctk.CTkFrame(inner_frame, height=2, fg_color="#4D2D18", corner_radius=0)
        separator.grid(row=1, column=0, sticky="ew", padx=40, pady=5)
        
        # POS LABEL
        pos_label = ctk.CTkLabel(
            inner_frame,
            text="POS",
            font=("Unica One", 30, "normal"),  
            text_color="#4D2D18",
            fg_color="transparent"
        )
        pos_label.grid(row=2, column=0, pady=(10, 20))
    
    def setup_bindings(self):
        """Setup keyboard bindings"""
        self.bind("<Escape>", lambda e: self.attributes('-fullscreen', False))
        self.bind("<F11>", lambda e: self.toggle_fullscreen())
    
    def toggle_fullscreen(self):
        """Toggle between fullscreen and windowed mode"""
        if self.attributes('-fullscreen'):
            self.attributes('-fullscreen', False)
        else:
            self.attributes('-fullscreen', True)
    
    def show_login(self):
        """Close splash screen and show login window"""
        self.destroy()
        
        # Import here to avoid circular imports

        login_app = LoginWindow()
        login_app.mainloop()