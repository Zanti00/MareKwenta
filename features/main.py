import customtkinter as ctk
import sys
import os

# Add the parent directory to the path to access models
# sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


from splash import SplashScreen

# def init_database():
#     """Initialize all database tables"""
#     try:
#         print("Initializing database tables...")
        
#         # Import model files to create tables in correct order
#         import models.user_model
#         import models.inventory_model
#         import models.product
#         import models.product_type
#         import models.product_ingredients_recipe
#         import models.ticket
#         import models.ticket_payment
#         import models.ticket_line_id
        
#         print("Database initialization completed successfully!")
        
#     except Exception as e:
#         print(f"Error initializing database: {e}")

if __name__ == "__main__":
    # Set global appearance
    ctk.set_appearance_mode("light")
    ctk.set_default_color_theme("blue")
    
    # Initialize database first
    # init_database()
    
    # Start the application with splash screen
    app = SplashScreen()
    app.mainloop()