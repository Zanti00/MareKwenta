#!/usr/bin/env python3
import sys
import os
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QmlElement, qmlRegisterType
from PySide6.QtQuickControls2 import QQuickStyle
from PySide6.QtCore import QObject, Signal, Slot, Property
from PySide6.QtQml import QQmlApplicationEngine

# Navigation handler class
QML_IMPORT_NAME = "NavigationHandler"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement
class NavigationHandler(QObject):
    """
    Navigation handler for QML interface
    This class handles navigation between different sections of the application
    """
    
    # Signals for navigation events
    navigationChanged = Signal(str)
    
    def __init__(self):
        super().__init__()
        self._current_page = "ticket"
    
    @Property(str, notify=navigationChanged)
    def currentPage(self):
        return self._current_page
    
    @currentPage.setter
    def currentPage(self, page):
        if self._current_page != page:
            self._current_page = page
            self.navigationChanged.emit(page)
            print(f"Navigation changed to: {page}")
    
    @Slot()
    def navigateToInventory(self):
        """Navigate to inventory page"""
        self.currentPage = "inventory"
        print("Navigated to Inventory")
    
    @Slot()
    def navigateToStaff(self):
        """Navigate to staff page"""
        self.currentPage = "staff"
        print("Navigated to Staff")
    
    @Slot()
    def navigateToReceipt(self):
        """Navigate to receipt page"""
        self.currentPage = "receipt"
        print("Navigated to Receipt")
    
    @Slot()
    def navigateToCashBox(self):
        """Navigate to cashbox page"""
        self.currentPage = "cashbox"
        print("Navigated to CashBox")
    
    @Slot()
    def navigateToTicket(self):
        """Navigate to ticket page"""
        self.currentPage = "ticket"
        print("Navigated to Ticket")
    
    @Slot()
    def navigateToDashboard(self):
        """Navigate to dashboard page"""
        self.currentPage = "dashboard"
        print("Navigated to Dashboard")

class MareKwentaApp:
    """
    Main application class for MareKwenta
    """
    
    def __init__(self):
        self.app = QGuiApplication(sys.argv)
        self.engine = QQmlApplicationEngine()
        self.nav_handler = NavigationHandler()
        
        # Set up the application
        self.setup_application()
        
    def setup_application(self):
        """Setup the QML application"""
        
        # Set application properties
        self.app.setApplicationName("MareKwenta")
        self.app.setApplicationVersion("1.0.0")
        self.app.setOrganizationName("MareKwenta Systems")
        
        # Set the QuickControls style (optional)
        QQuickStyle.setStyle("Material")
        
        # Register the navigation handler
        self.engine.rootContext().setContextProperty("navHandler", self.nav_handler)
        
        # Register QML types
        qmlRegisterType(NavigationHandler, "NavigationHandler", 1, 0, "NavigationHandler")
        
        # Add import paths if needed
        current_dir = os.path.dirname(os.path.abspath(__file__))
        # Go up one directory level (exit python_file folder)
        parent_dir = os.path.dirname(current_dir)
        # Navigate to MareKwentaContent/mareKwenta
        marekwenta_dir = os.path.join(parent_dir, "MareKwentaContent", "mareKwenta")
        
        # Add both directories to import path
        self.engine.addImportPath(current_dir)
        self.engine.addImportPath(parent_dir)
        self.engine.addImportPath(marekwenta_dir)
        
        # Connect quit signal
        self.engine.quit.connect(self.app.quit)
        
        # Load the main QML file from MareKwentaContent/mareKwenta directory
        qml_file = os.path.join(marekwenta_dir, "main_window.qml")
        
        # Check if the file exists
        if not os.path.exists(qml_file):
            sys.exit(-1)
        
        self.engine.load(qml_file)
        
        # Check if QML loaded successfully
        if not self.engine.rootObjects():
            print("Failed to load QML file")
            sys.exit(-1)
            
        print("MareKwenta application started successfully")
    
    def run(self):
        """Run the application"""
        return self.app.exec()

def main():
    """Main function"""
    try:
        # Create and run the application
        app = MareKwentaApp()
        exit_code = app.run()
        print(f"Application exited with code: {exit_code}")
        return exit_code
        
    except Exception as e:
        print(f"Error running application: {e}")
        return -1

if __name__ == "__main__":
    sys.exit(main())