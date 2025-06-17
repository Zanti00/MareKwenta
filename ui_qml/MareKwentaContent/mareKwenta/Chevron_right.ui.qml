import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: chevron_right
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
        anchors.leftMargin: 18
        anchors.rightMargin: 18
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
                path: "M 0 24 L 12 12 L 0 0"
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
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.topMargin: 10
                anchors.bottomMargin: 10
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3.5
            }

            PropertyChanges {
                target: chevron_right
                width: 40
                height: 40
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 20 L 10 10 L 0 0"
            }
        },
        State {
            name: "size_32"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3
            }

            PropertyChanges {
                target: chevron_right
                width: 32
                height: 32
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 16 L 8 8 L 0 0"
            }
        },
        State {
            name: "size_24"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 9
                anchors.rightMargin: 9
                anchors.topMargin: 6
                anchors.bottomMargin: 6
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2.5
            }

            PropertyChanges {
                target: chevron_right
                width: 24
                height: 24
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 12 L 6 6 L 0 0"
            }
        },
        State {
            name: "size_20"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2
            }

            PropertyChanges {
                target: chevron_right
                width: 20
                height: 20
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 10 L 5 5 L 0 0"
            }
        },
        State {
            name: "size_16"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 6
                anchors.rightMargin: 6
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 1.6
            }

            PropertyChanges {
                target: chevron_right
                width: 16
                height: 16
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 8 L 4 4 L 0 0"
            }
        },
        State {
            name: "size_48"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 18
                anchors.rightMargin: 18
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 4
            }

            PropertyChanges {
                target: chevron_right
                width: 48
                height: 48
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 0 24 L 12 12 L 0 0"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"075cd221-2a29-5881-a915-2a60907ad56f"}D{i:1;uuid:"ca5ee3ec-c497-5502-a71f-1a5f8e549ec4"}
D{i:2;uuid:"ca5ee3ec-c497-5502-a71f-1a5f8e549ec4_ShapePath_0"}D{i:3;uuid:"ca5ee3ec-c497-5502-a71f-1a5f8e549ec4-PathSvg_0"}
}
##^##*/

