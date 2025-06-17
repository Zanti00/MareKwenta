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
    property alias inventory1Text: inventory1.text
    property alias cafe_Latte3Text: cafe_Latte3.text
    property alias spanish_LatteText: spanish_Latte.text
    property alias cafe_LatteText: cafe_Latte.text
    property alias cafe_Latte6Text: cafe_Latte6.text
    property alias spanish_Latte2Text: spanish_Latte2.text
    property alias receiptsText: receipts.text
    property alias mKText: mK.text
    property alias inventoryText: inventory.text
    property alias americano3Text: americano3.text
    property alias cash_BoxText: cash_Box.text
    property alias hello_UserText: hello_User.text
    property alias logsText: logs.text
    property alias americano2Text: americano2.text
    property alias dash_boardText: dash_board.text
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
    property alias staffText: staff.text
    property alias ticketText: ticket.text
    property alias spanish_Latte1Text: spanish_Latte1.text
    property alias cafe_Latte2Text: cafe_Latte2.text
    property alias cafe_Latte1Text: cafe_Latte1.text
    property alias coffee_Hot_VentiText: coffee_Hot_Venti.text
    property alias americanoText: americano.text
    property alias cafe_Latte4Text: cafe_Latte4.text
    property alias mocha3Text: mocha3.text

    Text {
        id: inventory
        width: 150
        height: 55
        color: "#4e2d18"
        text: qsTr("Inventory")
        anchors.top: parent.top
        anchors.topMargin: 88
        font.letterSpacing: 1.188
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Unbounded"
        anchors.horizontalCenterOffset: -126
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: link_Ingredients
        width: 253
        height: 55
        color: "#4e2d18"
        text: qsTr("Link Ingredients")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 766
        anchors.topMargin: 88
        font.letterSpacing: 1.188
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Unbounded"
    }

    Shape {
        id: line_5_Stroke_
        width: 245
        height: 3
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 766
        anchors.topMargin: 124
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_5_Stroke__ShapePath_0
            strokeWidth: 3
            strokeColor: "transparent"
            PathSvg {
                id: line_5_Stroke__PathSvg_0
                path: "M 244.99998474121094 0 L 244.99998474121094 2.999999761581421 L 0 2.999999761581421 L 0 5.684341886080802e-14 L 244.99998474121094 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4e2d18"
        }
        antialiasing: true
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

            Add {
                id: add
                width: 39
                height: 34
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 503
                anchors.topMargin: 4
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

        Input_Field {
            id: input_Field
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 150
            valueText: qsTr("16")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 150
            valueText: qsTr("Coffee Beans")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field1
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 200
            valueText: qsTr("60")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field1
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 200
            valueText: qsTr("Water")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field2
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 249
            valueText: qsTr("120")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field2
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 249
            valueText: qsTr("Milk")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field3
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 298
            valueText: qsTr("8")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field3
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 298
            valueText: qsTr("Ice")
            state: "state_Default_Value_Type_Default"
        }

        Add {
            id: add1
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 65
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

        Add {
            id: add2
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 109
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

        Add {
            id: add3
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 109
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

        Add {
            id: add4
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 365
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

            Add {
                id: add5
                width: 39
                height: 34
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 503
                anchors.topMargin: 4
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

        Input_Field {
            id: input_Field4
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 150
            valueText: qsTr("16")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field4
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 150
            valueText: qsTr("Coffee Beans")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field5
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 200
            valueText: qsTr("60")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field5
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 200
            valueText: qsTr("Water")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field6
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 249
            valueText: qsTr("120")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field6
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 249
            valueText: qsTr("Milk")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field7
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 298
            valueText: qsTr("8")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field7
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 298
            valueText: qsTr("Ice")
            state: "state_Default_Value_Type_Default"
        }

        Add {
            id: add6
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 65
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

        Add {
            id: add7
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 109
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

        Add {
            id: add8
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 109
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

        Add {
            id: add9
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 365
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

            Add {
                id: add10
                width: 39
                height: 34
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 503
                anchors.topMargin: 4
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

        Input_Field {
            id: input_Field8
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 150
            valueText: qsTr("16")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field8
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 150
            valueText: qsTr("Coffee Beans")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field9
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 200
            valueText: qsTr("60")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field9
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 200
            valueText: qsTr("Water")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field10
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 249
            valueText: qsTr("120")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field10
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 249
            valueText: qsTr("Milk")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field11
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 298
            valueText: qsTr("8")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field11
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 298
            valueText: qsTr("Ice")
            state: "state_Default_Value_Type_Default"
        }

        Add {
            id: add11
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 65
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

        Add {
            id: add12
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 109
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

        Add {
            id: add13
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 109
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

        Add {
            id: add14
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 365
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

            Add {
                id: add15
                width: 39
                height: 34
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 503
                anchors.topMargin: 4
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

        Input_Field {
            id: input_Field12
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 150
            valueText: qsTr("16")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field12
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 150
            valueText: qsTr("Coffee Beans")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field13
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 200
            valueText: qsTr("60")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field13
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 200
            valueText: qsTr("Water")
            state: "state_Default_Value_Type_Default"
        }

        Input_Field {
            id: input_Field14
            width: 256
            height: 37
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 249
            valueText: qsTr("120")
            state: "state_Default_Value_Type_Default"
        }

        Select_Field {
            id: select_Field14
            width: 267
            height: 44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 300
            anchors.topMargin: 249
            valueText: qsTr("Milk")
            state: "state_Default_Value_Type_Default"
        }

        Add {
            id: add16
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 65
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

        Add {
            id: add17
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 109
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

        Add {
            id: add18
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 109
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

        Add {
            id: add19
            width: 39
            height: 34
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 312
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
        text: qsTr("Hello, User")
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
        anchors.rightMargin: 1338
        Image {
            id: rectangle_14
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_14_1.png"
        }

        Image {
            id: rectangle_44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_44_1.png"
        }

        Rectangle {
            id: rectangle_43
            width: 83
            height: 97
            color: "#424d2d18"
            radius: 12
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 9
            anchors.topMargin: 116
        }

        Text {
            id: inventory1
            width: 92
            height: 26
            color: "#4d2d18"
            text: qsTr("Inventory")
            anchors.top: parent.top
            anchors.topMargin: 183
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: group_90
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.rightMargin: 21
            anchors.topMargin: 580
            anchors.bottomMargin: 385
            Text {
                id: ticket
                width: 62
                height: 21
                color: "#4d2d18"
                text: qsTr("Ticket")
                anchors.top: parent.top
                anchors.topMargin: 38
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
                anchors.horizontalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Shopping_cart {
                id: shopping_cart
                width: 31
                height: 29
                anchors.top: parent.top
                state: "size_48"
                clip: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Archive {
            id: archive
            width: 29
            height: 30
            anchors.top: parent.top
            anchors.topMargin: 144
            state: "size_48"
            clip: true
            anchors.horizontalCenterOffset: -1
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: group_91
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 687
            anchors.bottomMargin: 268
            Text {
                id: dash_board
                width: 103
                height: 34
                color: "#4d2d18"
                text: qsTr("Dash\nboard")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 35
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
            }

            Bar_chart_2 {
                id: bar_chart_2
                width: 28
                height: 29
                anchors.top: parent.top
                state: "size_48"
                clip: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            id: logs
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
            id: group_88
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 9
            anchors.rightMargin: 9
            anchors.topMargin: 362
            anchors.bottomMargin: 609
            Text {
                id: receipts
                width: 85
                height: 20
                color: "#4e2d18"
                text: qsTr("Receipts")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 33
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
            }

            List {
                id: element
                width: 34
                height: 28
                anchors.top: parent.top
                state: "size_48"
                clip: true
                anchors.horizontalCenterOffset: -3
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Item {
            id: group_89
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 14
            anchors.rightMargin: 18
            anchors.topMargin: 456
            anchors.bottomMargin: 478
            Text {
                id: cash_Box
                width: 71
                height: 53
                color: "#4e2d18"
                text: qsTr("Cash Box")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 37
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
            }

            Dollar_sign {
                id: dollar_sign
                width: 29
                height: 31
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 19
                state: "size_48"
                clip: true
            }
        }

        Item {
            id: group_8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 23
            anchors.rightMargin: 21
            anchors.topMargin: 44
            anchors.bottomMargin: 922
            Text {
                id: mK
                width: 59
                height: 58
                color: "#4d2d18"
                text: qsTr("MK")
                anchors.left: parent.left
                anchors.top: parent.top
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
                id: line_1_Stroke_
                width: 52
                height: 2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 35
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_1_Stroke__ShapePath_0
                    strokeWidth: 2
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_1_Stroke__PathSvg_0
                        path: "M 52 0 L 52 2 L 8.881784197001252e-16 2 L 0 1.4210854715202004e-14 L 52 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#4d2d18"
                }
                antialiasing: true
            }
        }

        Item {
            id: group_87
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 25
            anchors.rightMargin: 28
            anchors.topMargin: 256
            anchors.bottomMargin: 692
            User {
                id: user
                width: 33
                height: 31
                anchors.top: parent.top
                state: "size_48"
                clip: true
                anchors.horizontalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: staff
                width: 50
                height: 34
                color: "#4e2d18"
                text: qsTr("Staff")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 42
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"11fe2170-e09e-54ed-83d2-a8bb4606d8dd"}D{i:1;uuid:"f754c448-a26a-56e0-99ec-534b602554b7"}
D{i:2;uuid:"c0c0fce9-4b48-5eb4-b168-6da11331abd6"}D{i:3;uuid:"06f86e0d-fb62-5627-9b5c-5abdb46020cd"}
D{i:4;uuid:"06f86e0d-fb62-5627-9b5c-5abdb46020cd_ShapePath_0"}D{i:5;uuid:"06f86e0d-fb62-5627-9b5c-5abdb46020cd-PathSvg_0"}
D{i:6;uuid:"01653a52-09f4-5ed9-bfca-7fd0adb358a4"}D{i:7;uuid:"cab48c71-18f7-5d07-b9bc-26e57b94f1b0"}
D{i:8;uuid:"270fe093-e2ff-5687-89b6-c619d19ff5ef"}D{i:9;uuid:"270fe093-e2ff-5687-89b6-c619d19ff5ef_ShapePath_0"}
D{i:10;uuid:"270fe093-e2ff-5687-89b6-c619d19ff5ef-PathSvg_0"}D{i:11;uuid:"c55c516a-f972-5ea5-b362-435623c540f7"}
D{i:12;uuid:"ea8b746e-ec57-5f8e-9d6d-e16860ff9d1b"}D{i:13;uuid:"7da761b9-65bd-539b-8c8d-259d027561aa"}
D{i:14;uuid:"7da761b9-65bd-539b-8c8d-259d027561aa_ShapePath_0"}D{i:15;uuid:"7da761b9-65bd-539b-8c8d-259d027561aa-PathSvg_0"}
D{i:16;uuid:"39b5f04e-3bfd-5567-a403-9f999e1cfcaa"}D{i:17;uuid:"7755f44f-94fa-5ccd-98ac-7d3f8ec4f2d4"}
D{i:18;uuid:"e6958b01-6803-5aac-9894-e94b966fb530"}D{i:19;uuid:"631dc24b-8bf6-59ca-825e-ed44e478fc8f"}
D{i:20;uuid:"0b76a398-7a10-58d3-b310-e8533c553977"}D{i:21;uuid:"d80df607-e531-546b-98be-1d44c1072bbc"}
D{i:22;uuid:"04ed2210-6dda-5912-97e1-4a26c81da11c"}D{i:23;uuid:"d0f1d4c7-20a9-5610-9b2a-633f80e0f5a5"}
D{i:24;uuid:"9a21b99d-a53b-5f54-8edc-7609bfeb96e7"}D{i:25;uuid:"67ba36a6-952f-5972-b170-11bcee5b075d"}
D{i:26;uuid:"785789bf-5b99-5ae8-8526-49978e5735a0"}D{i:27;uuid:"f299130f-e8ff-5a61-ba3a-bd8985cc8bcc"}
D{i:28;uuid:"440016d2-c417-5616-8451-4ec8fb87d3ed"}D{i:29;uuid:"d5319ac4-67c0-59ce-beea-bd8abadcb7c2"}
D{i:30;uuid:"a00d9f24-30be-5a65-8a9e-0f940bf8f754"}D{i:31;uuid:"d3e7a0ac-8546-5111-bb40-c90faa61306d"}
D{i:32;uuid:"f375ed73-1e24-564d-8cfe-2a33cfa13eb1"}D{i:33;uuid:"d9294392-788f-535c-842b-3ef9be9b1ab8"}
D{i:34;uuid:"9035b36b-2f8f-566b-8b89-e71c0c8e27ee"}D{i:35;uuid:"9035b36b-2f8f-566b-8b89-e71c0c8e27ee_ShapePath_0"}
D{i:36;uuid:"9035b36b-2f8f-566b-8b89-e71c0c8e27ee-PathSvg_0"}D{i:37;uuid:"f41689c9-5b4d-59d0-a29b-d1dd40685aa9"}
D{i:38;uuid:"94de0622-d37f-5c4e-849f-0a1671ed9511"}D{i:39;uuid:"7d2c49b9-5656-5e90-83f4-a179571be6cf"}
D{i:40;uuid:"7d2c49b9-5656-5e90-83f4-a179571be6cf_ShapePath_0"}D{i:41;uuid:"7d2c49b9-5656-5e90-83f4-a179571be6cf-PathSvg_0"}
D{i:42;uuid:"4b9a5799-6e54-5c82-849f-cc43ddae5452"}D{i:43;uuid:"52136292-3750-5f2a-8ab1-24c3ae73ec47"}
D{i:44;uuid:"2c73acbc-3639-5759-abb0-036e11ed351b"}D{i:45;uuid:"2c73acbc-3639-5759-abb0-036e11ed351b_ShapePath_0"}
D{i:46;uuid:"2c73acbc-3639-5759-abb0-036e11ed351b-PathSvg_0"}D{i:47;uuid:"5977fc72-5f5c-55a1-9fd2-23c83b32a404"}
D{i:48;uuid:"338be08a-6018-5302-970e-a7c297a1d1b8"}D{i:49;uuid:"775dcd79-b720-5802-92e1-a923355a6eb9"}
D{i:50;uuid:"f42f9701-5d99-5c3d-b1d4-b54393225deb"}D{i:51;uuid:"a43980e9-dc6b-5bbc-9e8a-e1d398105869"}
D{i:52;uuid:"233a14cd-e635-520c-bda8-111fb5a7490c"}D{i:53;uuid:"6d6763d1-e1b4-5128-a0a5-5ac55e97fdc9"}
D{i:54;uuid:"dba33f2f-45a9-5c7f-9e6d-7663099ae710"}D{i:55;uuid:"32462bd5-858c-53cf-89c4-16e8ebb1e81d"}
D{i:56;uuid:"ecf0dd01-c5b2-5134-abb2-e34a19eefadb"}D{i:57;uuid:"3a2a0125-dd3b-5081-969c-4f00204024bb"}
D{i:58;uuid:"054e63bf-69e8-5690-a0fb-420e4df3ff36"}D{i:59;uuid:"65808941-1a63-5243-8882-4ed9e7bb5b87"}
D{i:60;uuid:"bf386a78-c172-508c-aad9-d64597dd3105"}D{i:61;uuid:"08517130-f6d3-5d97-9968-240595506497"}
D{i:62;uuid:"8b10f20f-26cf-5e39-bde7-d0e2336fe42a"}D{i:63;uuid:"541a9eb1-70ae-5a63-a4cc-0a772452514d"}
D{i:64;uuid:"ca01b286-0e95-5e8e-ae70-4d92e247cc5b"}D{i:65;uuid:"889392b7-05b2-56e6-b640-c4da09faca03"}
D{i:66;uuid:"889392b7-05b2-56e6-b640-c4da09faca03_ShapePath_0"}D{i:67;uuid:"889392b7-05b2-56e6-b640-c4da09faca03-PathSvg_0"}
D{i:68;uuid:"1838cf54-1244-5354-9427-d460ebb356ea"}D{i:69;uuid:"083ecffe-84af-521e-9fd2-de30cc0bc004"}
D{i:70;uuid:"7c9e1edc-367e-50d9-8205-c4e479e01454"}D{i:71;uuid:"7c9e1edc-367e-50d9-8205-c4e479e01454_ShapePath_0"}
D{i:72;uuid:"7c9e1edc-367e-50d9-8205-c4e479e01454-PathSvg_0"}D{i:73;uuid:"5b22646d-d544-57f1-bae1-71b00a30dea3"}
D{i:74;uuid:"cb24d537-2945-58b3-8e31-0c6ba546275c"}D{i:75;uuid:"74f52dd6-cae6-53d9-97c7-a27211d80817"}
D{i:76;uuid:"74f52dd6-cae6-53d9-97c7-a27211d80817_ShapePath_0"}D{i:77;uuid:"74f52dd6-cae6-53d9-97c7-a27211d80817-PathSvg_0"}
D{i:78;uuid:"3ea3d412-3aaa-54c6-9ae1-aba1a34336d3"}D{i:79;uuid:"49bdfa3e-42b4-54f7-b9b7-d8015cf4f9ad"}
D{i:80;uuid:"38441063-c4a0-59a1-950c-14219964831c"}D{i:81;uuid:"c15389d9-2534-57eb-86c7-7fa304c040a8"}
D{i:82;uuid:"89ffde5f-ffc0-50b2-a408-7e85974f7def"}D{i:83;uuid:"4c0f26d9-384b-54b0-bccd-1e2d99540738"}
D{i:84;uuid:"2ed9841a-87ad-5e0f-9295-36c2eaba331f"}D{i:85;uuid:"b38df443-19cd-5341-a8ca-4d6399445c69"}
D{i:86;uuid:"b5399034-55b7-5a63-9808-d62665dcb8a8"}D{i:87;uuid:"45bd56e2-f2e4-5b96-bf27-3d3b97b942a3"}
D{i:88;uuid:"bbf24437-03ab-5200-8996-690361b01416"}D{i:89;uuid:"16c029b8-3602-5688-ae2e-180154f955d0"}
D{i:90;uuid:"859b808c-a890-5c1a-bbbb-2a3c93c40548"}D{i:91;uuid:"f05bed6d-20b7-5453-9796-deff65323afa"}
D{i:92;uuid:"485427ae-fab0-5a49-b71d-9e728966c51d"}D{i:93;uuid:"0061a2d3-9303-5626-8eae-7c5f51e1b4a0"}
D{i:94;uuid:"3db43320-7d81-52f7-b76c-ccb8efe922ef"}D{i:95;uuid:"9d3a9159-25dc-5470-9077-1c73946c235c"}
D{i:96;uuid:"337118df-bef2-5806-a998-753c2bf9b4eb"}D{i:97;uuid:"337118df-bef2-5806-a998-753c2bf9b4eb_ShapePath_0"}
D{i:98;uuid:"337118df-bef2-5806-a998-753c2bf9b4eb-PathSvg_0"}D{i:99;uuid:"68f9793f-5963-5fc3-8db5-17f6c0465db2"}
D{i:100;uuid:"0f9286e9-d1fd-5807-bd56-6acf44fc6c82"}D{i:101;uuid:"5cab01cf-4739-5650-aaf0-13e27c5625ba"}
D{i:102;uuid:"5cab01cf-4739-5650-aaf0-13e27c5625ba_ShapePath_0"}D{i:103;uuid:"5cab01cf-4739-5650-aaf0-13e27c5625ba-PathSvg_0"}
D{i:104;uuid:"f5b6db9e-1e9d-58cd-8d4b-1b29725704d7"}D{i:105;uuid:"06e9cd59-397b-5c6c-9084-7bbf1f1dc987"}
D{i:106;uuid:"04a6ddc8-87ed-5d43-8faa-293058dcd497"}D{i:107;uuid:"04a6ddc8-87ed-5d43-8faa-293058dcd497_ShapePath_0"}
D{i:108;uuid:"04a6ddc8-87ed-5d43-8faa-293058dcd497-PathSvg_0"}D{i:109;uuid:"e815bb80-de5d-5b8f-b581-2de429d209e9"}
D{i:110;uuid:"c27a665e-35d5-5658-8309-f8e9879da691"}D{i:111;uuid:"47f2c98f-a41e-5a30-9a5a-d13c41e84e8e"}
D{i:112;uuid:"4b781f54-3dae-5b1e-b73c-5f225b007e17"}D{i:113;uuid:"2176b1c9-0130-51ec-b095-7a488d454378"}
D{i:114;uuid:"21a86ea5-1775-5a88-b0d4-3e320ce3d2de"}D{i:115;uuid:"104473dc-ca78-54a5-8578-7d4d1d983704"}
D{i:116;uuid:"1b4038f5-6af6-525b-823d-a341c164cfb4"}D{i:117;uuid:"f0cba4cc-c3d7-5416-a328-93868163af91"}
D{i:118;uuid:"027b835c-a869-5186-98f4-6fa0fcb05058"}D{i:119;uuid:"17daccb4-46d8-5b35-9d5e-3e2ed8ddf74a"}
D{i:120;uuid:"b062157b-faaa-5715-bc74-e56bfc43d859"}D{i:121;uuid:"2561ae24-b435-591f-8d47-595df7e03047"}
D{i:122;uuid:"92e2cc00-87e7-5b25-9c76-40069efac79a"}D{i:123;uuid:"feb732ae-b608-56ae-9136-b3b7c256f5a7"}
D{i:124;uuid:"439f7fc7-8ca7-5994-92f7-6f3cf9a19683"}D{i:125;uuid:"56da38d9-b804-5b82-9ac5-8553dbc853cf"}
D{i:126;uuid:"56da38d9-b804-5b82-9ac5-8553dbc853cf_ShapePath_0"}D{i:127;uuid:"56da38d9-b804-5b82-9ac5-8553dbc853cf-PathSvg_0"}
D{i:128;uuid:"d712172f-6795-5e6f-a1af-09e2163d1c52"}D{i:129;uuid:"ef722c35-b046-58d7-a7b4-72d42760dda3"}
D{i:130;uuid:"7a65e9ea-157b-5122-98f5-c690fef9b1d6"}D{i:131;uuid:"67e00da6-8649-500b-b60a-847feb8a6664"}
D{i:132;uuid:"0f800201-e3b9-5ed1-a7de-1de5ec1ca424"}D{i:133;uuid:"47f84a63-cb2a-5641-9485-7e1588c44eed"}
D{i:134;uuid:"c2c11f6a-e3c9-53df-8b4b-8947e640a502"}D{i:135;uuid:"5aea75cc-6c2b-56f0-afd7-752e742725cf"}
D{i:136;uuid:"d675e6de-9fe1-5e0a-b093-de254ad1fbc1"}D{i:137;uuid:"aa0f381b-c779-5fa4-9870-8b8972a8d366"}
D{i:138;uuid:"90378ee0-77ef-5613-a701-f2efe9f48f00"}D{i:139;uuid:"7bb88a81-5712-530e-8d40-c453d0b0e295"}
D{i:140;uuid:"6ee82f0e-637c-5920-8208-f9cfe054e9a4"}D{i:141;uuid:"2bdf23e3-d35b-5edb-a722-99d1cde4646c"}
D{i:142;uuid:"73edf537-d8d4-5864-975b-7d464775613f"}D{i:143;uuid:"71fb501c-cc6f-5027-81f3-ea293b8c8477"}
D{i:144;uuid:"90cb379c-1e1f-5bfc-b884-4adeeb49276d"}D{i:145;uuid:"3accb09c-d6f1-5eba-afa8-2791109ba119"}
D{i:146;uuid:"60b60a66-6d97-5355-96b4-1927792133a5"}D{i:147;uuid:"ed2d0462-de56-5ece-b9ec-4727e0ec83bf"}
D{i:148;uuid:"b6fb8590-f3e8-53eb-bd32-8a8eed8b3265"}D{i:149;uuid:"47854433-57ce-5fd5-954a-2dab9b4852f2"}
D{i:150;uuid:"c23abef5-aa56-5464-88a4-c97f5883121b"}D{i:151;uuid:"c23abef5-aa56-5464-88a4-c97f5883121b_ShapePath_0"}
D{i:152;uuid:"c23abef5-aa56-5464-88a4-c97f5883121b-PathSvg_0"}D{i:153;uuid:"d1ae2d74-f369-5a4b-9af7-055ce67769d3"}
D{i:154;uuid:"bdbdd7df-4174-5033-9c0c-21b6503a38ad"}D{i:155;uuid:"a0f916c0-9bcc-51c7-9769-5be8aeaecfad"}
}
##^##*/

