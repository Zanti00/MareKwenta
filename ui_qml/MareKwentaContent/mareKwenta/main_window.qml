import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Window {
    id: main_window
    width: 1440
    height: 1024
    visible: true


    Rectangle{
        id: rectangle10
        anchors.fill: parent
        color: "#f2efea"

        Item {
            id: navbar
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
                        onClicked: content_loader.source = "inventory.qml"
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
                        onClicked: content_loader.source = "staff_owner.qml"
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
                        onClicked: {
                            // Empty for now as you mentioned receipt is still empty
                            console.log("Receipt clicked - not implemented yet")
                        }
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
                        objectName: "cashbox_navbar"
                        x: 0
                        y: 350
                        width: 78
                        height: 85
                        text: qsTr("")
                        icon.width: 55
                        icon.source: "assets/DollarSign.png"
                        icon.height: 55
                        icon.color: "#4e2d18"
                        onClicked: content_loader.source = "cash_box.qml"
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
                        onClicked: content_loader.source = "Ticket_Main.qml"
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
                        onClicked: content_loader.source = "dashboard.qml"
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

        // Main content loader
        Loader {
            id: content_loader
            anchors.left: navbar.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10

            // Default to ticket system
            source: "Ticket_Main.qml"

            onLoaded: {
                console.log("Loaded:", source)
                // Handle any post-load setup here
                if (item && source.toString().includes("Ticket_Main.qml")) {
                    // Connect any signals from Ticket_Main if needed
                    if (item.show_product_modifier) {
                        // Connect to your modifier popup if needed
                    }
                }
            }

            onSourceChanged: {
                console.log("Loading:", source)
            }
        }
    }
}
/*##^##
Designer {
    D{i:0;uuid:"4fa88c5b-ac5d-5c98-b1da-fdec66fb40a2"}
}
##^##*/
