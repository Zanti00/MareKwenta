import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: cash_Box_employee
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias element1Text: cash_text.text
    property alias sack_of_RiceText: expensename.text
    property alias cASH_EXPENSESText: cASH_EXPENSES.text
    property alias cASH_SALESText: cASH_SALES.text
    property alias pETTY_CASHText: pETTY_CASH.text
    property alias cASH1Text: category.text
    property alias gCASHText: gCASH.text
    property alias headerText: header.text
    property alias element7Text: noncash_text.text
    property alias dATE_Text: dATE_.text
    property alias element6Text: cashexpenses_text.text
    property alias june_8_2025Text: date_text.text
    property alias eXPENSE_ADDEDText: eXPENSE_ADDED.text
    property alias element2Text: gcash_text.text
    property alias cASHText: cASH.text
    property alias nON_CASH_EXPENSESText: nON_CASH_EXPENSES.text
    property alias element5Text: cashsales_text.text
    property alias mAYAText: mAYA.text
    property alias element3Text: maya_text.text
    property alias element4Text: pettycash_text.text

    Text {
        id: header
        width: 257
        height: 38
        color: "#4e2d18"
        text: qsTr("Cash Box")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 41
        font.pixelSize: 36
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "Unbounded"
    }

    Item {
        id: group_17
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -2
        anchors.rightMargin: 1340
        Image {
            id: rectangle_15
            width: 124
            height: 1040
            anchors.top: parent.top
            anchors.topMargin: -8
            source: "assets/rectangle_15.png"

            Rectangle {
                id: rectangle8
                x: 18
                y: 775
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
            }

            Rectangle {
                id: rectangle9
                x: 18
                y: 657
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
            }

            Rectangle {
                id: rectangle7
                x: 18
                y: 541
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
            }

            Rectangle {
                id: rectangle6
                x: 18
                y: 423
                width: 78
                height: 85
                color: "#f2efea"
                border.color: "#f2efea"
            }

            Rectangle {
                id: rectangle5
                x: 18
                y: 305
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
                border.color: "#f2efea"
            }

            Rectangle {
                id: rectangle4
                x: 18
                y: 126
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
                border.color: "#f2efea"

                Button {
                    id: inventory_navbar
                    x: 0
                    objectName: "inventory_navbar"
                    y: 0
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.height: 55
                    icon.color: "#4e2d18"
                    icon.width: 55
                    icon.source: "assets/Archive.png"
                    onClicked: navHandler.navigateToInventory()
                    display: AbstractButton.IconOnly
                    background: Rectangle{
                        color: "#f2efea"
                        border.color: "#f2efea"

                    }
                    Text {
                        id: text4
                        x: 5
                        y: 63
                        color: "#4e2d18"
                        text: qsTr("Inventory")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: staff_navbar
                    objectName: "staff_navbar"
                    x: 0
                    y: 114
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/User.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    onClicked: navHandler.navigateToStaff()
                    display: AbstractButton.IconOnly
                    background: Rectangle{
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"

                    }

                    Text {
                        id: text5
                        x: 21
                        y: 62
                        color: "#4e2d18"
                        text: qsTr("Staff")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: receipt_navbar
                    objectName: "receipt_navbar"
                    x: 0
                    y: 226
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/List.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    display: AbstractButton.IconOnly
                    Text {
                        id: text6
                        x: 12
                        y: 65
                        color: "#4e2d18"
                        text: qsTr("Receipt")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                    background: Rectangle {
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"
                    }
                }

                Button {
                    id: cashbox_navbar
                    objectName: "casbox_navbar"
                    x: 0
                    y: 350
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/DollarSign.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    onClicked: navHandler.navigateToCashBox()
                    display: AbstractButton.IconOnly
                    Text {
                        id: text7
                        x: 7
                        y: 65
                        color: "#4e2d18"
                        text: qsTr("CashBox")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                    background: Rectangle {
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"
                    }
                }

                Button {
                    id: ticket_navbar
                    objectName: "ticket_navbar"
                    x: 0
                    y: 466
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/Ticket.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    display: AbstractButton.IconOnly
                    Text {
                        id: text8
                        x: 17
                        y: 65
                        color: "#4e2d18"
                        text: qsTr("Ticket")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                    background: Rectangle {
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"
                    }
                }

                Button {
                    id: dashboard_navbar
                    objectName: "dashboard_navbar"
                    x: 0
                    y: 584
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/BarChart.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    onClicked: navHandler.navigateToDashboard()
                    display: AbstractButton.IconOnly
                    Text {
                        id: text9
                        x: 0
                        y: 65
                        color: "#4e2d18"
                        text: qsTr("Dashboard")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                    background: Rectangle {
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"
                    }
                }
            }





        }

        Text {
            id: logs1
            width: 50
            height: 34
            visible: false
            color: "#4e2d18"
            text: qsTr("Logs")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 287
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Item {
            id: group_9
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 23
            anchors.rightMargin: 21
            anchors.topMargin: 44
            anchors.bottomMargin: 922
            Text {
                id: mK1
                width: 59
                height: 58
                color: "#4d2d18"
                text: qsTr("MK")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -1
                anchors.topMargin: -8
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4d2d18"
                style: Text.Outline
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Shape {
                id: line_1_Stroke_1
                width: 52
                height: 2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 3
                anchors.topMargin: 28
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_1_Stroke__ShapePath_1
                    strokeWidth: 2
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_1_Stroke__PathSvg_1
                        path: "M 52 0 L 52 2 L 8.881784197001252e-16 2 L 0 1.4210854715202004e-14 L 52 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#4d2d18"
                }
                antialiasing: true
            }
        }
    }

    Rectangle {
        id: rectangle_64
        width: 200
        height: 100
        color: "#ffffff"
        radius: 14
        border.color: "#4d2d18"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 127
        anchors.topMargin: 163
    }

    Text {
        id: cASH
        width: 46
        height: 19
        color: "#b24d2d18"
        text: qsTr("CASH")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 140
        anchors.topMargin: 177
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Rectangle {
        id: rectangle_65
        width: 800
        height: 768
        color: "#f2efea"
        radius: 24
        border.color: "#b24d2d18"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 595
        anchors.topMargin: 163
    }

    Text {
        id: cash_text
        width: 153
        height: 34
        color: "#4d2d18"
        text: qsTr("₱ 3,100.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 141
        anchors.topMargin: 218
        font.pixelSize: 28
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Rectangle {
        id: rectangle_66
        width: 200
        height: 100
        color: "#ffffff"
        radius: 14
        border.color: "#0091f7"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 353
        anchors.topMargin: 162
    }

    Rectangle {
        id: rectangle_67
        width: 200
        height: 100
        color: "#ffffff"
        radius: 14
        border.color: "#00894c"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 353
        anchors.topMargin: 278
    }

    Text {
        id: gCASH
        width: 58
        height: 19
        color: "#b20091f7"
        text: qsTr("GCASH")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 366
        anchors.topMargin: 176
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: mAYA
        width: 46
        height: 19
        color: "#b200894c"
        text: qsTr("MAYA")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 366
        anchors.topMargin: 292
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: gcash_text
        width: 153
        height: 34
        color: "#0091f7"
        text: qsTr("₱ 3,100.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 367
        anchors.topMargin: 217
        font.pixelSize: 28
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Text {
        id: maya_text
        width: 153
        height: 34
        color: "#00894c"
        text: qsTr("₱ 3,100.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 367
        anchors.topMargin: 333
        font.pixelSize: 28
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Image {
        id: debit_Card
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 507
        anchors.topMargin: 289
        source: "assets/debit_Card_1.png"
    }

    Image {
        id: credit_Card
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 507
        anchors.topMargin: 174
        source: "assets/credit_Card.png"
    }

    Rectangle {
        id: rectangle_68
        width: 200
        height: 100
        color: "#ffffff"
        radius: 14
        border.color: "#4d2d18"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 128
        anchors.topMargin: 279
    }

    Rectangle {
        id: rectangle_69
        width: 200
        height: 100
        color: "#ffffff"
        radius: 14
        border.color: "#4d2d18"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 128
        anchors.topMargin: 395
    }


    Text {
        id: pETTY_CASH
        width: 101
        height: 19
        color: "#b24d2d18"
        text: qsTr("PETTY CASH")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 141
        anchors.topMargin: 293
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: cASH_SALES
        width: 100
        height: 19
        color: "#b24d2d18"
        text: qsTr("CASH SALES")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 141
        anchors.topMargin: 409
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: pettycash_text
        width: 153
        height: 34
        color: "#4d2d18"
        text: qsTr("₱ 1,000.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 334
        font.pixelSize: 28
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Text {
        id: cashsales_text
        width: 153
        height: 34
        color: "#4d2d18"
        text: qsTr("₱ 3,100.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 450
        font.pixelSize: 28
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Rectangle {
        id: rectangle_70
        width: 200
        height: 120
        color: "#ffffff"
        radius: 14
        border.color: "#4d2d18"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 129
        anchors.topMargin: 511
    }


    Text {
        id: cASH_EXPENSES
        width: 83
        height: 38
        color: "#b24d2d18"
        text: qsTr("CASH \nEXPENSES")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 525
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: cashexpenses_text
        width: 153
        height: 34
        color: "#4d2d18"
        text: qsTr("₱ 3,100.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 143
        anchors.topMargin: 584
        font.pixelSize: 28
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Rectangle {
        id: rectangle_71
        width: 200
        height: 120
        color: "#ffffff"
        radius: 14
        border.color: "#4d2d18"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 129
        anchors.topMargin: 647
    }

    Text {
        id: nON_CASH_EXPENSES
        width: 103
        height: 38
        color: "#b24d2d18"
        text: qsTr("NON - CASH \nEXPENSES")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 661
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: noncash_text
        width: 153
        height: 34
        color: "#4d2d18"
        text: qsTr("₱ 3,100.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 143
        anchors.topMargin: 720
        font.pixelSize: 28
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Rectangle {
        id: rectangle_51
        width: 283
        height: 48
        color: "#f2efea"
        radius: 10
        border.color: "#4d2d18"
        border.width: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1109
        anchors.topMargin: 50
    }

    Text {
        id: dATE_
        width: 68
        height: 29
        color: "#b24d2d18"
        text: qsTr("DATE:")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1123
        anchors.topMargin: 60
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: date_text
        width: 153
        height: 29
        color: "#4d2d18"
        text: qsTr("June 8, 2025")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1225
        anchors.topMargin: 60
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.DemiBold
        font.family: "Inter"
    }

    Text {
        id: eXPENSE_ADDED
        width: 202
        height: 29
        color: "#4d2d18"
        text: qsTr("EXPENSE ADDED")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 638
        anchors.topMargin: 191
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Rectangle {
        id: rectangle_72
        width: 800
        height: 84
        color: "#ffffff"
        border.color: "#b24d2d18"
        border.width: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 595
        anchors.topMargin: 243

        Button {
            id: delete_button
            x: 28
            y: 30
            width: 25
            height: 25
            text: qsTr("Button")
            icon.color: "#860707"
            icon.source: "assets/trash.png"
            display: AbstractButton.IconOnly
            background: Rectangle {
                color: "#f7d6d6"
                radius: 8
                border.color: "#960606"
            }
        }

        Button {
            id: edit_button
            x: 59
            y: 30
            width: 25
            height: 25
            text: qsTr("")
            icon.source: "assets/Edit.png"
            icon.color: "#03590f"
            display: AbstractButton.IconOnly
            background: Rectangle {
                color: "#d4ffda"
                radius: 8
                border.color: "#03590f"
            }
        }
    }

    Text {
        id: expense_text
        width: 87
        height: 22
        color: "#4d2d18"
        text: qsTr("₱ 300.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1267
        anchors.topMargin: 274
        font.pixelSize: 18
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Text {
        id: expensename
        width: 122
        height: 22
        color: "#4d2d18"
        text: qsTr("1 Sack of Rice")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 780
        anchors.topMargin: 261
        font.pixelSize: 18
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Inter"
    }

    Text {
        id: category
        width: 46
        height: 19
        color: "#b24d2d18"
        text: qsTr("CASH")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 780
        anchors.topMargin: 289
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Button {
        id: addexpense_button
        x: 1312
        y: 179
        width: 54
        height: 53
        text: qsTr("")
        icon.source: "assets/Edit.png"
        icon.color: "#03590f"
        display: AbstractButton.TextOnly
        contentItem: Text {
            color: "#4e2d18"
            text: "+"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Medium"
            font.pointSize: 21
            font.family: "Unbounded"
        }
        background: Rectangle {
            color: "#f2efea"
            radius: 72
            border.color: "#4e2d18"
        }
        onClicked: {
            console.log("Add expense button clicked!")
            navHandler.addExpenseButtonClicked()
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"0154729e-62fa-5104-9e79-fd6f8ca55248"}D{i:1;uuid:"764cc56a-ad90-525a-aa58-cadaa2b722b9"}
D{i:2;uuid:"b35aee79-ffc6-59da-8d3f-3d07b5fce7f5"}D{i:34;uuid:"eff5447a-5502-517a-b612-fca95467d22e"}
D{i:35;uuid:"546e3da8-3c1b-5b0d-bd79-1a5232b6924f"}D{i:36;uuid:"fdb62f75-0917-54df-99aa-fb83ddb79031"}
D{i:37;uuid:"3ef80c7c-bfc2-5417-be71-6ea110567fd5"}D{i:39;uuid:"e4d3542d-58f1-5c94-af7d-1ad51ee6d95f"}
D{i:43;uuid:"ea6596a3-206f-519d-889b-c27a6311cb5e"}
}
##^##*/

