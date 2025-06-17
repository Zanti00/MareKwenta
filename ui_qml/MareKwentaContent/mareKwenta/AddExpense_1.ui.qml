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

        Input_Field {
            id: input_Field
            width: 256
            height: 70
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 30
            anchors.topMargin: 64
            state: "state_Default_Value_Type_Default"
            labelText: qsTr("Expense Name")
        }

        Input_Field {
            id: input_Field1
            width: 256
            height: 70
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 30
            anchors.topMargin: 151
            state: "state_Default_Value_Type_Default"
            labelText: qsTr("Expense Amount")
        }

        Button_Danger {
            id: button_Danger
            width: 52
            height: 38
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 234
            anchors.topMargin: 323
            state: "variant_Primary_State_Default_Size_Medium"
            clip: true
            buttonText: qsTr("Add")
        }

        Radio_Field {
            id: radio_Field
            width: 256
            height: 22
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 40
            anchors.topMargin: 261
            state: "state_Default_Value_Type_Checked"
            labelText: qsTr("Cash")
        }

        Radio_Field {
            id: radio_Field1
            width: 256
            height: 22
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 40
            anchors.topMargin: 290
            state: "state_Default_Value_Type_Checked"
            labelText: qsTr("Non-Cash")
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
    }
}

/*##^##
Designer {
    D{i:0;uuid:"92c2f9c3-e858-5fab-b6a7-c1185b18acd9"}D{i:1;uuid:"3c837b9e-eb57-554e-8ebb-ce5fda3c7206"}
D{i:2;uuid:"f6aa57f2-6981-5cc7-b7dd-905b685aab58"}D{i:3;uuid:"2c53dbe6-c172-57c4-b872-46bc2306b570"}
D{i:4;uuid:"8a4b0d0e-6686-58a0-8c26-f9edfad510b1"}D{i:5;uuid:"b020d9c8-db61-567a-b4bd-b0e853e0d942"}
D{i:6;uuid:"ce37fbdc-9252-5b3e-b18e-a0435a83152e"}D{i:7;uuid:"f1a50821-aebc-593c-b1b5-8832dfed47be"}
D{i:8;uuid:"83bafe0e-48b1-53a5-b758-c4c41ceccca5"}D{i:9;uuid:"82c2c8df-ca88-52ac-bfe7-57527049a4e2"}
}
##^##*/

