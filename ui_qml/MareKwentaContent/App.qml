import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "mareKwenta"

Window {
    id: app_window
    objectName: "app_window"
    width: 1440
    height: 1024
    visible: true
    title: "MareKwenta"

    // Navigation properties
    property string currentPage: "Ticket_Main.qml"
    property alias navHandler: nav_handler_item

    // Window state management for seamless navigation
    property bool wasFullScreen: false

    onVisibilityChanged: {
        if (visibility === ApplicationWindow.FullScreen) {
            wasFullScreen = true
        } else if (visibility === ApplicationWindow.Windowed) {
            wasFullScreen = false
        }
    }

    // Create navigation handler instance
    Item {
        id: nav_handler_item

        function navigateToPage(pageName) {
            console.log("Navigation requested to:", pageName)

            // Maintain window state
            var shouldBeFullScreen = (app_window.visibility === ApplicationWindow.FullScreen)

            // Change the page
            main_stack.replace(pageName)

            // Restore window state if needed
            if (shouldBeFullScreen && app_window.visibility !== ApplicationWindow.FullScreen) {
                app_window.showFullScreen()
            }
        }

        function showProductModifier(productName, productType) {
            product_modifier_popup.open_popup(productName, productType)
        }
    }

    // Main content area with StackView for smooth transitions
    StackView {
        id: main_stack
        anchors.fill: parent
        initialItem: currentPage

        // Smooth transition animations
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }

        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }

        replaceEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        replaceExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        onCurrentItemChanged: {
            if (currentItem) {
                console.log("Stack view changed to:", currentItem)

                // Connect navigation signals if the page supports them
                if (currentItem.hasOwnProperty("navigationRequested")) {
                    currentItem.navigationRequested.connect(nav_handler_item.navigateToPage)
                }

                // Connect product modifier signals for POS pages
                if (currentItem.hasOwnProperty("show_product_modifier")) {
                    currentItem.show_product_modifier.connect(product_modifier_popup.open_popup)
                }

                // Pass navigation handler reference
                if (currentItem.hasOwnProperty("navHandler")) {
                    currentItem.navHandler = nav_handler_item
                }

                // Maintain focus for keyboard navigation
                currentItem.forceActiveFocus()
            }
        }
    }

    // Global overlay for popups
    Overlay.modal: Rectangle {
        color: Qt.rgba(0, 0, 0, 0.5)

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }

    // Product Modifier Popup
    Popup {
        id: product_modifier_popup
        objectName: "product_modifier_popup"
        anchors.centerIn: parent
        width: Math.min(600, app_window.width * 0.8)
        height: Math.min(800, app_window.height * 0.8)
        modal: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        // Properties for product modification
        property string productName: ""
        property string productType: ""
        property int selectedQuantity: 1
        property string selectedSize: ""
        property string selectedTemperature: ""
        property var selectedExtras: []

        // Signals
        signal productModified(string name, int quantity, string size, string temperature, var extras)
        signal cancelled()

        function open_popup(product_name_text, type) {
            // Reset state for a new product selection
            productName = product_name_text || ""
            productType = type || ""
            selectedQuantity = 1
            selectedSize = ""
            selectedTemperature = ""
            selectedExtras = []

            console.log("Opening product modifier for:", productName, "type:", productType)
            open()
        }

        background: Rectangle {
            color: "#ffffff"
            radius: 12
            border.color: "#e0e0e0"
            border.width: 1

            // Subtle shadow effect
            Rectangle {
                anchors.fill: parent
                anchors.margins: -2
                color: "transparent"
                border.color: Qt.rgba(0, 0, 0, 0.1)
                border.width: 1
                radius: parent.radius + 1
                z: -1
            }
        }

        // Popup content
        Rectangle {
            anchors.fill: parent
            color: "#f8f9fa"
            radius: 12

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 20

                // Header
                Rectangle {
                    width: parent.width
                    height: 60
                    color: "#ffffff"
                    radius: 8
                    border.color: "#e9ecef"
                    border.width: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Customize Product"
                        font.pointSize: 18
                        font.bold: true
                        color: "#343a40"
                    }
                }

                // Product info
                Rectangle {
                    width: parent.width
                    height: 80
                    color: "#f2efea"
                }
             }
        }
    }
}
