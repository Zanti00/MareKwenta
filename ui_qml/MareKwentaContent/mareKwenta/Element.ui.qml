import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: element
    width: 24
    height: 24
    color: "transparent"

    Shape {
        id: icon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 3
        anchors.bottomMargin: 3
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: icon_ShapePath_0
            strokeWidth: 0.025
            strokeColor: "transparent"
            PathSvg {
                id: icon_PathSvg_0
                path: "M 3 18 C 2.449999988079071 18 1.9791666567325592 17.804167062044144 1.587499976158142 17.412500381469727 C 1.195833295583725 17.02083370089531 1 16.55000001192093 1 16 L 1 3 L 0 3 L 0 1 L 5 1 L 5 0 L 11 0 L 11 1 L 16 1 L 16 3 L 15 3 L 15 16 C 15 16.55000001192093 14.804167062044144 17.02083370089531 14.412500381469727 17.412500381469727 C 14.02083370089531 17.804167062044144 13.550000011920929 18 13 18 L 3 18 Z M 13 3 L 3 3 L 3 16 L 13 16 L 13 3 Z M 5 14 L 7 14 L 7 5 L 5 5 L 5 14 Z M 9 14 L 11 14 L 11 5 L 9 5 L 9 14 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#1d1b20"
        }
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"33993cba-5848-5de2-bf22-91fa6c1ed0b3"}D{i:1;uuid:"cae0abd0-46fc-5d60-a55d-a164dc60f632"}
D{i:2;uuid:"cae0abd0-46fc-5d60-a55d-a164dc60f632_ShapePath_0"}D{i:3;uuid:"cae0abd0-46fc-5d60-a55d-a164dc60f632-PathSvg_0"}
}
##^##*/

