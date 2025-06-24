import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

Item {
    id:ticketPanelRoot
    objectName: "ticket_panel_root"
    width: 500
    height: 1024
    property int selectedTab: 0
    signal open_split_popup(real amount_to_split)
    Component {
        id: productDetailComponent
        Item_detail { }
    }
    Image {
        id: rectangle_4
        x: 2
        y: -8
        width: 510
        height: 1050
        source: "mareKwenta/assets/rectangle_4.png"

        StackLayout {
            id: change_or_disc_state
            x: 14
            y: 797
            width: 488
            height: 107
            currentIndex: 1

            Item {
                id: item1_change

                Button {
                    id: change_btn_20
                    objectName: "change_20_button"
                    x: 8
                    y: 8
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: rectangle_17
                        color: "#f2efea"
                        radius: 8
                        border.color: "#f8961e"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: p20
                        width: 47
                        height: 20
                        color: "#f8961e"
                        text: qsTr("P20")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }

                }
                Button {
                    id: change_btn_100
                    objectName: "change_100_button"
                    x: 247
                    y: 8
                    width: 109
                    height: 50

                    background: Rectangle {
                        id: rectangle_18
                        color: "#f2efea"
                        radius: 8
                        border.color: "#5c0099"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: p100
                        width: 57
                        height: 20
                        color: "#5c0099"
                        text: qsTr("P100")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: change_btn_200
                    objectName: "change_200_button"
                    x: 365
                    y: 8
                    width: 109
                    height: 50

                    background: Rectangle {
                        id: rectangle_19
                        color: "#f2efea"
                        radius: 8
                        border.color: "#87a70a"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: p200
                        width: 68
                        height: 20
                        color: "#87a70a"
                        text: qsTr("P200")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: change_btn_50
                    objectName: "change_50_button"
                    x: 128
                    y: 8
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: rectangle_20
                        color: "#f2efea"
                        radius: 8
                        border.color: "#c30e0e"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: p50
                        width: 48
                        height: 20
                        color: "#c30e0e"
                        text: qsTr("P50")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: change_btn_500
                    objectName: "change_500_button"
                    x: 8
                    y: 58
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: rectangle_21
                        color: "#f2efea"
                        radius: 8
                        border.color: "#ffd500"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: p500
                        width: 60
                        height: 20
                        color: "#ffd500"
                        text: qsTr("P500")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: change_btn_1000
                    objectName: "change_1000_button"
                    x: 128
                    y: 58
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: rectangle_24
                        color: "#f2efea"
                        radius: 8
                        border.color: "#0091f7"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: p1000
                        width: 71
                        height: 20
                        color: "#0091f7"
                        text: qsTr("P1000")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        rotation: 0.567
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: change_btn_clr
                    objectName: "change_clear_button"
                    x: 365
                    y: 58
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: rectangle_23
                        color: "#f2efea"
                        radius: 8
                        border.color: "#9e2b2b"
                        border.width: 1
                    }
                    contentItem: Text {
                        id: clear
                        width: 72
                        height: 0
                        color: "#9e2b2b"
                        text: qsTr("Clear")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: 0
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Text {
                    id: element6
                    x: 239
                    y: 150
                    width: 20
                    height: 20
                    color: "#4e2d18"
                    text: qsTr("₱")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 250
                    anchors.topMargin: 75
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    font.weight: Font.Medium
                    font.family: "Unbounded"
                }

                TextInput {
                    id: textInput
                    objectName: "change_amount_input"
                    x: 261
                    y: 75
                    width: 80
                    height: 20
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

            Item {
                id: item2_discs
                Button {
                    id: disc_btn_5
                    objectName: "discount_5_percent_button"
                    x: 8
                    y: 8
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: disc_5
                        color: "#f2efea"
                        radius: 8
                        border.color: "#f8961e"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: d5
                        width: 47
                        height: 20
                        color: "#f8961e"
                        text: qsTr("5%")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: disc_btn_20
                    objectName: "discount_20_percent_button"
                    x: 247
                    y: 8
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: disc_20
                        color: "#f2efea"
                        radius: 8
                        border.color: "#5c0099"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: d20
                        width: 57
                        height: 20
                        color: "#5c0099"
                        text: qsTr("20%")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: disc_btn_100
                    objectName: "discount_100_percent_button"
                    x: 365
                    y: 8
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: disc_100
                        color: "#f2efea"
                        radius: 8
                        border.color: "#87a70a"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: d100
                        width: 68
                        height: 20
                        color: "#87a70a"
                        text: qsTr("100%")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: disc_btn_10
                    objectName: "discount_10_percent_button"
                    width: 109
                    height: 50
                    x: 128
                    y: 8
                    background: Rectangle {
                        id: disc_10
                        color: "#f2efea"
                        radius: 8
                        border.color: "#c30e0e"
                        border.width: 1
                    }

                    contentItem: Text {
                        id: d10
                        width: 48
                        height: 20
                        color: "#c30e0e"
                        text: qsTr("10%")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: disc_btn_clear
                    objectName: "discount_clear_button"
                    x: 365
                    y: 58
                    width: 109
                    height: 50
                    background: Rectangle {
                        id: disc_Clear
                        color: "#f2efea"
                        radius: 8
                        border.color: "#9e2b2b"
                        border.width: 1
                    }
                    contentItem: Text {
                        id: dclear
                        width: 72
                        height: 14
                        color: "#9e2b2b"
                        text: qsTr("Clear")
                        font.pixelSize: 15
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: 0
                        font.weight: Font.Medium
                        font.family: "Unbounded"
                    }
                }
                Text {
                    id: disc_percent_icon
                    width: 20
                    height: 20
                    color: "#4e2d18"
                    text: qsTr("%")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 219
                    anchors.topMargin: 78
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    font.weight: Font.Medium
                    font.family: "Unbounded"
                }

                TextInput {
                    id: disc_input_percent
                    objectName: "discount_percent_input"
                    x: 237
                    y: 78
                    width: 68
                    height: 20
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

                Text {
                    id: disc_peso_icon
                    width: 20
                    height: 20
                    color: "#4e2d18"
                    text: qsTr("₱")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 76
                    anchors.topMargin: 78
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    font.weight: Font.Medium
                    font.family: "Unbounded"
                }

                TextInput {
                    id: disc_input_peso
                    objectName: "discount_peso_input"
                    x: 88
                    y: 78
                    width: 68
                    height: 20
                    color: "#4e2d18"
                    text: qsTr("Amount")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    selectionColor: "#4e2d18"
                    font.underline: true
                    font.family: "Inter"
                    cursorVisible: true
                }
            }
        }

        Image {
            id: rectangle_16
            x: 8
            y: 725
            width: 494
            height: 66
            source: "mareKwenta/assets/rectangle_16.png"

        }

        ScrollView {
            id: ticket_product_list
            objectName: "ticket_product_list_scroll_view"
            width: 448
            height: 592
            anchors.verticalCenterOffset: -165
            anchors.horizontalCenterOffset: -2
            anchors.centerIn: parent
            Column {
                id: ticket_order_Items
                objectName: "ticket_order_items_column"
                width: parent.width
                height: parent.height
                spacing:5
                    Item_detail{
                        product_name: "Americano"
                        quantity: 3
                        size_drink: "Grande"
                        item_info: "Iced"
                        unit_price: 90.00
                    }
                }
            }


        Row {
            id: row
            x: 81
            y: 511
            width: 266
            height: 50
            anchors.verticalCenterOffset: 233
            anchors.horizontalCenterOffset: 0
            spacing: 60
            anchors.centerIn: parent
            Button {
                id: change_btn_head
                objectName: "change_tab_button"
                anchors.verticalCenter: parent.verticalCenter
                width: 100
                height: 50

                font.pixelSize: 14
                font.weight: Font.Normal
                font.family: "Unbounded"
                background: Rectangle {
                    color: "#f2efea"
                }
                contentItem: Column {
                    id: change_tab_content_column
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


                onClicked:{
                    change_or_disc_state.currentIndex = 0
                    selectedTab = 0;
                    }
            }

            Button {
                id: discount_btn_head
                objectName: "discount_tab_button"
                height: 50
                width: 100
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
                font.weight: Font.Normal
                font.family: "Unbounded"


                onClicked:{
                    change_or_disc_state.currentIndex = 1
                    selectedTab = 1;
                }
                background: Rectangle {
                    color: "#f2efea"
                }
                contentItem: Column {
                    id: column2
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4
                    Text {
                        text: qsTr("Discount")
                        color: "#4e2d18"
                        font: discount_btn_head.font
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        //anchors.centerIn: parent
                        //font.pointSize: 12
                        //font.styleName: "Medium"
                        //font.family: "Unbounded"
                    }
                    Rectangle {
                        width: 60
                        height: 2
                        color: "#4e2d18"
                        anchors.horizontalCenter: parent.horizontalCenter
                        visible: selectedTab === 1
                    }
                }
            }
        }
        Text {
            id: subTotal_lbl
            width: 166
            height: 27
            color: "#4e2d18"
            text: qsTr("SubTotal")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 689
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Text {
            id: currentBillTotalInput
            objectName: "current_bill_total_display"
            width: 149
            height: 31
            color: "#4d6443"
            text: qsTr("₱ 0.00")
            anchors.left: parent.right
            anchors.top: parent.top
            anchors.leftMargin: -180
            anchors.topMargin: 689
            font.pixelSize: 20
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: ticket
            width: 93
            height: 30
            color: "#4d2d18"
            text: qsTr("Ticket")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 37
            anchors.topMargin: 28
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        RowLayout {
            id: row1
            //x: 25
            anchors.horizontalCenter: parent.horizontalCenter
            y: 910
            width: 460
            height: 50
            spacing: 100
            Column {
                id: column

                Layout.fillWidth: true

                Text {
                    id: cash_Receivedlbl
                    //width: 104
                    height: 15
                    color: "#4e2d18"
                    text: qsTr("Cash Received")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.NoWrap
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.Light
                    font.family: "Unbounded"
                }
                Text {
                    id: cash_received
                    objectName: "cash_received_display"
                    //width: 104
                    height: 30
                    color: "#4d6443"
                    text: qsTr("₱ 0")
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.Normal
                    font.family: "Unbounded"
                }
            }
            Column {

                Layout.fillWidth: true

                Text {
                    id: change_lbl
                    //width: 68
                    height: 15
                    color: "#4e2d18"
                    text: qsTr("Change")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHcenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.NoWrap
                    font.weight: Font.Light
                    font.family: "Unbounded"
                }
                Text {
                    id: calculate_change
                    objectName: "calculated_change_display"
                    //width: 68
                    height: 30
                    color: "#4d6443"
                    text: qsTr("₱ 0")
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    font.weight: Font.Normal
                    font.family: "Unbounded"
                }
            }
        }

        Button {
            id: gcash_btn
            objectName: "gcash_payment_button"
            x: 24
            y: 972
            width: 95
            height: 53
            background: Rectangle {
                id: rectangle_25
                color: "#0091f7"
                radius: 8
            }

            contentItem: Text {
                id: gCash
                //width: 83
                //height: 21
                color: "#f2efea"
                text: qsTr("GCash")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.NoWrap
                anchors.centerIn: parent
                font.weight: Font.DemiBold
                font.family: "Unbounded"
            }
        }

        Button {
            id: maya_btn
            objectName: "maya_payment_button"
            x: 130
            y: 972
            width: 76
            height: 53
            background: Rectangle {
                id: rectangle_26
                color: "#9aca1f"
                radius: 8
            }

            contentItem: Text {
                id: maya
                color: "#f2efea"
                text: qsTr("Maya")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.NoWrap
                anchors.centerIn: parent
                font.weight: Font.DemiBold
                font.family: "Unbounded"
            }
        }

        Button {
            id: split_btn
            objectName: "split_payment_button"
            x: 216
            y: 972
            width: 95
            height: 53
            background: Rectangle {
                id: rectangle_27
                color: "#708a2e"
                radius: 8
            }

            contentItem: Text {
                id: split
                width: 68
                height: 21
                color: "#f2efea"
                text: qsTr("Split")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                anchors.centerIn: parent
                font.weight: Font.DemiBold
                font.family: "Unbounded"
            }
            onClicked: {
                var amount = parseInt(currentBillTotalInput.text || "0");
        ticketPanelRoot.open_split_popup(amount); // Emitting the signal
        console.log("Ticket_Panel: Emitting openSplitPopup with amount:", amount);
            }
        }

        Button {
            id: charge_btn
            objectName: "charge_button"
            x: 321
            y: 972
            width: 167
            height: 53
            background: Rectangle {
                id: rectangle_28
                color: "#708a2e"
                radius: 8
            }

            contentItem: Text {
                id: charge
                width: 75
                height: 20
                color: "#f2efea"
                text: qsTr("Charge")
                anchors.centerIn: parent
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.NoWrap
                font.weight: Font.DemiBold
                font.family: "Unbounded"
            }
        }

        Rectangle {
            id: rectangle
            y: 675
            width: 454
            height: 1
            color: "#4e2d18"
            border.color: "#4e2d18"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
