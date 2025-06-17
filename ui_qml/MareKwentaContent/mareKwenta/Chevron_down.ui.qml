import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: chevron_down
    width: 48
    height: 48
    color: "transparent"
    state: "size_48"
    clip: true

    Shape {
        id: icon
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.topMargin: 18
        anchors.bottomMargin: 18
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: icon_ShapePath_0
            strokeWidth: 4
            strokeStyle: ShapePath.SolidLine
            strokeColor: "#1e1e1e"
            PathSvg {
                id: icon_PathSvg_0
                path: "M 0 0 L 12 12 L 24 0"
            }
            joinStyle: ShapePath.RoundJoin
            fillRule: ShapePath.WindingFill
            fillColor: "transparent"
        }
        antialiasing: true
    }
    states: [
        State {
            name: "size_40"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.topMargin: 15
                anchors.bottomMargin: 15
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 0 L 10 10 L 20 0"
            }

            PropertyChanges {
                target: chevron_down
                width: 40
                height: 40
            }
        },
        State {
            name: "size_32"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 0 L 8 8 L 16 0"
            }

            PropertyChanges {
                target: chevron_down
                width: 32
                height: 32
            }
        },
        State {
            name: "size_24"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 6
                anchors.rightMargin: 6
                anchors.topMargin: 9
                anchors.bottomMargin: 9
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 0 L 6 6 L 12 0"
            }

            PropertyChanges {
                target: chevron_down
                width: 24
                height: 24
            }
        },
        State {
            name: "size_20"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 0 L 5 5 L 10 0"
            }

            PropertyChanges {
                target: chevron_down
                width: 20
                height: 20
            }
        },
        State {
            name: "size_16"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 6
                anchors.bottomMargin: 6
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 1.6
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 0 L 4 4 L 8 0"
            }

            PropertyChanges {
                target: chevron_down
                width: 16
                height: 16
            }
        },
        State {
            name: "size_48"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 18
                anchors.bottomMargin: 18
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 4
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 0 L 12 12 L 24 0"
            }

            PropertyChanges {
                target: chevron_down
                width: 48
                height: 48
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"3101c3e8-a77f-5b37-b96a-077fa8927f59"}D{i:1;uuid:"870a4f42-8a89-5785-a7a5-e4eac0de751e"}
D{i:2;uuid:"870a4f42-8a89-5785-a7a5-e4eac0de751e_ShapePath_0"}D{i:3;uuid:"870a4f42-8a89-5785-a7a5-e4eac0de751e-PathSvg_0"}
}
##^##*/

