import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: bar_chart_2
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
        anchors.topMargin: 8
        anchors.bottomMargin: 8
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: icon_ShapePath_0
            strokeWidth: 4
            strokeStyle: ShapePath.SolidLine
            strokeColor: "#1e1e1e"
            PathSvg {
                id: icon_PathSvg_0
                path: "M 24 32 L 24 12 M 12 32 L 12 0 M 0 32 L 0 20"
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
                anchors.topMargin: 7
                anchors.bottomMargin: 7
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 20 26.666664123535156 L 20 9.999999046325684 M 10 26.66666603088379 L 10 0 M 0 26.666667938232422 L 0 16.666667938232422"
            }

            PropertyChanges {
                target: bar_chart_2
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
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 16 21.33333396911621 L 16 8 M 8 21.33333396911621 L 8 0 M 0 21.333332061767578 L 0 13.333333015441895"
            }

            PropertyChanges {
                target: bar_chart_2
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
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 12 16 L 12 6 M 6 16 L 6 0 M 0 16 L 0 10"
            }

            PropertyChanges {
                target: bar_chart_2
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
                anchors.topMargin: 3
                anchors.bottomMargin: 3
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 10 13.333332061767578 L 10 4.999999523162842 M 5 13.333333015441895 L 5 0 M 0 13.333333969116211 L 0 8.333333969116211"
            }

            PropertyChanges {
                target: bar_chart_2
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
                anchors.topMargin: 3
                anchors.bottomMargin: 3
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 1.6
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 8 10.666665458679226 L 8 3.99999954700471 M 4 10.666666221618666 L 4 0 M 0 10.666666984558105 L 0 6.666667056083676"
            }

            PropertyChanges {
                target: bar_chart_2
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
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 4
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 24 32 L 24 12 M 12 32 L 12 0 M 0 32 L 0 20"
            }

            PropertyChanges {
                target: bar_chart_2
                width: 48
                height: 48
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"26175a63-b9d2-50d4-8ac8-65745489ee26"}D{i:1;uuid:"f3f2feb5-5058-5be9-88ef-fcf7c76d938d"}
D{i:2;uuid:"f3f2feb5-5058-5be9-88ef-fcf7c76d938d_ShapePath_0"}D{i:3;uuid:"f3f2feb5-5058-5be9-88ef-fcf7c76d938d-PathSvg_0"}
}
##^##*/

