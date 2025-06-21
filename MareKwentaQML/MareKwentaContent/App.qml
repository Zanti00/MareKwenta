// app.qml
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "mareKwenta"

Window {
    id: app_window
    objectName: "app_window"
    width: main_screen.width
    height: main_screen.height

    visible: true
    title: "MareKwenta"

    Loader {
        id: main_screen
        width: 1440
        height: 1024
        anchors.fill: parent
        source: "Ticket_Main.qml"

        onLoaded: {
            if (item) {
                item.show_product_modifier.connect(product_modifier_popup.open_popup);
            }
        }
    }

    // --- The Modifier_popup component ---
    Modifier_popup {
        id: product_modifier_popup
        objectName: "product_modifier_popup"
        parent: app_window.overlay

        function open_popup(product_name_text, type) {
            // Reset state for a new product selection
            productName = product_name_text;
            productType=type;
            selectedQuantity = 1;
            selectedSize = "";
            selectedTemperature = "";
            selectedExtras = [];
            product_modifier_popup.open();
        }

        onProductModified: (name, quantity, size, temperature, extras) => {
            console.log("Product Modified (from app.qml):");
            console.log("  Name:", name);
            console.log("  Quantity:", quantity);
            console.log("  Size:", size);
            console.log("  Temperature:", temperature);
            console.log("  Extras:", extras);

            if (main_screen.item && main_screen.item.ticket_loader && main_screen.item.ticket_loader.item) {
                 main_screen.item.ticket_loader.item.add_item_to_order(name, quantity, size, temperature, extras); // snake_case function call
            } else {
                console.warn("Could not find Ticket_Panel item to add order.");
            }
        }

        onCancelled: () => {
            console.log("Product modification cancelled (from app.qml).");
        }
    }
    Split_content {
            id: split_payment_popup
            objectName: "split_payment_popup"
            anchors.centerIn: parent
            isModal: true
            closePopupPolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            popupBackground: Rectangle {
                color: Qt.rgba(0, 0, 0, 0.5)
            }

            onCharge: { (split_data) => {
                console.log("Charge signal received with data:", split_data);
                split_payment_popup.close();
            }}

            onCloseRequested: {
                console.log("Close requested from Split_content popup.");
                split_payment_popup.close();
            }
    }

}
