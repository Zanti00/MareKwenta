import QtQuick
import QtQuick.Controls

Rectangle {
    id: addExpense1
    width: 315
    height: 383
    color: "transparent"
    property alias add_ExpenseText: add_Expense.text
    property alias expense_TagText: expense_Tag.text

    Item {
        id: addExpense
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Rectangle {
            id: rectangle_56
            width: 315
            height: 383
            color: "#f2efea"
            border.color: "#4e2d18"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top

            RadioButton {
                id: cash_radiobutton
                x: 54
                y: 257
                text: qsTr("Cash")
                font.pointSize: 13
            }

            RadioButton {
                id: noncash_radiobutton
                x: 54
                y: 286
                text: qsTr("Non-Cash")
                font.pointSize: 13
            }
        }

        Text {
            id: add_Expense
            width: 257
            height: 38
            color: "#4e2d18"
            text: qsTr("Add Expense")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 30
            anchors.topMargin: 19
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Inter"
        }

        Text {
            id: expense_Tag
            width: 192
            height: 27
            color: "#000000"
            text: qsTr("Expense Tag")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 30
            anchors.topMargin: 234
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            lineHeight: 22
            lineHeightMode: Text.FixedHeight
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Input_Field {
            id: expensename_textbox
            width: 265
            height: 62
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 25
            anchors.topMargin: 63
            valueText: ""
            state: "state_Default_Value_Type_Default"
            labelText: qsTr("Expense Name")
        }

        Input_Field {
            id: expenseamount_textbox
            width: 265
            height: 62
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 25
            anchors.topMargin: 151
            valueText: ""
            state: "state_Default_Value_Type_Default"
            labelText: qsTr("Expense Amount")
        }

        TextInput {
            id: expensename_input
            x: 37
            y: 98
            width: 241
            height: 27
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            selectionColor: "#4e2d18"
            passwordCharacter: ""
            font.family: "Arial"
        }

        TextInput {
            id: expenseamount_input
            x: 37
            y: 186
            width: 241
            height: 27
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            selectionColor: "#4e2d18"
            passwordCharacter: ""
            font.family: "Arial"
        }
    }

    Button {
        id: addexpense_button
        x: 95
        y: 330
        width: 126
        height: 36
        font.pointSize: 13
        font.family: "Inter 18pt 18pt"
        font.bold: true
        display: AbstractButton.TextOnly
        contentItem: Text {
            color: "#f2efea"
            text: "Add"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Medium"
            font.pointSize: 11
            font.family: "Inter 18pt 18pt"
        }
        background: Rectangle {
            color: "#4e2d18"
            radius: 8
            border.color: "#4e2d18"
            border.width: 1
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"be577048-0f00-5970-a41b-793b83818814"}D{i:1;uuid:"c89e8e42-a533-5857-8921-c6017b15340f"}
D{i:2;uuid:"af057834-b15b-5c5e-b421-d9af5c77d129"}D{i:4}D{i:5;uuid:"b8cc85f7-aaff-5a86-a4e7-c2db5ad83ff4"}
D{i:6;uuid:"d28daef9-eba4-5f05-9740-8c7500cf4228"}D{i:7}D{i:8}D{i:9}D{i:10}D{i:11}
}
##^##*/

