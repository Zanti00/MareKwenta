import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: user
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
        anchors.leftMargin: 8
        anchors.rightMargin: 8
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
                path: "M 32 36 L 32 32 C 32 29.878268003463745 31.157143712043762 27.843438267707825 29.65685272216797 26.34314727783203 C 28.156561732292175 24.842856287956238 26.121731996536255 24.000000000000007 24 24 L 8 24 C 5.878268003463745 24.000000000000004 3.843436360359192 24.842856287956238 2.3431453704833984 26.34314727783203 C 0.842854380607605 27.843438267707825 1.7763568394002505e-15 29.878268003463745 0 32 L 0 36"
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
                path: "M 16 16 C 20.418277740478516 16 24 12.418277740478516 24 8 C 24 3.581721782684326 20.418277740478516 0 16 0 C 11.581721782684326 0 8 3.581721782684326 8 8 C 8 12.418277740478516 11.581721782684326 16 16 16 Z"
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
                anchors.leftMargin: 7
                anchors.rightMargin: 7
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }

            PropertyChanges {
                target: user
                width: 40
                height: 40
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
                path: "M 13.333333969116211 13.333333015441895 C 17.0152325630188 13.333333015441895 20 10.348565101623535 20 6.666666507720947 C 20 2.9847681522369385 17.0152325630188 0 13.333333969116211 0 C 9.651435613632202 0 6.6666669845581055 2.9847681522369385 6.6666669845581055 6.666666507720947 C 6.6666669845581055 10.348565101623535 9.651435613632202 13.333333015441895 13.333333969116211 13.333333015441895 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 26.66666603088379 30 L 26.66666603088379 26.66666603088379 C 26.66666603088379 24.898556113243103 25.964285135269165 23.202863931655884 24.71404266357422 21.952621459960938 C 23.463800191879272 20.70237898826599 21.768109917640686 20.000000000000007 20 20 L 6.666666507720947 20 C 4.898556590080261 20.000000000000004 3.202863574028015 20.70237898826599 1.9526211023330688 21.952621459960938 C 0.7023786306381226 23.202863931655884 1.480297330873836e-15 24.898556113243103 0 26.66666603088379 L 0 30"
            }
        },
        State {
            name: "size_32"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            PropertyChanges {
                target: user
                width: 32
                height: 32
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
                path: "M 10.666666030883789 10.666666984558105 C 13.612185001373291 10.666666984558105 16 8.278852462768555 16 5.333333492279053 C 16 2.387814521789551 13.612185001373291 0 10.666666030883789 0 C 7.721147060394287 0 5.3333330154418945 2.387814521789551 5.3333330154418945 5.333333492279053 C 5.3333330154418945 8.278852462768555 7.721147060394287 10.666666984558105 10.666666030883789 10.666666984558105 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 21.33333396911621 24 L 21.33333396911621 21.33333396911621 C 21.33333396911621 19.918845891952515 20.771430492401123 18.562293529510498 19.771236419677734 17.56209945678711 C 18.771042346954346 16.56190538406372 17.414488077163696 16.000000000000004 16 16 L 5.333333492279053 16 C 3.9188454151153564 16.000000000000004 2.5622910261154175 16.56190538406372 1.5620969533920288 17.56209945678711 C 0.5619028806686401 18.562293529510498 1.1842379282265398e-15 19.918845891952515 0 21.33333396911621 L 0 24"
            }
        },
        State {
            name: "size_24"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 3
                anchors.bottomMargin: 3
            }

            PropertyChanges {
                target: user
                width: 24
                height: 24
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
                path: "M 8 8 C 10.209138870239258 8 12 6.209138870239258 12 4 C 12 1.790860891342163 10.209138870239258 0 8 0 C 5.790860891342163 0 4 1.790860891342163 4 4 C 4 6.209138870239258 5.790860891342163 8 8 8 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 16 18 L 16 16 C 16 14.939134001731873 15.578571856021881 13.921719133853912 14.828426361083984 13.171573638916016 C 14.078280866146088 12.421428143978119 13.060865998268127 12.000000000000004 12 12 L 4 12 C 2.9391340017318726 12.000000000000002 1.921718180179596 12.421428143978119 1.1715726852416992 13.171573638916016 C 0.4214271903038025 13.921719133853912 8.881784197001252e-16 14.939134001731873 0 16 L 0 18"
            }
        },
        State {
            name: "size_20"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
            }

            PropertyChanges {
                target: user
                width: 20
                height: 20
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
                path: "M 6.6666669845581055 6.666666507720947 C 8.5076162815094 6.666666507720947 10 5.174282550811768 10 3.3333332538604736 C 10 1.4923840761184692 8.5076162815094 0 6.6666669845581055 0 C 4.825717806816101 0 3.3333334922790527 1.4923840761184692 3.3333334922790527 3.3333332538604736 C 3.3333334922790527 5.174282550811768 4.825717806816101 6.666666507720947 6.6666669845581055 6.666666507720947 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 13.333333015441895 15 L 13.333333015441895 13.333333015441895 C 13.333333015441895 12.449278056621552 12.982142567634583 11.601431965827942 12.35702133178711 10.976310729980469 C 11.731900095939636 10.351189494132996 10.884054958820343 10.000000000000004 10 10 L 3.3333332538604736 10 C 2.4492782950401306 10.000000000000002 1.6014317870140076 10.351189494132996 0.9763105511665344 10.976310729980469 C 0.3511893153190613 11.601431965827942 7.40148665436918e-16 12.449278056621552 0 13.333333015441895 L 0 15"
            }
        },
        State {
            name: "size_16"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 2
                anchors.bottomMargin: 2
            }

            PropertyChanges {
                target: user
                width: 16
                height: 16
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
                path: "M 5.333333396911607 5.333333206176758 C 6.8060927818026595 5.333333206176758 7.999999713897699 4.139426040649415 7.999999713897699 2.666666603088379 C 7.999999713897699 1.1939072608947754 6.8060927818026595 0 5.333333396911607 0 C 3.8605741073879836 0 2.6666666984558036 1.1939072608947754 2.6666666984558036 2.666666603088379 C 2.6666666984558036 4.139426040649415 3.8605741073879836 5.333333206176758 5.333333396911607 5.333333206176758 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 10.666666030883789 12 L 10.666666030883789 10.666666412353516 C 10.666666030883789 9.95942244529724 10.38571368268558 9.281145572662354 9.885616711892464 8.781048583984376 C 9.385519741099348 8.280951595306398 8.707243655660957 8.000000000000002 7.999999713897699 8 L 2.6666665077209473 8 C 1.9594225659576887 8.000000000000002 1.281145383793874 8.280951595306398 0.781048413000758 8.781048583984376 C 0.2809514422076419 9.281145572662354 5.921189111737107e-16 9.95942244529724 0 10.666666412353516 L 0 12"
            }
        },
        State {
            name: "size_48"

            PropertyChanges {
                target: icon
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 6
                anchors.bottomMargin: 6
            }

            PropertyChanges {
                target: user
                width: 48
                height: 48
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
                path: "M 16 16 C 20.418277740478516 16 24 12.418277740478516 24 8 C 24 3.581721782684326 20.418277740478516 0 16 0 C 11.581721782684326 0 8 3.581721782684326 8 8 C 8 12.418277740478516 11.581721782684326 16 16 16 Z"
            }

            PropertyChanges {
                target: icon_PathSvg_0
                path: "M 32 36 L 32 32 C 32 29.878268003463745 31.157143712043762 27.843438267707825 29.65685272216797 26.34314727783203 C 28.156561732292175 24.842856287956238 26.121731996536255 24.000000000000007 24 24 L 8 24 C 5.878268003463745 24.000000000000004 3.843436360359192 24.842856287956238 2.3431453704833984 26.34314727783203 C 0.842854380607605 27.843438267707825 1.7763568394002505e-15 29.878268003463745 0 32 L 0 36"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"00c83edb-6fe5-5d13-abe3-d02b29f0d8f1"}D{i:1;uuid:"159c9001-4fb9-5a27-9332-64ffb6858056"}
D{i:2;uuid:"159c9001-4fb9-5a27-9332-64ffb6858056_ShapePath_0"}D{i:3;uuid:"159c9001-4fb9-5a27-9332-64ffb6858056-PathSvg_0"}
D{i:4;uuid:"159c9001-4fb9-5a27-9332-64ffb6858056_ShapePath_1"}D{i:5;uuid:"159c9001-4fb9-5a27-9332-64ffb6858056-PathSvg_1"}
}
##^##*/

