import sys
import os
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import qmlRegisterType
from PySide6.QtQuick import QQuickView
from PySide6.QtCore import QUrl, QObject, Signal, Slot, QTimer, Property


class NavBarHandler(QObject):
    """
    Navigation handler for the application navbar.
    Manages navigation between different QML pages using QQuickView windows.
    """
    
    # Signals
    navigationChanged = Signal(str)
    dataChanged = Signal()
    
    def __init__(self):
        super().__init__()
        self.current_view = None  # Currently active window
        self.all_views = []  # Track all open windows
        self.cash_box_view = None  # Specific reference to cash_box window
        self.add_expense_view = None  # Specific reference to add_expense window
        self.base_path = r"C:\Users\Detera\Desktop\Py\MareKwenta\ui_qml\MareKwentaContent\mareKwenta"
        self._current_page = "inventory.qml"
        
        # Create a timer for delayed navigation
        self.navigation_timer = QTimer()
        self.navigation_timer.setSingleShot(True)
        self.navigation_timer.timeout.connect(self._performNavigation)
        self.pending_page = None
        self.pending_action = "replace"  # "replace" or "new_window"
        
    def set_current_view(self, view):
        """Set the current active view reference"""
        self.current_view = view
        if view not in self.all_views:
            self.all_views.append(view)
        
    @Property(str, notify=navigationChanged)
    def currentPage(self):
        """Current active page property"""
        return self._current_page
    
    @currentPage.setter
    def currentPage(self, page):
        if self._current_page != page:
            self._current_page = page
            self.navigationChanged.emit(page)
    
    def _get_qml_path(self, filename):
        """Get full path to QML file"""
        return os.path.join(self.base_path, filename)
    
    def _load_page_in_window(self, qml_filename, window_title="MareKwenta", close_current=True):
        """Load a QML page in a new window, optionally closing the current one"""
        qml_path = self._get_qml_path(qml_filename)
        
        # Check if file exists
        if not os.path.exists(qml_path):
            print(f"Error: QML file not found at {qml_path}")
            return False
        
        # Store reference to current view before creating new one
        old_view = self.current_view if close_current else None
        
        # Create new window for the page
        new_view = QQuickView()
        new_view.rootContext().setContextProperty("navHandler", self)
        
        # Load the QML file
        qml_url = QUrl.fromLocalFile(qml_path)
        new_view.setSource(qml_url)
        
        if new_view.status() == QQuickView.Error:
            print(f"Error loading QML file {qml_filename}:")
            for error in new_view.errors():
                print(error.toString())
            return False
        
        # Set window properties
        page_display_name = qml_filename.replace('.qml', '').replace('_', ' ').title()
        new_view.setTitle(f"{window_title} - {page_display_name}")
        
        # Handle special cases for cash_box and add_expense relationship
        if qml_filename == "cash_box.qml":
            self.cash_box_view = new_view
            # Close any existing add_expense window when opening cash_box
            if self.add_expense_view:
                self.add_expense_view.close()
                if self.add_expense_view in self.all_views:
                    self.all_views.remove(self.add_expense_view)
                self.add_expense_view = None
                
        elif qml_filename == "add_expense.qml":
            self.add_expense_view = new_view
            # Set up close event handler for add_expense
            new_view.closing.connect(self._on_add_expense_closed)
        
        # Add to our list of views
        self.all_views.append(new_view)
        
        # Set the new view as current BEFORE showing it
        self.current_view = new_view
        
        # Show the new window
        new_view.show()
        
        # Close the old window ONLY if close_current is True
        if close_current and old_view and old_view != new_view:
            old_view.close()
            if old_view in self.all_views:
                self.all_views.remove(old_view)
            # Clear specific references if needed
            if old_view == self.cash_box_view:
                self.cash_box_view = None
            elif old_view == self.add_expense_view:
                self.add_expense_view = None
        
        # Update current page
        self.currentPage = qml_filename
        print(f"Navigated to: {qml_filename} (close_current: {close_current})")
        return True
    
    def _open_new_window(self, qml_filename, window_title="MareKwenta"):
        """Open a QML page in a new window without closing existing windows"""
        return self._load_page_in_window(qml_filename, window_title, close_current=False)
    
    @Slot()
    def navigateToInventory(self):
        """Navigate to inventory page"""
        self.pending_page = "inventory.qml"
        self.pending_action = "replace"
        self.navigation_timer.start(50)
    
    @Slot()
    def navigateToCashBox(self):
        """Navigate to cash box page"""
        self.pending_page = "cash_box.qml"
        self.pending_action = "replace"
        self.navigation_timer.start(50)
    
    @Slot()
    def navigateToStaff(self):
        """Navigate to staff/owner page"""
        self.pending_page = "staff_owner.qml"
        self.pending_action = "replace"
        self.navigation_timer.start(50)
    
    @Slot()
    def navigateToDashboard(self):
        """Navigate to dashboard page"""
        self.pending_page = "dashboard.qml"
        self.pending_action = "replace"
        self.navigation_timer.start(50)
    
    def _on_add_expense_closed(self):
        """Handle when add_expense window is closed"""
        print("Add expense window closed")
        if self.add_expense_view in self.all_views:
            self.all_views.remove(self.add_expense_view)
        self.add_expense_view = None
        
        # If cash_box is still open, make it the current view
        if self.cash_box_view and self.cash_box_view in self.all_views:
            self.current_view = self.cash_box_view
            self.currentPage = "cash_box.qml"
            print("Returned focus to cash_box window")
    
    def _close_cash_box_and_add_expense(self):
        """Close both cash_box and add_expense windows"""
        if self.add_expense_view:
            self.add_expense_view.close()
            if self.add_expense_view in self.all_views:
                self.all_views.remove(self.add_expense_view)
            self.add_expense_view = None
            
        if self.cash_box_view:
            self.cash_box_view.close()
            if self.cash_box_view in self.all_views:
                self.all_views.remove(self.cash_box_view)
            self.cash_box_view = None
        
        print("Closed cash_box and add_expense windows")
    
    def _performNavigation(self):
        """Actually perform the navigation after delay"""
        if self.pending_page:
            print(f"=== Performing delayed navigation to: {self.pending_page} (action: {self.pending_action}) ===")
            
            # If navigating away from cash_box to any other page, close both cash_box and add_expense
            if (self._current_page == "cash_box.qml" and 
                self.pending_page != "add_expense.qml" and 
                self.pending_action == "replace"):
                print("Navigating away from cash_box - closing cash_box and add_expense windows")
                self._close_cash_box_and_add_expense()
            
            if self.pending_action == "new_window":
                self._open_new_window(self.pending_page)
            else:
                self._load_page_in_window(self.pending_page)
            
            self.pending_page = None
            self.pending_action = "replace"
    
    @Slot(str)
    def navigateToPage(self, page_name):
        """
        Generic navigation method
        Args:
            page_name (str): Name of the page to navigate to
        """
        valid_pages = {
            "inventory": "inventory.qml",
            "cashbox": "cash_box.qml", 
            "staff": "staff_owner.qml",
            "dashboard": "dashboard.qml"
        }
        
        if page_name.lower() in valid_pages:
            self.pending_page = valid_pages[page_name.lower()]
            self.pending_action = "replace"
            self.navigation_timer.start(50)
        else:
            print(f"Warning: Unknown page '{page_name}'")
    

    @Slot()
    def goHome(self):
        """Navigate back to home/default page (inventory)"""
        self.navigateToInventory()
    
    @Slot(str)
    def handleButtonClick(self, message):
        """Handle general button clicks"""
        print(f"Button clicked with message: {message}")
    
    @Slot()
    def closeCurrentWindow(self):
        """Close the current active window"""
        if self.current_view:
            self.current_view.close()
            if self.current_view in self.all_views:
                self.all_views.remove(self.current_view)
            self.current_view = None
            print("Closed current window")
    
    @Slot()
    def closeAllWindows(self):
        """Close all open windows"""
        for view in self.all_views[:]:  # Copy list to avoid modification during iteration
            view.close()
        self.all_views.clear()
        self.current_view = None
        print("Closed all windows")
    
    @Slot()
    def login_clicked(self):
        """Handle the login click - navigate to inventory"""
        print("=== Login clicked - navigating to inventory ===")
        self.navigateToInventory()

    @Slot()
    def linkIngredientsClicked(self):
        """Navigate to linking ingredients page"""
        self.pending_page = "linking_ingredients.qml"
        self.pending_action = "replace"
        self.navigation_timer.start(50)
    
    @Slot()
    def inventoryClicked(self):
        """Navigate to inventory page"""
        self.pending_page = "inventory.qml"
        self.pending_action = "replace"
        self.navigation_timer.start(50)
    
    @Slot()
    def addExpenseButtonClicked(self):
        """Handle the add expense button click - open as popup only from cash_box"""
        print("=== Add expense button clicked ===")
        
        # Only open in new window if currently in cash_box, otherwise replace
        if self._current_page == "cash_box.qml":
            print("Opening add_expense as popup window (keeping cash_box open)")
            self.pending_page = "add_expense.qml"
            self.pending_action = "new_window"
        else:
            print("Replacing current window with add_expense")
            self.pending_page = "add_expense.qml"
            self.pending_action = "replace"
        
        self.navigation_timer.start(50)

def register_nav_types():
    """Register the NavBarHandler type for QML usage"""
    qmlRegisterType(NavBarHandler, "Navigation", 1, 0, "NavBarHandler")

        
def main():
    app = QApplication(sys.argv)

    # Register the navigation handler type
    register_nav_types()

    # Create the main QML view (Initial page)
    main_view = QQuickView()
    
    # Create the navigation handler
    nav_handler = NavBarHandler()
    nav_handler.set_current_view(main_view)
    
    # Make navigation handler available to QML
    main_view.rootContext().setContextProperty("navHandler", nav_handler)
    
    # Load your initial QML file
    qml_file = QUrl.fromLocalFile(r"C:\Users\Detera\Desktop\Py\MareKwenta\ui_qml\MareKwentaContent\mareKwenta\inventory.qml")
    main_view.setSource(qml_file)
    
    if main_view.status() == QQuickView.Error:
        print("Error loading initial QML file:")
        for error in main_view.errors():
            print(error.toString())
        sys.exit(-1)

    # Set window properties
    main_view.setTitle("MareKwenta - Inventory")
    main_view.show()
    
    print("MareKwenta application started successfully!")
    
    # Run the application
    sys.exit(app.exec())


if __name__ == "__main__":
    main()