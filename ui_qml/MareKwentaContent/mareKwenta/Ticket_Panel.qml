import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

Item {
    id: ticketPanelRoot
    objectName: "ticket_panel_root"
    width: 500
    height: 824
    property int selectedTab: 0
    signal open_split_popup(real amount_to_split)

    Component {
        id: productDetailComponent
        Item_detail { }
    }

    Rectangle {
        id: mainBackground
        anchors.fill: parent
        anchors.margins: 2
        color: "#f2efea"
        radius: 8

        Column {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 8

            // Header
            Text {
                id: ticket
                width: parent.width
                height: 40
                color: "#4d2d18"
                text: qsTr("Ticket")
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            // Product List Area
            ScrollView {
                id: ticket_product_list
                objectName: "ticket_product_list_scroll_view"
                width: parent.width
                height: 300
                clip: true

                Column {
                    id: ticket_order_Items
                    objectName: "ticket_order_items_column"
                    width: parent.width
                    spacing: 5

                    Item_detail {
                        product_name: "Americano"
                        quantity: 3
                        size_drink: "Grande"
                        item_info: "Iced"
                        unit_price: 90.00
                    }
                }
            }

            // Divider
            Rectangle {
                width: parent.width
                height: 1
                color: "#4e2d18"
            }

            // SubTotal Section
            Row {
                width: parent.width
                height: 35

                Text {
                    id: subTotal_lbl
                    width: parent.width * 0.6
                    height: parent.height
                    color: "#4e2d18"
                    text: qsTr("SubTotal")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Normal
                    font.family: "Unbounded"
                }

                Text {
                    id: currentBillTotalInput
                    objectName: "current_bill_total_display"
                    width: parent.width * 0.4
                    height: parent.height
                    color: "#4d6443"
                    text: qsTr("₱ 0.00")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.DemiBold
                    font.family: "Poppins"
                }
            }

            // Tab Headers
            Row {
                id: tabRow
                width: parent.width
                height: 50
                spacing: 60
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: change_btn_head
                    objectName: "change_tab_button"
                    width: 100
                    height: 50
                    font.pixelSize: 14
                    font.weight: Font.Normal
                    font.family: "Unbounded"

                    background: Rectangle {
                        color: "#f2efea"
                    }

                    contentItem: Column {
                        spacing: 4
                        Text {
                            text: qsTr("Change")
                            color: "#4e2d18"
                            font: change_btn_head.font
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Rectangle {
                            width: 60
                            height: 2
                            color: "#4e2d18"
                            anchors.horizontalCenter: parent.horizontalCenter
                            visible: selectedTab === 0
                        }
                    }

                    onClicked: {
                        change_or_disc_state.currentIndex = 0
                        selectedTab = 0
                    }
                }

                Button {
                    id: discount_btn_head
                    objectName: "discount_tab_button"
                    width: 100
                    height: 50
                    font.pixelSize: 14
                    font.weight: Font.Normal
                    font.family: "Unbounded"

                    background: Rectangle {
                        color: "#f2efea"
                    }

                    contentItem: Column {
                        spacing: 4
                        Text {
                            text: qsTr("Discount")
                            color: "#4e2d18"
                            font: discount_btn_head.font
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Rectangle {
                            width: 60
                            height: 2
                            color: "#4e2d18"
                            anchors.horizontalCenter: parent.horizontalCenter
                            visible: selectedTab === 1
                        }
                    }

                    onClicked: {
                        change_or_disc_state.currentIndex = 1
                        selectedTab = 1
                    }
                }
            }

            // Tab Content
            StackLayout {
                id: change_or_disc_state
                width: parent.width
                height: 120
                currentIndex: 0

                // Change Tab
                Item {
                    id: item1_change

                    Grid {
                        width: 375
                        columns: 4
                        columnSpacing: 8
                        rowSpacing: 8

                        Button {
                            id: change_btn_20
                            objectName: "change_20_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#f8961e"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#f8961e"
                                text: qsTr("P20")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Button {
                            id: change_btn_50
                            objectName: "change_50_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#c30e0e"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#c30e0e"
                                text: qsTr("P50")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Button {
                            id: change_btn_100
                            objectName: "change_100_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#5c0099"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#5c0099"
                                text: qsTr("P100")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Button {
                            id: change_btn_200
                            objectName: "change_200_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#87a70a"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#87a70a"
                                text: qsTr("P200")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Button {
                            id: change_btn_500
                            objectName: "change_500_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#ffd500"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#ffd500"
                                text: qsTr("P500")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Button {
                            id: change_btn_1000
                            objectName: "change_1000_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#0091f7"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#0091f7"
                                text: qsTr("P1000")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Row {
                            width: (parent.width - 24) / 4 * 2 + 8
                            height: 50
                            spacing: 4

                            Text {
                                width: 20
                                height: parent.height
                                color: "#4e2d18"
                                text: qsTr("₱")
                                font.pixelSize: 16
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }

                            TextInput {
                                id: textInput
                                objectName: "change_amount_input"
                                width: parent.width - 24
                                height: parent.height
                                color: "#4e2d18"
                                text: qsTr("Amount")
                                font.pixelSize: 16
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                                cursorVisible: true
                                selectionColor: "#4e2d18"
                                font.underline: true
                                font.family: "Inter"
                            }
                        }

                        Button {
                            id: change_btn_clr
                            objectName: "change_clear_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#9e2b2b"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#9e2b2b"
                                text: qsTr("Clear")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }
                    }
                }

                // Discount Tab
                Item {
                    id: item2_discs

                    Grid {
                        width: parent.width
                        columns: 4
                        columnSpacing: 8
                        rowSpacing: 8

                        Button {
                            id: disc_btn_5
                            objectName: "discount_5_percent_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#f8961e"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#f8961e"
                                text: qsTr("5%")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Button {
                            id: disc_btn_10
                            objectName: "discount_10_percent_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#c30e0e"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#c30e0e"
                                text: qsTr("10%")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Button {
                            id: disc_btn_20
                            objectName: "discount_20_percent_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#5c0099"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#5c0099"
                                text: qsTr("20%")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Button {
                            id: disc_btn_100
                            objectName: "discount_100_percent_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#87a70a"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#87a70a"
                                text: qsTr("100%")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Row {
                            width: (parent.width - 24) / 4
                            height: 50
                            spacing: 2

                            Text {
                                width: 15
                                height: parent.height
                                color: "#4e2d18"
                                text: qsTr("₱")
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }

                            TextInput {
                                id: disc_input_peso
                                objectName: "discount_peso_input"
                                width: parent.width - 17
                                height: parent.height
                                color: "#4e2d18"
                                text: qsTr("Amt")
                                font.pixelSize: 12
                                horizontalAlignment: Text.AlignCenter
                                verticalAlignment: Text.AlignVCenter
                                selectionColor: "#4e2d18"
                                font.underline: true
                                font.family: "Inter"
                                cursorVisible: true
                            }
                        }

                        Row {
                            width: (parent.width - 24) / 4
                            height: 50
                            spacing: 2

                            TextInput {
                                id: disc_input_percent
                                objectName: "discount_percent_input"
                                width: parent.width - 17
                                height: parent.height
                                color: "#4e2d18"
                                text: qsTr("Amt")
                                font.pixelSize: 12
                                horizontalAlignment: Text.AlignCenter
                                verticalAlignment: Text.AlignVCenter
                                cursorVisible: true
                                selectionColor: "#4e2d18"
                                font.underline: true
                                font.family: "Inter"
                            }

                            Text {
                                width: 15
                                height: parent.height
                                color: "#4e2d18"
                                text: qsTr("%")
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }

                        Item {
                            width: (parent.width - 24) / 4
                            height: 50
                        }

                        Button {
                            id: disc_btn_clear
                            objectName: "discount_clear_button"
                            width: (parent.width - 24) / 4
                            height: 50
                            background: Rectangle {
                                color: "#f2efea"
                                radius: 8
                                border.color: "#9e2b2b"
                                border.width: 1
                            }
                            contentItem: Text {
                                color: "#9e2b2b"
                                text: qsTr("Clear")
                                font.pixelSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.weight: Font.Medium
                                font.family: "Unbounded"
                            }
                        }
                    }
                }
            }

            // Cash and Change Section with background
            Rectangle {
                width: parent.width
                height: 80
                color: "#e8e5e0"
                radius: 8

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 20

                    Column {
                        Layout.fillWidth: true

                        Text {
                            id: cash_Receivedlbl
                            height: 15
                            color: "#4e2d18"
                            text: qsTr("Cash Received")
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.weight: Font.Light
                            font.family: "Unbounded"
                        }
                        Text {
                            id: cash_received
                            objectName: "cash_received_display"
                            height: 30
                            color: "#4d6443"
                            text: qsTr("₱ 0")
                            font.pixelSize: 20
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.weight: Font.Normal
                            font.family: "Unbounded"
                        }
                    }

                    Column {
                        Layout.fillWidth: true

                        Text {
                            id: change_lbl
                            height: 15
                            color: "#4e2d18"
                            text: qsTr("Change")
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.weight: Font.Light
                            font.family: "Unbounded"
                        }
                        Text {
                            id: calculate_change
                            objectName: "calculated_change_display"
                            height: 30
                            color: "#4d6443"
                            text: qsTr("₱ 0")
                            font.pixelSize: 20
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.weight: Font.Normal
                            font.family: "Unbounded"
                        }
                    }
                }
            }

            // Payment Buttons
            Row {
                width: parent.width
                height: 53
                spacing: 8

                Button {
                    id: gcash_btn
                    objectName: "gcash_payment_button"
                    width: (parent.width - 24) / 4
                    height: 53
                    background: Rectangle {
                        color: "#0091f7"
                        radius: 8
                    }
                    contentItem: Text {
                        color: "#f2efea"
                        text: qsTr("GCash")
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.DemiBold
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: maya_btn
                    objectName: "maya_payment_button"
                    width: (parent.width - 24) / 4
                    height: 53
                    background: Rectangle {
                        color: "#9aca1f"
                        radius: 8
                    }
                    contentItem: Text {
                        color: "#f2efea"
                        text: qsTr("Maya")
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.DemiBold
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: split_btn
                    objectName: "split_payment_button"
                    width: (parent.width - 24) / 4
                    height: 53
                    background: Rectangle {
                        color: "#708a2e"
                        radius: 8
                    }
                    contentItem: Text {
                        color: "#f2efea"
                        text: qsTr("Split")
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.DemiBold
                        font.family: "Unbounded"
                    }
                    onClicked: {
                        var amount = parseInt(currentBillTotalInput.text.replace("₱ ", "") || "0");
                        ticketPanelRoot.open_split_popup(amount);
                        console.log("Ticket_Panel: Emitting openSplitPopup with amount:", amount);
                    }
                }

                Button {
                    id: charge_btn
                    objectName: "charge_button"
                    width: (parent.width - 24) / 4
                    height: 53
                    background: Rectangle {
                        color: "#708a2e"
                        radius: 8
                    }
                    contentItem: Text {
                        color: "#f2efea"
                        text: qsTr("Charge")
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.DemiBold
                        font.family: "Unbounded"
                    }
                }
            }
        }
    }
}
