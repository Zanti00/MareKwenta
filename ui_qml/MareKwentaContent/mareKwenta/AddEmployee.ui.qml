import QtQuick
import QtQuick.Controls

Rectangle {
    id: addEmployee1
    width: 315
    height: 304
    color: "transparent"
    property alias add_EmployeeText: add_Employee.text

    Item {
        id: addEmployee
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Rectangle {
            id: rectangle_56
            width: 315
            height: 304
            color: "#f2efea"
            radius: 20
            border.color: "#4e2d18"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Text {
            id: add_Employee
            width: 257
            height: 38
            color: "#4e2d18"
            text: qsTr("Add Employee")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 30
            anchors.topMargin: 25
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
            anchors.topMargin: 70
            state: "state_Default_Value_Type_Default"
            labelText: qsTr("Employee Name")
        }

        Input_Field {
            id: input_Field1
            width: 256
            height: 70
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 30
            anchors.topMargin: 157
            state: "state_Default_Value_Type_Default"
            labelText: qsTr("Password")
        }

        Button_Danger {
            id: button_Danger
            width: 52
            height: 38
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 234
            anchors.topMargin: 244
            state: "variant_Primary_State_Default_Size_Medium"
            clip: true
            buttonText: qsTr("Add")
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"e25bc1ab-7df0-5723-915e-b4cd545083ca"}D{i:1;uuid:"0594c7a2-9d61-567e-bcac-9160efdb2735"}
D{i:2;uuid:"5e250eaf-e1f2-5393-9f6d-463d68703592"}D{i:3;uuid:"8370daf5-2e7c-5863-9954-b6103a61ca26"}
D{i:4;uuid:"fa773bcc-7d3d-5fd0-8b3a-2267d14997ec"}D{i:5;uuid:"df926fb4-3364-586b-b481-9e786a5c4442"}
D{i:6;uuid:"626614c9-83fc-55d2-bd13-3aaf7bf27415"}
}
##^##*/

