import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: inventory_Management_Entry
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias create_IngredientText: create_Ingredient.text
    property alias ingredientText: ingredient.text
    property alias logs1Text: logs1.text
    property alias receiptsText: receipts.text
    property alias mKText: mK.text
    property alias inventoryText: inventory.text
    property alias quantityText: quantity.text
    property alias cash_BoxText: cash_Box.text
    property alias hello_UserText: hello_User.text
    property alias currentText: current.text
    property alias logsText: logs.text
    property alias element6Text: measurement_text.text
    property alias link_IngredientsText: link_Ingredients.text
    property alias mK1Text: mK1.text
    property alias ticketText: ticket.text
    property alias element3Text: status_text.text
    property alias milkText: ingredient_text.text

    Text {
        id: inventory
        width: 167
        height: 30
        color: "#4e2d18"
        text: qsTr("Inventory")
        anchors.top: parent.top
        anchors.topMargin: 88
        font.letterSpacing: 1.188
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.styleName: "Medium"
        font.underline: false
        font.weight: Font.Normal
        font.family: "Unbounded"
        anchors.horizontalCenterOffset: -126
        anchors.horizontalCenter: parent.horizontalCenter
        signal navigateToInventoryLinking
    }

    Text {
        id: link_Ingredients
        width: 277
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
        font.styleName: "Medium"
        font.weight: Font.Normal
        font.family: "Unbounded"

        // Add MouseArea to make it clickable
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            onClicked: {
                console.log("Link clicked - calling navigation function")
                mainWindow.linkIngredientsClicked()
            }
        }
    }

    Item {
        id: group_14
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -2
        anchors.rightMargin: 1340
        Image {
            id: rectangle_14
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_14.png"
        }

        Text {
            id: ticket
            width: 62
            height: 21
            color: "#4d2d18"
            text: qsTr("Ticket")
            anchors.top: parent.top
            anchors.topMargin: 618
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Bar_chart_2 {
            id: bar_chart_2
            width: 28
            height: 29
            anchors.top: parent.top
            anchors.topMargin: 687
            state: "size_48"
            clip: true
            anchors.horizontalCenter: parent.horizontalCenter
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

        Text {
            id: receipts
            width: 85
            height: 20
            color: "#4e2d18"
            text: qsTr("Receipts")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 9
            anchors.topMargin: 395
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Text {
            id: cash_Box
            width: 71
            height: 53
            color: "#4e2d18"
            text: qsTr("Cash Box")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 14
            anchors.topMargin: 493
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
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
    }

    Item {
        id: group_17
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -2
        anchors.rightMargin: 1340
        Image {
            id: rectangle_15
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_15.png"

            Button {
                id: inventory_navbar
                x: 18
                y: 144
                width: 67
                height: 63
                visible: true
                hoverEnabled: false
                padding: 24
                font.bold: true
                font.pointSize: 13
                font.family: "Inter 18pt 18pt"
                display: AbstractButton.TextOnly
                background: Rectangle {
                    id: highlight_inventory
                    opacity: 0.2
                    visible: false
                    color: "#4d2d18"
                    radius: 8
                    border.color: "#4d2d18"
                }
                contentItem: Text {
                    color: "#4e2d18"
                    text: "Inventory"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    font.styleName: "Medium"
                    font.pointSize: 10
                    font.family: "Unbounded"

                    Image {
                        id: archive
                        x: 9
                        y: 0
                        width: 39
                        height: 34
                        source: "assets/Archive.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Button {
                id: staff_navbar
                x: 18
                y: 220
                width: 67
                height: 63
                visible: true
                padding: 24
                font.pointSize: 13
                font.family: "Inter 18pt 18pt"
                font.bold: true
                display: AbstractButton.TextOnly
                contentItem: Text {
                    color: "#4e2d18"
                    text: "Staff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    font.styleName: "Medium"
                    font.pointSize: 7
                    font.family: "Unbounded"

                    Image {
                        id: user
                        x: 12
                        y: 8
                        source: "assets/User.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
                background: Rectangle {
                    id: highlight_staff
                    opacity: 0.2
                    visible: false
                    color: "#4d2d18"
                    radius: 8
                    border.color: "#4d2d18"
                }
            }
        }

        Item {
            id: group_86
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 687
            anchors.bottomMargin: 268
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
        id: group_16
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 127
        anchors.rightMargin: 35
        anchors.topMargin: 305
        anchors.bottomMargin: 31
        Rectangle {
            id: ingridientsList
            width: 1278
            height: 688
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top

            ComboBox {
                id: action_combobox
                x: 1112
                y: 60
                width: 114
                height: 36
                model: ["Create", "Delete"]
                font.letterSpacing: 0
                currentIndex: 0
                textRole: ""
                font.pointSize: 10
                displayText: "  Action"
            }
        }

        Text {
            id: ingredient
            width: 127
            height: 25
            color: "#000000"
            text: qsTr("Ingredient")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 49
            anchors.topMargin: 16
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Text {
            id: current
            width: 127
            height: 25
            color: "#000000"
            text: qsTr("Action")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1101
            anchors.topMargin: 16
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.bold: false
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Text {
            id: ingredient_text
            objectName: "ingredient_text"
            width: 127
            height: 34
            color: "#000000"
            text: qsTr("Milk")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 49
            anchors.topMargin: 61
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: status_text
            objectName: "status_text"
            width: 127
            height: 34
            color: "#000000"
            text: qsTr("108")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 854
            anchors.topMargin: 61
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Shape {
            id: line_6_Stroke_
            width: 1210
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 34
            anchors.topMargin: 50
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_6_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_6_Stroke__PathSvg_0
                    path: "M 1210 3.518070741392876e-7 L 1210 1.0000003576278687 L 0 1 L 2.907469820456754e-10 0 L 1210 3.518070741392876e-7 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Shape {
            id: line_7_Stroke_
            width: 1210
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 34
            anchors.topMargin: 106
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_7_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_7_Stroke__PathSvg_0
                    path: "M 1210 4.797369115294714e-7 L 1210 1.0000004768371582 L 0 1 L 2.1321966414689086e-10 0 L 1210 4.797369115294714e-7 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Shape {
            id: line_8_Stroke_
            width: 1210
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 34
            anchors.topMargin: 162
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_8_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_8_Stroke__PathSvg_0
                    path: "M 1210 4.797369115294714e-7 L 1210 1.0000004768371582 L 0 1 L 2.1321966414689086e-10 0 L 1210 4.797369115294714e-7 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Text {
            id: quantity
            width: 127
            height: 25
            color: "#000000"
            text: qsTr("Quantity")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 307
            anchors.topMargin: 16
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Text {
            id: measurement_text
            objectName: "measurement_text"
            width: 127
            height: 34
            color: "#020202"
            text: qsTr("123")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 552
            anchors.topMargin: 61
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Shape {
            id: line_9_Stroke_
            width: 1210
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 34
            anchors.topMargin: 218
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_9_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_9_Stroke__PathSvg_0
                    path: "M 1210 3.518070741392876e-7 L 1210 1.0000003576278687 L 0 1 L 2.907469820456754e-10 0 L 1210 3.518070741392876e-7 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Text {
            id: quantity1
            width: 187
            height: 25
            color: "#000000"
            text: qsTr("Measurement")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 522
            anchors.topMargin: 16
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Text {
            id: quantity_text
            objectName: "quantity_text"
            width: 127
            height: 34
            color: "#020202"
            text: qsTr("123")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 307
            anchors.topMargin: 61
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Inter"
        }

        Text {
            id: quantity2
            width: 187
            height: 25
            color: "#000000"
            text: qsTr("Status")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 818
            anchors.topMargin: 16
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }
    }

    Item {
        id: group_15
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 129
        anchors.rightMargin: 33
        anchors.topMargin: 154
        anchors.bottomMargin: 754
        Rectangle {
            id: addIngredients
            width: 1278
            height: 116
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top

            Rectangle {
                id: rectangle2
                x: 783
                y: 61
                width: 101
                height: 38
                color: "#ffffff"
                radius: 12
                border.color: "#919191"
            }

            Rectangle {
                id: rectangle1
                x: 539
                y: 61
                width: 200
                height: 38
                color: "#ffffff"
                radius: 12
                border.color: "#919191"
            }

            Rectangle {
                id: rectangle
                x: 293
                y: 61
                width: 200
                height: 38
                color: "#ffffff"
                radius: 12
                border.color: "#919191"

                TextInput {
                    x: 8
                    y: 5
                    width: 179
                    height: 28
                    text: qsTr("")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    selectionColor: "#4e2d18"
                    font.family: "Inter 18pt 18pt"
                    objectName: "ingredientname_input"
                    id: ingredientname_input
                }

                TextInput {
                    id: amountinstock_input
                    x: 255
                    y: 5
                    width: 179
                    height: 28
                    text: qsTr("")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    selectionColor: "#4e2d18"
                    font.family: "Inter 18pt 18pt"
                    objectName: "amountinstock_input"
                }

                TextInput {
                    id: cost_input
                    x: 500
                    y: 5
                    width: 82
                    height: 28
                    text: qsTr("")
                    font.pixelSize: 12
                    verticalAlignment: Text.AlignVCenter
                    selectionColor: "#4e2d18"
                    font.family: "Inter 18pt 18pt"
                    objectName: "cost_input"
                }
            }

            Text {
                id: text1
                x: 293
                y: 45
                color: "#2e2e2e"
                text: qsTr("Ingredient Name")
                font.pixelSize: 10
                font.family: "Inter 18pt 18pt"
            }

            Text {
                id: text2
                x: 539
                y: 45
                color: "#2e2e2e"
                text: qsTr("Amount In Stock")
                font.pixelSize: 10
                font.family: "Inter 18pt 18pt"
            }

            Text {
                id: text3
                x: 793
                y: 45
                color: "#2e2e2e"
                text: qsTr("Cost")
                font.pixelSize: 10
                font.family: "Inter 18pt 18pt"
            }

            Rectangle {
                id: rectangle3
                x: 917
                y: 61
                width: 42
                height: 38
                color: "#ffffff"
                radius: 60
                border.color: "#919191"

                Button {
                    id: createingredients_button
                    x: 0
                    y: 0
                    width: 42
                    height: 38
                    opacity: 1
                    hoverEnabled: true
                    text: qsTr("+")
                    leftPadding: 5
                    topPadding: -4
                    font.pointSize: 27
                    display: AbstractButton.TextOnly
                    objectName: "createingredients_button"
                    background: Rectangle {
                        color: "transparent"
                    }
                    onClicked: mainWindow.createIngredientsClicked()
                }
            }
        }

        Text {
            id: create_Ingredient
            width: 277
            height: 24
            color: "#000000"
            text: qsTr("Create Ingredient")
            anchors.top: parent.top
            anchors.topMargin: 8
            font.letterSpacing: 1
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Bold
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"4fa88c5b-ac5d-5c98-b1da-fdec66fb40a2"}
}
##^##*/

