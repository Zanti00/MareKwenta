import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: star
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
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 4
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
                path: "M 20 0 L 26.18000030517578 12.520000457763672 L 40 14.540000915527344 L 30 24.280000686645508 L 32.36000061035156 38.040000915527344 L 20 31.540000915527344 L 7.640000343322754 38.040000915527344 L 10 24.280000686645508 L 0 14.540000915527344 L 13.819999694824219 12.520000457763672 L 20 0 Z"
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
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 5
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 16.66666603088379 0 L 21.816665649414062 10.433333396911621 L 33.33333206176758 12.116666793823242 L 25 20.233333587646484 L 26.96666717529297 31.700000762939453 L 16.66666603088379 26.28333282470703 L 6.366666793823242 31.700000762939453 L 8.333333015441895 20.233333587646484 L 0 12.116666793823242 L 11.516666412353516 10.433333396911621 L 16.66666603088379 0 Z"
            }

            PropertyChanges {
                target: star
                width: 40
                height: 40
            }
        },
        State {
            name: "size_32"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 4
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 3
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 13.333333969116211 0 L 17.45333480834961 8.346667289733887 L 26.666667938232422 9.693334579467773 L 20 16.186668395996094 L 21.573333740234375 25.360000610351562 L 13.333333969116211 21.026668548583984 L 5.093333721160889 25.360000610351562 L 6.6666669845581055 16.186668395996094 L 0 9.693334579467773 L 9.213333129882812 8.346667289733887 L 13.333333969116211 0 Z"
            }

            PropertyChanges {
                target: star
                width: 32
                height: 32
            }
        },
        State {
            name: "size_24"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.topMargin: 2
                anchors.bottomMargin: 3
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2.5
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 10 0 L 13.09000015258789 6.260000228881836 L 20 7.270000457763672 L 15 12.140000343322754 L 16.18000030517578 19.020000457763672 L 10 15.770000457763672 L 3.820000171661377 19.020000457763672 L 5 12.140000343322754 L 0 7.270000457763672 L 6.909999847412109 6.260000228881836 L 10 0 Z"
            }

            PropertyChanges {
                target: star
                width: 24
                height: 24
            }
        },
        State {
            name: "size_20"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.topMargin: 2
                anchors.bottomMargin: 2
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 2
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 8.333333015441895 0 L 10.908332824707031 5.2166666984558105 L 16.66666603088379 6.058333396911621 L 12.5 10.116666793823242 L 13.483333587646484 15.850000381469727 L 8.333333015441895 13.141666412353516 L 3.183333396911621 15.850000381469727 L 4.166666507720947 10.116666793823242 L 0 6.058333396911621 L 5.758333206176758 5.2166666984558105 L 8.333333015441895 0 Z"
            }

            PropertyChanges {
                target: star
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
                anchors.topMargin: 1
                anchors.bottomMargin: 2
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 1.6
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 6.666666507720947 0 L 8.726666384601593 4.173333358764649 L 13.333333015441895 4.846666717529297 L 10.000000143051153 8.093333435058595 L 10.786667024421702 12.680000305175781 L 6.666666507720947 10.513333129882813 L 2.546666753959658 12.680000305175781 L 3.3333332538604736 8.093333435058595 L 0 4.846666717529297 L 4.606666630840302 4.173333358764649 L 6.666666507720947 0 Z"
            }

            PropertyChanges {
                target: star
                width: 16
                height: 16
            }
        },
        State {
            name: "size_48"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 6
            }

            PropertyChanges {
                target: icon_ShapePath_0
                strokeWidth: 4
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 20 0 L 26.18000030517578 12.520000457763672 L 40 14.540000915527344 L 30 24.280000686645508 L 32.36000061035156 38.040000915527344 L 20 31.540000915527344 L 7.640000343322754 38.040000915527344 L 10 24.280000686645508 L 0 14.540000915527344 L 13.819999694824219 12.520000457763672 L 20 0 Z"
            }

            PropertyChanges {
                target: star
                width: 48
                height: 48
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"91b367ab-435e-52d6-b2e2-51ceaaa93343"}D{i:1;uuid:"9ee88ab1-f978-50a5-aa87-153bcdce9e4d"}
D{i:2;uuid:"9ee88ab1-f978-50a5-aa87-153bcdce9e4d_ShapePath_0"}D{i:3;uuid:"9ee88ab1-f978-50a5-aa87-153bcdce9e4d-PathSvg_0"}
}
##^##*/

