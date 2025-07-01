import customtkinter as ctk
import tkinter as tk
from tkinter import ttk

class NotificationDropdown:
    def __init__(self, parent, x, y):
        self.parent = parent
        self.dropdown = None
        self.x = x
        self.y = y
        
    def create_dropdown(self):
        # Create dropdown window
        self.dropdown = ctk.CTkToplevel(self.parent)
        self.dropdown.title("")
        self.dropdown.geometry(f"350x400+{self.x}+{self.y}")
        self.dropdown.resizable(False, False)
        self.dropdown.configure(fg_color="#2b2b2b")
        
        # Remove window decorations for popup effect
        self.dropdown.overrideredirect(True)
        
        # Header with title and close button
        header_frame = ctk.CTkFrame(self.dropdown, fg_color="#2b2b2b", height=40)
        header_frame.pack(fill="x", padx=10, pady=(10, 0))
        header_frame.pack_propagate(False)
        
        title_label = ctk.CTkLabel(
            header_frame, 
            text="NOTIFICATIONS", 
            font=ctk.CTkFont(size=14, weight="bold"),
            text_color="white"
        )
        title_label.pack(side="left", pady=10)
        
        close_btn = ctk.CTkButton(
            header_frame,
            text="×",
            width=30,
            height=30,
            font=ctk.CTkFont(size=18, weight="bold"),
            fg_color="transparent",
            text_color="white",
            hover_color="#404040",
            command=self.close_dropdown
        )
        close_btn.pack(side="right", pady=5)
        
        # Scrollable frame for notifications
        scrollable_frame = ctk.CTkScrollableFrame(
            self.dropdown,
            fg_color="#2b2b2b",
            scrollbar_fg_color="#2b2b2b",
            scrollbar_button_color="#404040",
            scrollbar_button_hover_color="#505050"
        )
        scrollable_frame.pack(fill="both", expand=True, padx=10, pady=10)
        
        # Full access section
        self.create_section(
            scrollable_frame,
            "Full access",
            "These extensions can see and change information on this site.",
            [
                ("🔊", "Volume up - Boost & Equalizer", True),
                ("📱", "Mobile Device Manager", True),
                ("🔐", "Password Manager Pro", True)
            ]
        )
        
        # No access needed section  
        self.create_section(
            scrollable_frame,
            "No access needed", 
            "These extensions don't need to see and change information on this site.",
            [
                ("📄", "Google Docs Offline", False),
                ("🌐", "Web Developer Tools", False),
                ("📊", "Analytics Tracker", False),
                ("🎨", "Color Picker", False)
            ]
        )
        
        # Manage extensions button
        manage_btn = ctk.CTkButton(
            scrollable_frame,
            text="Manage extensions...",
            font=ctk.CTkFont(size=12),
            fg_color="transparent",
            text_color="#8ab4f8",
            hover_color="#404040",
            anchor="w",
            height=35
        )
        manage_btn.pack(fill="x", pady=(10, 0))
        
        # Bind click outside to close
        self.dropdown.bind("<FocusOut>", lambda e: self.close_dropdown())
        self.dropdown.focus()
        
    def create_section(self, parent, title, description, items):
        # Section frame
        section_frame = ctk.CTkFrame(parent, fg_color="transparent")
        section_frame.pack(fill="x", pady=(0, 15))
        
        # Section title
        title_label = ctk.CTkLabel(
            section_frame,
            text=title,
            font=ctk.CTkFont(size=13, weight="bold"),
            text_color="white",
            anchor="w"
        )
        title_label.pack(fill="x", pady=(0, 5))
        
        # Section description
        desc_label = ctk.CTkLabel(
            section_frame,
            text=description,
            font=ctk.CTkFont(size=11),
            text_color="#9aa0a6",
            anchor="w",
            wraplength=300,
            justify="left"
        )
        desc_label.pack(fill="x", pady=(0, 10))
        
        # Items
        for icon, name, has_access in items:
            self.create_item(section_frame, icon, name, has_access)
    
    def create_item(self, parent, icon, name, has_access):
        item_frame = ctk.CTkFrame(
            parent, 
            fg_color="transparent",
            height=40
        )
        item_frame.pack(fill="x", pady=2)
        item_frame.pack_propagate(False)
        
        # Icon
        icon_label = ctk.CTkLabel(
            item_frame,
            text=icon,
            font=ctk.CTkFont(size=16),
            width=30
        )
        icon_label.pack(side="left", padx=(5, 10), pady=8)
        
        # Name
        name_label = ctk.CTkLabel(
            item_frame,
            text=name,
            font=ctk.CTkFont(size=12),
            text_color="white",
            anchor="w"
        )
        name_label.pack(side="left", fill="x", expand=True, pady=8)
        
        # Access indicator (pin icon for full access items)
        if has_access:
            pin_btn = ctk.CTkButton(
                item_frame,
                text="📌",
                width=30,
                height=25,
                font=ctk.CTkFont(size=12),
                fg_color="transparent",
                text_color="#9aa0a6",
                hover_color="#404040"
            )
            pin_btn.pack(side="right", padx=5, pady=8)
        
        # More options button
        more_btn = ctk.CTkButton(
            item_frame,
            text="⋮",
            width=30,
            height=25,
            font=ctk.CTkFont(size=16, weight="bold"),
            fg_color="transparent",
            text_color="#9aa0a6",
            hover_color="#404040"
        )
        more_btn.pack(side="right", padx=5, pady=8)
        
        # Hover effect
        def on_enter(event):
            item_frame.configure(fg_color="#404040")
        def on_leave(event):
            item_frame.configure(fg_color="transparent")
            
        item_frame.bind("<Enter>", on_enter)
        item_frame.bind("<Leave>", on_leave)
        for child in item_frame.winfo_children():
            child.bind("<Enter>", on_enter)
            child.bind("<Leave>", on_leave)
    
    def close_dropdown(self):
        if self.dropdown:
            self.dropdown.destroy()
            self.dropdown = None

