import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15
import QtQuick.Studio.Components 1.0

Rectangle {
    id: dashboard_Sales_by_Product
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias redText: red.text
    property alias all_dayText: all_day.text
    property alias element1Text: element1.text
    property alias all_EmployeesText: all_Employees.text
    property alias product_3Text: product_3.text
    property alias receiptsText: receipts.text
    property alias mKText: mK.text
    property alias inventoryText: inventory.text
    property alias product_4Text: product_4.text
    property alias net_SalesText: net_Sales.text
    property alias cash_BoxText: cash_Box.text
    property alias logsText: logs.text
    property alias dash_boardText: dash_board.text
    property alias minkText: mink.text
    property alias greenText: green.text
    property alias sales_by_Product_ChartText: sales_by_Product_Chart.text
    property alias product_2Text: product_2.text
    property alias porpolText: porpol.text
    property alias product_5Text: product_5.text
    property alias elementText: element.text
    property alias dashboardText: dashboard.text
    property alias product_1Text: product_1.text
    property alias element2Text: element2.text
    property alias element5Text: element5.text
    property alias staffText: staff.text
    property alias ticketText: ticket.text
    property alias blueText: blue.text
    property alias sales_by_ProductsText: sales_by_Products.text
    property alias element3Text: element3.text
    property alias top_5_ProductsText: top_5_Products.text
    property alias element4Text: element4.text

    Text {
        id: dashboard
        width: 208
        height: 54
        color: "#4e2d18"
        text: qsTr("Dashboard")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 33
        font.pixelSize: 36
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Poppins"
    }

    Item {
        id: table
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 142
        anchors.rightMargin: 865
        anchors.topMargin: 208
        anchors.bottomMargin: 417
        Image {
            id: rectangle_46
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            source: "assets/rectangle_46.png"
        }

        Text {
            id: top_5_Products
            width: 166
            height: 24
            color: "#4e2d18"
            text: qsTr("Top 5 Products")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 23
            anchors.topMargin: 23
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: product_1
            width: 111
            height: 24
            color: "#4e2d18"
            text: qsTr("Product 1")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 77
            anchors.topMargin: 82
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element
            width: 58
            height: 24
            color: "#4e2d18"
            text: qsTr("₱170.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 272
            anchors.topMargin: 82
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_11_Stroke_
            width: 300
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 123
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_11_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_11_Stroke__PathSvg_0
                    path: "M 300 0 L 300 0.7998046875 L 0 0.7998046875 L 0 0 L 300 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: product_2
            width: 111
            height: 24
            color: "#4e2d18"
            text: qsTr("Product 2")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 77
            anchors.topMargin: 143
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element1
            width: 64
            height: 24
            color: "#4e2d18"
            text: qsTr("₱500.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 272
            anchors.topMargin: 143
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_11_Stroke_1
            width: 300
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 183
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_11_Stroke__ShapePath_1
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_11_Stroke__PathSvg_1
                    path: "M 300 0 L 300 0.7998046875 L 0 0.7998046875 L 0 0 L 300 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: product_3
            width: 111
            height: 24
            color: "#4e2d18"
            text: qsTr("Product 3")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 78
            anchors.topMargin: 205
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element2
            width: 54
            height: 24
            color: "#4e2d18"
            text: qsTr("₱30.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 273
            anchors.topMargin: 205
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_12_Stroke_
            width: 300
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 245
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_12_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_12_Stroke__PathSvg_0
                    path: "M 300 0 L 300 0.7998046875 L 0 0.7998046875 L 0 0 L 300 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: product_4
            width: 111
            height: 24
            color: "#4e2d18"
            text: qsTr("Product 4")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 78
            anchors.topMargin: 268
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element3
            width: 58
            height: 24
            color: "#4e2d18"
            text: qsTr("₱170.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 273
            anchors.topMargin: 268
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_11_Stroke_2
            width: 300
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 308
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_11_Stroke__ShapePath_2
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_11_Stroke__PathSvg_2
                    path: "M 300 0 L 300 0.7998046875 L 0 0.7998046875 L 0 0 L 300 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: product_5
            width: 111
            height: 24
            color: "#4e2d18"
            text: qsTr("Product 5")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 78
            anchors.topMargin: 331
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element4
            width: 64
            height: 24
            color: "#4e2d18"
            text: qsTr("₱500.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 273
            anchors.topMargin: 331
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: net_Sales
            width: 166
            height: 21
            color: "#4e2d18"
            text: qsTr("Net Sales")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 268
            anchors.topMargin: 26
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Poppins"
        }

        ArcItem {
            id: ellipse_4
            width: 24
            height: 23
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 83
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#e96969"
            end: 450.00001
            begin: 90
            arcWidth: 12
            antialiasing: true
        }

        ArcItem {
            id: ellipse_5
            width: 24
            height: 23
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 32
            anchors.topMargin: 144
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#5fa8da"
            end: 450.00001
            begin: 90
            arcWidth: 12
            antialiasing: true
        }

        ArcItem {
            id: ellipse_6
            width: 24
            height: 23
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 33
            anchors.topMargin: 206
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#7ed894"
            end: 450.00001
            begin: 90
            arcWidth: 12
            antialiasing: true
        }

        ArcItem {
            id: ellipse_7
            width: 24
            height: 23
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 33
            anchors.topMargin: 269
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#e96969"
            end: 450.00001
            begin: 90
            arcWidth: 12
            antialiasing: true
        }

        ArcItem {
            id: ellipse_8
            width: 24
            height: 23
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 33
            anchors.topMargin: 332
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#5fa8da"
            end: 450.00001
            begin: 90
            arcWidth: 12
            antialiasing: true
        }
    }

    Item {
        id: filters
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 142
        anchors.rightMargin: 141
        anchors.topMargin: 121
        anchors.bottomMargin: 853
        Image {
            id: rectangle_47
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            source: "assets/rectangle_47.png"
        }

        Text {
            id: sales_by_Products
            width: 180
            height: 30
            color: "#4d2d18"
            text: qsTr("Sales by Products")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 23
            anchors.topMargin: 10
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Chevron_down {
            id: chevron_down
            width: 24
            height: 24
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 254
            anchors.topMargin: 13
            state: "size_16"
            clip: true
        }

        Image {
            id: rectangle_48
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 323
            source: "assets/rectangle_48.png"
        }

        Text {
            id: all_day
            width: 70
            height: 30
            color: "#4d2d18"
            text: qsTr("All day")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 350
            anchors.topMargin: 10
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Chevron_down {
            id: chevron_down1
            width: 24
            height: 24
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 486
            anchors.topMargin: 13
            state: "size_16"
            clip: true
        }

        Image {
            id: rectangle_49
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 556
            anchors.topMargin: 1
            source: "assets/rectangle_49.png"
        }

        Text {
            id: all_Employees
            width: 141
            height: 30
            color: "#4d2d18"
            text: qsTr("All Employees")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 583
            anchors.topMargin: 11
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Chevron_down {
            id: chevron_down2
            width: 24
            height: 24
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 796
            anchors.topMargin: 14
            state: "size_16"
            clip: true
        }

        Image {
            id: rectangle_51
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 870
            anchors.topMargin: 2
            source: "assets/rectangle_51.png"
        }

        Text {
            id: element5
            width: 49
            height: 30
            color: "#4d2d18"
            text: qsTr("Date")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 897
            anchors.topMargin: 12
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Chevron_down {
            id: chevron_down3
            width: 24
            height: 24
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1110
            anchors.topMargin: 15
            state: "size_16"
            clip: true
        }
    }

    Item {
        id: piechart
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 536
        anchors.rightMargin: 53
        anchors.topMargin: 205
        anchors.bottomMargin: 54
        Image {
            id: rectangle_50
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            source: "assets/rectangle_50.png"
        }

        Text {
            id: sales_by_Product_Chart
            width: 223
            height: 24
            color: "#4e2d18"
            text: qsTr("Sales by Product Chart")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 21
            anchors.topMargin: 26
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        ArcItem {
            id: ellipse_9
            width: 444
            height: 433
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 226
            anchors.topMargin: 144
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#d9d9d9"
            end: 450.00001
            begin: 90
            arcWidth: 222
            antialiasing: true
        }

        Text {
            id: red
            width: 29
            height: 24
            color: "#000000"
            text: qsTr("red")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 478
            anchors.topMargin: 193
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: mink
            width: 43
            height: 24
            color: "#000000"
            text: qsTr("mink")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 509
            anchors.topMargin: 331
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: green
            width: 49
            height: 24
            color: "#000000"
            text: qsTr("green")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 505
            anchors.topMargin: 484
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: blue
            width: 37
            height: 24
            color: "#000000"
            text: qsTr("blue")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 345
            anchors.topMargin: 434
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: porpol
            width: 55
            height: 24
            color: "#000000"
            text: qsTr("porpol")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 319
            anchors.topMargin: 244
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Shape {
            id: line_13_Stroke_
            width: 442
            height: 2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 228
            anchors.topMargin: 353
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_13_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_13_Stroke__PathSvg_0
                    path: "M 441.9998474121094 0 L 442.0021057128906 0.9999974370002747 L 0.002262437716126442 1.9999971389770508 L 0 0.9999997019767761 L 441.9998474121094 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Shape {
            id: line_14_Stroke_
            width: 103
            height: 181
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 449
            anchors.topMargin: 172
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_14_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_14_Stroke__PathSvg_0
                    path: "M 101.99992370605469 0 L 102.87110900878906 0.4909466505050659 L 0.8711896538734436 181.4907989501953 L 0 180.99986267089844 L 101.99992370605469 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Shape {
            id: line_15_Stroke_
            width: 4
            height: 434
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 448
            anchors.topMargin: 143
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_15_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_15_Stroke__PathSvg_0
                    path: "M 0.9999768733978271 434.00750732421875 L 0 434.0007019042969 L 2.952385663986206 0 L 3.952362537384033 0.006802563555538654 L 0.9999768733978271 434.00750732421875 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }
    }

    Item {
        id: nav
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
            source: "assets/rectangle_14_10.png"
        }

        Image {
            id: rectangle_44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_44_6.png"
        }

        Rectangle {
            id: rectangle_43
            width: 83
            height: 97
            color: "#424d2d18"
            radius: 12
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 8
            anchors.topMargin: 680
        }

        Text {
            id: dash_board
            width: 103
            height: 34
            color: "#4d2d18"
            text: qsTr("Dash\nboard")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 722
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Item {
            id: group_116
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

        Item {
            id: group_112
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 6
            anchors.rightMargin: 5
            anchors.topMargin: 144
            anchors.bottomMargin: 815
            Text {
                id: inventory
                width: 92
                height: 26
                color: "#4d2d18"
                text: qsTr("Inventory")
                anchors.top: parent.top
                anchors.topMargin: 39
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
                anchors.horizontalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Archive {
                id: archive
                width: 29
                height: 30
                anchors.top: parent.top
                state: "size_48"
                clip: true
                anchors.horizontalCenterOffset: -1
                anchors.horizontalCenter: parent.horizontalCenter
            }
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

        Item {
            id: group_114
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
                id: element6
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
            id: group_115
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
            id: group_113
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
    D{i:0;uuid:"e8d7d43e-f292-5aa9-88fb-92409c69721a"}D{i:1;uuid:"ff4ce387-cb48-5f7a-9f5e-3bfd4c296074"}
D{i:2;uuid:"a0012e1c-03f8-539d-afb7-37e2f80f4444"}D{i:3;uuid:"d7de8129-3d90-59ea-ab8c-2c15abc358bc"}
D{i:4;uuid:"3817dcd2-92cf-572c-84a4-e870add85960"}D{i:5;uuid:"59bbacc6-57c7-5c26-a443-bd958f1d5422"}
D{i:6;uuid:"a875b987-432f-5c1f-bb0a-2424114135af"}D{i:7;uuid:"8cd87d77-28d5-50ae-a38c-7a884d67daac"}
D{i:8;uuid:"8cd87d77-28d5-50ae-a38c-7a884d67daac_ShapePath_0"}D{i:9;uuid:"8cd87d77-28d5-50ae-a38c-7a884d67daac-PathSvg_0"}
D{i:10;uuid:"66114e6c-e89c-5de2-8c17-0dfa34a55430"}D{i:11;uuid:"8d5bd65f-3805-57a0-be40-3b423a933597"}
D{i:12;uuid:"40d3d5e4-d453-5655-9837-05eb5853e044"}D{i:13;uuid:"40d3d5e4-d453-5655-9837-05eb5853e044_ShapePath_0"}
D{i:14;uuid:"40d3d5e4-d453-5655-9837-05eb5853e044-PathSvg_0"}D{i:15;uuid:"efe07c1b-0261-5def-aaee-1876d4358862"}
D{i:16;uuid:"c5c1cf7e-a223-5617-814d-7baede0e34f0"}D{i:17;uuid:"04f9ba7b-293e-56cb-930c-9d2e5087d195"}
D{i:18;uuid:"04f9ba7b-293e-56cb-930c-9d2e5087d195_ShapePath_0"}D{i:19;uuid:"04f9ba7b-293e-56cb-930c-9d2e5087d195-PathSvg_0"}
D{i:20;uuid:"3a3e3582-86b7-5f12-a21c-02ec1f564b56"}D{i:21;uuid:"3df2c4ca-5376-5d0b-84ed-6a1c04bc045e"}
D{i:22;uuid:"32457ed0-7f6a-534d-9f4e-e22212eae847"}D{i:23;uuid:"32457ed0-7f6a-534d-9f4e-e22212eae847_ShapePath_0"}
D{i:24;uuid:"32457ed0-7f6a-534d-9f4e-e22212eae847-PathSvg_0"}D{i:25;uuid:"6ec8e20e-a5f6-547d-8938-6d2050017320"}
D{i:26;uuid:"41fbc41b-6079-55a4-9b08-e3735704282a"}D{i:27;uuid:"a35cf58b-6127-5b06-aba8-c142aa884727"}
D{i:28;uuid:"9dbff252-2153-563b-b897-11ed6db83a14"}D{i:29;uuid:"8e2758da-3bfb-57a5-807c-2a68c576cd26"}
D{i:30;uuid:"e6c92b2b-d8b3-56ca-ae9c-354a853ba51d"}D{i:31;uuid:"b0c7e262-6453-538e-b2b5-f774692ae416"}
D{i:32;uuid:"06818107-7258-5c8b-8ab7-718ada656792"}D{i:33;uuid:"1ba5b0e3-a3b2-5b86-b922-a6f87b87fe69"}
D{i:34;uuid:"2e6cdb2f-b0e9-5113-b690-6ed18a562c23"}D{i:35;uuid:"eb461619-c8cf-52da-a97c-f2844ee49735"}
D{i:36;uuid:"30185eeb-5f95-53bb-a1d5-f11a2bd66b91"}D{i:37;uuid:"2d9a0f30-a06d-54ba-9e68-119f8bd67656"}
D{i:38;uuid:"f7d47a10-b8a1-5e5d-80c5-d61a113b226a"}D{i:39;uuid:"695a3ead-442b-59c5-b067-8c726e6d14f8"}
D{i:40;uuid:"847cc781-2157-5220-9565-744a74a7537c"}D{i:41;uuid:"df10f117-d569-5aee-a406-922f5a462b17"}
D{i:42;uuid:"a352e9ff-a4e6-5145-a9cf-0744c1070e00"}D{i:43;uuid:"aa814aaf-bb82-5aa8-8441-70af3580d51c"}
D{i:44;uuid:"906a1184-93bc-5c88-8560-ec0dc2e1b9bd"}D{i:45;uuid:"1bd314a1-b62f-535c-bf1e-0bf680fe3a0b"}
D{i:46;uuid:"ed950f3e-90e1-532a-9caf-de8c636c0b97"}D{i:47;uuid:"140d155f-c8ec-5f10-bc22-439b2a37f343"}
D{i:48;uuid:"d7958203-01ad-5259-a5eb-8823a55d0360"}D{i:49;uuid:"cb0f455c-e6ac-5439-a369-8283a19753d7"}
D{i:50;uuid:"6bbf6283-a442-59a3-8833-3d29f79850c7"}D{i:51;uuid:"8f724220-4010-5bb6-8260-a8e8ca6875f7"}
D{i:52;uuid:"c710e03d-1e92-5c77-b314-6c92fde44e52"}D{i:53;uuid:"768879b0-66ff-5658-ba11-d0bbbd771d04"}
D{i:54;uuid:"0fcf3ec6-54da-591d-bea3-a9a771c86d98"}D{i:55;uuid:"6bbd9613-dbdf-5c40-8735-3e88ef8d1016"}
D{i:56;uuid:"6bbd9613-dbdf-5c40-8735-3e88ef8d1016_ShapePath_0"}D{i:57;uuid:"6bbd9613-dbdf-5c40-8735-3e88ef8d1016-PathSvg_0"}
D{i:58;uuid:"a0ac5125-7208-5437-8a04-d955a5315150"}D{i:59;uuid:"a0ac5125-7208-5437-8a04-d955a5315150_ShapePath_0"}
D{i:60;uuid:"a0ac5125-7208-5437-8a04-d955a5315150-PathSvg_0"}D{i:61;uuid:"718244e1-7ad0-5757-8ac9-423382d83281"}
D{i:62;uuid:"718244e1-7ad0-5757-8ac9-423382d83281_ShapePath_0"}D{i:63;uuid:"718244e1-7ad0-5757-8ac9-423382d83281-PathSvg_0"}
D{i:64;uuid:"341b0ef4-4782-55d8-844c-882871af8c7a"}D{i:65;uuid:"50d1e319-9e91-5d9c-8414-cb8d7143cd75"}
D{i:66;uuid:"d881f2df-c969-5606-9838-516406a1641b"}D{i:67;uuid:"13fc928d-939a-54fe-9887-207b4dd8a350"}
D{i:68;uuid:"d42b5cd1-8766-51da-96c3-97478bd3f10e"}D{i:69;uuid:"bbbb3617-7daa-5ece-a40a-084c4c9193eb"}
D{i:70;uuid:"0508d9f7-c645-50e3-ad47-77d44e1abc9f"}D{i:71;uuid:"e17b1965-363e-5cf2-b38f-922f1e7373e8"}
D{i:72;uuid:"1072df20-7e13-5e7d-9db8-37323e11ef26"}D{i:73;uuid:"2a48911b-465b-5ec5-87b8-ed4fec5db412"}
D{i:74;uuid:"68629de9-900b-5e87-9c32-11eaa7c7154a"}D{i:75;uuid:"b80b3397-37fb-5486-a4eb-ab6234d56f13"}
D{i:76;uuid:"609fa06c-4299-5c8e-b96d-1cbd2e9aa547"}D{i:77;uuid:"b94d74f8-dc53-57b0-aaac-a051bb9ae22c"}
D{i:78;uuid:"73bb1219-a221-5579-bac6-435efff03c41"}D{i:79;uuid:"88dcc8f6-2028-5563-8b28-5c369d52ae02"}
D{i:80;uuid:"0b9b186f-f06b-59a9-864c-027b596d5dc4"}D{i:81;uuid:"acb8b20a-4dae-5d72-9cff-c8dca5df27c5"}
D{i:82;uuid:"c0b7c231-a61c-5717-ad35-abe255f56eff"}D{i:83;uuid:"c1832eff-7e79-5ea9-a2ca-a8a008c5d16f"}
D{i:84;uuid:"414c0661-7e3b-54eb-825a-72b0ddf13f42"}D{i:85;uuid:"989e2a6c-2e5c-553f-919e-352ac97df4f6"}
D{i:86;uuid:"989e2a6c-2e5c-553f-919e-352ac97df4f6_ShapePath_0"}D{i:87;uuid:"989e2a6c-2e5c-553f-919e-352ac97df4f6-PathSvg_0"}
D{i:88;uuid:"92f43b61-2d3b-539c-be46-112d96da28c5"}D{i:89;uuid:"0fbc425d-78f3-5df6-a6c2-31e825f41361"}
D{i:90;uuid:"bd06834b-658d-5a0a-9b90-149943e11518"}
}
##^##*/

