import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: login
    width: 1440
    height: 1024
    color: "#d5c8b0"
    property alias pOSText: pOS.text
    property alias mareKwentaText: mareKwenta.text

    Text {
        id: mareKwenta
        width: 360
        height: 54
        color: "#4e2d18"
        text: qsTr("MareKwenta")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 546
        anchors.topMargin: 288
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        anchors.horizontalCenter: parent.horizontalCenter
        font.weight: Font.Medium
        font.family: "Unbounded"
    }

    Shape {
        anchors.horizontalCenter: parent.horizontalCenter
        id: line_1_Stroke_
        y: 341
        width: 320
        height: 1
        anchors.horizontalCenterOffset: 0
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_1_Stroke__ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: line_1_Stroke__PathSvg_0
                path: "M 319.50115966796875 0.49999940395355225 L 319.4996032714844 1.4999980926513672 L 0 0.9999987483024597 L 0.001564943348057568 0 L 319.50115966796875 0.49999940395355225 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#000000"
        }
        antialiasing: true
    }

    Text {
        id: pOS
        width: 155
        height: 68
        color: "#4e2d18"
        text: qsTr("POS")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 643
        anchors.topMargin: 357
        font.letterSpacing: 18
        font.pixelSize: 36
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.horizontalCenter: parent.horizontalCenter
        font.weight: Font.Normal
        font.family: "Unica One"
    }

    Item {
        id: group_1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 492
        anchors.rightMargin: 493
        anchors.topMargin: 457
        anchors.bottomMargin: 302
        anchors.verticalCenterOffset: -30
        Rectangle {
            id: rectangle_1
            width: 455
            height: 275
            color: "#f2efea"
            radius: 22
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Button {
                id: login_button
                x: 129
                y: 220
                width: 186
                height: 36
                font.bold: true
                font.pointSize: 13
                font.family: "Inter 18pt 18pt"
                display: AbstractButton.TextOnly

                background: Rectangle {
                    color: "#4e2d18"
                    radius: 8
                    border.width: 1
                    border.color: "#4e2d18"
                }

                contentItem: Text {
                    color: "#f2efea"
                    text: "LOGIN"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.styleName: "Medium"
                    font.pointSize: 11
                    font.family: "Inter 18pt 18pt"
                }
                onClicked: mainWindow.login_clicked()
            }

            Input_Field {
                id: username_textbox
                width: 412
                height: 85
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 22
                anchors.topMargin: 23
                valueText: ""
                state: "state_Default_Value_Type_Default"
                labelText: qsTr("Username")
            }

            Input_Field {
                id: password_textbox
                width: 412
                height: 85
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 22
                anchors.topMargin: 116
                valueText: ""
                state: "state_Default_Value_Type_Default"
                labelText: qsTr("Password")

                TextInput {
                    id: password_input
                    x: 8
                    y: 41
                    width: 387
                    height: 27
                    text: qsTr("")
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    echoMode: TextInput.Password
                    selectionColor: "#4e2d18"
                    font.family: "Arial"
                    objectName: "password_input"
                }

                TextInput {
                    id: username_input
                    x: 8
                    y: -52
                    width: 387
                    height: 27
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    passwordCharacter: ""
                    selectionColor: "#4e2d18"
                    font.family: "Arial"
                    objectName: "username_input"
                }
            }
        }
    }


    /*##^##
Designer {
    D{i:0;uuid:"8e78650b-0357-51ce-b056-fde7396cc5f6"}D{i:1;uuid:"45443533-74e6-51aa-91e5-372bb850b607"}
}
##^##*/
}