class NotificationApp:
    def __init__(self):
        self.app = ctk.CTk()
        self.app.title("Notification Dropdown Demo")
        self.app.geometry("600x400")
        self.app.configure(fg_color="#1e1e1e")
        
        # Set appearance mode
        ctk.set_appearance_mode("dark")
        ctk.set_default_color_theme("blue")
        
        # Create main content
        self.create_main_interface()
        
        self.notification_dropdown = None
        
    def create_main_interface(self):
        # Top bar frame
        top_frame = ctk.CTkFrame(self.app, height=60, fg_color="#2b2b2b")
        top_frame.pack(fill="x", padx=10, pady=10)
        top_frame.pack_propagate(False)
        
        # App title
        title_label = ctk.CTkLabel(
            top_frame,
            text="My Application",
            font=ctk.CTkFont(size=16, weight="bold"),
            text_color="white"
        )
        title_label.pack(side="left", padx=20, pady=15)
        
        # Notification button
        self.notification_btn = ctk.CTkButton(
            top_frame,
            text="🔔",
            width=40,
            height=40,
            font=ctk.CTkFont(size=18),
            fg_color="#404040",
            hover_color="#505050",
            command=self.toggle_notifications
        )
        self.notification_btn.pack(side="right", padx=20, pady=10)
        
        # Main content area
        content_frame = ctk.CTkFrame(self.app, fg_color="#2b2b2b")
        content_frame.pack(fill="both", expand=True, padx=10, pady=(0, 10))
        
        welcome_label = ctk.CTkLabel(
            content_frame,
            text="Click the notification bell to see the dropdown",
            font=ctk.CTkFont(size=14),
            text_color="#9aa0a6"
        )
        welcome_label.pack(expand=True)
    
    def toggle_notifications(self):
        if self.notification_dropdown and self.notification_dropdown.dropdown:
            self.notification_dropdown.close_dropdown()
        else:
            # Calculate position for dropdown
            btn_x = self.notification_btn.winfo_rootx()
            btn_y = self.notification_btn.winfo_rooty() + self.notification_btn.winfo_height() + 5
            
            # Adjust if dropdown would go off screen
            screen_width = self.app.winfo_screenwidth()
            if btn_x + 350 > screen_width:
                btn_x = screen_width - 350 - 10
                
            self.notification_dropdown = NotificationDropdown(self.app, btn_x, btn_y)
            self.notification_dropdown.create_dropdown()
    
    def run(self):
        self.app.mainloop()

if __name__ == "__main__":
    app = NotificationApp()
    app.run()