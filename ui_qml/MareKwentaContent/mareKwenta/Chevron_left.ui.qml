import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: chevron_left
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
                path: "M 12 24 L 0 12 L 12 0"
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
                target: icon_PathSvg_0
                path: "M 10 20 L 0 10 L 10 0"
            }

            PropertyChanges {
                target: chevron_left
                width: 40
                height: 40
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
                target: icon_PathSvg_0
                path: "M 8 16 L 0 8 L 8 0"
            }

            PropertyChanges {
                target: chevron_left
                width: 32
                height: 32
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
                target: icon_PathSvg_0
                path: "M 6 12 L 0 6 L 6 0"
            }

            PropertyChanges {
                target: chevron_left
                width: 24
                height: 24
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
                target: icon_PathSvg_0
                path: "M 5 10 L 0 5 L 5 0"
            }

            PropertyChanges {
                target: chevron_left
                width: 20
                height: 20
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
                target: icon_PathSvg_0
                path: "M 4 8 L 0 4 L 4 0"
            }

            PropertyChanges {
                target: chevron_left
                width: 16
                height: 16
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
                target: icon_PathSvg_0
                path: "M 12 24 L 0 12 L 12 0"
            }

            PropertyChanges {
                target: chevron_left
                width: 48
                height: 48
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"92c541fb-70da-50f4-893e-b40d06da8cde"}D{i:1;uuid:"5b8eba87-1b5e-5340-9dde-df2936faa528"}
D{i:2;uuid:"5b8eba87-1b5e-5340-9dde-df2936faa528_ShapePath_0"}D{i:3;uuid:"5b8eba87-1b5e-5340-9dde-df2936faa528-PathSvg_0"}
}
##^##*/

