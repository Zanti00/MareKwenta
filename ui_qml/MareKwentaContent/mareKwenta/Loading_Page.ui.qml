import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: loading_Page
    width: 1440
    height: 1024
    color: "#d5c8b0"
    property alias pOSText: pOS.text
    property alias mareKwentaText: mareKwenta.text

    Text {
        id: mareKwenta
        width: 512
        height: 114
        color: "#4e2d18"
        text: qsTr("MareKwenta")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 485
        anchors.topMargin: 455
        font.pixelSize: 64
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "Unbounded"
    }

    Shape {
        id: line_1_Stroke_
        width: 484
        height: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 493
        anchors.topMargin: 541
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_1_Stroke__ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: line_1_Stroke__PathSvg_0
                path: "M 484 0 L 484 1 L 0 1 L 0 0 L 484 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#000000"
        }
        antialiasing: true
    }

    Text {
        id: pOS
        width: 161
        height: 68
        color: "#4e2d18"
        text: qsTr("POS")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 667
        anchors.topMargin: 542
        font.letterSpacing: 24
        font.pixelSize: 48
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Unica One"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"bc7b0c70-7356-5722-bcbc-a9e32975173d"}D{i:1;uuid:"54a393b8-3e99-5de6-958d-994c5f2b51b3"}
D{i:2;uuid:"d37e9d6e-1a6a-5eb2-994d-9819ff353d1d"}D{i:3;uuid:"d37e9d6e-1a6a-5eb2-994d-9819ff353d1d_ShapePath_0"}
D{i:4;uuid:"d37e9d6e-1a6a-5eb2-994d-9819ff353d1d-PathSvg_0"}D{i:5;uuid:"54e5d559-24ff-5baf-ab73-0244d2f7c9dd"}
}
##^##*/

