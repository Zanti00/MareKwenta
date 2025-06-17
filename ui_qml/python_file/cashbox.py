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
        self.main_view = None  # Cash_Box_Employee view
        self.secondary_views = {}  # Dictionary to store other open windows
        self.base_path = "C:\\Users\\Detera\\Desktop\\Py\\MareKwenta\\ui_qml\\mareKwentaContent\\mareKwenta"  # Base path for QML files

        # Create a timer for delayed navigation
        self.navigation_timer = QTimer()
        self.navigation_timer.setSingleShot(True)
        self.navigation_timer.timeout.connect(self._performNavigation)
        self.pending_page = None
    
    def set_main_view(self, view):
        """Set the main QQuickView reference (Cash_Box_Employee)"""
        self.main_view = view
    
    @Slot(str)
    def handleButtonClick(self, message):
        print(f"Button clicked with message: {message}")
    
    @Slot(str)
    def navigateToPage(self, page_name):
        """Navigate to a different QML page in a new window"""
        print(f"=== Attempting to navigate to: {page_name} ===")
        
        # Map page names to QML files
        page_mapping = {
            "addexpense": "AddExpense.qml",
            "ingredients": "Ingredients.qml",  # Add other pages as needed
            "cashbox": "Cash_Box_employee.qml"
        }
        
        if page_name in page_mapping:
            # Check if window is already open
            if page_name in self.secondary_views:
                # Bring existing window to front
                existing_view = self.secondary_views[page_name]
                existing_view.raise_()
                existing_view.requestActivate()
                print(f"Brought existing {page_name} window to front")
                return
            
            qml_file = os.path.join(self.base_path, page_mapping[page_name])
            print(f"Full path: {qml_file}")
            
            # Check if file exists
            if not os.path.exists(qml_file):
                print(f"ERROR: File does not exist: {qml_file}")
                return
            
            # Create new window for the page
            new_view = QQuickView()
            
            # Make Python object available to the new QML window
            new_view.rootContext().setContextProperty("mainWindow", self)
            
            qml_url = QUrl.fromLocalFile(qml_file)
            print(f"QML URL: {qml_url.toString()}")
            
            # Load the new QML file in the new window
            new_view.setSource(qml_url)
            
            # Check for errors
            if new_view.status() == QQuickView.Error:
                print("Error loading QML file:")
                for error in new_view.errors():
                    print(f"  - {error.toString()}")
                new_view.deleteLater()
                return
            
            # Store the new view and show it
            self.secondary_views[page_name] = new_view
            new_view.show()
            
            # Connect window closing to cleanup
            new_view.closing.connect(lambda: self.cleanup_window(page_name))
            
            print(f"Successfully opened {page_name} in new window")
        else:
            print(f"Unknown page: {page_name}")
    
    def cleanup_window(self, page_name):
        """Clean up when a secondary window is closed"""
        if page_name in self.secondary_views:
            print(f"Cleaning up {page_name} window")
            del self.secondary_views[page_name]
    
    @Slot(str)
    def closeWindow(self, page_name):
        """Close a specific window"""
        if page_name in self.secondary_views:
            self.secondary_views[page_name].close()
            del self.secondary_views[page_name]
            print(f"Closed {page_name} window")
    
    @Slot()
    def closeAllSecondaryWindows(self):
        """Close all secondary windows but keep main window open"""
        for page_name, view in list(self.secondary_views.items()):
            view.close()
        self.secondary_views.clear()
        print("Closed all secondary windows")
    
    @Slot()
    def linkIngredientsClicked(self):
        """Handle the link_ingredients click specifically"""
        print("=== Link ingredients clicked - scheduling navigation ===")
        self.pending_page = "ingredients"
        # Delay navigation by 50ms to allow click handler to complete
        self.navigation_timer.start(50)
    
    @Slot()
    def addExpenseButtonClicked(self):
        """Handle the addexpense_button click specifically"""
        print("=== Add expense button clicked - scheduling navigation ===")
        self.pending_page = "addexpense"
        # Delay navigation by 50ms to allow click handler to complete
        self.navigation_timer.start(50)
    
    def _performNavigation(self):
        """Actually perform the navigation after delay"""
        if self.pending_page:
            print(f"=== Performing delayed navigation to: {self.pending_page} ===")
            self.navigateToPage(self.pending_page)
            self.pending_page = None

def main():
    app = QApplication(sys.argv)
    
    # Create the main QML view (Cash_Box_Employee)
    main_view = QQuickView()
    
    # Create your Python object
    main_window = MainWindow()
    main_window.set_main_view(main_view)  # Set the main view reference
    
    # Register your Python class with QML (optional)
    qmlRegisterType(MainWindow, "MyModule", 1, 0, "MainWindow")
    
    # Make Python object available to QML
    main_view.rootContext().setContextProperty("mainWindow", main_window)
    
    # Load your initial QML file (Cash_Box_Employee)
    qml_file = QUrl.fromLocalFile("C:\\Users\\Detera\\Desktop\\Py\\MareKwenta\\ui_qml\\mareKwentaContent\\mareKwenta\\Cash_Box_employee.qml")
    main_view.setSource(qml_file)
    
    if main_view.status() == QQuickView.Error:
        print("Error loading initial QML file:")
        for error in main_view.errors():
            print(error.toString())
        sys.exit(-1)

    # Show the main window
    main_view.show()
    
    # Handle main window closing
    main_view.closing.connect(lambda: main_window.closeAllSecondaryWindows())
    
    # Run the application
    sys.exit(app.exec())

if __name__ == "__main__":
    main()