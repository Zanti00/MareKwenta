// Ticket_Main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Rectangle {
    id: ticket_main_root
    objectName: "ticket_main_root"
    width: 1440
    height: 1024
    color: "#f2efea"

    // --- Signal ---
    signal show_product_modifier(string product_name, string product_type)

    Text {
        id: title_hello
        x: 104
        y: 29
        width: 130
        height: 48
        color: "#4e2d18"
        text: qsTr("Hello, ")
        font.pixelSize: 36
        font.styleName: "Medium"
        font.family: "Unbounded"
    }

    Text {
        id: text_user
        objectName: "text_user_label"
        x: 232
        y: 31
        color: "#4e2d18"
        text: qsTr("User")
        font.pixelSize: 36
        font.styleName: "Medium"
        font.family: "Unbounded"
    }

    Item {
        id: product_panel_placeholder
        x: 71
        y: 86
        width: 878
        height: 938
        Loader {
            id: product_loader
            objectName: "product_panel_loader"
            x: -50
            y: -8
            width: 1031
            height: 802
            source: "Product_Panel.qml"
            onLoaded: {
                if (item) {
                    item.product_clicked.connect(ticket_main_root.show_product_modifier);
                }
            }
        }
    }

    Item {
        id: ticket_panel_placeholder
        x: 950
        y: 0
        width: 500
        height: 1024
        Loader {
            id: ticket_loader
            objectName: "ticket_panel_loader"
            anchors.fill: parent
            anchors.leftMargin: -117
            anchors.rightMargin: 117
            anchors.topMargin: -8
            anchors.bottomMargin: 8
            source: "Ticket_Panel.qml"
            onLoaded: {
                    item.open_split_popup.connect(function(amount_to_split) {
                        console.log("ticket_main.qml: Received open_split_popup signal. Amount:", amount_to_split);
                        if (split_payment_popup) { // Ensure it exists if local
                            split_payment_popup.totalAmount = amount_to_split;
                            split_payment_popup.open();
                            split_payment_popup.paymentCount = 2;
                            split_payment_popup.updateSplitRows();
                            console.log("ticket_main.qml: Called split_payment_popup.open() and updated properties.");
                        }
                    });
             }
        }
    }
}

