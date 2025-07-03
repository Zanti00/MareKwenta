import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Item {
    id: cash_Box_employee
    width: 1240
    height: 1024
    visible: true
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

    Rectangle{
        anchors.fill: parent
        color: "#f2efea"
        Text {
            id: header
            width: 257
            height: 38
            color: "#4e2d18"
            text: qsTr("Cash Box")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 34
            anchors.topMargin: 46
            font.pixelSize: 36
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
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
            anchors.leftMargin: 918
            anchors.topMargin: 41
            Text {
                id: dATE_
                width: 68
                height: 29
                color: "#b24d2d18"
                text: qsTr("DATE:")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 8
                anchors.topMargin: 11
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
                anchors.leftMargin: 110
                anchors.topMargin: 11
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.DemiBold
                font.family: "Inter"
            }
        }



        Rectangle {
            id: rectangle_65
            width: 676
            height: 525
            color: "#f2efea"
            radius: 24
            border.color: "#b24d2d18"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 537
            anchors.topMargin: 179
        }
        Rectangle {
            id: rectangle_72
            width: 676
            height: 84
            color: "#ffffff"
            border.color: "#b24d2d18"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 537
            anchors.topMargin: 269

            Button {
                id: delete_button
                x: 11
                y: 23
                width: 42
                height: 39
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
                x: 64
                y: 23
                width: 42
                height: 39
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
            anchors.leftMargin: 1114
            anchors.topMargin: 300
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
            anchors.leftMargin: 666
            anchors.topMargin: 289
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
            anchors.leftMargin: 666
            anchors.topMargin: 308
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Button {
            id: addexpense_button
            x: 1131
            y: 198
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

        Rectangle {
            id: circle4
            x: 279
            y: 295
            width: 34
            height: 32
            color: "#f2efea"
            radius: 24
            border.color: "#f2efea"
            Image {
                id: cash1
                x: 5
                y: 4
                source: "assets/Cash.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: circle6
            x: 279
            y: 518
            width: 34
            height: 32
            color: "#f2efea"
            radius: 24
            border.color: "#f2efea"
            Image {
                id: cash2
                x: 5
                y: 4
                source: "assets/Cash.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: rectangle
            x: 10
            y: 148
            width: 521
            height: 755
            color: "#f2efea"
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
                anchors.leftMargin: 25
                anchors.topMargin: 35
                Rectangle {
                    id: circle2
                    x: 153
                    y: 10
                    width: 34
                    height: 32
                    color: "#f2efea"
                    radius: 24
                    border.color: "#f2efea"

                    Image {
                        id: cash
                        x: 5
                        y: 4
                        source: "assets/Cash.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Text {
                    id: cASH
                    width: 46
                    height: 19
                    color: "#b24d2d18"
                    text: qsTr("CASH")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 15
                    anchors.topMargin: 10
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.NoWrap
                    font.weight: Font.Normal
                    font.family: "Inter"
                }


                Text {
                    id: cash_text
                    width: 153
                    height: 34
                    color: "#4d2d18"
                    text: qsTr("₱ 3,100.00")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 24
                    anchors.topMargin: 55
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    font.weight: Font.Bold
                    font.family: "Inter"
                }
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
                anchors.leftMargin: 289
                anchors.topMargin: 35

                Rectangle {
                    id: circle
                    x: 152
                    y: 9
                    width: 34
                    height: 32
                    color: "#f2efea"
                    radius: 24
                    border.color: "#f2efea"
                }
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
                anchors.leftMargin: 289
                anchors.topMargin: 162
            }

            Text {
                id: gCASH
                width: 58
                height: 19
                color: "#b20091f7"
                text: qsTr("GCASH")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 309
                anchors.topMargin: 49
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
                anchors.leftMargin: 299
                anchors.topMargin: 177
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Inter"
            }
            Rectangle {
                id: circle1
                x: 441
                y: 170
                width: 34
                height: 32
                color: "#f2efea"
                radius: 24
                border.color: "#f2efea"
            }
            Text {
                id: gcash_text
                width: 153
                height: 34
                color: "#0091f7"
                text: qsTr("₱ 3,100.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 317
                anchors.topMargin: 90
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
                anchors.leftMargin: 317
                anchors.topMargin: 217
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
                anchors.leftMargin: 446
                anchors.topMargin: 174
                source: "assets/debit_Card_1.png"
            }

            Image {
                id: credit_Card
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 446
                anchors.topMargin: 49
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
                anchors.leftMargin: 25
                anchors.topMargin: 162
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
                anchors.leftMargin: 26
                anchors.topMargin: 291
            }
            Rectangle {
                id: circle5
                x: 177
                y: 299
                width: 34
                height: 32
                color: "#f2efea"
                radius: 24
                border.color: "#f2efea"

                Image {
                    id: cash5
                    x: 5
                    y: 4
                    source: "assets/Cash.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Text {
                id: pETTY_CASH
                width: 101
                height: 25
                color: "#b24d2d18"
                text: qsTr("PETTY CASH")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 37
                anchors.topMargin: 176
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
                anchors.leftMargin: 38
                anchors.topMargin: 305
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
                anchors.leftMargin: 49
                anchors.topMargin: 217
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
                anchors.leftMargin: 50
                anchors.topMargin: 351
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
                anchors.leftMargin: 26
                anchors.topMargin: 429
            }

            Rectangle {
                id: circle8
                x: 177
                y: 170
                width: 34
                height: 32
                color: "#f2efea"
                radius: 24
                border.color: "#f2efea"

                Image {
                    id: cash4
                    x: 5
                    y: 4
                    source: "assets/Cash.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            Text {
                id: cASH_EXPENSES
                width: 85
                height: 38
                color: "#b24d2d18"
                text: qsTr("CASH EXPENSES")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 38
                anchors.topMargin: 447
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
                anchors.leftMargin: 49
                anchors.topMargin: 507
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
                anchors.leftMargin: 289
                anchors.topMargin: 290
            }
            Rectangle {
                id: circle10
                x: 441
                y: 307
                width: 34
                height: 32
                color: "#f2efea"
                radius: 24
                border.color: "#f2efea"

                Image {
                    id: cash7
                    x: 5
                    y: 4
                    source: "assets/Cash.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            Text {
                id: nON_CASH_EXPENSES
                width: 103
                height: 38
                color: "#b24d2d18"
                text: qsTr("NON - CASH \nEXPENSES")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 309
                anchors.topMargin: 301
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
                anchors.leftMargin: 313
                anchors.topMargin: 358
                font.pixelSize: 28
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.NoWrap
                font.weight: Font.Bold
                font.family: "Inter"
            }

            Rectangle {
                id: circle3
                x: 177
                y: 440
                width: 34
                height: 32
                color: "#f2efea"
                radius: 24
                border.color: "#f2efea"

                Image {
                    id: cash6
                    x: 5
                    y: 4
                    source: "assets/Cash.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
        Text {
            id: eXPENSE_ADDED
            width: 202
            height: 29
            color: "#4d2d18"
            text: qsTr("EXPENSE ADDED")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 561
            anchors.topMargin: 210
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Bold
            font.family: "Inter"
        }
    }




}

/*##^##
Designer {
    D{i:0;uuid:"0154729e-62fa-5104-9e79-fd6f8ca55248"}
}
##^##*/

