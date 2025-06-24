import sys
import os
import os
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QUrl

os.environ["QT_QUICK_CONTROLS_STYLE"] = "Material"
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Get the directory of the current script (ticketpage.py)
    current_script_dir = os.path.dirname(__file__)

    # --- UPDATED PATH HERE (corrected based on latest info) ---
    # Navigate:
    # 1. Up from 'Ticket' folder (where ticketpage.py is) to the project root ('MAREKWENTA')
    # 2. Down into 'MareKwentaQML'
    # 3. Down into 'MareKwentaContent' (where Ticket_Main_PageForm.ui.qml resides)
    qml_file_path = os.path.join(
        current_script_dir,
        '..',                 # Go up one level (from 'Ticket' to 'MAREKWENTA')
        'MareKwentaContent',  # Go into 'MareKwentaContent'
        'App.qml' # Your target QML file
    )
    # --- END UPDATED PATH ---

    # For debugging: print the resolved path to verify it's correct
    print(f"Attempting to load QML from: {os.path.abspath(qml_file_path)}")

    if not os.path.exists(qml_file_path):
        print(f"Error: QML file not found at {os.path.abspath(qml_file_path)}")
        sys.exit(1)

    engine.load(QUrl.fromLocalFile(qml_file_path))

    if not engine.rootObjects():
        print("Error: Failed to load QML or create root objects.")
        sys.exit(-1)

    print("QML loaded successfully. Starting application event loop.")
    sys.exit(app.exec())