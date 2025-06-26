import QtQuick
import QtQuick.Controls

Button {
    id: root
    objectName: "product_button_root"

    property string product_name: "Product Name"
    property url product_image_source: ""
    property string product_type: ""

    width: 173
    height: 213

    // --- Button Background Styling ---
    background: Rectangle {
        id: buttonBackgroundRect
        width: parent.width
        height: parent.height
        radius: 16
        color: root.pressed ? "#F0F0F0" : "#ffffff"
        border.color: root.pressed ? "#CCCCCC" : "#E0E0E0" 
        border.width: 1
    }

    // --- Button Content Item (Image and Text) ---
    contentItem: Item {
        id: buttonContentContainer
        anchors.fill: parent

        // Image Section

            Image {
                id: productImage
                source: product_image_source
                anchors.verticalCenterOffset: -14
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                width: parent.width * 0.9
                height: parent.height * 0.7
                fillMode: Image.PreserveAspectFit
                smooth: true
                layer.enabled: true
            }
        }


        // Text Section
        Text {
            id: productNameText
            
            anchors.horizontalCenter: parent.horizontalCenter
            y: 170 

            width: parent.width - 20 
            height: 40
            color: "#4e2d18"
            text: product_name
            font.pixelSize: 15
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft 
            wrapMode: Text.Wrap
            font.weight: Font.Bold
            font.family: "Poppins" 
        }

    }



