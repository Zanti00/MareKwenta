import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: inventory_Management_Ingredients_Linking
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias cafe_Latte3Text: cafe_Latte3.text
    property alias spanish_LatteText: spanish_Latte.text
    property alias cafe_LatteText: cafe_Latte.text
    property alias cafe_Latte6Text: cafe_Latte6.text
    property alias spanish_Latte2Text: spanish_Latte2.text
    property alias inventoryText: inventory.text
    property alias americano3Text: americano3.text
    property alias hello_UserText: hello_User.text
    property alias americano2Text: americano2.text
    property alias spanish_Latte3Text: spanish_Latte3.text
    property alias coffee_Hot_GrandeText: coffee_Hot_Grande.text
    property alias link_IngredientsText: link_Ingredients.text
    property alias cafe_Latte5Text: cafe_Latte5.text
    property alias coffee_Iced_VentiText: coffee_Iced_Venti.text
    property alias mocha1Text: mocha1.text
    property alias mocha2Text: mocha2.text
    property alias cafe_Latte7Text: cafe_Latte7.text
    property alias americano1Text: americano1.text
    property alias mochaText: mocha.text
    property alias coffee_Iced_GrandeText: coffee_Iced_Grande.text
    property alias spanish_Latte1Text: spanish_Latte1.text
    property alias cafe_Latte2Text: cafe_Latte2.text
    property alias cafe_Latte1Text: cafe_Latte1.text
    property alias coffee_Hot_VentiText: coffee_Hot_Venti.text
    property alias americanoText: americano.text
    property alias cafe_Latte4Text: cafe_Latte4.text
    property alias mocha3Text: mocha3.text

    Text {
        id: inventory
        width: 163
        height: 55
        color: "#4e2d18"
        text: qsTr("Inventory")
        anchors.top: parent.top
        anchors.topMargin: 84
        font.letterSpacing: 1.188
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.styleName: "Medium"
        font.weight: Font.Normal
        font.family: "Unbounded"
        anchors.horizontalCenterOffset: -132
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            anchors.leftMargin: -2
            anchors.rightMargin: 2
            anchors.topMargin: -2
            anchors.bottomMargin: 2
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            onClicked: {
                console.log("Link clicked - calling navigation function")
                navHandler.inventoryClicked()
            }
        }
    }


    Text {
        id: link_Ingredients
        width: 313
        height: 55
        color: "#4e2d18"
        text: qsTr("Link Ingredients")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 774
        anchors.topMargin: 84
        font.letterSpacing: 1.188
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.styleName: "Bold"
        font.weight: Font.Bold
        font.family: "Unbounded"
    }

    Item {
        id: group_15
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 137
        anchors.rightMargin: 704
        anchors.topMargin: 154
        anchors.bottomMargin: 384
        Rectangle {
            id: addIngredients
            width: 599
            height: 486
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Shape {
            id: line_7_Stroke_
            width: 535
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 360
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_7_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_7_Stroke__PathSvg_0
                    path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 0 0.9999999403953552 L 0 1.1368683772161603e-13 L 534.9765014648438 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }

        Text {
            id: coffee_Iced_Grande
            width: 366
            height: 27
            color: "#000000"
            text: qsTr("Coffee-Iced-Grande")
            anchors.top: parent.top
            anchors.topMargin: 15
            font.letterSpacing: 1
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: -96
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: group_29
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 32
            anchors.rightMargin: 25
            anchors.topMargin: 411
            anchors.bottomMargin: 38
            Shape {
                id: line_7_Stroke_1
                width: 535
                height: 1
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: -1
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_7_Stroke__ShapePath_1
                    strokeWidth: 1
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_7_Stroke__PathSvg_1
                        path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 2.4492934404725397e-16 0.9999999403953552 L 0 1.3100631690576847e-13 L 534.9765014648438 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#4e2d18"
                }
                antialiasing: true
            }


            Text {
                id: mocha
                width: 138
                height: 34
                color: "#000000"
                text: qsTr("Mocha")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 3
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Inter"
            }
        }

        Text {
            id: americano
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Americano")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 64
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }


        Text {
            id: cafe_Latte
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 108
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }


        Text {
            id: cafe_Latte1
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 108
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: spanish_Latte
            width: 151
            height: 34
            color: "#000000"
            text: qsTr("Spanish Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 364
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Shape {
            id: line_6_Stroke_
            width: 535
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 104
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_6_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_6_Stroke__PathSvg_0
                    path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 0 0.9999999403953552 L 0 1.1368683772161603e-13 L 534.9765014648438 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }
    }

    Item {
        id: group_17
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 136
        anchors.rightMargin: 705
        anchors.topMargin: 678
        anchors.bottomMargin: -140
        Rectangle {
            id: addIngredients1
            width: 599
            height: 486
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Shape {
            id: line_7_Stroke_2
            width: 535
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 360
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_7_Stroke__ShapePath_2
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_7_Stroke__PathSvg_2
                    path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 0 0.9999999403953552 L 0 1.1368683772161603e-13 L 534.9765014648438 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }

        Text {
            id: coffee_Iced_Venti
            width: 366
            height: 27
            color: "#000000"
            text: qsTr("Coffee-Iced-Venti")
            anchors.top: parent.top
            anchors.topMargin: 15
            font.letterSpacing: 1
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: -96
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: group_30
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 32
            anchors.rightMargin: 25
            anchors.topMargin: 411
            anchors.bottomMargin: 38
            Shape {
                id: line_7_Stroke_3
                width: 535
                height: 1
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: -1
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_7_Stroke__ShapePath_3
                    strokeWidth: 1
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_7_Stroke__PathSvg_3
                        path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 2.4492934404725397e-16 0.9999999403953552 L 0 1.3100631690576847e-13 L 534.9765014648438 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#4e2d18"
                }
                antialiasing: true
            }



            Text {
                id: mocha1
                width: 138
                height: 34
                color: "#000000"
                text: qsTr("Mocha")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 3
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Inter"
            }
        }

        Text {
            id: americano1
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Americano")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 64
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: cafe_Latte2
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 108
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: cafe_Latte3
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 108
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: spanish_Latte1
            width: 151
            height: 34
            color: "#000000"
            text: qsTr("Spanish Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 364
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Shape {
            id: line_6_Stroke_1
            width: 535
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 104
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_6_Stroke__ShapePath_1
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_6_Stroke__PathSvg_1
                    path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 0 0.9999999403953552 L 0 1.1368683772161603e-13 L 534.9765014648438 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }
    }

    Item {
        id: group_18
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 780
        anchors.rightMargin: 61
        anchors.topMargin: 613
        anchors.bottomMargin: -75
        Rectangle {
            id: addIngredients2
            width: 599
            height: 486
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Shape {
            id: line_7_Stroke_4
            width: 535
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 360
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_7_Stroke__ShapePath_4
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_7_Stroke__PathSvg_4
                    path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 0 0.9999999403953552 L 0 1.1368683772161603e-13 L 534.9765014648438 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }

        Text {
            id: coffee_Hot_Venti
            width: 366
            height: 27
            color: "#000000"
            text: qsTr("Coffee-Hot-Venti")
            anchors.top: parent.top
            anchors.topMargin: 15
            font.letterSpacing: 1
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: -96
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: group_31
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 32
            anchors.rightMargin: 25
            anchors.topMargin: 411
            anchors.bottomMargin: 38
            Shape {
                id: line_7_Stroke_5
                width: 535
                height: 1
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: -1
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_7_Stroke__ShapePath_5
                    strokeWidth: 1
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_7_Stroke__PathSvg_5
                        path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 2.4492934404725397e-16 0.9999999403953552 L 0 1.3100631690576847e-13 L 534.9765014648438 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#4e2d18"
                }
                antialiasing: true
            }

            Text {
                id: mocha2
                width: 138
                height: 34
                color: "#000000"
                text: qsTr("Mocha")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 3
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Inter"
            }
        }

        Text {
            id: americano2
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Americano")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 64
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: cafe_Latte4
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 108
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: cafe_Latte5
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 108
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: spanish_Latte2
            width: 151
            height: 34
            color: "#000000"
            text: qsTr("Spanish Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 364
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Shape {
            id: line_6_Stroke_2
            width: 535
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 104
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_6_Stroke__ShapePath_2
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_6_Stroke__PathSvg_2
                    path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 0 0.9999999403953552 L 0 1.1368683772161603e-13 L 534.9765014648438 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }
    }

    Item {
        id: group_16
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 780
        anchors.rightMargin: 61
        anchors.topMargin: 157
        anchors.bottomMargin: 449
        Rectangle {
            id: addIngredients3
            width: 599
            height: 418
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Shape {
            id: line_7_Stroke_6
            width: 535
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 307
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_7_Stroke__ShapePath_6
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_7_Stroke__PathSvg_6
                    path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 0 0.9999999403953552 L 0 1.1368683772161603e-13 L 534.9765014648438 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }

        Text {
            id: coffee_Hot_Grande
            width: 366
            height: 27
            color: "#000000"
            text: qsTr("Coffee-Hot-Grande")
            anchors.top: parent.top
            anchors.topMargin: 15
            font.letterSpacing: 1
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: -96
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: group_32
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 32
            anchors.rightMargin: 25
            anchors.topMargin: 358
            anchors.bottomMargin: 23
            Shape {
                id: line_7_Stroke_7
                width: 535
                height: 1
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: -1
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_7_Stroke__ShapePath_7
                    strokeWidth: 1
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_7_Stroke__PathSvg_7
                        path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 2.4492934404725397e-16 0.9999999403953552 L 0 1.3100631690576847e-13 L 534.9765014648438 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#4e2d18"
                }
                antialiasing: true
            }

            Text {
                id: mocha3
                width: 138
                height: 34
                color: "#000000"
                text: qsTr("Mocha")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 3
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Inter"
            }
        }


        Text {
            id: americano3
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Americano")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 64
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }


        Text {
            id: cafe_Latte6
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 108
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }


        Text {
            id: cafe_Latte7
            width: 138
            height: 34
            color: "#000000"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 108
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: spanish_Latte3
            width: 151
            height: 34
            color: "#000000"
            text: qsTr("Spanish Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 311
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Shape {
            id: line_6_Stroke_3
            width: 535
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 104
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_6_Stroke__ShapePath_3
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_6_Stroke__PathSvg_3
                    path: "M 534.9765014648438 0 L 534.9765014648438 0.9999999403953552 L 0 0.9999999403953552 L 0 1.1368683772161603e-13 L 534.9765014648438 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }
    }

    Text {
        id: hello_User
        width: 257
        height: 38
        color: "#4e2d18"
        text: qsTr("Inventory")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 41
        font.pixelSize: 36
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "Unbounded"
    }

    Item {
        id: group_19
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -2
        anchors.rightMargin: 1340
        Image {
            id: rectangle_15
            width: 124
            height: 1040
            anchors.top: parent.top
            anchors.topMargin: -8
            source: "assets/rectangle_15.png"

            Rectangle {
                id: rectangle8
                x: 18
                y: 775
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
            }

            Rectangle {
                id: rectangle9
                x: 18
                y: 657
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
            }

            Rectangle {
                id: rectangle7
                x: 18
                y: 541
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
            }

            Rectangle {
                id: rectangle6
                x: 18
                y: 423
                width: 78
                height: 85
                color: "#f2efea"
                border.color: "#f2efea"
            }

            Rectangle {
                id: rectangle5
                x: 18
                y: 305
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
                border.color: "#f2efea"
            }

            Rectangle {
                id: rectangle4
                x: 18
                y: 126
                width: 78
                height: 85
                color: "#f2efea"
                radius: 12
                border.color: "#f2efea"

                Button {
                    id: inventory_navbar
                    x: 0
                    objectName: "inventory_navbar"
                    y: 0
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.height: 55
                    icon.color: "#4e2d18"
                    icon.width: 55
                    icon.source: "assets/Archive.png"
                    onClicked: navHandler.navigateToInventory()
                    display: AbstractButton.IconOnly
                    background: Rectangle{
                        color: "#f2efea"
                        border.color: "#f2efea"

                    }
                    Text {
                        id: text4
                        x: 5
                        y: 63
                        color: "#4e2d18"
                        text: qsTr("Inventory")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: staff_navbar
                    objectName: "staff_navbar"
                    x: 0
                    y: 114
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/User.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    onClicked: navHandler.navigateToStaff()
                    display: AbstractButton.IconOnly
                    background: Rectangle{
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"

                    }

                    Text {
                        id: text5
                        x: 21
                        y: 62
                        color: "#4e2d18"
                        text: qsTr("Staff")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                }

                Button {
                    id: receipt_navbar
                    objectName: "receipt_navbar"
                    x: 0
                    y: 226
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/List.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    display: AbstractButton.IconOnly
                    Text {
                        id: text6
                        x: 12
                        y: 65
                        color: "#4e2d18"
                        text: qsTr("Receipt")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                    background: Rectangle {
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"
                    }
                }

                Button {
                    id: cashbox_navbar
                    objectName: "casbox_navbar"
                    x: 0
                    y: 350
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/DollarSign.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    onClicked: navHandler.navigateToCashBox()
                    display: AbstractButton.IconOnly
                    Text {
                        id: text7
                        x: 7
                        y: 65
                        color: "#4e2d18"
                        text: qsTr("CashBox")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                    background: Rectangle {
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"
                    }
                }

                Button {
                    id: ticket_navbar
                    objectName: "ticket_navbar"
                    x: 0
                    y: 466
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/Ticket.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    display: AbstractButton.IconOnly
                    Text {
                        id: text8
                        x: 17
                        y: 65
                        color: "#4e2d18"
                        text: qsTr("Ticket")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                    background: Rectangle {
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"
                    }
                }

                Button {
                    id: dashboard_navbar
                    objectName: "dashboard_navbar"
                    x: 0
                    y: 584
                    width: 78
                    height: 85
                    text: qsTr("")
                    icon.width: 55
                    icon.source: "assets/BarChart.png"
                    icon.height: 55
                    icon.color: "#4e2d18"
                    onClicked: navHandler.navigateToDashboard()
                    display: AbstractButton.IconOnly
                    Text {
                        id: text9
                        x: 0
                        y: 65
                        color: "#4e2d18"
                        text: qsTr("Dashboard")
                        font.pixelSize: 12
                        font.family: "Unbounded"
                    }
                    background: Rectangle {
                        color: "#f2efea"
                        radius: 12
                        border.color: "#f2efea"
                    }
                }
            }





        }

        Text {
            id: logs1
            width: 50
            height: 34
            visible: false
            color: "#4e2d18"
            text: qsTr("Logs")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 287
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Item {
            id: group_9
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 23
            anchors.rightMargin: 21
            anchors.topMargin: 44
            anchors.bottomMargin: 922
            Text {
                id: mK1
                width: 59
                height: 58
                color: "#4d2d18"
                text: qsTr("MK")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -1
                anchors.topMargin: -8
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4d2d18"
                style: Text.Outline
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Shape {
                id: line_1_Stroke_1
                width: 52
                height: 2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 3
                anchors.topMargin: 28
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_1_Stroke__ShapePath_1
                    strokeWidth: 2
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_1_Stroke__PathSvg_1
                        path: "M 52 0 L 52 2 L 8.881784197001252e-16 2 L 0 1.4210854715202004e-14 L 52 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#4d2d18"
                }
                antialiasing: true
            }
        }
    }

    Rectangle {
        id: separator
        x: 774
        y: 116
        width: 260
        height: 3
        color: "#4e2d18"
        border.color: "#4e2d18"
    }

}

/*##^##
Designer {
    D{i:0;uuid:"11fe2170-e09e-54ed-83d2-a8bb4606d8dd"}D{i:1;uuid:"f754c448-a26a-56e0-99ec-534b602554b7"}
D{i:3;uuid:"c0c0fce9-4b48-5eb4-b168-6da11331abd6"}D{i:22;uuid:"01653a52-09f4-5ed9-bfca-7fd0adb358a4"}
D{i:23;uuid:"cab48c71-18f7-5d07-b9bc-26e57b94f1b0"}D{i:24;uuid:"270fe093-e2ff-5687-89b6-c619d19ff5ef"}
D{i:25;uuid:"270fe093-e2ff-5687-89b6-c619d19ff5ef_ShapePath_0"}D{i:26;uuid:"270fe093-e2ff-5687-89b6-c619d19ff5ef-PathSvg_0"}
D{i:27;uuid:"c55c516a-f972-5ea5-b362-435623c540f7"}D{i:28;uuid:"ea8b746e-ec57-5f8e-9d6d-e16860ff9d1b"}
D{i:29;uuid:"7da761b9-65bd-539b-8c8d-259d027561aa"}D{i:30;uuid:"7da761b9-65bd-539b-8c8d-259d027561aa_ShapePath_0"}
D{i:31;uuid:"7da761b9-65bd-539b-8c8d-259d027561aa-PathSvg_0"}D{i:40;uuid:"f41689c9-5b4d-59d0-a29b-d1dd40685aa9"}
D{i:41;uuid:"94de0622-d37f-5c4e-849f-0a1671ed9511"}D{i:42;uuid:"7d2c49b9-5656-5e90-83f4-a179571be6cf"}
D{i:43;uuid:"7d2c49b9-5656-5e90-83f4-a179571be6cf_ShapePath_0"}D{i:44;uuid:"7d2c49b9-5656-5e90-83f4-a179571be6cf-PathSvg_0"}
D{i:45;uuid:"4b9a5799-6e54-5c82-849f-cc43ddae5452"}D{i:46;uuid:"52136292-3750-5f2a-8ab1-24c3ae73ec47"}
D{i:47;uuid:"2c73acbc-3639-5759-abb0-036e11ed351b"}D{i:48;uuid:"2c73acbc-3639-5759-abb0-036e11ed351b_ShapePath_0"}
D{i:49;uuid:"2c73acbc-3639-5759-abb0-036e11ed351b-PathSvg_0"}D{i:58;uuid:"1838cf54-1244-5354-9427-d460ebb356ea"}
D{i:59;uuid:"083ecffe-84af-521e-9fd2-de30cc0bc004"}D{i:60;uuid:"7c9e1edc-367e-50d9-8205-c4e479e01454"}
D{i:61;uuid:"7c9e1edc-367e-50d9-8205-c4e479e01454_ShapePath_0"}D{i:62;uuid:"7c9e1edc-367e-50d9-8205-c4e479e01454-PathSvg_0"}
D{i:63;uuid:"5b22646d-d544-57f1-bae1-71b00a30dea3"}D{i:64;uuid:"cb24d537-2945-58b3-8e31-0c6ba546275c"}
D{i:65;uuid:"74f52dd6-cae6-53d9-97c7-a27211d80817"}D{i:66;uuid:"74f52dd6-cae6-53d9-97c7-a27211d80817_ShapePath_0"}
D{i:67;uuid:"74f52dd6-cae6-53d9-97c7-a27211d80817-PathSvg_0"}D{i:109}
}
##^##*/

