import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: dashboard_Sales_by_Category
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias all_dayText: all_day.text
    property alias element1Text: element1.text
    property alias element12Text: element12.text
    property alias gross_profitText: gross_profit.text
    property alias all_EmployeesText: all_Employees.text
    property alias foodText: food.text
    property alias cost_of_goodsText: cost_of_goods.text
    property alias sales_by_CategoryText: sales_by_Category.text
    property alias categoryText: category.text
    property alias page_1_of_1Text: page_1_of_1.text
    property alias element11Text: element11.text
    property alias receiptsText: receipts.text
    property alias mKText: mK.text
    property alias inventoryText: inventory.text
    property alias element10Text: element10.text
    property alias net_salesText: net_sales.text
    property alias export1Text: export1.text
    property alias element7Text: element7.text
    property alias cash_BoxText: cash_Box.text
    property alias logsText: logs.text
    property alias dash_boardText: dash_board.text
    property alias element6Text: element6.text
    property alias non_coffeeText: non_coffee.text
    property alias coffeeText: coffee.text
    property alias elementText: element.text
    property alias dashboardText: dashboard.text
    property alias element2Text: element2.text
    property alias element9Text: element9.text
    property alias element5Text: element5.text
    property alias staffText: staff.text
    property alias ticketText: ticket.text
    property alias element8Text: element8.text
    property alias items_soldText: items_sold.text
    property alias element3Text: element3.text
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
            source: "assets/rectangle_47_1.png"
        }

        Text {
            id: sales_by_Category
            width: 185
            height: 30
            color: "#4d2d18"
            text: qsTr("Sales by Category")
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
            source: "assets/rectangle_48_1.png"
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
            source: "assets/rectangle_49_1.png"
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
            source: "assets/rectangle_51_1.png"
        }

        Text {
            id: element
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
        id: table
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 142
        anchors.rightMargin: 51
        anchors.topMargin: 208
        anchors.bottomMargin: 396
        Image {
            id: rectangle_46
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            source: "assets/rectangle_46_1.png"
        }

        Text {
            id: export1
            width: 166
            height: 24
            color: "#4e2d18"
            text: qsTr("Export")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 27
            anchors.topMargin: 23
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: food
            width: 41
            height: 24
            color: "#4e2d18"
            text: qsTr("Food")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 27
            anchors.topMargin: 141
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element1
            width: 58
            height: 24
            color: "#4e2d18"
            text: qsTr("₱170.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 624
            anchors.topMargin: 139
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_11_Stroke_
            width: 1182
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 27
            anchors.topMargin: 119
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_11_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_11_Stroke__PathSvg_0
                    path: "M 1182 0 L 1182 0.7998046875 L 0 0.7998046875 L 0 0 L 1182 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: element2
            width: 54
            height: 24
            color: "#4e2d18"
            text: qsTr("₱30.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 618
            anchors.topMargin: 273
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element3
            width: 64
            height: 24
            color: "#4e2d18"
            text: qsTr("₱500.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 618
            anchors.topMargin: 207
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Item {
            id: group_30
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 27
            anchors.rightMargin: 53
            anchors.topMargin: 77
            anchors.bottomMargin: 319
            Text {
                id: category
                width: 75
                height: 24
                color: "#4e2d18"
                text: qsTr("Category")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Light
                font.family: "Poppins"
            }

            Text {
                id: items_sold
                width: 81
                height: 24
                color: "#4e2d18"
                text: qsTr("Items sold")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 348
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Light
                font.family: "Poppins"
            }

            Text {
                id: net_sales
                width: 72
                height: 24
                color: "#4e2d18"
                text: qsTr("Net sales")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 588
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Light
                font.family: "Poppins"
            }

            Text {
                id: cost_of_goods
                width: 112
                height: 24
                color: "#4e2d18"
                text: qsTr("Cost of goods")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 808
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Light
                font.family: "Poppins"
            }

            Text {
                id: gross_profit
                width: 91
                height: 24
                color: "#4e2d18"
                text: qsTr("Gross profit")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 1077
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Light
                font.family: "Poppins"
            }
        }

        Text {
            id: coffee
            width: 54
            height: 24
            color: "#4e2d18"
            text: qsTr("Coffee")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 27
            anchors.topMargin: 207
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: non_coffee
            width: 92
            height: 24
            color: "#4e2d18"
            text: qsTr("Non-coffee")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 27
            anchors.topMargin: 271
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_13_Stroke_
            width: 1182
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 27
            anchors.topMargin: 61
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_13_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_13_Stroke__PathSvg_0
                    path: "M 1182 0 L 1182 0.7998046875 L 0 0.7998046875 L 0 0 L 1182 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Shape {
            id: line_14_Stroke_
            width: 1182
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 27
            anchors.topMargin: 183
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_14_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_14_Stroke__PathSvg_0
                    path: "M 1182 0 L 1182 0.7998046875 L 0 0.7998046875 L 0 0 L 1182 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Shape {
            id: line_15_Stroke_
            width: 1182
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 27
            anchors.topMargin: 253
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_15_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_15_Stroke__PathSvg_0
                    path: "M 1182 0 L 1182 0.7998046875 L 0 0.7998046875 L 0 0 L 1182 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: element4
            width: 17
            height: 24
            color: "#4e2d18"
            text: qsTr("10")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 437
            anchors.topMargin: 141
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element5
            width: 12
            height: 24
            color: "#4e2d18"
            text: qsTr("5")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 437
            anchors.topMargin: 206
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element6
            width: 11
            height: 24
            color: "#4e2d18"
            text: qsTr("2")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 435
            anchors.topMargin: 271
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element7
            width: 44
            height: 24
            color: "#4e2d18"
            text: qsTr("₱0.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 864
            anchors.topMargin: 139
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element8
            width: 44
            height: 24
            color: "#4e2d18"
            text: qsTr("₱0.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 864
            anchors.topMargin: 273
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element9
            width: 44
            height: 24
            color: "#4e2d18"
            text: qsTr("₱0.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 864
            anchors.topMargin: 207
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element10
            width: 64
            height: 24
            color: "#4e2d18"
            text: qsTr("₱500.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1115
            anchors.topMargin: 146
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element11
            width: 54
            height: 24
            color: "#4e2d18"
            text: qsTr("₱30.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1127
            anchors.topMargin: 210
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element12
            width: 58
            height: 24
            color: "#4e2d18"
            text: qsTr("₱170.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1112
            anchors.topMargin: 273
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Image {
            id: rectangle_52
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.topMargin: 352
            source: "assets/rectangle_52.png"
        }

        Shape {
            id: line_16_Stroke_
            width: 1
            height: 30
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 91
            anchors.topMargin: 361
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_16_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_16_Stroke__PathSvg_0
                    path: "M 0 0 L 0.7998046875 0 L 0.7998046875 30 L 0 30 L 0 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Chevron_right {
            id: chevron_right
            width: 48
            height: 48
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 107
            anchors.topMargin: 352
            state: "size_48"
            clip: true
        }

        Chevron_left {
            id: chevron_left
            width: 58
            height: 48
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 22
            anchors.topMargin: 352
            state: "size_48"
            clip: true
        }

        Text {
            id: page_1_of_1
            width: 84
            height: 24
            color: "#4e2d18"
            text: qsTr("Page: 1 of 1")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 181
            anchors.topMargin: 364
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
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
            source: "assets/rectangle_14_11.png"
        }

        Image {
            id: rectangle_44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_44_7.png"
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
                id: element13
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
    D{i:0;uuid:"01da1459-2c3d-5438-852c-0d0684b2dd7f"}D{i:1;uuid:"c78bf9b2-b0a5-5c76-976c-c02626f17d34"}
D{i:2;uuid:"d8716cbc-c9fa-593b-a452-aba2f34e7885"}D{i:3;uuid:"2391399b-c0a9-5c19-a695-f0cb914f49f3"}
D{i:4;uuid:"fc95dfb5-925c-5203-9670-b9763c01792d"}D{i:5;uuid:"e2b9106a-04f5-5942-9ce4-d73d223ec25f"}
D{i:6;uuid:"2f49abaf-e5ec-5b7e-b60a-5971dd1a4315"}D{i:7;uuid:"8fb80c49-0aec-53ee-b8ba-83bdf3d28a6c"}
D{i:8;uuid:"af2de1e1-0a75-52b6-a8d6-578eb965e49f"}D{i:9;uuid:"267df1c3-5fc5-562a-bddc-f120fa37131b"}
D{i:10;uuid:"8ce54deb-a9e1-559d-bbd1-93940b6d2683"}D{i:11;uuid:"c241fa4a-e724-53a2-a2de-bacf05d9c7e3"}
D{i:12;uuid:"634240ed-fdf7-5936-b539-a92bf32e97b8"}D{i:13;uuid:"764746ab-d9c0-501d-9954-15d967c85714"}
D{i:14;uuid:"0b9b4483-d87b-5255-957b-31fcbdafcf14"}D{i:15;uuid:"7e2ad363-16c4-5f01-8a05-0c9a632cc761"}
D{i:16;uuid:"19a118f5-62d7-54c8-9694-33ab75bde47d"}D{i:17;uuid:"4d8a54c4-78b0-59f8-a4db-c9bb3ee792eb"}
D{i:18;uuid:"c427c81a-0945-500a-8358-d63427e99b59"}D{i:19;uuid:"1e535c46-72fc-523d-b510-f6f962dbbd79"}
D{i:20;uuid:"d9c8a1e1-20e5-5b6d-9dbb-7ee74f4dbed3"}D{i:21;uuid:"d9c8a1e1-20e5-5b6d-9dbb-7ee74f4dbed3_ShapePath_0"}
D{i:22;uuid:"d9c8a1e1-20e5-5b6d-9dbb-7ee74f4dbed3-PathSvg_0"}D{i:23;uuid:"6c73957a-11fa-5b6e-afe3-dea7dc4a33e1"}
D{i:24;uuid:"ba786538-9a7b-5e38-b7b7-36c1653492f1"}D{i:25;uuid:"857bf5a6-788f-58ce-9ed2-eb678801f19f"}
D{i:26;uuid:"6d3eae0c-ae63-5356-9151-203c3e212da9"}D{i:27;uuid:"5ba1943f-7b6d-5767-bcc6-018b561f33e6"}
D{i:28;uuid:"e5877b63-217c-5b6a-9f73-5eeaa5fbbdb1"}D{i:29;uuid:"b98ac9f6-0ffc-5135-b2bf-49da24741722"}
D{i:30;uuid:"ec116b90-c266-55d3-aa85-c1246ef0b60b"}D{i:31;uuid:"fa0a34d9-7f46-5af1-a8a2-a6cb6d8d0ad2"}
D{i:32;uuid:"5ba31e88-66a2-5c88-99bc-277b30326d72"}D{i:33;uuid:"96b825c5-64ab-5f13-8dad-5168ddf81798"}
D{i:34;uuid:"96b825c5-64ab-5f13-8dad-5168ddf81798_ShapePath_0"}D{i:35;uuid:"96b825c5-64ab-5f13-8dad-5168ddf81798-PathSvg_0"}
D{i:36;uuid:"5fc960d5-c477-5e83-9aa1-f715e3fed425"}D{i:37;uuid:"5fc960d5-c477-5e83-9aa1-f715e3fed425_ShapePath_0"}
D{i:38;uuid:"5fc960d5-c477-5e83-9aa1-f715e3fed425-PathSvg_0"}D{i:39;uuid:"fa7d082a-aeaa-5098-8614-37759f684b02"}
D{i:40;uuid:"fa7d082a-aeaa-5098-8614-37759f684b02_ShapePath_0"}D{i:41;uuid:"fa7d082a-aeaa-5098-8614-37759f684b02-PathSvg_0"}
D{i:42;uuid:"efcaee08-84b8-5520-9079-14c00de1752c"}D{i:43;uuid:"6f167dcd-1f39-5e6d-b42e-acf927ce82d2"}
D{i:44;uuid:"71979449-0921-54b2-aaf7-29b31a2f59f7"}D{i:45;uuid:"b7a1bfbc-aa35-564a-857b-7f2122c5bc9f"}
D{i:46;uuid:"f2affd84-281a-51d9-8f40-bf7b767f74d8"}D{i:47;uuid:"41456347-dc4c-5e69-95c0-8c9cebd6baf3"}
D{i:48;uuid:"404fa397-e063-54d2-ad68-4a8834e065fd"}D{i:49;uuid:"2f8ff6b0-d6f8-56ec-9c0f-0b73d412e329"}
D{i:50;uuid:"1434dd83-68f7-5577-9fa5-bf13449a620b"}D{i:51;uuid:"26e30ec3-7f87-57bc-91c7-f1c51845d245"}
D{i:52;uuid:"7e39c091-83fd-593e-91f7-c212d849aef7"}D{i:53;uuid:"7e39c091-83fd-593e-91f7-c212d849aef7_ShapePath_0"}
D{i:54;uuid:"7e39c091-83fd-593e-91f7-c212d849aef7-PathSvg_0"}D{i:55;uuid:"f51b6501-0409-5441-b8fd-bf633e4a9955"}
D{i:56;uuid:"85f19db9-31be-53f5-b5f9-6efe595c4cd0"}D{i:57;uuid:"6d822a1d-0e33-5a21-bd60-6b6aadbd2328"}
D{i:58;uuid:"b170b45f-9f4e-5150-a51e-5e43aeb90417"}D{i:59;uuid:"1bfaddb6-aeb5-5111-abfc-b66f17c032e0"}
D{i:60;uuid:"c3477116-df5e-5e0e-8820-293d3d1ace0f"}D{i:61;uuid:"483f099f-1055-523d-94b4-d32c4c7afbf0"}
D{i:62;uuid:"1d178b49-5c15-5cd3-8ff8-4b23423ffbf0"}D{i:63;uuid:"086772a5-86b3-57c3-9cdd-3a00d646157e"}
D{i:64;uuid:"62817398-e539-59eb-8408-7d8c90fefc42"}D{i:65;uuid:"18980132-c01d-558a-b076-765c5a477898"}
D{i:66;uuid:"8a1abbf7-80c1-585f-888d-d990501584db"}D{i:67;uuid:"efd82171-8b81-5760-954b-5bec99f4b78f"}
D{i:68;uuid:"3c306710-f670-54a6-971e-9a149a38b175"}D{i:69;uuid:"6a7e2efe-385f-573a-bbc8-23d038be0ed5"}
D{i:70;uuid:"44f8aff8-2904-5d67-86fa-4817fcb1a984"}D{i:71;uuid:"d8f1f714-1423-5231-a8de-0ffa69d1f7b0"}
D{i:72;uuid:"14b14e6d-e691-5fc7-8673-1a745d8b0dc1"}D{i:73;uuid:"bcbe8991-207c-5bb5-b3fc-8fadcf38953b"}
D{i:74;uuid:"ca10802d-8423-53f4-a615-5ac24c1a8026"}D{i:75;uuid:"261f3ae7-233a-55da-bc11-85ab01207f98"}
D{i:76;uuid:"984e8a4f-5fbb-5163-af7f-3c76ded1601c"}D{i:77;uuid:"71d357e8-06eb-582c-85a2-c69a789d1f08"}
D{i:78;uuid:"edbb41ec-b2aa-55d8-96e8-7fd9416f2861"}D{i:79;uuid:"9d1ee442-8a1b-51fc-8b37-655484064592"}
D{i:80;uuid:"9d1ee442-8a1b-51fc-8b37-655484064592_ShapePath_0"}D{i:81;uuid:"9d1ee442-8a1b-51fc-8b37-655484064592-PathSvg_0"}
D{i:82;uuid:"79f6bcec-3b24-500e-867e-9903046270a6"}D{i:83;uuid:"24114a8b-171e-5f6d-b135-79c68d945de1"}
D{i:84;uuid:"61c21f4a-224d-5c26-b997-3b82b0808d81"}
}
##^##*/

