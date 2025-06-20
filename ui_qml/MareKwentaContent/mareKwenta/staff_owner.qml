import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: employee_Management
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias startedText: started.text
    property alias may_05_2026Text: date_text.text
    property alias endedText: ended.text
    property alias employee_IDText: employee_ID.text
    property alias employee_NameText: employee_Name.text
    property alias aMText: timein_text.text
    property alias aya_Del_RosarioText: employeename_text.text
    property alias elementText: employeeid_text.text
    property alias pMText: timeout_text.text
    property alias staffText: staff.text

    Text {
        id: date_text
        width: 229
        height: 55
        color: "#4e2d18"
        text: qsTr("May 05, 2026")
        anchors.top: parent.top
        anchors.topMargin: 32
        font.letterSpacing: 1.188
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Unbounded"
        anchors.horizontalCenterOffset: 576
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: staff
        width: 257
        height: 38
        color: "#4e2d18"
        text: qsTr("Staff")
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

    Item {
        id: group_38
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 127
        anchors.rightMargin: 33
        anchors.topMargin: 110
        anchors.bottomMargin: 35
        Rectangle {
            id: logs
            width: 1280
            height: 879
            color: "#ffffff"
            radius: 20
            anchors.left: parent.left
            anchors.top: parent.top

            RoundButton {
                id: addemployee_button
                x: 1126
                y: 542
                width: 74
                height: 69
                text: "+"
                topPadding: -3
                font.pointSize: 33
                font.bold: true
                display: AbstractButton.TextOnly
            }
        }

        Text {
            id: employee_ID
            width: 201
            height: 43
            color: "#000000"
            text: qsTr("Employee ID")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 26
            anchors.topMargin: 14
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Text {
            id: employee_Name
            width: 201
            height: 43
            color: "#000000"
            text: qsTr("Employee Name")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 220
            anchors.topMargin: 14
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Text {
            id: started
            width: 201
            height: 43
            color: "#000000"
            text: qsTr("Started")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 851
            anchors.topMargin: 14
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Text {
            id: ended
            width: 201
            height: 43
            color: "#000000"
            text: qsTr("Ended")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1051
            anchors.topMargin: 14
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Text {
            id: employeeid_text
            width: 201
            height: 43
            color: "#000000"
            text: qsTr("0001")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 26
            anchors.topMargin: 72
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Text {
            id: employeename_text
            width: 201
            height: 43
            color: "#000000"
            text: qsTr("Aya Del Rosario")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 220
            anchors.topMargin: 72
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Text {
            id: timein_text
            width: 201
            height: 43
            color: "#000000"
            text: qsTr("7:56 AM")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 851
            anchors.topMargin: 72
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Text {
            id: timeout_text
            width: 201
            height: 43
            color: "#000000"
            text: qsTr("12:03 PM")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1051
            anchors.topMargin: 72
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
        }

        Shape {
            id: line_17_Stroke_
            width: 1230
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 21
            anchors.topMargin: 67
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_17_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_17_Stroke__PathSvg_0
                    path: "M 1230.009765625 0 L 1230.009765625 1 L 0 1 L 0 0 L 1230.009765625 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Item {
            id: group_117
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 1176
            anchors.rightMargin: 24
            anchors.topMargin: 782
            anchors.bottomMargin: 17
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
    D{i:0;uuid:"ab4c7de6-6014-57b5-9a28-cc4b142065fd"}D{i:1;uuid:"5bd738fe-e1a2-5c4a-811d-cc5d0f64cce7"}
D{i:2;uuid:"bd53f988-a59e-5aea-b94c-7e3422133f54"}D{i:3;uuid:"ca482a50-cf48-5af4-b037-ce9d9c92f4aa"}
D{i:4;uuid:"31350e4b-390a-51a6-9517-d565f680e71a"}D{i:5;uuid:"ae72bcd8-68d0-5a99-b6ef-01e7c84d7c9c"}
D{i:6;uuid:"1e958c90-548c-5072-906c-4c11f6053bb9"}D{i:7;uuid:"5b4b3c79-ee5a-59c7-9b64-fa64b6e0937b"}
D{i:8;uuid:"e4c29f67-ef62-5b66-ba5a-f628dcf0346a"}D{i:9;uuid:"a2a5684e-7047-5fea-8424-ce2c55c8ac4d"}
D{i:10;uuid:"1475a969-8409-5dcd-9b8a-c645f42179c0"}D{i:11;uuid:"5bf7c4de-12d0-5a4a-9e74-7ac3f88dd551"}
D{i:12;uuid:"67141bfc-3880-531b-ada8-5714500c3202"}D{i:13;uuid:"66ba591f-49c6-50e1-b4e0-89af49819205"}
D{i:14;uuid:"66ba591f-49c6-50e1-b4e0-89af49819205_ShapePath_0"}D{i:15;uuid:"66ba591f-49c6-50e1-b4e0-89af49819205-PathSvg_0"}
D{i:16;uuid:"8c92b65a-7aee-5f98-aa2c-436abe3b8887"}D{i:17;uuid:"17313f8f-f9a2-5577-948d-d81ad5b0e06a"}
D{i:18;uuid:"12f26386-803c-5e5e-86ea-af2a74fb1d2c"}D{i:19;uuid:"8386ca92-62a9-529e-b609-129ae973df7f"}
}
##^##*/

