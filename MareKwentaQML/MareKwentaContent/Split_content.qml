import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Popup {
    id: split_content_root
    objectName: "split_content_root"

    width: 400
    height: 500

    property alias isModal: split_content_root.modal
    property alias popupBackground: split_content_root.background
    property alias closePopupPolicy: split_content_root.closePolicy
    property int totalAmount: 0
    property int paymentCount: 2
    property var paymentMethods: ["Cash", "GCash", "Maya"]
    property bool validSplit: true
    property int enteredTotal: 0

    signal charge(var splitData)
    signal closeRequested()

    Rectangle {
        anchors.fill: parent
        color: "#f8f2ea"
        radius: 10

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10

            // Header
            RowLayout {
                spacing: 10
                Button {
                    text: "←"
                    font.pointSize: 16
                    onClicked: split_content_root.closeRequested()
                    background: Rectangle{
                        color: "transparent"
                    }
                }
                Label {
                    color: "#4e2d18"
                    text: "Split"
                    font.pixelSize: 22
                    font.family: "Unbounded"
                    font.bold: true
                }
            }

            Label {
                color: "#4e2d18"
                text: "Payments"
                font.pixelSize: 16
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.family: "Inter 24pt 24pt"
                Layout.alignment: Qt.AlignHCenter
            }

            RowLayout {
                spacing: 20
                height:30
                Layout.alignment: Qt.AlignHCenter

                Button {
                    text: "−"
                    height:30
                    width:30
                    background: Rectangle{
                        color: parent.pressed? "#4e2d18":"#f2efea"
                        radius: 40}
                    onClicked: {
                        if (paymentCount > 1) {
                            paymentCount--
                            updateSplitRows()
                        }
                    }
                }

                Label {
                    text: paymentCount.toString()
                    font.pixelSize: 20
                    color: "#7a9c33"
                }

                Button {
                    text: "+"
                    height:30
                    width:30
                    background: Rectangle{
                        color: parent.pressed? "#4e2d18":"#f2efea"
                        radius: 40}
                    onClicked: {
                        paymentCount++
                        updateSplitRows()
                    }
                }
            }

            Rectangle {
                height: 1
                width: parent.width
                color: "#ccc"
                Layout.fillWidth: true
            }

            ScrollView {
                id: scroll_view_split_list
                Layout.fillWidth: true
                Layout.fillHeight: true

                Column {
                    id: split_list
                    spacing: 30
                    width: parent.width
                }
            }

            // Warning or live total calculator
            Label {
                id: total_display
                text: "Total Entered: ₱" + enteredTotal + " / ₱" + totalAmount
                color: validSplit ? "green" : "red"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

            Button {
                id: charge_button
                objectName: "charge_button"
                text: "CHARGE"
                display: AbstractButton.TextOnly
                font.family: "Unbounded"
                enabled: validSplit
                background: Rectangle { color: enabled ? "#7a9c33" : "#aaaaaa"; radius: 16 }
                font.bold: true
                padding: 10
                Layout.alignment: Qt.AlignHCenter

                onClicked: {
                    var result = []
                    for (let i = 0; i < split_list.children.length; ++i) {
                        let child = split_list.children[i]
                        result.push({
                            method: child.paymentMethod,
                            amount: child.amount
                        })
                    }
                    split_content_root.charge(result)
                }
            }
        }
    }

    Component {
        id: payment_row_component

        Item {
            id: payment_row
            width: parent.width
            height: 40

            property string paymentMethod: "Cash"
            property int amount: 0

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Label {
                    text: "🧾"
                }

                ComboBox {
                    id: method_box
                    model: split_content_root.paymentMethods
                    currentIndex: 0
                    onCurrentTextChanged: payment_row.paymentMethod = currentText
                    Layout.fillWidth: true
                }

                TextField {
                    id: amount_field
                    text: amount.toString()
                    validator: IntValidator { bottom: 0 }
                    onTextChanged: {
                        payment_row.amount = parseInt(text || "0")
                        split_content_root.checkTotalAmount()
                    }
                    Layout.preferredWidth: 80
                }
            }

            Component.onCompleted: checkTotalAmount()
        }
    }

    function updateSplitRows() {
        split_list.children.forEach(child => child.destroy())

        let base = Math.floor(totalAmount / paymentCount)
        let remainder = totalAmount % paymentCount

        for (let i = 0; i < paymentCount; ++i) {
            let row = payment_row_component.createObject(split_list)
            row.amount = base + (i === paymentCount - 1 ? remainder : 0)
        }

        Qt.callLater(checkTotalAmount)
    }

    function checkTotalAmount() {
        let sum = 0
        for (let i = 0; i < split_list.children.length; ++i) {
            sum += split_list.children[i].amount
        }
        enteredTotal = sum
        validSplit = (sum === totalAmount)
    }

    Component.onCompleted: updateSplitRows()
}
