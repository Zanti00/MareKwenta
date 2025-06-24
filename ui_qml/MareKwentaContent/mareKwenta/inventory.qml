import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Item {
    id: inventory_Management_Entry
    width: 1440
    height: 1024
    visible: true
    property alias create_IngredientText: create_Ingredient.text
    property alias ingredientText: ingredient.text
    property alias logs1Text: logs1.text
    property alias inventoryText: inventory.text
    property alias quantityText: quantity.text
    property alias hello_UserText: hello_User.text
    property alias currentText: current.text
    property alias element6Text: measurement_text.text
    property alias link_IngredientsText: link_Ingredients.text
    property alias mK1Text: mK1.text
    property alias element3Text: status_text.text
    property alias milkText: ingredient_text.text

    Rectangle{
        id: rectangle10
        anchors.fill: parent
        color: "#f2efea"
        Text {
            id: inventory
            width: 167
            height: 30
            color: "#4e2d18"
            text: qsTr("Inventory")
            font.letterSpacing: 1.188
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.styleName: "Bold"
            font.underline: false
            font.weight: Font.Bold
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: -120
            anchors.horizontalCenter: parent.horizontalCenter
            signal navigateToInventoryLinking
            y: 81
        }


        Text {
            id: link_Ingredients
            x: 766
            y: 81
            width: 277
            height: 55
            color: "#4e2d18"
            text: qsTr("Link Ingredients")
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
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true

                onClicked: {
                    console.log("Link clicked - calling navigation function")
                    navHandler.linkIngredientsClicked()
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
                anchors.horizontalCenter: parent.horizontalCenter

                ComboBox {
                    id: action_combobox
                    y: 70
                    width: 114
                    height: 36
                    model: ["Edit", "Delete"]
                    font.letterSpacing: 0
                    anchors.horizontalCenterOffset: 519
                    anchors.horizontalCenter: parent.horizontalCenter
                    currentIndex: 0
                    textRole: ""
                    font.pointSize: 10
                    displayText: "  Action"
                }
            }

            Text {
                id: ingredient
                y: 16
                width: 127
                height: 25
                color: "#000000"
                text: qsTr("Ingredient")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: -549
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Text {
                id: current
                y: 16
                width: 127
                height: 25
                color: "#000000"
                text: qsTr("Action")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: 510
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: false
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Text {
                id: ingredient_text
                y: 74
                objectName: "ingredient_text"
                width: 127
                height: 34
                color: "#000000"
                text: qsTr("Milk")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: -530
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Light
                font.family: "Inter"
            }

            Text {
                id: status_text
                y: 74
                objectName: "status_text"
                width: 127
                height: 34
                color: "#000000"
                text: qsTr("108")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: 279
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Light
                font.family: "Inter"
            }

            Shape {
                id: line_6_Stroke_
                y: 54
                width: 1210
                height: 1
                anchors.horizontalCenterOffset: -8
                anchors.horizontalCenter: parent.horizontalCenter
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
                y: 114
                width: 1210
                height: 1
                anchors.horizontalCenterOffset: -8
                anchors.horizontalCenter: parent.horizontalCenter
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


            Text {
                id: quantity
                y: 16
                width: 127
                height: 25
                color: "#000000"
                text: qsTr("Quantity")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: -268
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Text {
                id: measurement_text
                y: 74
                objectName: "measurement_text"
                width: 127
                height: 34
                color: "#020202"
                text: qsTr("123")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: -23
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Light
                font.family: "Inter"
            }

            Text {
                id: quantity1
                y: 16
                width: 187
                height: 25
                color: "#000000"
                text: qsTr("Measurement")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: -23
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Text {
                id: quantity_text
                y: 74
                objectName: "quantity_text"
                width: 127
                height: 34
                color: "#020202"
                text: qsTr("123")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: -268
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Light
                font.family: "Inter"
            }

            Text {
                id: quantity2
                y: 16
                width: 187
                height: 25
                color: "#000000"
                text: qsTr("Status")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                anchors.horizontalCenterOffset: 279
                anchors.horizontalCenter: parent.horizontalCenter
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
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    id: rectangle2
                    x: 684
                    y: 61
                    width: 101
                    height: 38
                    color: "#ffffff"
                    radius: 12
                    border.color: "#919191"
                }

                Rectangle {
                    id: rectangle1
                    x: 459
                    y: 61
                    width: 200
                    height: 38
                    color: "#ffffff"
                    radius: 12
                    border.color: "#919191"
                }

                Rectangle {
                    id: rectangle
                    x: 239
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
                        x: 232
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
                        x: 454
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
                    x: 245
                    y: 45
                    color: "#2e2e2e"
                    text: qsTr("Ingredient Name")
                    font.pixelSize: 10
                    font.family: "Inter 18pt 18pt"
                }

                Text {
                    id: text2
                    x: 471
                    y: 45
                    color: "#2e2e2e"
                    text: qsTr("Amount In Stock")
                    font.pixelSize: 10
                    font.family: "Inter 18pt 18pt"
                }

                Text {
                    id: text3
                    x: 697
                    y: 45
                    color: "#2e2e2e"
                    text: qsTr("Cost")
                    font.pixelSize: 10
                    font.family: "Inter 18pt 18pt"
                }

                Rectangle {
                    id: rectangle3
                    x: 949
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
                        onClicked: navHandler.createIngredientsClicked()
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

            ComboBox {
                id: action_combobox1
                y: 61
                width: 114
                height: 36
                font.letterSpacing: 0
                anchors.horizontalCenterOffset: 238
                anchors.horizontalCenter: parent.horizontalCenter
                textRole: ""
                model: ["ml", "grams", "oz", "pcs"]
                font.pointSize: 10
                displayText: "  Measurement"
                currentIndex: 0
            }
        }

        Rectangle {
            id: separator
            y: 117
            width: 163
            height: 3
            color: "#4e2d18"
            border.color: "#4e2d18"
            anchors.horizontalCenterOffset: -120
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"4fa88c5b-ac5d-5c98-b1da-fdec66fb40a2"}
}
##^##*/

