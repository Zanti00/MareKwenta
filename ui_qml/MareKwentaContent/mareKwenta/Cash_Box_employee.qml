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
    property alias receiptsText: receipts.text
    property alias headerText: header.text
    property alias mKText: mK.text
    property alias element7Text: noncash_text.text
    property alias cash_BoxText: cash_Box.text
    property alias dATE_Text: dATE_.text
    property alias element6Text: cashexpenses_text.text
    property alias june_8_2025Text: date_text.text
    property alias eXPENSE_ADDEDText: eXPENSE_ADDED.text
    property alias element2Text: gcash_text.text
    property alias cASHText: cASH.text
    property alias nON_CASH_EXPENSESText: nON_CASH_EXPENSES.text
    property alias element5Text: cashsales_text.text
    property alias staffText: staff.text
    property alias element8Text: expense_text.text
    property alias ticketText: ticket.text
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
        id: nav
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 2
        anchors.rightMargin: 1350
        Item {
            id: group_40
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Image {
                id: rectangle_14
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -4
                anchors.topMargin: -8
                source: "assets/rectangle_14_16.png"
            }

            Item {
                id: group_61
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 14
                anchors.rightMargin: 13
                anchors.topMargin: 132
                anchors.bottomMargin: 827
                Text {
                    id: ticket
                    width: 62
                    height: 21
                    color: "#4d2d18"
                    text: qsTr("Ticket")
                    anchors.top: parent.top
                    anchors.topMargin: 44
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    font.weight: Font.Light
                    font.family: "Unbounded"
                    anchors.horizontalCenterOffset: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Shopping_cart {
                    id: shopping_cart
                    width: 31
                    height: 29
                    anchors.top: parent.top
                    state: "size_48"
                    clip: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Item {
                id: group_62
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 19
                anchors.rightMargin: 20
                anchors.topMargin: 243
                anchors.bottomMargin: 703
                User {
                    id: user
                    width: 33
                    height: 31
                    anchors.top: parent.top
                    state: "size_48"
                    clip: true
                    anchors.horizontalCenterOffset: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: staff
                    width: 50
                    height: 34
                    color: "#4d2d18"
                    text: qsTr("Staff")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 44
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    font.weight: Font.Light
                    font.family: "Unbounded"
                }
            }

            Text {
                id: cash_Box
                width: 71
                height: 53
                color: "#4d2d18"
                text: qsTr("Cash Box")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 513
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
            }

            Item {
                id: group_64
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 4
                anchors.rightMargin: 0
                anchors.topMargin: 353
                anchors.bottomMargin: 577
                Item {
                    id: group_63
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 41
                    Text {
                        id: receipts
                        width: 85
                        height: 53
                        color: "#4d2d18"
                        text: qsTr("Receipts")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.Wrap
                        font.weight: Font.Light
                        font.family: "Unbounded"
                    }
                }

                List {
                    id: element
                    width: 34
                    height: 28
                    anchors.top: parent.top
                    state: "size_48"
                    clip: true
                    anchors.horizontalCenterOffset: -2
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Dollar_sign {
                id: dollar_sign
                width: 29
                height: 31
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 29
                anchors.topMargin: 461
                state: "size_48"
                clip: true
            }
        }

        Item {
            id: group_41
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            anchors.topMargin: 46
            anchors.bottomMargin: 920
            Text {
                id: mK
                width: 59
                height: 58
                color: "#4d2d18"
                text: qsTr("MK")
                anchors.left: parent.left
                anchors.top: parent.top
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
                id: line_1_Stroke_
                width: 52
                height: 2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 35
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_1_Stroke__ShapePath_0
                    strokeWidth: 2
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_1_Stroke__PathSvg_0
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
        id: rectangle_49
        width: 83
        height: 97
        color: "#424d2d18"
        radius: 12
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 4
        anchors.topMargin: 456
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
            mainWindow.addExpenseButtonClicked()
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"0154729e-62fa-5104-9e79-fd6f8ca55248"}D{i:1;uuid:"764cc56a-ad90-525a-aa58-cadaa2b722b9"}
D{i:2;uuid:"b35aee79-ffc6-59da-8d3f-3d07b5fce7f5"}D{i:3;uuid:"af1242fb-4353-5075-bf35-53593f851389"}
D{i:4;uuid:"c890194d-8561-5591-a965-c050ffd94fa9"}D{i:5;uuid:"63dc575f-468d-5e76-8ba7-0680ef4caf38"}
D{i:6;uuid:"363153c0-36e3-50e5-9bc6-32d6210efdf6"}D{i:7;uuid:"fece78f9-4dfc-5fca-9b07-454e2a62bb0b"}
D{i:8;uuid:"3fa28ad4-f106-576d-a820-c5d3179e2ab7"}D{i:9;uuid:"e0f20c37-80ce-589c-9c30-b46b54d6569c"}
D{i:10;uuid:"50ed4f83-91cd-563c-a2e4-0a52f792d4e7"}D{i:11;uuid:"7ecc2a29-ae39-53a0-9c26-b44c436ec9a1"}
D{i:12;uuid:"02dd4a5a-e7eb-5ac6-9f0f-e092fdf0dc79"}D{i:13;uuid:"67c862d9-0287-57bf-98fc-30a6b9961eb8"}
D{i:14;uuid:"7611a580-09fb-5c02-a98d-7aa8e2a9a928"}D{i:15;uuid:"c74192a1-9649-53b5-88d4-ef77e5cfef17"}
D{i:16;uuid:"cb57f209-a0ae-5d0e-8a92-5907be4dc589"}D{i:17;uuid:"6f2757c1-cdca-566d-9d95-404ae9d5b542"}
D{i:18;uuid:"03bacfcb-6766-5f0e-8a81-e9dfc4b9cc23"}D{i:19;uuid:"66f614a1-94bb-548a-8556-4b3d9006abd0"}
D{i:20;uuid:"66f614a1-94bb-548a-8556-4b3d9006abd0_ShapePath_0"}D{i:21;uuid:"66f614a1-94bb-548a-8556-4b3d9006abd0-PathSvg_0"}
D{i:22;uuid:"3b2b4a8e-b279-5b36-bec8-430d03096a7a"}D{i:23;uuid:"eff5447a-5502-517a-b612-fca95467d22e"}
D{i:24;uuid:"546e3da8-3c1b-5b0d-bd79-1a5232b6924f"}D{i:25;uuid:"fdb62f75-0917-54df-99aa-fb83ddb79031"}
D{i:26;uuid:"3ef80c7c-bfc2-5417-be71-6ea110567fd5"}D{i:28;uuid:"e4d3542d-58f1-5c94-af7d-1ad51ee6d95f"}
D{i:32;uuid:"ea6596a3-206f-519d-889b-c27a6311cb5e"}
}
##^##*/

