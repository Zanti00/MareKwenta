import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Window {
    id: main_window
    width: 1440
    height: 1024
    visible: true
    title: "MareKwenta"

    // Navigation properties
    property string currentPage: "inventory.qml"
    property int navbarWidth: 124  // Define navbar width as a property

    // Window state management for seamless navigation
    property bool wasFullScreen: false

    onVisibilityChanged: {
        if (visibility === Window.FullScreen) {
            wasFullScreen = true
        } else if (visibility === Window.Windowed) {
            wasFullScreen = false
        }
    }

    Rectangle{
        id: rectangle10
        anchors.fill: parent
        color: "#f2efea"

        // Fixed navbar with proper sizing
        Item {
            id: navbar
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: main_window.navbarWidth
            // Remove height property - it's controlled by anchors

            Image {
                id: rectangle_15
                width: 124
                height: 800
                anchors.fill: parent
                source: "assets/rectangle_15.png"

                // Header section with logo
                Item {
                    id: header_section
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.right: parent.right
                    height: 100
                    anchors.margins: 20

                    Text {
                        id: mK1
                        color: "#4d2d18"
                        text: qsTr("MK")
                        anchors.centerIn: parent
                        font.pixelSize: 28
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                        style: Text.Outline
                        styleColor: "#4d2d18"
                    }

                    Shape {
                        id: line_1_Stroke_1
                        width: 52
                        height: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: mK1.bottom
                        anchors.topMargin: 5
                        layer.samples: 16
                        layer.enabled: true
                        ShapePath {
                            strokeWidth: 2
                            strokeColor: "transparent"
                            PathSvg {
                                path: "M 52 0 L 52 2 L 8.881784197001252e-16 2 L 0 1.4210854715202004e-14 L 52 0 Z"
                            }
                            fillRule: ShapePath.WindingFill
                            fillColor: "#4d2d18"
                        }
                        antialiasing: true
                    }
                }

                // Navigation buttons section
                Column {
                    id: nav_buttons
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: header_section.bottom
                    anchors.bottom: parent.bottom
                    anchors.margins: 18
                    anchors.topMargin: 26
                    spacing: 10

                    Button {
                        id: inventory_navbar
                        objectName: "inventory_navbar"
                        width: 78
                        height: 85
                        text: qsTr("")
                        icon.height: 55
                        icon.color: "#4e2d18"
                        icon.width: 55
                        icon.source: "assets/Archive.png"
                        onClicked: {
                            console.log("Inventory button clicked")
                            content_loader.source = "inventory.qml"
                        }
                        display: AbstractButton.IconOnly
                        background: Rectangle{
                            color: "#f2efea"
                            radius: 12
                            border.color: "#f2efea"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 5
                            color: "#4e2d18"
                            text: qsTr("Inventory")
                            font.pixelSize: 12
                            font.family: "Unbounded"
                        }
                    }

                    Button {
                        id: staff_navbar
                        objectName: "staff_navbar"
                        width: 78
                        height: 85
                        text: qsTr("")
                        icon.width: 55
                        icon.source: "assets/User.png"
                        icon.height: 55
                        icon.color: "#4e2d18"
                        onClicked: {
                            console.log("Staff button clicked")
                            content_loader.source = "staff_owner.qml"
                        }
                        display: AbstractButton.IconOnly
                        background: Rectangle{
                            color: "#f2efea"
                            radius: 12
                            border.color: "#f2efea"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 5
                            color: "#4e2d18"
                            text: qsTr("Staff")
                            font.pixelSize: 12
                            font.family: "Unbounded"
                        }
                    }

                    Button {
                        id: receipt_navbar
                        objectName: "receipt_navbar"
                        width: 78
                        height: 85
                        text: qsTr("")
                        icon.width: 55
                        icon.source: "assets/List.png"
                        icon.height: 55
                        icon.color: "#4e2d18"
                        display: AbstractButton.IconOnly
                        onClicked: {
                            console.log("Receipt button clicked")
                            content_loader.source = "receipt.qml"
                        }
                        background: Rectangle {
                            color: "#f2efea"
                            radius: 12
                            border.color: "#f2efea"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 5
                            color: "#4e2d18"
                            text: qsTr("Receipt")
                            font.pixelSize: 12
                            font.family: "Unbounded"
                        }
                    }

                    Button {
                        id: cashbox_navbar
                        objectName: "cashbox_navbar"
                        width: 78
                        height: 85
                        text: qsTr("")
                        icon.width: 55
                        icon.source: "assets/DollarSign.png"
                        icon.height: 55
                        icon.color: "#4e2d18"
                        onClicked: {
                            console.log("CashBox button clicked")
                            content_loader.source = "cash_box.qml"
                        }
                        display: AbstractButton.IconOnly
                        background: Rectangle {
                            color: "#f2efea"
                            radius: 12
                            border.color: "#f2efea"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 5
                            color: "#4e2d18"
                            text: qsTr("CashBox")
                            font.pixelSize: 12
                            font.family: "Unbounded"
                        }
                    }

                    Button {
                        id: ticket_navbar
                        objectName: "ticket_navbar"
                        width: 78
                        height: 85
                        text: qsTr("")
                        icon.width: 55
                        icon.source: "assets/Ticket.png"
                        icon.height: 55
                        icon.color: "#4e2d18"
                        onClicked: {
                            console.log("Ticket button clicked")
                            content_loader.source = "Ticket_Main.qml"
                        }
                        display: AbstractButton.IconOnly
                        background: Rectangle {
                            color: "#f2efea"
                            radius: 12
                            border.color: "#f2efea"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 5
                            color: "#4e2d18"
                            text: qsTr("Ticket")
                            font.pixelSize: 12
                            font.family: "Unbounded"
                        }
                    }

                    Button {
                        id: dashboard_navbar
                        objectName: "dashboard_navbar"
                        width: 78
                        height: 85
                        text: qsTr("")
                        icon.width: 55
                        icon.source: "assets/BarChart.png"
                        icon.height: 55
                        icon.color: "#4e2d18"
                        onClicked: {
                            console.log("Dashboard button clicked")
                            content_loader.source = "dashboard.qml"
                        }
                        display: AbstractButton.IconOnly
                        background: Rectangle {
                            color: "#f2efea"
                            radius: 12
                            border.color: "#f2efea"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 5
                            color: "#4e2d18"
                            text: qsTr("Dashboard")
                            font.pixelSize: 12
                            font.family: "Unbounded"
                        }
                    }
                }
            }
        }

        // Main content area - Fixed to properly use remaining space
        Rectangle {
            id: content_area
            anchors.left: navbar.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: 10
            color: "transparent"

            // Optional: Add a subtle border for debugging
            // border.color: "red"
            // border.width: 1

            // Main content loader with proper sizing
            Loader {
                id: content_loader
                anchors.fill: parent
                clip: true  // Prevent content from overflowing

                source: "inventory.qml"

                onLoaded: {
                    console.log("Successfully loaded:", source)

                    // Connect the product modifier signal from the loaded item
                    if (item && item.hasOwnProperty("show_product_modifier")) {
                        console.log("Connecting product modifier signal")
                        item.show_product_modifier.connect(product_modifier_popup.open_popup)
                    }

                    // Pass reference to the main window if needed
                    if (item && item.hasOwnProperty("mainWindow")) {
                        item.mainWindow = main_window
                    }

                    // Pass available size to loaded content
                    if (item && item.hasOwnProperty("availableWidth")) {
                        item.availableWidth = content_loader.width
                    }
                    if (item && item.hasOwnProperty("availableHeight")) {
                        item.availableHeight = content_loader.height
                    }
                }

                onSourceChanged: {
                    console.log("Attempting to load:", source)
                }

                // Handle loading errors
                onStatusChanged: {
                    if (status === Loader.Error) {
                        console.log("Failed to load:", source)
                        console.log("Error details - check if file exists and is a proper Item component")
                    } else if (status === Loader.Ready) {
                        console.log("Ready:", source)
                    } else if (status === Loader.Loading) {
                        console.log("Loading:", source)
                    }
                }

                // Fallback content when loading fails
                Rectangle {
                    anchors.fill: parent
                    color: "#f2efea"
                    visible: content_loader.status === Loader.Error

                    Text {
                        anchors.centerIn: parent
                        text: "Failed to load: " + content_loader.source
                        color: "#4e2d18"
                        font.family: "Unbounded"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
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

    // Product Modifier Popup - Responsive sizing
        Popup {
            id: product_modifier_popup
            objectName: "product_modifier_popup"
            anchors.centerIn: parent
            width: Math.min(700, main_window.width * 0.8)
            height: Math.min(550, main_window.height * 0.8)
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
                color: "#f2efea"
                radius: 12
                border.color: "#4e2d18"
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

            // Main content container with proper margins
            Rectangle {
                anchors.fill: parent
                anchors.margins: 20
                color: "transparent"

                Column {
                    anchors.fill: parent
                    spacing: 15

                    // Header with close button and item name
                    Row {
                        width: parent.width
                        height: 40
                        spacing: 10

                        // "X" button
                        Button {
                            width: 30
                            height: 30
                            text: "X"
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: product_modifier_popup.close()
                            background: Rectangle {
                                color: "transparent"
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "#666"
                                font.pointSize: 18
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }

                        // Spacer between X and product name
                        Item {
                            width: 10
                        }

                        // Product name
                        Text {
                            text: product_modifier_popup.productName
                            font.pointSize: 16
                            font.bold: true
                            color: "#333"
                            font.family: "Unbounded"
                            elide: Text.ElideRight
                            width: parent.width - 30 - 10 - 80 // 30 for X, 10 for spacer, 80 for price (adjust if needed)
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        // Price
                        Text {
                            text: "₱0.00"
                            font.pointSize: 16
                            font.bold: true
                            color: "#333"
                            font.family: "Unbounded"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }


                    // Size section
                    Column {
                        width: parent.width
                        spacing: 10

                        Text {
                            text: "Size"
                            font.pointSize: 14
                            font.bold: true
                            color: "#333"
                            font.family: "Unbounded"
                        }

                        Row {
                            width: parent.width
                            spacing: 10

                            Button {
                                id: grande_btn
                                width: (parent.width - 10) / 2
                                height: 45
                                text: "Grande"
                                checkable: true
                                checked: product_modifier_popup.selectedSize === "Grande"
                                onClicked: {
                                    product_modifier_popup.selectedSize = "Grande"
                                    venti_btn.checked = false
                                }
                                background: Rectangle {
                                    color: parent.checked ? "#e8e8e8" : "#ffffff"
                                    border.color: "#ccc"
                                    border.width: 1
                                    radius: 4
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#333"
                                    font.family: "Unbounded"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            Button {
                                id: venti_btn
                                width: (parent.width - 10) / 2
                                height: 45
                                text: "Venti"
                                checkable: true
                                checked: product_modifier_popup.selectedSize === "Venti"
                                onClicked: {
                                    product_modifier_popup.selectedSize = "Venti"
                                    grande_btn.checked = false
                                }
                                background: Rectangle {
                                    color: parent.checked ? "#e8e8e8" : "#ffffff"
                                    border.color: "#ccc"
                                    border.width: 1
                                    radius: 4
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#333"
                                    font.family: "Unbounded"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }

                    // Extras section
                    Column {
                        width: parent.width
                        spacing: 10

                        Text {
                            text: "Extras"
                            font.pointSize: 14
                            font.bold: true
                            color: "#333"
                            font.family: "Unbounded"
                        }

                        Row {
                            width: parent.width
                            spacing: 10

                            Button {
                                id: solo_shot_btn
                                width: (parent.width - 10) / 2
                                height: 45
                                text: "Solo Shot"
                                checkable: true
                                background: Rectangle {
                                    color: parent.checked ? "#e8e8e8" : "#ffffff"
                                    border.color: "#ccc"
                                    border.width: 1
                                    radius: 4
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#333"
                                    font.family: "Unbounded"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            Button {
                                id: doppio_shot_btn
                                width: (parent.width - 10) / 2
                                height: 45
                                text: "Doppio Shot"
                                checkable: true
                                background: Rectangle {
                                    color: parent.checked ? "#e8e8e8" : "#ffffff"
                                    border.color: "#ccc"
                                    border.width: 1
                                    radius: 4
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#333"
                                    font.family: "Unbounded"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }

                        // Whip Cream button (centered)
                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            Button {
                                id: whip_cream_btn
                                width: 150
                                height: 45
                                text: "Whip Cream"
                                checkable: true
                                background: Rectangle {
                                    color: parent.checked ? "#e8e8e8" : "#ffffff"
                                    border.color: "#ccc"
                                    border.width: 1
                                    radius: 4
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#333"
                                    font.family: "Unbounded"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }

                    // Quantity section
                    Column {
                        width: parent.width
                        spacing: 10

                        Text {
                            text: "Quantity"
                            font.pointSize: 14
                            font.bold: true
                            color: "#333"
                            font.family: "Unbounded"
                        }

                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 20

                            Button {
                                width: 40
                                height: 40
                                text: "−"
                                font.pointSize: 20
                                onClicked: if (product_modifier_popup.selectedQuantity > 1) product_modifier_popup.selectedQuantity--
                                background: Rectangle {
                                    color: "#ffffff"
                                    border.color: "#ccc"
                                    border.width: 1
                                    radius: 4
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#333"
                                    font.pointSize: 20
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                text: product_modifier_popup.selectedQuantity
                                font.pointSize: 18
                                color: "#333"
                                font.family: "Unbounded"
                                width: 40
                                horizontalAlignment: Text.AlignHCenter
                            }

                            Button {
                                width: 40
                                height: 40
                                text: "+"
                                font.pointSize: 18
                                onClicked: product_modifier_popup.selectedQuantity++
                                background: Rectangle {
                                    color: "#ffffff"
                                    border.color: "#ccc"
                                    border.width: 1
                                    radius: 4
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#333"
                                    font.pointSize: 18
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }

                    // Spacer to push button to bottom
                    Item {
                        width: parent.width
                    }

                    // Done button
                    Button {
                        width: 110
                        height: 50
                        anchors.right: parent.right
                        text: "DONE"
                        onClicked: {
                            // Collect selected extras
                            var extras = []
                            if (solo_shot_btn.checked) extras.push("Solo Shot")
                            if (doppio_shot_btn.checked) extras.push("Doppio Shot")
                            if (whip_cream_btn.checked) extras.push("Whip Cream")

                            product_modifier_popup.selectedExtras = extras
                            product_modifier_popup.productModified(
                                product_modifier_popup.productName,
                                product_modifier_popup.selectedQuantity,
                                product_modifier_popup.selectedSize,
                                product_modifier_popup.selectedTemperature,
                                product_modifier_popup.selectedExtras
                            )
                            product_modifier_popup.close()
                        }
                        background: Rectangle {
                            color: "#8B4513"
                            radius: 4
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "#ffffff"
                            font.family: "Unbounded"
                            font.pointSize: 10
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }

}
/*##^##
Designer {
    D{i:0;uuid:"4fa88c5b-ac5d-5c98-b1da-fdec66fb40a2"}
}
##^##*/
