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
        """Set the main QQuickView reference (Login)"""
        self.main_view = view
    
    @Slot(str)
    def handleButtonClick(self, message):
        print(f"Button clicked with message: {message}")
    
    
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
    def login_clicked(self):
        """Handle the login click specifically"""
        print("=== Login clicked - scheduling navigation ===")
        self.pending_page = "login"
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

    # Create the main QML view (Login)
    main_view = QQuickView()
    
    # Create your Python object
    main_window = MainWindow()
    main_window.set_main_view(main_view)  # Set the main view reference
    
    # Register your Python class with QML (optional)
    qmlRegisterType(MainWindow, "MyModule", 1, 0, "MainWindow")
    
    # Make Python object available to QML
    main_view.rootContext().setContextProperty("mainWindow", main_window)
    
    # Load your initial QML file (Cash_Box_Employee)
    qml_file = QUrl.fromLocalFile("C:\\Users\\Detera\\Desktop\\Py\\MareKwenta\\ui_qml\\mareKwentaContent\\mareKwenta\\Login.qml")
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