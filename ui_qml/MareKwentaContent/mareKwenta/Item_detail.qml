import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item {
    id: rootItem
    width: 447
    height: 111

    // Component Properties
    property string product_name: "Default Product"
    property int quantity: 1
    property string size_drink: "Grande/Venti"
    property real unit_price: 0.0
    property string item_info: "Hot/Iced & Extra"

    // Calculated property for the total of this item
    readonly property real itemTotal: quantity * unit_price

    // Signal for removal
    signal removeItem(string product_name, real itemTotal)

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: "transparent"
        radius: 8

        Image {
            anchors.fill: parent
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.topMargin: 4
            anchors.bottomMargin: -4
            source: "mareKwenta/assets/rectangle_8.png"
            fillMode: Image.Stretch
        }


        Item { //text fields
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 25
            width: parent.width * 0.7
            height: parent.height - 40

            ColumnLayout {
                anchors.fill: parent
                spacing: 1
                Text {
                    id: product_nameText
                    color: "#4e2d18"
                    text: rootItem.product_name
                    font.pixelSize: 18
                    font.weight: Font.Medium
                    font.family: "Unbounded"
                    Layout.fillWidth: true
                    wrapMode: Text.Wrap
                }

                RowLayout { // For "Size: Grande/Venti"
                    Label {
                        text: qsTr("Size:")
                        color: "#4e2d18"
                        font.pixelSize: 12
                        font.weight: Font.ExtraLight
                        font.family: "Inter 18pt 18pt"
                    }
                    Label {
                        text: rootItem.size_drink
                        color: "#4e2d18"
                        font.pixelSize: 12
                        font.weight: Font.ExtraLight
                        font.family: "Inter 18pt 18pt"
                        Layout.fillWidth: true
                    }
                }

                RowLayout { // For "Info: Hot or Iced, Extras"
                    Label {
                        text: qsTr("Info:")
                        color: "#4e2d18"
                        font.pixelSize: 12
                        font.weight: Font.ExtraLight
                        font.family: "Inter 18pt 18pt"
                    }
                    Label {
                        text: rootItem.item_info
                        color: "#4e2d18"
                        font.pixelSize: 12
                        font.weight: Font.ExtraLight
                        font.family: "Inter 18pt 18pt"
                        Layout.fillWidth: true
                    }
                }

                RowLayout { // For "Quantity"
                    Label {
                        text: qsTr("Quantity:")
                        color: "#4e2d18"
                        font.pixelSize: 12
                        font.weight: Font.ExtraLight
                        font.family: "Inter 18pt 18pt"
                    }
                    Label {
                        text: rootItem.quantity.toString() // Display the numeric quantity
                        color: "#4e2d18"
                        font.pixelSize: 12
                        font.weight: Font.ExtraLight
                        font.family: "Inter 18pt 18pt"
                        Layout.fillWidth: true
                    }
                }
            }
        }

        ColumnLayout{
            x: 334
            width: 103
            height: 95
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20


            // Item Total Display
            Button {
                id: deleteButton
                Layout.topMargin: 5
                Layout.rightMargin: 0
                Layout.alignment: Qt.AlignRight | Qt.AlignTop

                icon.color: "#4e2d18"
                display: AbstractButton.IconOnly
                icon.source: "mareKwenta/assets/trash.png"
                onClicked: rootItem.removeItem(rootItem.product_name, rootItem.itemTotal)

                // Optional: Customize button background for visual feedback
                background: Rectangle {
                    color: parent.pressed ? "#f0f0f0" : "transparent"
                    radius: 5
                }
            }
            Text {
                id: itemTotalText
                color: "#708a2e"
                text: "₱" + rootItem.itemTotal.toFixed(2)

                font.letterSpacing: 2
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                Layout.bottomMargin: 5
                Layout.topMargin: 0
                Layout.rightMargin: 0
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                font.weight: Font.DemiBold
                font.family: "Unbounded"
            }

            // Delete Button

        }
    }
}
