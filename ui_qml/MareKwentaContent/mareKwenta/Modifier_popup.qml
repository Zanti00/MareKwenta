// Modifier_popup.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
Popup {
    id: root_popup
    objectName: "modifier_root_popup"

    property string productType: ""
    property string productName: "Selected Product"
    property int selectedQuantity: 1
    property string selectedSize: "" // "Grande" or "Venti"
    property string selectedTemperature: "" // "Hot" or "Iced"
    property var selectedExtras: [] // Array of selected extras e.g., ["Solo Shot", "Whip Cream"]


    signal productModified(string name, int quantity, string size, string temperature, var extras)
    signal cancelled()


    parent: ApplicationWindow.overlay
    anchors.centerIn: parent
    width: 720
    height: 700

    modal: true
    closePolicy: Popup.CloseOnPressOutside


    Overlay.modal: Rectangle {
        color: "#80000000"
    }

    Rectangle {
        id: popup_content_rect
        width: parent.width
        height: parent.height
        color: "#f2efea"
        radius: 15

        ColumnLayout {
            id: main_column_layout
            anchors.fill: parent
            anchors.margins: 25
            spacing: 15

            RowLayout {
                id: header_row
                Layout.fillWidth: true
                Layout.preferredHeight: 60
                spacing: 10

                Button {
                    id: close_btn
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("X")
                    font.pointSize: 22
                    font.bold: true
                    display: AbstractButton.TextOnly
                    background: Rectangle {
                        anchors.fill: parent
                        color: parent.pressed ? "lightgray" : "transparent"
                        radius: 5
                    }
                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        color: "#4e2d18"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: root_popup.close()
                }

                Label {
                    id: product_title_label
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    color: "#4e2d18"
                    text: root_popup.productName
                    font.weight: Font.DemiBold
                    font.pointSize: 24
                    font.family: "Unbounded"
                }
            }

            RowLayout {
                visible: productType === "Coffee" || productType === "Matcha" ||
                         productType === "Chocolate" || productType === "Frappe"
                id: size_label_row
                Layout.fillWidth: true
                Layout.preferredHeight: 30

                Label {
                    id: label_size
                    Layout.fillWidth: true
                    color: "#4e2d18"
                    text: qsTr("Size")
                    font.weight: Font.Normal
                    font.pointSize: 18
                    font.family: "Unbounded"
                }
            }

            RowLayout {
                visible: productType === "Coffee" || productType === "Matcha" ||
                    productType === "Chocolate" || productType === "Frappe"
                id: size_selection_row
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                spacing: 10

                Button {
                    id: grande_btn
                    text: qsTr("Grande")
                    Layout.fillWidth: true
                    Layout.preferredHeight:50
                    Layout.minimumWidth: 250
                    background: Rectangle {
                        anchors.fill: parent
                        color: root_popup.selectedSize === grande_btn.text ? "#4e2d18" : "transparent"
                        border.color: "#4e2d18"
                        border.width: 1
                        radius: 8
                    }
                    contentItem: Text {
                        color: root_popup.selectedSize === grande_btn.text ? "#f2efea" : "#4e2d18"
                        text: grande_btn.text
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.pointSize: 15
                        font.family: "Unbounded"
                    }
                    onClicked: root_popup.selectedSize = grande_btn.text
                }

                Button {
                    id: venti_btn
                    text: qsTr("Venti")
                    Layout.fillWidth: true
                    Layout.preferredHeight:50
                    Layout.minimumWidth: 250
                    background: Rectangle {
                        anchors.fill: parent
                        color: root_popup.selectedSize === venti_btn.text ? "#4e2d18" : "transparent"
                        border.color: "#4e2d18"
                        border.width: 1
                        radius: 8
                    }
                    contentItem: Text {
                        color: root_popup.selectedSize === venti_btn.text ? "#f2efea" : "#4e2d18"
                        text: venti_btn.text
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.pointSize: 15
                        font.family: "Unbounded"
                    }
                    onClicked: root_popup.selectedSize = venti_btn.text
                }
            }

            RowLayout {
                visible: productType === "Coffee" || productType === "Matcha" || productType === "Chocolate"
                id: hot_iced_label_row
                Layout.preferredHeight: 30
                Label {
                    id: label_hot_iced
                    Layout.fillWidth: true
                    color: "#4e2d18"
                    text: qsTr("Hot/Iced")
                    font.weight: Font.Normal
                    font.pointSize: 18
                    font.family: "Unbounded"
                }
            }

            // --- Hot/Iced Buttons Row ---
            RowLayout {
                visible: productType === "Coffee" || productType === "Matcha" || productType === "Chocolate"
                id: hot_iced_selection_row
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                spacing: 10

                Button {
                    id: hot_btn // Snake case
                    text: qsTr("Hot")
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    Layout.minimumWidth: 250
                    background: Rectangle {
                        anchors.fill: parent
                        color: root_popup.selectedTemperature === hot_btn.text ? "#4e2d18" : "transparent"
                        border.color: "#4e2d18"
                        border.width: 1
                        radius: 8
                    }
                    contentItem: Text {
                        text: hot_btn.text
                        color: root_popup.selectedTemperature === hot_btn.text ? "#f2efea" : "#4e2d18"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.pointSize: 15
                        font.family: "Unbounded"
                    }
                    onClicked: root_popup.selectedTemperature = hot_btn.text
                }
                Button {
                    id: iced_btn
                    text: qsTr("Iced")
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    Layout.minimumWidth: 250
                    background: Rectangle {
                        anchors.fill: parent
                        color: root_popup.selectedTemperature === iced_btn.text ? "#4e2d18" : "transparent"
                        border.color: "#4e2d18"
                        border.width: 1
                        radius: 8
                    }
                    contentItem: Text {
                        text: iced_btn.text
                        color: root_popup.selectedTemperature === iced_btn.text ? "#f2efea" : "#4e2d18"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Normal
                        font.pointSize: 15
                        font.family: "Unbounded"
                    }
                    onClicked: root_popup.selectedTemperature = iced_btn.text
                }
            }

            // --- Extras Label Row ---
            RowLayout {
                visible: productType !== "Food"
                id: extras_label_row
                Layout.fillWidth: true
                Layout.preferredHeight: 30
                Label {
                    id: label_extras
                    Layout.fillWidth: true
                    color: "#4e2d18"
                    text: qsTr("Extras")
                    font.weight: Font.Normal
                    font.pointSize: 18
                    font.family: "Unbounded"
                }
            }

            // --- Extras Buttons Row (using a Repeater for easier management) ---
            GridLayout {
                visible: productType !== "Food"
                id: extras_grid_layout
                Layout.fillWidth: true
                Layout.preferredHeight: 120
                columns: 2
                columnSpacing: 10
                rowSpacing: 10

                property var available_extras: [
                    "Solo Shot", "Double Shot", "Whip Cream"
                ]

                Repeater {
                    model: parent.available_extras
                    delegate: Button {
                        id: extra_button_delegate
                        property string extraName: model.modelData
                        text: extraName
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50


                        property bool isSelected: root_popup.selectedExtras.includes(extraName)

                        background: Rectangle {
                            anchors.fill: parent
                            color: extra_button_delegate.isSelected ? "#4e2d18" : "transparent"
                            border.color: "#4e2d18"
                            border.width: 1
                            radius: 8
                        }
                        contentItem: Text {
                            text: extra_button_delegate.text
                            color: extra_button_delegate.isSelected ? "#f2efea" : "#4e2d18"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.Normal
                            font.pointSize: 15
                            font.family: "Unbounded"
                        }
                        onClicked: {
                            if (extra_button_delegate.isSelected) {
                                // Remove from selectedExtras
                                root_popup.selectedExtras.splice(root_popup.selectedExtras.indexOf(extraName), 1);
                            } else {
                                // Add to selectedExtras
                                root_popup.selectedExtras.push(extraName);
                            }
                            // Important: Reassign the array to trigger change signal for UI update
                            root_popup.selectedExtras = root_popup.selectedExtras;
                        }
                    }
                }
            }


            // --- Quantity Label Row ---
            RowLayout {
                id: quantity_label_row
                Layout.fillWidth: true
                Layout.preferredHeight: 30
                Label {
                    id: label_quantity
                    Layout.fillWidth: true
                    color: "#4e2d18"
                    text: qsTr("Quantity")
                    font.weight: Font.Normal
                    font.pointSize: 18
                    font.family: "Unbounded"
                }
            }

            // --- Quantity +/- Buttons Row ---
            RowLayout {
                id: quantity_control_row
                spacing: 20
                Layout.preferredHeight: 40
                Layout.alignment: Qt.AlignHCenter

                Button {
                    id: minus_btn
                    text: "−"
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    background: Rectangle {
                        anchors.fill: parent
                        color: parent.pressed ? "#4e2d18" : "#f2efea"
                        radius: parent.width / 2
                    }
                    contentItem: Text {
                        text: parent.text
                        font.pixelSize: 20
                        color: parent.pressed ? "#f2efea" : "#4e2d18"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: {
                        if (root_popup.selectedQuantity > 1) {
                            root_popup.selectedQuantity--
                        }
                    }
                }

                Label {
                    id: quantity_display_label
                    text: root_popup.selectedQuantity.toString()
                    font.pixelSize: 25
                    color: "#7a9c33"
                    Layout.preferredWidth: 50
                    Layout.alignment: Qt.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Button {
                    id: plus_btn
                    text: "+"
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    background: Rectangle {
                        anchors.fill: parent
                        color: parent.pressed ? "#4e2d18" : "#f2efea"
                        radius: parent.width / 2
                    }
                    contentItem: Text {
                        text: parent.text
                        font.pixelSize: 20
                        color: parent.pressed ? "#f2efea" : "#4e2d18"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: {
                        root_popup.selectedQuantity++
                    }
                }
            }

            // Spacer
            Item {
                id: spacer_item
                Layout.fillHeight: true
                Layout.minimumHeight: 10
            }

            // --- Add to Cart Button ---
            Button {
                id: add_to_cart_button
                objectName: "add_to_cart_button"
                text: qsTr("Add to Cart")
                Layout.fillWidth: false
                Layout.preferredHeight: 60
                Layout.alignment: Qt.AlignHCenter

                background: Rectangle {
                    color: parent.pressed ?  "#f2efea":"#4e2d18"
                    anchors.fill: parent
                    // Greenish color
                    radius: 10
                }
                contentItem: Text {
                    text: parent.text
                    font.pointSize: 20
                    font.bold: true
                    color: parent.pressed ? "#4e2d18" : "#f2efea"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    // Emit signal
                    root_popup.productModified(
                        root_popup.productName,
                        root_popup.selectedQuantity,
                        root_popup.selectedSize,
                        root_popup.selectedTemperature,
                        root_popup.selectedExtras
                    )
                    root_popup.close()
                }
            }
        }
    }
}
