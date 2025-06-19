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
    property alias element10Text: element10.text
    property alias net_salesText: net_sales.text
    property alias export1Text: export1.text
    property alias element7Text: element7.text
    property alias element6Text: element6.text
    property alias non_coffeeText: non_coffee.text
    property alias coffeeText: coffee.text
    property alias elementText: element.text
    property alias dashboardText: dashboard.text
    property alias element2Text: element2.text
    property alias element9Text: element9.text
    property alias element5Text: element5.text
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
        id: group_17
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
}

/*##^##
Designer {
    D{i:0;uuid:"01da1459-2c3d-5438-852c-0d0684b2dd7f"}D{i:1;uuid:"c78bf9b2-b0a5-5c76-976c-c02626f17d34"}
D{i:2;uuid:"d8716cbc-c9fa-593b-a452-aba2f34e7885"}D{i:3;uuid:"2391399b-c0a9-5c19-a695-f0cb914f49f3"}
D{i:4;uuid:"fc95dfb5-925c-5203-9670-b9763c01792d"}D{i:11;uuid:"7e2ad363-16c4-5f01-8a05-0c9a632cc761"}
D{i:12;uuid:"19a118f5-62d7-54c8-9694-33ab75bde47d"}D{i:13;uuid:"4d8a54c4-78b0-59f8-a4db-c9bb3ee792eb"}
D{i:14;uuid:"c427c81a-0945-500a-8358-d63427e99b59"}D{i:15;uuid:"1e535c46-72fc-523d-b510-f6f962dbbd79"}
D{i:16;uuid:"d9c8a1e1-20e5-5b6d-9dbb-7ee74f4dbed3"}D{i:17;uuid:"d9c8a1e1-20e5-5b6d-9dbb-7ee74f4dbed3_ShapePath_0"}
D{i:18;uuid:"d9c8a1e1-20e5-5b6d-9dbb-7ee74f4dbed3-PathSvg_0"}D{i:19;uuid:"6c73957a-11fa-5b6e-afe3-dea7dc4a33e1"}
D{i:20;uuid:"ba786538-9a7b-5e38-b7b7-36c1653492f1"}D{i:21;uuid:"857bf5a6-788f-58ce-9ed2-eb678801f19f"}
D{i:22;uuid:"6d3eae0c-ae63-5356-9151-203c3e212da9"}D{i:23;uuid:"5ba1943f-7b6d-5767-bcc6-018b561f33e6"}
D{i:24;uuid:"e5877b63-217c-5b6a-9f73-5eeaa5fbbdb1"}D{i:25;uuid:"b98ac9f6-0ffc-5135-b2bf-49da24741722"}
D{i:26;uuid:"ec116b90-c266-55d3-aa85-c1246ef0b60b"}D{i:27;uuid:"fa0a34d9-7f46-5af1-a8a2-a6cb6d8d0ad2"}
D{i:28;uuid:"5ba31e88-66a2-5c88-99bc-277b30326d72"}D{i:29;uuid:"96b825c5-64ab-5f13-8dad-5168ddf81798"}
D{i:30;uuid:"96b825c5-64ab-5f13-8dad-5168ddf81798_ShapePath_0"}D{i:31;uuid:"96b825c5-64ab-5f13-8dad-5168ddf81798-PathSvg_0"}
D{i:32;uuid:"5fc960d5-c477-5e83-9aa1-f715e3fed425"}D{i:33;uuid:"5fc960d5-c477-5e83-9aa1-f715e3fed425_ShapePath_0"}
D{i:34;uuid:"5fc960d5-c477-5e83-9aa1-f715e3fed425-PathSvg_0"}D{i:35;uuid:"fa7d082a-aeaa-5098-8614-37759f684b02"}
D{i:36;uuid:"fa7d082a-aeaa-5098-8614-37759f684b02_ShapePath_0"}D{i:37;uuid:"fa7d082a-aeaa-5098-8614-37759f684b02-PathSvg_0"}
D{i:38;uuid:"efcaee08-84b8-5520-9079-14c00de1752c"}D{i:39;uuid:"6f167dcd-1f39-5e6d-b42e-acf927ce82d2"}
D{i:40;uuid:"71979449-0921-54b2-aaf7-29b31a2f59f7"}D{i:41;uuid:"b7a1bfbc-aa35-564a-857b-7f2122c5bc9f"}
D{i:42;uuid:"f2affd84-281a-51d9-8f40-bf7b767f74d8"}D{i:43;uuid:"41456347-dc4c-5e69-95c0-8c9cebd6baf3"}
D{i:44;uuid:"404fa397-e063-54d2-ad68-4a8834e065fd"}D{i:45;uuid:"2f8ff6b0-d6f8-56ec-9c0f-0b73d412e329"}
D{i:46;uuid:"1434dd83-68f7-5577-9fa5-bf13449a620b"}D{i:47;uuid:"26e30ec3-7f87-57bc-91c7-f1c51845d245"}
D{i:48;uuid:"7e39c091-83fd-593e-91f7-c212d849aef7"}D{i:49;uuid:"7e39c091-83fd-593e-91f7-c212d849aef7_ShapePath_0"}
D{i:50;uuid:"7e39c091-83fd-593e-91f7-c212d849aef7-PathSvg_0"}D{i:52;uuid:"b170b45f-9f4e-5150-a51e-5e43aeb90417"}
D{i:53;uuid:"1bfaddb6-aeb5-5111-abfc-b66f17c032e0"}
}
##^##*/

