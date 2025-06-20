import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15
import QtCharts

Rectangle {
    id: dashboard_Sales_by_Category
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias element1Text: element1.text
    property alias gross_profitText: gross_profit.text
    property alias foodText: food.text
    property alias cost_of_goodsText: cost_of_goods.text
    property alias categoryText: category.text
    property alias element10Text: element10.text
    property alias net_salesText: net_sales.text
    property alias export1Text: export1.text
    property alias element7Text: element7.text
    property alias dashboardText: dashboard.text
    property alias items_soldText: items_sold.text
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

        ComboBox {
            id: category_combo
            objectName: "category_combo"
            x: 8
            y: 0
            width: 209
            height: 50
            model: ["Sales by Category", "Sales by Product", "Sales Summary"]
            onCurrentTextChanged: navHandler.onCategorySelected(currentText)
            background: Rectangle {
                color: "#f2efea"
                border.color: "#918f8e"
                border.width: 1
                radius: 8
            }

            contentItem: Text {
                text: category_combo.displayText
                color: "#333333"
                font.pixelSize: 14
                leftPadding: 12
                rightPadding: 30  // Make room for arrow
                verticalAlignment: Text.AlignVCenter
            }

            indicator: Canvas {
                id: canvas
                x: category_combo.width - width - 12
                y: category_combo.topPadding + (category_combo.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = "#666666";
                    context.fill();
                }
            }
        }

        ComboBox {
            id: periodicity_combobox
            objectName: "periodicity_combobox"
            x: 290
            y: 0
            width: 209
            height: 50
            model: ["Daily", "Weekly", "Monthly","Yearly"]
            onCurrentTextChanged: navHandler.onPeriodicitySelected(currentText)
            contentItem: Text {
                color: "#333333"
                text: periodicity_combobox.displayText
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter
                rightPadding: 30
                leftPadding: 12
            }
            background: Rectangle {
                color: "#f2efea"
                radius: 8
                border.color: "#918f8e"
                border.width: 1
            }
            indicator: Canvas {
                id: canvas1
                x: periodicity_combobox.width - width - 12
                y: periodicity_combobox.topPadding + (periodicity_combobox.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = "#666666";
                    context.fill();
                }
            }
        }

        ComboBox {
            id: date_combobox
            objectName: "date_combobox"
            x: 599
            y: 0
            width: 209
            height: 50
            model: ["Daily", "Weekly", "Monthly","Yearly"]
            onCurrentTextChanged: navHandler.onDateSelected(currentText)
            contentItem: Text {
                color: "#333333"
                text: date_combobox.displayText
                font.pixelSize: 14
                verticalAlignment: Text.AlignVCenter
                rightPadding: 30
                leftPadding: 12
            }
            background: Rectangle {
                color: "#f2efea"
                radius: 8
                border.color: "#918f8e"
                border.width: 1
            }
            indicator: Canvas {
                id: canvas2
                x: date_combobox.width - width - 12
                y: date_combobox.topPadding + (date_combobox.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = "#666666";
                    context.fill();
                }
            }
        }
        Button {
            id: generate_button
            objectName: "generate_button"
            x: 912
            y: 0
            width: 129
            height: 50
            font.pointSize: 13
            font.family: "Inter 18pt 18pt"
            font.bold: true
            display: AbstractButton.TextOnly
            onClicked: navHandler.onGenerateClicked()
            contentItem: Text {
                color: "#f2efea"
                text: "Generate"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.styleName: "Medium"
                font.pointSize: 11
                font.family: "Inter 18pt 18pt"
            }
            background: Rectangle {
                color: "#4e2d18"
                radius: 8
                border.color: "#4e2d18"
                border.width: 1
            }
        }
    }
    Connections {
        target: navHandler

        function onPeriodicityEnabled(enabled) {
            periodicity_combobox.enabled = enabled
        }

        function onDateEnabled(enabled) {
            date_combobox.enabled = enabled
        }

        function onDateOptionsChanged(options) {
            date_combobox.model = options
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
            text: qsTr("Sales by Category")
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
            objectName: "category_text"
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
            objectName: "net_sales_text"
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
                objectName: "category"
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
                objectName: "items_sold"
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
                objectName: "net_sales"
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
                objectName: "cost_of_goods"
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
                objectName: "gross_profit"
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

        Text {
            id: element4
            objectName: "items_sold_text"
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
            id: element7
            objectName: "cost_of_goods_text"
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
            id: element10
            objectName: "gross_profit_text"
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
D{i:2;uuid:"d8716cbc-c9fa-593b-a452-aba2f34e7885"}D{i:19;uuid:"b170b45f-9f4e-5150-a51e-5e43aeb90417"}
D{i:20;uuid:"1bfaddb6-aeb5-5111-abfc-b66f17c032e0"}
}
##^##*/

