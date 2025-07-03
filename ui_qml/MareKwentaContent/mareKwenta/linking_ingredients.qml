import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Item {
    id: inventory_Management_Ingredients_Linking
    width: 1440
    height: 1024
    visible: true
    property alias inventoryText: inventory.text
    property alias hello_UserText: hello_User.text
    property alias link_IngredientsText: link_Ingredients.text

    Rectangle{
        id: rectangle
        anchors.fill: parent
        color: "#f2efea"
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
            y: 84
            width: 313
            height: 55
            color: "#4e2d18"
            text: qsTr("Link Ingredients")
            font.letterSpacing: 1.188
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.horizontalCenterOffset: 211
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
            font.weight: Font.Bold
            font.family: "Unbounded"
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



        Rectangle {
            id: separator
            y: 117
            width: 260
            height: 3
            color: "#4e2d18"
            border.color: "#4e2d18"
            anchors.horizontalCenterOffset: 184
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"11fe2170-e09e-54ed-83d2-a8bb4606d8dd"}
}
##^##*/

