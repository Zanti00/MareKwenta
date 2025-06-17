import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: plus
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
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: icon_ShapePath_0
            strokeWidth: 4
            strokeStyle: ShapePath.SolidLine
            strokeColor: "#1e1e1e"
            PathSvg {
                id: icon_PathSvg_0
                path: "M 14 0 L 14 28 M 0 14 L 28 14"
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
                target: plus
                width: 40
                height: 40
            }

            PropertyChanges {
                target: icon
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 11.666666030883789 0 L 11.666666030883789 23.333332061767578 M 0 11.666666030883789 L 23.333332061767578 11.666666030883789"
            }
        },
        State {
            name: "size_32"

            PropertyChanges {
                target: plus
                width: 32
                height: 32
            }

            PropertyChanges {
                target: icon
                anchors.leftMargin: 7
                anchors.rightMargin: 7
                anchors.topMargin: 7
                anchors.bottomMargin: 7
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 9.333333969116211 0 L 9.333333969116211 18.666667938232422 M 0 9.333333969116211 L 18.666667938232422 9.333333969116211"
            }
        },
        State {
            name: "size_24"

            PropertyChanges {
                target: plus
                width: 24
                height: 24
            }

            PropertyChanges {
                target: icon
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 7 0 L 7 14 M 0 7 L 14 7"
            }
        },
        State {
            name: "size_20"

            PropertyChanges {
                target: plus
                width: 20
                height: 20
            }

            PropertyChanges {
                target: icon
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 5.8333330154418945 0 L 5.8333330154418945 11.666666030883789 M 0 5.8333330154418945 L 11.666666030883789 5.8333330154418945"
            }
        },
        State {
            name: "size_16"

            PropertyChanges {
                target: plus
                width: 16
                height: 16
            }

            PropertyChanges {
                target: icon
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 1.6
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 4.666666507720947 0 L 4.666666507720947 9.333333015441895 M 0 4.666666507720947 L 9.333333015441895 4.666666507720947"
            }
        },
        State {
            name: "size_48"

            PropertyChanges {
                target: plus
                width: 48
                height: 48
            }

            PropertyChanges {
                target: icon
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.bottomMargin: 10
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 4
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 14 0 L 14 28 M 0 14 L 28 14"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"db775e36-2292-576e-8eb2-e238cdc8e8e3"}D{i:1;uuid:"4f99a4d6-393c-5c9b-8ce0-affb65f7980a"}
D{i:2;uuid:"4f99a4d6-393c-5c9b-8ce0-affb65f7980a_ShapePath_0"}D{i:3;uuid:"4f99a4d6-393c-5c9b-8ce0-affb65f7980a-PathSvg_0"}
}
##^##*/

