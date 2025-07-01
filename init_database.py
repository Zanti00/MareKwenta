import os
import sqlite3

def init_database():
    """Initialize the database by running all model files"""
    print("Initializing database...")
    
    # Get the base path
    base_path = os.path.dirname(os.path.abspath(__file__))
    
    # List of model files to run in order
    model_files = [
        "models/inventory_model.py",
        "models/product.py", 
        "models/product_type.py",
        "models/product_ingredients_recipe.py"
    ]
    
    for model_file in model_files:
        model_path = os.path.join(base_path, model_file)
        if os.path.exists(model_path):
            try:
                print(f"Running {model_file}...")
                exec(open(model_path).read())
            except Exception as e:
                print(f"Error running {model_file}: {e}")
        else:
            print(f"Model file not found: {model_path}")
    
    print("Database initialization complete!")

if __name__ == "__main__":
    init_database()
