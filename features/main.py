import customtkinter as ctk
import sys

from splash import SplashScreen
# from staff.staff_employee import StaffPageEmployee

def main():
    # Initialize database first
    sys.path.append('..')
    from init_database import init_database
    init_database()
    
    # Start the application with splash screen
    app = SplashScreen()
    app.mainloop()

if __name__ == "__main__":
    # Set global appearance
    ctk.set_appearance_mode("light")
    ctk.set_default_color_theme("blue")
    
    main()