import QtQuick.Controls
import QtQuick.Shapes 1.15
import QtQuick

Rectangle {
    visible: true
    width: 640
    height: 480

    Rectangle {
        id: add1
        width: 24
        height: 24
        color: "transparent"

        Shape {
            id: icon
            anchors.left: parent.left
            anchors.right: parent.right
            // ... rest of your code
        }
    }

    Rectangle {
        id: add
        width: 24
        height: 24
        color: "transparent"
    }

    Shape {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: icon_ShapePath_0
            strokeWidth: 0.025
            strokeColor: "transparent"
            PathSvg {
                id: icon_PathSvg_0
                path: "M 6 8 L 0 8 L 0 6 L 6 6 L 6 0 L 8 0 L 8 6 L 14 6 L 14 8 L 8 8 L 8 14 L 6 14 L 6 8 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#1d1b20"
        }
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"d1a5c87d-d01e-5b7e-bf88-5af40d93759d"}
}
##^##*/

