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
        anchors.leftMargin: 6
        anchors.rightMargin: 6
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
                path: "M 10 0 L 36 0 M 10 12 L 36 12 M 10 24 L 36 24 M 0 0 L 0.019999980926513672 0 M 0 12 L 0.019999980926513672 12 M 0 24 L 0.019999980926513672 24"
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
                anchors.leftMargin: 5
                anchors.rightMargin: 5
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
                path: "M 8.333333969116211 0 L 30 0 M 8.333333969116211 10 L 30 10 M 8.333333969116211 20 L 30 20 M 0 0 L 0.016666650772094727 0 M 0 10 L 0.016666650772094727 10 M 0 20 L 0.016666650772094727 20"
            }
        },
        State {
            name: "size_32"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 4
                anchors.rightMargin: 4
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
                path: "M 6.666666507720947 0 L 24 0 M 6.666666507720947 8 L 24 8 M 6.666666507720947 16 L 24 16 M 0 0 L 0.013333320617675781 0 M 0 8 L 0.013333320617675781 8 M 0 16 L 0.013333320617675781 16"
            }
        },
        State {
            name: "size_24"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 3
                anchors.rightMargin: 3
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
                path: "M 5 0 L 18 0 M 5 6 L 18 6 M 5 12 L 18 12 M 0 0 L 0.009999990463256836 0 M 0 6 L 0.009999990463256836 6 M 0 12 L 0.009999990463256836 12"
            }
        },
        State {
            name: "size_20"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 3
                anchors.rightMargin: 3
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
                path: "M 4.1666669845581055 0 L 15 0 M 4.1666669845581055 5 L 15 5 M 4.1666669845581055 10 L 15 10 M 0 0 L 0.008333325386047363 0 M 0 5 L 0.008333325386047363 5 M 0 10 L 0.008333325386047363 10"
            }
        },
        State {
            name: "size_16"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 2
                anchors.rightMargin: 2
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
                path: "M 3.3333335876464845 0 L 12 0 M 3.3333335876464845 4 L 12 4 M 3.3333335876464845 8 L 12 8 M 0 0 L 0.006666660308837891 0 M 0 4 L 0.006666660308837891 4 M 0 8 L 0.006666660308837891 8"
            }
        },
        State {
            name: "size_48"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 6
                anchors.rightMargin: 6
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
                path: "M 10 0 L 36 0 M 10 12 L 36 12 M 10 24 L 36 24 M 0 0 L 0.019999980926513672 0 M 0 12 L 0.019999980926513672 12 M 0 24 L 0.019999980926513672 24"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"303f8376-c201-5dd6-9645-29029ab5558e"}D{i:1;uuid:"3ba95f59-77b4-58d8-a59d-f89f9c0db7f9"}
D{i:2;uuid:"3ba95f59-77b4-58d8-a59d-f89f9c0db7f9_ShapePath_0"}D{i:3;uuid:"3ba95f59-77b4-58d8-a59d-f89f9c0db7f9-PathSvg_0"}
}
##^##*/

