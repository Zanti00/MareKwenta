import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15
import QtCharts

Rectangle {
    id: dashboard_Sales_Summary
    width: 1440
    height: 952
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias mKText: mK.text
    property alias receiptsText: receipts.text
    property alias headerText: header.text
    property alias inventoryText: inventory.text
    property alias cash_BoxText: cash_Box.text
    property alias dash_boardText: dash_board.text
    property alias ticketText: ticket.text

    Text {
        id: header
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
        id: graph
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 142
        anchors.rightMargin: 51
        anchors.topMargin: 208
        anchors.bottomMargin: 54
        Image {
            id: rectangle_46
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            source: "assets/rectangle_46_2.png"

            ChartView {
                id: line
                x: 103
                y: 53
                width: 1050
                height: 592
                LineSeries {
                    name: "LineSeries"
                    XYPoint {
                        x: 0
                        y: 2
                    }

                    XYPoint {
                        x: 1
                        y: 1.2
                    }

                    XYPoint {
                        x: 2
                        y: 3.3
                    }

                    XYPoint {
                        x: 5
                        y: 2.1
                    }
                }
            }
        }

        Text {
            id: sales_by_Product_Chart
            width: 223
            height: 24
            color: "#4e2d18"
            text: qsTr("Sales Summary")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 39
            anchors.topMargin: 36
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
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
    D{i:0;uuid:"3f86a195-e5ae-5638-93e1-318f02ffdc75"}D{i:1;uuid:"290d9591-6d57-54f3-9717-8c0ed342dcd0"}
D{i:2;uuid:"d74184c6-dc83-5d4f-bf8b-da33057a4b85"}D{i:19;uuid:"feefb81f-68fa-5f81-8539-e60df2e2de51"}
D{i:20;uuid:"a83d6f29-cff0-5705-896b-91e6e265ff9e"}
}
##^##*/

