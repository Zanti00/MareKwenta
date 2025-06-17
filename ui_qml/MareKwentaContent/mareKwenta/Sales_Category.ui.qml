import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: sales_Category
    width: 302
    height: 164
    color: "transparent"
    property alias sales_by_CategoryText: sales_by_Category.text
    property alias sales_SummaryText: sales_Summary.text
    property alias sales_by_ProductsText: sales_by_Products.text

    Image {
        id: rectangle_47
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -4
        anchors.rightMargin: -4
        anchors.topMargin: 11
        anchors.bottomMargin: 12
        source: "assets/rectangle_47_3.png"
    }

    Text {
        id: sales_by_Products
        color: "#4d2d18"
        text: qsTr("Sales by Products")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 23
        anchors.rightMargin: 99
        anchors.topMargin: 95
        anchors.bottomMargin: 39
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "Poppins"
    }

    Text {
        id: sales_Summary
        color: "#4d2d18"
        text: qsTr("Sales Summary")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 23
        anchors.rightMargin: 94
        anchors.topMargin: 24
        anchors.bottomMargin: 112
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "Poppins"
    }

    Text {
        id: sales_by_Category
        color: "#4d2d18"
        text: qsTr("Sales by Category")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 23
        anchors.rightMargin: 94
        anchors.topMargin: 61
        anchors.bottomMargin: 73
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "Poppins"
    }

    Shape {
        id: line_11_Stroke_
        opacity: 0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 23
        anchors.rightMargin: 29
        anchors.topMargin: 94
        anchors.bottomMargin: 69
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_11_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_11_Stroke__PathSvg_0
                path: "M 250 0 L 250 0.7998046875 L 0 0.7998046875 L 0 0 L 250 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_12_Stroke_
        opacity: 0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 23
        anchors.rightMargin: 29
        anchors.topMargin: 57
        anchors.bottomMargin: 106
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_12_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_12_Stroke__PathSvg_0
                path: "M 250 0 L 250 0.7998046875 L 0 0.7998046875 L 0 0 L 250 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"1fc28791-d3a7-584d-b563-7d6d8257ecd4"}D{i:1;uuid:"7e13a196-704a-5523-8646-b89c4c0d6f6d"}
D{i:2;uuid:"0896bf97-0aff-53db-8aad-fa293a5111ff"}D{i:3;uuid:"3916832c-6ffa-5342-bd54-e9310a946484"}
D{i:4;uuid:"21fbe8d8-b33c-561d-9a1b-df8d9e1d79c1"}D{i:5;uuid:"563e7ea9-f2ba-573b-beae-880b11def07f"}
D{i:6;uuid:"563e7ea9-f2ba-573b-beae-880b11def07f_ShapePath_0"}D{i:7;uuid:"563e7ea9-f2ba-573b-beae-880b11def07f-PathSvg_0"}
D{i:8;uuid:"41414c9d-53d9-5430-b57f-f4c94ab8afa8"}D{i:9;uuid:"41414c9d-53d9-5430-b57f-f4c94ab8afa8_ShapePath_0"}
D{i:10;uuid:"41414c9d-53d9-5430-b57f-f4c94ab8afa8-PathSvg_0"}
}
##^##*/

