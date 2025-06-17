import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: element
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
        anchors.topMargin: 12
        anchors.bottomMargin: 12
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: icon_ShapePath_0
            strokeWidth: 4
            strokeStyle: ShapePath.SolidLine
            strokeColor: "#1e1e1e"
            PathSvg {
                id: icon_PathSvg_0
                path: "M 24 0 L 0 24 M 0 0 L 24 24"
            }
            joinStyle: ShapePath.RoundJoin
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
                anchors.topMargin: 10
                anchors.bottomMargin: 10
            }

            PropertyChanges {
                target: element
                width: 40
                height: 40
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 20 0 L 0 20 M 0 0 L 20 20"
            }
        },
        State {
            name: "size_32"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: element
                width: 32
                height: 32
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 16 0 L 0 16 M 0 0 L 16 16"
            }
        },
        State {
            name: "size_24"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 6
                anchors.rightMargin: 6
                anchors.topMargin: 6
                anchors.bottomMargin: 6
            }

            PropertyChanges {
                target: element
                width: 24
                height: 24
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 12 0 L 0 12 M 0 0 L 12 12"
            }
        },
        State {
            name: "size_20"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }

            PropertyChanges {
                target: element
                width: 20
                height: 20
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 10 0 L 0 10 M 0 0 L 10 10"
            }
        },
        State {
            name: "size_16"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            PropertyChanges {
                target: element
                width: 16
                height: 16
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 1.6
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 8 0 L 0 8 M 0 0 L 8 8"
            }
        },
        State {
            name: "size_48"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }

            PropertyChanges {
                target: element
                width: 48
                height: 48
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 4
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 24 0 L 0 24 M 0 0 L 24 24"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"5ff6cc9c-5e9f-5914-81d1-f2d15c20aede"}D{i:1;uuid:"388bbad7-fb24-5e7d-8f47-d492b15132c0"}
D{i:2;uuid:"388bbad7-fb24-5e7d-8f47-d492b15132c0_ShapePath_0"}D{i:3;uuid:"388bbad7-fb24-5e7d-8f47-d492b15132c0-PathSvg_0"}
}
##^##*/

