// Ticket_Main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: ticket_main_root
    objectName: "ticket_main_root"
    width: 1240
    height: 1024
    color: "#f2efea"

    // --- Signal ---
    signal show_product_modifier(string product_name, string product_type)

    // Header section
    Item {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        height: 60

        Text {
            id: title_hello
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            color: "#4e2d18"
            text: qsTr("Hello, ")
            font.pixelSize: 36
            font.styleName: "Medium"
            font.family: "Unbounded"
        }

        Text {
            id: text_user
            objectName: "text_user_label"
            anchors.left: title_hello.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 5
            color: "#4e2d18"
            text: qsTr("User")
            font.pixelSize: 36
            font.styleName: "Medium"
            font.family: "Unbounded"
        }
    }

    // Main content area
    Item {
        id: content_area
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        // Product panel - takes up left portion
        Item {
            id: product_panel_placeholder
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: parent.width * 0.6 // 60% of available width

            Loader {
                id: product_loader
                objectName: "product_panel_loader"
                anchors.fill: parent
                anchors.margins: 10
                source: "Product_Panel.qml"
                onLoaded: {
                    if (item) {
                        item.product_clicked.connect(ticket_main_root.show_product_modifier);
                    }
                }
            }
        }

        // Ticket panel - takes up right portion
        Item {
            id: ticket_panel_placeholder
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: product_panel_placeholder.right
            anchors.leftMargin: 10

            Loader {
                id: ticket_loader
                objectName: "ticket_panel_loader"
                anchors.fill: parent
                anchors.leftMargin: -14
                anchors.rightMargin: 14
                anchors.topMargin: -89
                anchors.bottomMargin: 89
                source: "Ticket_Panel.qml"
                onLoaded: {
                    if (item) {
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
    }
}
