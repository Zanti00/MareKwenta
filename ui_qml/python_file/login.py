import sys
import os
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import qmlRegisterType, QmlElement
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QUrl, QObject, Signal, Slot, QTimer

# Register the class for QML
QML_IMPORT_NAME = "MyModule"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement
class MainWindow(QObject):
    # Define signals for communication between Python and QML
    dataChanged = Signal()
    
    def __init__(self):
        super().__init__()
        self.engine = None  # QQmlApplicationEngine reference
        self.secondary_views = {}  # Dictionary to store other open windows
        self.base_path = "C:\\Users\\Detera\\Desktop\\Py\\MareKwenta\\ui_qml\\mareKwentaContent\\mareKwenta"  # Base path for QML files

        # Create a timer for delayed navigation
        self.navigation_timer = QTimer()
        self.navigation_timer.setSingleShot(True)
        self.navigation_timer.timeout.connect(self._performNavigation)
        self.pending_page = None
    
    def set_engine(self, engine):
        """Set the QQmlApplicationEngine reference"""
        self.engine = engine
    
    def get_main_window(self):
        """Get the main window object from QML"""
        if self.engine:
            root_objects = self.engine.rootObjects()
            if root_objects:
                return root_objects[0]  # Return the first (main) window
        return None
    
    @Slot(str)
    def handleButtonClick(self, message):
        print(f"Button clicked with message: {message}")
    
    @Slot(str)
    def navigateToPage(self, page_name):
        """Navigate to a different page by creating a new window"""
        print(f"=== Navigating to: {page_name} ===")
        
        if page_name in self.secondary_views:
            # Window already exists, just show it
            print(f"Window {page_name} already exists, bringing to front")
            self.secondary_views[page_name].show()
            self.secondary_views[page_name].raise_()
            return
        
        try:
            # Create a new QQmlApplicationEngine for the secondary window
            secondary_engine = QQmlApplicationEngine()
            
            # Make Python object available to the new window
            secondary_engine.rootContext().setContextProperty("mainWindow", self)
            
            # Construct QML file path
            qml_file_path = os.path.join(self.base_path, f"{page_name}.qml")
            qml_url = QUrl.fromLocalFile(qml_file_path)
            
            print(f"Loading QML file: {qml_file_path}")
            
            # Load the QML file
            secondary_engine.load(qml_url)
            
            # Check for errors
            root_objects = secondary_engine.rootObjects()
            if not root_objects:
                print(f"Error: No root objects found for {page_name}")
                return
            
            # Store the engine (not the window object) to keep it alive
            self.secondary_views[page_name] = secondary_engine
            
            # Get the window object and connect its closing signal
            window_obj = root_objects[0]
            if hasattr(window_obj, 'closing'):
                window_obj.closing.connect(lambda: self.closeWindow(page_name))
            
            print(f"Successfully opened {page_name} window")
            
        except Exception as e:
            print(f"Error creating {page_name} window: {str(e)}")
    
    @Slot(str)
    def closeWindow(self, page_name):
        """Close a specific window"""
        if page_name in self.secondary_views:
            # The engine will be destroyed, which closes the window
            del self.secondary_views[page_name]
            print(f"Closed {page_name} window")
    
    @Slot()
    def closeAllSecondaryWindows(self):
        """Close all secondary windows but keep main window open"""
        for page_name in list(self.secondary_views.keys()):
            del self.secondary_views[page_name]
        self.secondary_views.clear()
        print("Closed all secondary windows")
    
    @Slot()
    def login_clicked(self):
        """Handle the login click specifically"""
        print("=== Login clicked - scheduling navigation ===")
        self.pending_page = "Cash_Box_Employee"  # Or whatever page you want to navigate to
        # Delay navigation by 50ms to allow click handler to complete
        self.navigation_timer.start(50)
    
    def _performNavigation(self):
        """Actually perform the navigation after delay"""
        if self.pending_page:
            print(f"=== Performing delayed navigation to: {self.pending_page} ===")
            self.navigateToPage(self.pending_page)
            self.pending_page = None

def main():
    # Use QGuiApplication instead of QApplication for better QML support
    app = QGuiApplication(sys.argv)

    # Create the QML application engine
    engine = QQmlApplicationEngine()
    
    # Create your Python object
    main_window = MainWindow()
    main_window.set_engine(engine)  # Set the engine reference
    
    # Make Python object available to QML
    engine.rootContext().setContextProperty("mainWindow", main_window)
    
    # Load your initial QML file (Login)
    qml_file = QUrl.fromLocalFile("C:\\Users\\Detera\\Desktop\\Py\\MareKwenta\\ui_qml\\mareKwentaContent\\mareKwenta\\Login.qml")
    engine.load(qml_file)
    
    # Check if the QML file loaded successfully
    root_objects = engine.rootObjects()
    if not root_objects:
        print("Error loading initial QML file")
        sys.exit(-1)
    
    # Get the main window object
    main_window_obj = root_objects[0]
    
    # Handle main window closing
    if hasattr(main_window_obj, 'closing'):
        main_window_obj.closing.connect(lambda: main_window.closeAllSecondaryWindows())
    
    # Run the application
    sys.exit(app.exec())

if __name__ == "__main__":
    main()