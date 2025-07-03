import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Item {
    id: inventory_Management_Entry
    width: 1240
    height: 1024
    visible: true
    property alias create_IngredientText: create_Ingredient.text
    property alias ingredientText: ingredient.text
    property alias inventoryText: inventory.text
    property alias quantityText: quantity.text
    property alias hello_UserText: hello_User.text
    property alias currentText: current.text
    property alias element6Text: measurement_text.text
    property alias link_IngredientsText: link_Ingredients.text
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
            anchors.horizontalCenterOffset: -172
            anchors.horizontalCenter: parent.horizontalCenter
            signal navigateToInventoryLinking
            y: 94
        }


        Text {
            id: link_Ingredients
            x: 699
            y: 94
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
            anchors.leftMargin: 66
            anchors.topMargin: 30
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
                anchors.fill: parent
                anchors.leftMargin: -34
                anchors.rightMargin: 34
                anchors.topMargin: -16
                anchors.bottomMargin: 16
                anchors.horizontalCenterOffset: -34
                color: "#ffffff"
                radius: 16
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: ingredient
                    y: 21
                    width: 127
                    height: 25
                    color: "#000000"
                    text: qsTr("Ingredient")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    anchors.horizontalCenterOffset: -426
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.Medium
                    font.family: "Unbounded"
                }

                Text {
                    id: current
                    y: 21
                    width: 127
                    height: 25
                    color: "#000000"
                    text: qsTr("Action")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    anchors.horizontalCenterOffset: 408
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: false
                    font.weight: Font.Medium
                    font.family: "Unbounded"
                }

                Text {
                    id: ingredient_text
                    y: 89
                    objectName: "ingredient_text"
                    width: 127
                    height: 34
                    color: "#000000"
                    text: qsTr("Milk")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    anchors.horizontalCenterOffset: -426
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.Light
                    font.family: "Inter"
                }

                Text {
                    id: status_text
                    y: 89
                    objectName: "status_text"
                    width: 127
                    height: 34
                    color: "#0a8a06"
                    text: qsTr("In Stock")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    font.bold: true
                    anchors.horizontalCenterOffset: 215
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.Light
                    font.family: "Inter"
                }

                Text {
                    id: quantity
                    y: 21
                    width: 127
                    height: 25
                    color: "#000000"
                    text: qsTr("Quantity")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    anchors.horizontalCenterOffset: -249
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.Medium
                    font.family: "Unbounded"
                }

                Text {
                    id: measurement_text
                    y: 89
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
                    y: 21
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
                    y: 89
                    objectName: "quantity_text"
                    width: 127
                    height: 34
                    color: "#020202"
                    text: qsTr("123")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    anchors.horizontalCenterOffset: -249
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.Light
                    font.family: "Inter"
                }

                Text {
                    id: quantity2
                    y: 23
                    width: 187
                    height: 25
                    color: "#000000"
                    text: qsTr("Status")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.Wrap
                    anchors.horizontalCenterOffset: 215
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.weight: Font.Medium
                    font.family: "Unbounded"
                }
                ComboBox {
                    id: action_combobox
                    y: 89
                    width: 138
                    height: 36
                    model: ["Edit", "Delete"]
                    font.letterSpacing: 0
                    anchors.horizontalCenterOffset: 408
                    anchors.horizontalCenter: parent.horizontalCenter
                    currentIndex: 0
                    textRole: ""
                    font.pointSize: 10
                    displayText: "  Action"
                }
            }

            Rectangle {
                id: separatorrow
                y: 46
                width: 1041
                height: 1
                opacity: 0.5
                color: "#4e2d18"
                border.color: "#4e2d18"
                anchors.horizontalCenterOffset: -33
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                id: separatorrow1
                y: 127
                width: 1041
                height: 1
                opacity: 0.5
                color: "#4e2d18"
                border.color: "#4e2d18"
                anchors.horizontalCenterOffset: -33
                anchors.horizontalCenter: parent.horizontalCenter
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
                y: 0
                width: 1062
                height: 116
                color: "#ffffff"
                radius: 16
                anchors.horizontalCenterOffset: -35
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: login_button
                    x: 848
                    y: 60
                    width: 92
                    height: 43
                    font.bold: true
                    font.pointSize: 13
                    font.family: "Inter 18pt 18pt"
                    display: AbstractButton.TextOnly

                    background: Rectangle {
                        color: "#4e2d18"
                        radius: 8
                        border.width: 1
                        border.color: "#4e2d18"
                    }

                    contentItem: Text {
                        color: "#f2efea"
                        text: "Save"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.styleName: "Medium"
                        font.pointSize: 11
                        font.family: "Inter 18pt 18pt"
                    }
                    onClicked: mainWindow.login_clicked()
                }
                Rectangle {
                    id: rectangle2
                    x: 524
                    y: 64
                    width: 101
                    height: 38
                    color: "#ffffff"
                    radius: 12
                    border.color: "#919191"
                }

                Rectangle {
                    id: rectangle1
                    x: 298
                    y: 64
                    width: 200
                    height: 38
                    color: "#ffffff"
                    radius: 12
                    border.color: "#919191"
                }

                Rectangle {
                    id: rectangle
                    x: 64
                    y: 64
                    width: 200
                    height: 38
                    color: "#ffffff"
                    radius: 12
                    border.color: "#919191"

                    TextInput {
                        x: 7
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
                        x: 245
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
                        x: 469
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
                    x: 65
                    y: 45
                    color: "#2e2e2e"
                    text: qsTr("Ingredient Name")
                    font.pixelSize: 10
                    font.family: "Inter 18pt 18pt"
                }

                Text {
                    id: text2
                    x: 300
                    y: 45
                    color: "#2e2e2e"
                    text: qsTr("Amount In Stock")
                    font.pixelSize: 10
                    font.family: "Inter 18pt 18pt"
                }

                Text {
                    id: text3
                    x: 524
                    y: 45
                    color: "#2e2e2e"
                    text: qsTr("Cost")
                    font.pixelSize: 10
                    font.family: "Inter 18pt 18pt"
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
                    y: 63
                    width: 158
                    height: 36
                    font.letterSpacing: 0
                    anchors.horizontalCenterOffset: 217
                    anchors.horizontalCenter: parent.horizontalCenter
                    textRole: ""
                    model: ["ml", "grams", "oz", "pcs"]
                    font.pointSize: 10
                    displayText: "  Measurement"
                    currentIndex: 0
                }
            }

        }

        Rectangle {
            id: separator
            y: 124
            width: 163
            height: 3
            color: "#4e2d18"
            border.color: "#4e2d18"
            anchors.horizontalCenterOffset: -174
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"4fa88c5b-ac5d-5c98-b1da-fdec66fb40a2"}D{i:19}
}
##^##*/

