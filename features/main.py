import customtkinter as ctk

from splash import SplashScreen
# from staff.staff_employee import StaffPageEmployee

if __name__ == "__main__":
    # Set global appearance
    ctk.set_appearance_mode("light")
    ctk.set_default_color_theme("blue")
    
    # Start the application with splash screen
    app = SplashScreen()
    app.mainloop()