import sys
import os
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import qmlRegisterType
from PySide6.QtQuick import QQuickView
from PySide6.QtCore import QUrl, QObject, Signal, Slot, QTimer

class MainWindow(QObject):
    # Define signals for communication between Python and QML
    dataChanged = Signal()
    
    def __init__(self):
        super().__init__()
        self.view = None
        self.base_path = "C:\\Users\\Detera\\Desktop\\Py\\MareKwenta\\ui_qml\\mareKwentaContent\\mareKwenta"
        
        # Create a timer for delayed navigation
        self.navigation_timer = QTimer()
        self.navigation_timer.setSingleShot(True)
        self.navigation_timer.timeout.connect(self._performNavigation)
        self.pending_page = None
    
    def set_view(self, view):
        """Set the QQuickView reference"""
        self.view = view
    
    @Slot(str)
    def handleButtonClick(self, message):
        print(f"Button clicked with message: {message}")
    
    @Slot()
    def createIngredientsClicked(self):
        """Handle the create ingredients button click"""
        print("=== Create Ingredients Button Clicked ===")
        
        if not self.view:
            print("Error: View not set")
            return
        
        # Get the root object to access QML elements
        root_object = self.view.rootObject()
        if not root_object:
            print("Error: Could not get root object")
            return
        
        try:
            # Debug: List all available objects
            print("=== Available QML objects ===")
            self.list_qml_objects(root_object)
            
            # Get text from input fields
            ingredient_name = self.get_qml_text(root_object, "ingredientname_input")
            amount_in_stock = self.get_qml_text(root_object, "amountinstock_input")
            cost = self.get_qml_text(root_object, "cost_input")
            
            print(f"Retrieved values:")
            print(f"  Ingredient Name: '{ingredient_name}'")
            print(f"  Amount in Stock: '{amount_in_stock}'")
            print(f"  Cost: '{cost}'")
            
            # Only update if we got valid text
            if ingredient_name:
                success1 = self.set_qml_text(root_object, "ingredient_text", ingredient_name)
                print(f"Set ingredient_text: {success1}")
            else:
                print("Warning: ingredient_name is empty")
                
            if amount_in_stock:
                success2 = self.set_qml_text(root_object, "quantity_text", amount_in_stock)
                print(f"Set quantity_text: {success2}")
            else:
                print("Warning: amount_in_stock is empty")
            
            print("Processing completed!")
            
        except Exception as e:
            print(f"Error processing ingredients: {e}")
            import traceback
            traceback.print_exc()
    
    def get_qml_text(self, root_object, object_name):
        """Get text from a QML TextInput element"""
        try:
            qml_object = root_object.findChild(QObject, object_name)
            if qml_object:
                # For TextInput elements - use property method
                text_value = qml_object.property('text')
                print(f"  Found {object_name}: '{text_value}'")
                return text_value if text_value else ""
            else:
                print(f"  ERROR: Could not find QML object: {object_name}")
                return ""
        except Exception as e:
            print(f"  ERROR getting text from {object_name}: {e}")
            return ""
    
    def set_qml_text(self, root_object, object_name, text_value):
        """Set text to a QML text element"""
        try:
            qml_object = root_object.findChild(QObject, object_name)
            if qml_object:
                # Set the text property
                qml_object.setProperty('text', text_value)
                print(f"  Successfully set {object_name} to: '{text_value}'")
                return True
            else:
                print(f"  ERROR: Could not find QML object: {object_name}")
                return False
        except Exception as e:
            print(f"  ERROR setting text for {object_name}: {e}")
            return False
    
    def list_qml_objects(self, obj, depth=0):
        """Debug helper to list all QML objects and their objectNames"""
        indent = "  " * depth
        obj_name = obj.objectName() if hasattr(obj, 'objectName') else "No objectName"
        class_name = obj.__class__.__name__
        print(f"{indent}{class_name}: objectName='{obj_name}'")
        
        # List children
        if hasattr(obj, 'children'):
            for child in obj.children():
                if hasattr(child, '__class__'):
                    self.list_qml_objects(child, depth + 1)
    
    @Slot(str)
    def navigateToPage(self, page_name):
        """Navigate to a different QML page"""
        print(f"=== Attempting to navigate to: {page_name} ===")
        
        if not self.view:
            print("Error: View not set")
            return
            
        # Unified page mapping for both directions
        page_mapping = {
            "inventory": "inventory.qml",
            "linking_ingredients": "linking_ingredients.qml",
            "ingredients": "linking_ingredients.qml",  # Alternative name
            "entry": "inventory.qml"  # Alternative name
        }
        
        if page_name in page_mapping:
            qml_file = os.path.join(self.base_path, page_mapping[page_name])
            print(f"Full path: {qml_file}")
            
            # Check if file exists
            if not os.path.exists(qml_file):
                print(f"ERROR: File does not exist: {qml_file}")
                return
            
            qml_url = QUrl.fromLocalFile(qml_file)
            print(f"QML URL: {qml_url.toString()}")
            
            # Clear the current source first to avoid conflicts
            self.view.setSource(QUrl())
            
            # Small delay to ensure cleanup
            QTimer.singleShot(10, lambda: self._loadNewPage(qml_url, page_name))
        else:
            print(f"Unknown page: {page_name}")
    
    def _loadNewPage(self, qml_url, page_name):
        """Load the new QML page after cleanup"""
        # Load the new QML file
        self.view.setSource(qml_url)
        
        # Check for errors
        if self.view.status() == QQuickView.Error:
            print("Error loading QML file:")
            for error in self.view.errors():
                print(f"  - {error.toString()}")
        else:
            print(f"Successfully navigated to {page_name}")
    
    # Navigation methods for specific pages
    @Slot()
    def inventoryClicked(self):
        """Navigate to inventory page"""
        self.pending_page = "inventory"
        self.navigation_timer.start(50)
    
    @Slot()
    def linkIngredientsClicked(self):
        """Navigate to linking ingredients page"""
        self.pending_page = "linking_ingredients"
        self.navigation_timer.start(50)
    
    # Alternative method names for compatibility
    @Slot()
    def goToInventory(self):
        """Alternative method to navigate to inventory"""
        self.inventoryClicked()
    
    @Slot()
    def goToLinkingIngredients(self):
        """Alternative method to navigate to linking ingredients"""
        self.linkIngredientsClicked()
    
    def _performNavigation(self):
        """Actually perform the navigation after delay"""
        if self.pending_page:
            print(f"=== Performing delayed navigation to: {self.pending_page} ===")
            self.navigateToPage(self.pending_page)
            self.pending_page = None

def main():
    app = QApplication(sys.argv)
    
    # Create the QML engine
    view = QQuickView()
    
    # Create your Python object
    main_window = MainWindow()
    main_window.set_view(view)  # Set the view reference
    
    # Register your Python class with QML (optional)
    qmlRegisterType(MainWindow, "MyModule", 1, 0, "MainWindow")
    
    # Make Python object available to QML
    view.rootContext().setContextProperty("mainWindow", main_window)
    
    # Load your initial QML file (start with inventory)
    qml_file = QUrl.fromLocalFile(r"C:\Users\Detera\Desktop\Py\MareKwenta\ui_qml\mareKwentaContent\mareKwenta\inventory.qml")
    view.setSource(qml_file)
    
    if view.status() == QQuickView.Error:
        print("Error loading initial QML file:")
        for error in view.errors():
            print(error.toString())
        sys.exit(-1)

    # Show the window
    view.show()
    
    # Run the application
    sys.exit(app.exec())

if __name__ == "__main__":
    main()