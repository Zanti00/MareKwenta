import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Item {
    id: employee_Management
    width: 1440
    height: 1024
    visible: true
    property alias startedText: started.text
    property alias may_05_2026Text: date_text.text
    property alias endedText: ended.text
    property alias employee_IDText: employee_ID.text
    property alias employee_NameText: employee_Name.text
    property alias aMText: timein_text.text
    property alias aya_Del_RosarioText: employeename_text.text
    property alias elementText: employeeid_text.text
    property alias pMText: timeout_text.text
    property alias staffText: staff.text

    Rectangle{
        anchors.fill: parent
        color: "#f2efea"
        Text {
            id: date_text
            width: 229
            height: 55
            color: "#4e2d18"
            text: qsTr("May 05, 2026")
            anchors.top: parent.top
            anchors.topMargin: 32
            font.letterSpacing: 1.188
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: 576
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: staff
            width: 257
            height: 38
            color: "#4e2d18"
            text: qsTr("Staff")
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
            id: group_38
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 127
            anchors.rightMargin: 33
            anchors.topMargin: 110
            anchors.bottomMargin: 35
            Rectangle {
                id: logs
                width: 1280
                height: 625
                color: "#ffffff"
                radius: 20
                anchors.left: parent.left
                anchors.top: parent.top

                RoundButton {
                    id: addemployee_button
                    x: 1136
                    y: 507
                    width: 74
                    height: 69
                    text: "+"
                    topPadding: -3
                    font.pointSize: 33
                    font.bold: true
                    display: AbstractButton.TextOnly
                    onClicked: navHandler.addemployee
                }
            }

            Text {
                id: employee_ID
                width: 201
                height: 43
                color: "#000000"
                text: qsTr("Employee ID")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 26
                anchors.topMargin: 14
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: "Inter"
            }

            Text {
                id: employee_Name
                width: 201
                height: 43
                color: "#000000"
                text: qsTr("Employee Name")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 220
                anchors.topMargin: 14
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: "Inter"
            }

            Text {
                id: started
                width: 201
                height: 43
                color: "#000000"
                text: qsTr("Started")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 851
                anchors.topMargin: 14
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: "Inter"
            }

            Text {
                id: ended
                width: 201
                height: 43
                color: "#000000"
                text: qsTr("Ended")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 1051
                anchors.topMargin: 14
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: "Inter"
            }

            Text {
                id: employeeid_text
                width: 201
                height: 43
                color: "#000000"
                text: qsTr("0001")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 26
                anchors.topMargin: 72
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: "Inter"
            }

            Text {
                id: employeename_text
                width: 201
                height: 43
                color: "#000000"
                text: qsTr("Aya Del Rosario")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 220
                anchors.topMargin: 72
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: "Inter"
            }

            Text {
                id: timein_text
                width: 201
                height: 43
                color: "#000000"
                text: qsTr("7:56 AM")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 851
                anchors.topMargin: 72
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: "Inter"
            }

            Text {
                id: timeout_text
                width: 201
                height: 43
                color: "#000000"
                text: qsTr("12:03 PM")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 1051
                anchors.topMargin: 72
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: "Inter"
            }

            Shape {
                id: line_17_Stroke_
                width: 1230
                height: 1
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 21
                anchors.topMargin: 67
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_17_Stroke__ShapePath_0
                    strokeWidth: 1
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_17_Stroke__PathSvg_0
                        path: "M 1230.009765625 0 L 1230.009765625 1 L 0 1 L 0 0 L 1230.009765625 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#000000"
                }
                antialiasing: true
            }

            Item {
                id: group_117
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 1176
                anchors.rightMargin: 24
                anchors.topMargin: 782
                anchors.bottomMargin: 17
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"ab4c7de6-6014-57b5-9a28-cc4b142065fd"}
}
##^##*/

