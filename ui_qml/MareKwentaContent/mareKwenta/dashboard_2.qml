import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15
import QtCharts

Window {
    id: dashboard_Sales_by_Product
    width: 1440
    height: 1024
    visible: true
    property alias sales_by_Product_ChartText: sales_by_Product_Chart.text
    property alias dashboardText: dashboard.text

    Rectangle{
        anchors.fill: parent
        color: "#f2efea"
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
                width: 1251
                height: 773
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -396
                source: "assets/rectangle_50.png"

                ChartView {
                    id: pie
                    objectName: "pie"
                    x: 143
                    y: 31
                    width: 966
                    height: 711
                    PieSeries {
                        name: "PieSeries"
                        PieSlice {
                            value: 13.5
                            label: "Slice1"
                        }

                        PieSlice {
                            value: 10.9
                            label: "Slice2"
                        }

                        PieSlice {
                            value: 8.6
                            label: "Slice3"
                        }
                    }
                }
            }

            Text {
                id: sales_by_Product_Chart
                width: 223
                height: 24
                color: "#4e2d18"
                text: qsTr("Sales by Product")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -368
                anchors.topMargin: 8
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.DemiBold
                font.family: "Poppins"
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"e8d7d43e-f292-5aa9-88fb-92409c69721a"}
}
##^##*/

