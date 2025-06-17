import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: archive
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
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 6
        anchors.bottomMargin: 6
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: icon_ShapePath_0
            strokeWidth: 4
            strokeStyle: ShapePath.SolidLine
            strokeColor: "#1e1e1e"
            PathSvg {
                id: icon_PathSvg_0
                path: "M 40 10 L 40 36 L 4 36 L 4 10"
            }
            joinStyle: ShapePath.RoundJoin
            fillRule: ShapePath.WindingFill
            fillColor: "transparent"
        }

        ShapePath {
            id: icon_ShapePath_1
            strokeWidth: 4
            strokeStyle: ShapePath.SolidLine
            strokeColor: "#1e1e1e"
            PathSvg {
                id: icon_PathSvg_1
                path: "M 44 0 L 0 0 L 0 10 L 44 10 L 44 0 Z"
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
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3.5
            }

            PropertyChanges {
                target: icon_ShapePath_1
                strokeWidth: 3.5
            }

            PropertyChanges {
                target: icon_PathSvg_1
                path: "M 36.666664123535156 0 L 0 0 L 0 8.333333015441895 L 36.666664123535156 8.333333015441895 L 36.666664123535156 0 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 33.33333206176758 8.333333969116211 L 33.33333206176758 30 L 3.3333334922790527 30 L 3.3333334922790527 8.333333969116211"
            }

            PropertyChanges {
                target: archive
                width: 40
                height: 40
            }
        },
        State {
            name: "size_32"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 1
                anchors.rightMargin: 1
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3
            }

            PropertyChanges {
                target: icon_ShapePath_1
                strokeWidth: 3
            }

            PropertyChanges {
                target: icon_PathSvg_1
                path: "M 29.33333396911621 0 L 0 0 L 0 6.6666669845581055 L 29.33333396911621 6.6666669845581055 L 29.33333396911621 0 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 26.666667938232422 6.666666507720947 L 26.666667938232422 24 L 2.6666665077209473 24 L 2.6666665077209473 6.666666507720947"
            }

            PropertyChanges {
                target: archive
                width: 32
                height: 32
            }
        },
        State {
            name: "size_24"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 1
                anchors.rightMargin: 1
                anchors.topMargin: 3
                anchors.bottomMargin: 3
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2.5
            }

            PropertyChanges {
                target: icon_ShapePath_1
                strokeWidth: 2.5
            }

            PropertyChanges {
                target: icon_PathSvg_1
                path: "M 22 0 L 0 0 L 0 5 L 22 5 L 22 0 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 20 5 L 20 18 L 2 18 L 2 5"
            }

            PropertyChanges {
                target: archive
                width: 24
                height: 24
            }
        },
        State {
            name: "size_20"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 1
                anchors.rightMargin: 1
                anchors.topMargin: 3
                anchors.bottomMargin: 3
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2
            }

            PropertyChanges {
                target: icon_ShapePath_1
                strokeWidth: 2
            }

            PropertyChanges {
                target: icon_PathSvg_1
                path: "M 18.333332061767578 0 L 0 0 L 0 4.166666507720947 L 18.333332061767578 4.166666507720947 L 18.333332061767578 0 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 16.66666603088379 4.1666669845581055 L 16.66666603088379 15 L 1.6666667461395264 15 L 1.6666667461395264 4.1666669845581055"
            }

            PropertyChanges {
                target: archive
                width: 20
                height: 20
            }
        },
        State {
            name: "size_16"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 1
                anchors.rightMargin: 1
                anchors.topMargin: 2
                anchors.bottomMargin: 2
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 1.6
            }

            PropertyChanges {
                target: icon_ShapePath_1
                strokeWidth: 1.6
            }

            PropertyChanges {
                target: icon_PathSvg_1
                path: "M 14.666666030883789 0 L 0 0 L 0 3.333333206176758 L 14.666666030883789 3.333333206176758 L 14.666666030883789 0 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 13.333333171497703 3.3333335876464845 L 13.333333171497703 12 L 1.333333431590691 12 L 1.333333431590691 3.3333335876464845"
            }

            PropertyChanges {
                target: archive
                width: 16
                height: 16
            }
        },
        State {
            name: "size_48"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.topMargin: 6
                anchors.bottomMargin: 6
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 4
            }

            PropertyChanges {
                target: icon_ShapePath_1
                strokeWidth: 4
            }

            PropertyChanges {
                target: icon_PathSvg_1
                path: "M 44 0 L 0 0 L 0 10 L 44 10 L 44 0 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 40 10 L 40 36 L 4 36 L 4 10"
            }

            PropertyChanges {
                target: archive
                width: 48
                height: 48
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"70f395a8-a507-5e30-af0b-28810f37ba48"}D{i:1;uuid:"1c17b42c-177b-55e5-955b-82f4e658fd31"}
D{i:2;uuid:"1c17b42c-177b-55e5-955b-82f4e658fd31_ShapePath_0"}D{i:3;uuid:"1c17b42c-177b-55e5-955b-82f4e658fd31-PathSvg_0"}
D{i:4;uuid:"1c17b42c-177b-55e5-955b-82f4e658fd31_ShapePath_1"}D{i:5;uuid:"1c17b42c-177b-55e5-955b-82f4e658fd31-PathSvg_1"}
}
##^##*/

