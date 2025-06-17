import QtQuick
import QtQuick.Controls

Rectangle {
    id: avatar
    width: 40
    height: 40
    color: "#2c2c2c"
    radius: 8
    property alias initialsText: initials.text
    state: "type_Initial_Size_Large_Shape_Square"
    clip: true

    Text {
        id: initials
        width: 13
        height: 24
        color: "#f5f5f5"
        text: qsTr("F")
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        lineHeight: 24
        lineHeightMode: Text.FixedHeight
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: shape
        visible: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/shape_type_Image_Size_Large_Shape_Square.png"
    }
    states: [
        State {
            name: "type_Image_Size_Small_Shape_Circle"

            PropertyChanges {
                target: avatar
                width: 24
                height: 24
                color: "transparent"
                radius: 9999
            }

            PropertyChanges {
                target: initials
                width: 13
                height: 24
                visible: false
                font.pixelSize: 20
                lineHeight: 24
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: shape
                visible: true
                source: "assets/shape_type_Image_Size_Small_Shape_Circle.png"
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Image_Size_Medium_Shape_Circle"

            PropertyChanges {
                target: avatar
                width: 32
                height: 32
                color: "transparent"
                radius: 9999
            }

            PropertyChanges {
                target: initials
                width: 13
                height: 24
                visible: false
                font.pixelSize: 20
                lineHeight: 24
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: shape
                visible: true
                source: "assets/shape_type_Image_Size_Medium_Shape_Circle.png"
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Image_Size_Large_Shape_Circle"

            PropertyChanges {
                target: avatar
                width: 40
                height: 40
                color: "transparent"
                radius: 9999
            }

            PropertyChanges {
                target: initials
                width: 13
                height: 24
                visible: false
                font.pixelSize: 20
                lineHeight: 24
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: shape
                visible: true
                source: "assets/shape_type_Image_Size_Large_Shape_Circle.png"
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Initial_Size_Small_Shape_Circle"

            PropertyChanges {
                target: avatar
                width: 24
                height: 24
                color: "#2c2c2c"
                radius: 9999
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: initials
                width: 10
                height: 20
                visible: true
                font.pixelSize: 14
                lineHeight: 20
                anchors.verticalCenterOffset: -1
                anchors.horizontalCenterOffset: 1
            }

            PropertyChanges {
                target: shape
                visible: false
                source: "assets/shape_type_Image_Size_Large_Shape_Square.png"
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Initial_Size_Medium_Shape_Circle"

            PropertyChanges {
                target: avatar
                width: 32
                height: 32
                color: "#2c2c2c"
                radius: 9999
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: initials
                width: 11
                height: 22
                visible: true
                font.pixelSize: 16
                lineHeight: 22
                anchors.verticalCenterOffset: -1
            }

            PropertyChanges {
                target: shape
                visible: false
                source: "assets/shape_type_Image_Size_Large_Shape_Square.png"
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Initial_Size_Large_Shape_Circle"

            PropertyChanges {
                target: avatar
                width: 40
                height: 40
                color: "#2c2c2c"
                radius: 9999
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: shape
                visible: false
                source: "assets/shape_type_Image_Size_Large_Shape_Square.png"
            }

            PropertyChanges {
                target: initials
                width: 13
                height: 24
                visible: true
                font.pixelSize: 20
                lineHeight: 24
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Image_Size_Small_Shape_Square"

            PropertyChanges {
                target: avatar
                width: 24
                height: 24
                color: "transparent"
                radius: 4
            }

            PropertyChanges {
                target: initials
                width: 13
                height: 24
                visible: false
                font.pixelSize: 20
                lineHeight: 24
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: shape
                visible: true
                source: "assets/shape_type_Image_Size_Small_Shape_Square.png"
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Image_Size_Medium_Shape_Square"

            PropertyChanges {
                target: avatar
                width: 32
                height: 32
                color: "transparent"
                radius: 8
            }

            PropertyChanges {
                target: initials
                width: 13
                height: 24
                visible: false
                font.pixelSize: 20
                lineHeight: 24
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: shape
                visible: true
                source: "assets/shape_type_Image_Size_Medium_Shape_Square.png"
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Image_Size_Large_Shape_Square"

            PropertyChanges {
                target: avatar
                width: 40
                height: 40
                color: "transparent"
                radius: 8
            }

            PropertyChanges {
                target: initials
                width: 13
                height: 24
                visible: false
                font.pixelSize: 20
                lineHeight: 24
            }

            PropertyChanges {
                target: shape
                visible: true
                source: "assets/shape_type_Image_Size_Large_Shape_Square.png"
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "type_Initial_Size_Small_Shape_Square"

            PropertyChanges {
                target: avatar
                width: 24
                height: 24
                color: "#2c2c2c"
                radius: 4
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: initials
                width: 10
                height: 20
                visible: true
                font.pixelSize: 14
                lineHeight: 20
                anchors.verticalCenterOffset: -1
                anchors.horizontalCenterOffset: 1
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: shape
                visible: false
                source: "assets/shape_type_Image_Size_Large_Shape_Square.png"
            }
        },
        State {
            name: "type_Initial_Size_Medium_Shape_Square"

            PropertyChanges {
                target: avatar
                width: 32
                height: 32
                color: "#2c2c2c"
                radius: 8
            }

            AnchorChanges {
                target: initials
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: initials
                width: 11
                height: 22
                visible: true
                font.pixelSize: 16
                lineHeight: 22
                anchors.verticalCenterOffset: -1
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: shape
                visible: false
                source: "assets/shape_type_Image_Size_Large_Shape_Square.png"
            }
        },
        State {
            name: "type_Initial_Size_Large_Shape_Square"

            AnchorChanges {
                target: initials
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.baseline: undefined
            }

            AnchorChanges {
                target: shape
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: avatar
                width: 40
                height: 40
                color: "#2c2c2c"
                radius: 8
            }

            PropertyChanges {
                target: initials
                width: 13
                height: 24
                visible: true
                font.pixelSize: 20
                lineHeight: 24
            }

            PropertyChanges {
                target: shape
                visible: false
                source: "assets/shape_type_Image_Size_Large_Shape_Square.png"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"d94f7eaa-cb43-5758-a4a5-30e27d16fbef"}D{i:1;uuid:"d6a561fa-fefe-5eff-8b7a-6ecbd42c150b"}
D{i:2;uuid:"373f736c-8d48-5bcb-ab95-c854f8312731"}
}
##^##*/

