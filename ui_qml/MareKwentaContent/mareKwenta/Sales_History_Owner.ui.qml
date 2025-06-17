import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: sales_History_Owner
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias saturday_25_May_2027Text: saturday_25_May_2027.text
    property alias element1Text: element1.text
    property alias element12Text: element12.text
    property alias order_No_Text: order_No_.text
    property alias am3Text: am3.text
    property alias receiptsText: receipts.text
    property alias element11Text: element11.text
    property alias headerText: header.text
    property alias mKText: mK.text
    property alias inventoryText: inventory.text
    property alias saturday_25_May_2026Text: saturday_25_May_2026.text
    property alias element10Text: element10.text
    property alias gcashText: gcash.text
    property alias element7Text: element7.text
    property alias cash_BoxText: cash_Box.text
    property alias totalText: total.text
    property alias saturday_25_May_2025Text: saturday_25_May_2025.text
    property alias logsText: logs.text
    property alias am1Text: am1.text
    property alias dash_boardText: dash_board.text
    property alias element6Text: element6.text
    property alias element14Text: element14.text
    property alias pmText: pm.text
    property alias mayaText: maya.text
    property alias size_Venti_120_00_Text: size_Venti_120_00_.text
    property alias quantity_2Text: quantity_2.text
    property alias pOS_POS_1Text: pOS_POS_1.text
    property alias saturday_25_May_2029Text: saturday_25_May_2029.text
    property alias elementText: element.text
    property alias element2Text: element2.text
    property alias element9Text: element9.text
    property alias element13Text: element13.text
    property alias pm1Text: pm1.text
    property alias staffText: staff.text
    property alias element5Text: element5.text
    property alias ticketText: ticket.text
    property alias element8Text: element8.text
    property alias saturday_25_May_2028Text: saturday_25_May_2028.text
    property alias employee_Name_Lorem_IpsumText: employee_Name_Lorem_Ipsum.text
    property alias strawberry_LatteText: strawberry_Latte.text
    property alias element3Text: element3.text
    property alias am2Text: am2.text
    property alias amText: am.text
    property alias element4Text: element4.text

    Text {
        id: header
        width: 304
        height: 45
        color: "#4e2d18"
        text: qsTr("Sales History")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 44
        font.pixelSize: 36
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Unbounded"
    }

    Image {
        id: rectangle_46
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 138
        anchors.topMargin: 121
        source: "assets/rectangle_46_3.png"
    }

    Text {
        id: saturday_25_May_2025
        width: 231
        height: 20
        color: "#708a2e"
        text: qsTr("Saturday 25 May 2025")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 158
        anchors.topMargin: 139
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Trash_2 {
        id: trash_2
        width: 48
        height: 48
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 696
        anchors.topMargin: 488
        state: "size_48"
        clip: true
    }

    Text {
        id: saturday_25_May_2026
        width: 231
        height: 20
        color: "#708a2e"
        text: qsTr("Saturday 25 May 2025")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 160
        anchors.topMargin: 256
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: saturday_25_May_2027
        width: 231
        height: 20
        color: "#708a2e"
        text: qsTr("Saturday 25 May 2025")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 160
        anchors.topMargin: 372
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: saturday_25_May_2028
        width: 231
        height: 20
        color: "#708a2e"
        text: qsTr("Saturday 25 May 2025")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 162
        anchors.topMargin: 490
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: saturday_25_May_2029
        width: 231
        height: 20
        color: "#708a2e"
        text: qsTr("Saturday 25 May 2025")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 164
        anchors.topMargin: 608
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: element
        width: 72
        height: 26
        color: "#4e2d18"
        text: qsTr("₱80.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 231
        anchors.topMargin: 183
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Inter"
    }

    Text {
        id: element1
        width: 88
        height: 26
        color: "#4e2d18"
        text: qsTr("₱100.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 232
        anchors.topMargin: 299
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Inter"
    }

    Text {
        id: element2
        width: 82
        height: 26
        color: "#4e2d18"
        text: qsTr("₱120.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 233
        anchors.topMargin: 417
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Inter"
    }

    Text {
        id: element3
        width: 90
        height: 26
        color: "#4e2d18"
        text: qsTr("₱80.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 235
        anchors.topMargin: 535
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Inter"
    }

    Text {
        id: element4
        width: 73
        height: 27
        color: "#4e2d18"
        text: qsTr("₱80.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 237
        anchors.topMargin: 652
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.DemiBold
        font.family: "Inter"
    }

    Shape {
        id: line_15_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 160
        anchors.topMargin: 242
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_15_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_15_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_17_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 160
        anchors.topMargin: 357
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_17_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_17_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_19_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 160
        anchors.topMargin: 475
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_19_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_19_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_21_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 162
        anchors.topMargin: 593
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_21_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_21_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_23_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 162
        anchors.topMargin: 711
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_23_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_23_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_16_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 158
        anchors.topMargin: 169
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_16_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_16_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_18_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 158
        anchors.topMargin: 285
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_18_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_18_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_20_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 159
        anchors.topMargin: 402
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_20_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_20_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_22_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 160
        anchors.topMargin: 520
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_22_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_22_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_24_Stroke_
        width: 350
        height: 1
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 162
        anchors.topMargin: 638
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_24_Stroke__ShapePath_0
            strokeWidth: 0.8
            strokeColor: "transparent"
            PathSvg {
                id: line_24_Stroke__PathSvg_0
                path: "M 350 0 L 350 0.7998046875 L 0 0.7998046875 L 0 0 L 350 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Text {
        id: element5
        width: 75
        height: 26
        color: "#804e2d18"
        text: qsTr("#1-1031")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 429
        anchors.topMargin: 193
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: element6
        width: 63
        height: 26
        color: "#804e2d18"
        text: qsTr("#1-1029")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 430
        anchors.topMargin: 308
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: element7
        width: 63
        height: 26
        color: "#804e2d18"
        text: qsTr("#1-1025")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 431
        anchors.topMargin: 426
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: element8
        width: 63
        height: 26
        color: "#804e2d18"
        text: qsTr("#1-1075")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 433
        anchors.topMargin: 544
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: element9
        width: 63
        height: 26
        color: "#804e2d18"
        text: qsTr("#1-2001")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 435
        anchors.topMargin: 662
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: am
        width: 52
        height: 20
        color: "#4e2d18"
        text: qsTr("10:24 am")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 233
        anchors.topMargin: 208
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Inter"
    }

    Text {
        id: am1
        width: 53
        height: 20
        color: "#4e2d18"
        text: qsTr("10:50 am")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 234
        anchors.topMargin: 324
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Inter"
    }

    Text {
        id: am2
        width: 50
        height: 20
        color: "#4e2d18"
        text: qsTr("5:00 am")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 235
        anchors.topMargin: 442
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Inter"
    }

    Text {
        id: am3
        width: 52
        height: 20
        color: "#4e2d18"
        text: qsTr("10:24 am")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 237
        anchors.topMargin: 560
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Inter"
    }

    Text {
        id: pm
        width: 49
        height: 20
        color: "#4e2d18"
        text: qsTr("7:00 pm")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 239
        anchors.topMargin: 678
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        font.family: "Inter"
    }

    Image {
        id: bill
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 177
        anchors.topMargin: 192
        source: "assets/bill.png"
    }

    Image {
        id: bill1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 178
        anchors.topMargin: 308
        source: "assets/bill1.png"
    }

    Image {
        id: bill2
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 179
        anchors.topMargin: 426
        source: "assets/bill2.png"
    }

    Image {
        id: bill3
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 181
        anchors.topMargin: 544
        source: "assets/bill3.png"
    }

    Image {
        id: bill4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 183
        anchors.topMargin: 662
        source: "assets/bill4.png"
    }

    Image {
        id: rectangle_48
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 645
        anchors.topMargin: 276
        source: "assets/rectangle_48_3.png"
    }

    Text {
        id: element10
        width: 133
        height: 39
        color: "#4e2d18"
        text: qsTr("#1-3028")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 912
        anchors.topMargin: 317
        font.pixelSize: 32
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Text {
        id: order_No_
        width: 75
        height: 19
        color: "#804e2d18"
        text: qsTr("Order No.")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 943
        anchors.topMargin: 365
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Shape {
        id: line_25_Stroke_
        width: 608
        height: 2
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 403
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_25_Stroke__ShapePath_0
            strokeWidth: 2
            strokeColor: "transparent"
            PathSvg {
                id: line_25_Stroke__PathSvg_0
                path: "M 2 0 L 2 2 L 0 2 L 0 0 L 2 0 Z M 10 0 L 10 2 L 6 2 L 6 0 L 10 0 Z M 18 0 L 18 2 L 14 2 L 14 0 L 18 0 Z M 26 0 L 26 2 L 22 2 L 22 0 L 26 0 Z M 34 0 L 34 2 L 30 2 L 30 0 L 34 0 Z M 42.0009765625 0 L 42.0009765625 2 L 38 2 L 38 0 L 42.0009765625 0 Z M 50.0009765625 0 L 50.0009765625 2 L 46.0009765625 2 L 46.0009765625 0 L 50.0009765625 0 Z M 58.0009765625 0 L 58.0009765625 2 L 54.0009765625 2 L 54.0009765625 0 L 58.0009765625 0 Z M 66.0009765625 0 L 66.0009765625 2 L 62.0009765625 2 L 62.0009765625 0 L 66.0009765625 0 Z M 74.0009765625 0 L 74.0009765625 2 L 70.0009765625 2 L 70.0009765625 0 L 74.0009765625 0 Z M 82.0009765625 0 L 82.0009765625 2 L 78.0009765625 2 L 78.0009765625 0 L 82.0009765625 0 Z M 90.0009765625 0 L 90.0009765625 2 L 86.0009765625 2 L 86.0009765625 0 L 90.0009765625 0 Z M 98.0009765625 0 L 98.0009765625 2 L 94.0009765625 2 L 94.0009765625 0 L 98.0009765625 0 Z M 106.0009765625 0 L 106.0009765625 2 L 102.0009765625 2 L 102.0009765625 0 L 106.0009765625 0 Z M 114.0009765625 0 L 114.0009765625 2 L 110.0009765625 2 L 110.0009765625 0 L 114.0009765625 0 Z M 122.0009765625 0 L 122.0009765625 2 L 118.0009765625 2 L 118.0009765625 0 L 122.0009765625 0 Z M 130.001953125 0 L 130.001953125 2 L 126.001953125 2 L 126.001953125 0 L 130.001953125 0 Z M 138.001953125 0 L 138.001953125 2 L 134.001953125 2 L 134.001953125 0 L 138.001953125 0 Z M 146.001953125 0 L 146.001953125 2 L 142.001953125 2 L 142.001953125 0 L 146.001953125 0 Z M 154.001953125 0 L 154.001953125 2 L 150.001953125 2 L 150.001953125 0 L 154.001953125 0 Z M 162.001953125 0 L 162.001953125 2 L 158.001953125 2 L 158.001953125 0 L 162.001953125 0 Z M 170.001953125 0 L 170.001953125 2 L 166.001953125 2 L 166.001953125 0 L 170.001953125 0 Z M 178.001953125 0 L 178.001953125 2 L 174.001953125 2 L 174.001953125 0 L 178.001953125 0 Z M 186.001953125 0 L 186.001953125 2 L 182.001953125 2 L 182.001953125 0 L 186.001953125 0 Z M 194.001953125 0 L 194.001953125 2 L 190.001953125 2 L 190.001953125 0 L 194.001953125 0 Z M 202.001953125 0 L 202.001953125 2 L 198.001953125 2 L 198.001953125 0 L 202.001953125 0 Z M 210.0029296875 0 L 210.0029296875 2 L 206.001953125 2 L 206.001953125 0 L 210.0029296875 0 Z M 218.0029296875 0 L 218.0029296875 2 L 214.0029296875 2 L 214.0029296875 0 L 218.0029296875 0 Z M 226.0029296875 0 L 226.0029296875 2 L 222.0029296875 2 L 222.0029296875 0 L 226.0029296875 0 Z M 234.0029296875 0 L 234.0029296875 2 L 230.0029296875 2 L 230.0029296875 0 L 234.0029296875 0 Z M 242.0029296875 0 L 242.0029296875 2 L 238.0029296875 2 L 238.0029296875 0 L 242.0029296875 0 Z M 250.0029296875 0 L 250.0029296875 2 L 246.0029296875 2 L 246.0029296875 0 L 250.0029296875 0 Z M 258.0029296875 0 L 258.0029296875 2 L 254.0029296875 2 L 254.0029296875 0 L 258.0029296875 0 Z M 266.0029296875 0 L 266.0029296875 2 L 262.0029296875 2 L 262.0029296875 0 L 266.0029296875 0 Z M 274.0029296875 0 L 274.0029296875 2 L 270.0029296875 2 L 270.0029296875 0 L 274.0029296875 0 Z M 282.0029296875 0 L 282.0029296875 2 L 278.0029296875 2 L 278.0029296875 0 L 282.0029296875 0 Z M 290.00390625 0 L 290.00390625 2 L 286.00390625 2 L 286.00390625 0 L 290.00390625 0 Z M 298.00390625 0 L 298.00390625 2 L 294.00390625 2 L 294.00390625 0 L 298.00390625 0 Z M 306.00390625 0 L 306.00390625 2 L 302.00390625 2 L 302.00390625 0 L 306.00390625 0 Z M 314.00390625 0 L 314.00390625 2 L 310.00390625 2 L 310.00390625 0 L 314.00390625 0 Z M 322.00390625 0 L 322.00390625 2 L 318.00390625 2 L 318.00390625 0 L 322.00390625 0 Z M 330.00390625 0 L 330.00390625 2 L 326.00390625 2 L 326.00390625 0 L 330.00390625 0 Z M 338.00390625 0 L 338.00390625 2 L 334.00390625 2 L 334.00390625 0 L 338.00390625 0 Z M 346.00390625 0 L 346.00390625 2 L 342.00390625 2 L 342.00390625 0 L 346.00390625 0 Z M 354.0048828125 0 L 354.0048828125 2 L 350.0048828125 2 L 350.0048828125 0 L 354.0048828125 0 Z M 362.0048828125 0 L 362.0048828125 2 L 358.0048828125 2 L 358.0048828125 0 L 362.0048828125 0 Z M 370.0048828125 0 L 370.0048828125 2 L 366.0048828125 2 L 366.0048828125 0 L 370.0048828125 0 Z M 378.0048828125 0 L 378.0048828125 2 L 374.0048828125 2 L 374.0048828125 0 L 378.0048828125 0 Z M 386.0048828125 0 L 386.0048828125 2 L 382.0048828125 2 L 382.0048828125 0 L 386.0048828125 0 Z M 394.0048828125 0 L 394.0048828125 2 L 390.0048828125 2 L 390.0048828125 0 L 394.0048828125 0 Z M 402.0048828125 0 L 402.0048828125 2 L 398.0048828125 2 L 398.0048828125 0 L 402.0048828125 0 Z M 410.0048828125 0 L 410.0048828125 2 L 406.0048828125 2 L 406.0048828125 0 L 410.0048828125 0 Z M 418.005859375 0 L 418.005859375 2 L 414.005859375 2 L 414.005859375 0 L 418.005859375 0 Z M 426.005859375 0 L 426.005859375 2 L 422.005859375 2 L 422.005859375 0 L 426.005859375 0 Z M 434.005859375 0 L 434.005859375 2 L 430.005859375 2 L 430.005859375 0 L 434.005859375 0 Z M 442.005859375 0 L 442.005859375 2 L 438.005859375 2 L 438.005859375 0 L 442.005859375 0 Z M 450.005859375 0 L 450.005859375 2 L 446.005859375 2 L 446.005859375 0 L 450.005859375 0 Z M 458.005859375 0 L 458.005859375 2 L 454.005859375 2 L 454.005859375 0 L 458.005859375 0 Z M 466.005859375 0 L 466.005859375 2 L 462.005859375 2 L 462.005859375 0 L 466.005859375 0 Z M 474.005859375 0 L 474.005859375 2 L 470.005859375 2 L 470.005859375 0 L 474.005859375 0 Z M 482.0068359375 0 L 482.0068359375 2 L 478.0068359375 2 L 478.0068359375 0 L 482.0068359375 0 Z M 490.0068359375 0 L 490.0068359375 2 L 486.0068359375 2 L 486.0068359375 0 L 490.0068359375 0 Z M 498.0068359375 0 L 498.0068359375 2 L 494.0068359375 2 L 494.0068359375 0 L 498.0068359375 0 Z M 506.0068359375 0 L 506.0068359375 2 L 502.0068359375 2 L 502.0068359375 0 L 506.0068359375 0 Z M 514.0068359375 0 L 514.0068359375 2 L 510.0068359375 2 L 510.0068359375 0 L 514.0068359375 0 Z M 522.0068359375 0 L 522.0068359375 2 L 518.0068359375 2 L 518.0068359375 0 L 522.0068359375 0 Z M 530.0068359375 0 L 530.0068359375 2 L 526.0068359375 2 L 526.0068359375 0 L 530.0068359375 0 Z M 538.0068359375 0 L 538.0068359375 2 L 534.0068359375 2 L 534.0068359375 0 L 538.0068359375 0 Z M 546.0078125 0 L 546.0078125 2 L 542.0068359375 2 L 542.0068359375 0 L 546.0078125 0 Z M 554.0078125 0 L 554.0078125 2 L 550.0078125 2 L 550.0078125 0 L 554.0078125 0 Z M 562.0078125 0 L 562.0078125 2 L 558.0078125 2 L 558.0078125 0 L 562.0078125 0 Z M 570.0078125 0 L 570.0078125 2 L 566.0078125 2 L 566.0078125 0 L 570.0078125 0 Z M 578.0078125 0 L 578.0078125 2 L 574.0078125 2 L 574.0078125 0 L 578.0078125 0 Z M 586.0078125 0 L 586.0078125 2 L 582.0078125 2 L 582.0078125 0 L 586.0078125 0 Z M 594.0078125 0 L 594.0078125 2 L 590.0078125 2 L 590.0078125 0 L 594.0078125 0 Z M 602.0078125 0 L 602.0078125 2 L 598.0078125 2 L 598.0078125 0 L 602.0078125 0 Z M 608.0078125 0 L 608.0078125 2 L 606.0087890625 2 L 606.0087890625 0 L 608.0078125 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_26_Stroke_
        width: 608
        height: 2
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 479
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_26_Stroke__ShapePath_0
            strokeWidth: 2
            strokeColor: "transparent"
            PathSvg {
                id: line_26_Stroke__PathSvg_0
                path: "M 2 0 L 2 2 L 0 2 L 0 0 L 2 0 Z M 10 0 L 10 2 L 6 2 L 6 0 L 10 0 Z M 18 0 L 18 2 L 14 2 L 14 0 L 18 0 Z M 26 0 L 26 2 L 22 2 L 22 0 L 26 0 Z M 34 0 L 34 2 L 30 2 L 30 0 L 34 0 Z M 42.0009765625 0 L 42.0009765625 2 L 38 2 L 38 0 L 42.0009765625 0 Z M 50.0009765625 0 L 50.0009765625 2 L 46.0009765625 2 L 46.0009765625 0 L 50.0009765625 0 Z M 58.0009765625 0 L 58.0009765625 2 L 54.0009765625 2 L 54.0009765625 0 L 58.0009765625 0 Z M 66.0009765625 0 L 66.0009765625 2 L 62.0009765625 2 L 62.0009765625 0 L 66.0009765625 0 Z M 74.0009765625 0 L 74.0009765625 2 L 70.0009765625 2 L 70.0009765625 0 L 74.0009765625 0 Z M 82.0009765625 0 L 82.0009765625 2 L 78.0009765625 2 L 78.0009765625 0 L 82.0009765625 0 Z M 90.0009765625 0 L 90.0009765625 2 L 86.0009765625 2 L 86.0009765625 0 L 90.0009765625 0 Z M 98.0009765625 0 L 98.0009765625 2 L 94.0009765625 2 L 94.0009765625 0 L 98.0009765625 0 Z M 106.0009765625 0 L 106.0009765625 2 L 102.0009765625 2 L 102.0009765625 0 L 106.0009765625 0 Z M 114.0009765625 0 L 114.0009765625 2 L 110.0009765625 2 L 110.0009765625 0 L 114.0009765625 0 Z M 122.0009765625 0 L 122.0009765625 2 L 118.0009765625 2 L 118.0009765625 0 L 122.0009765625 0 Z M 130.001953125 0 L 130.001953125 2 L 126.001953125 2 L 126.001953125 0 L 130.001953125 0 Z M 138.001953125 0 L 138.001953125 2 L 134.001953125 2 L 134.001953125 0 L 138.001953125 0 Z M 146.001953125 0 L 146.001953125 2 L 142.001953125 2 L 142.001953125 0 L 146.001953125 0 Z M 154.001953125 0 L 154.001953125 2 L 150.001953125 2 L 150.001953125 0 L 154.001953125 0 Z M 162.001953125 0 L 162.001953125 2 L 158.001953125 2 L 158.001953125 0 L 162.001953125 0 Z M 170.001953125 0 L 170.001953125 2 L 166.001953125 2 L 166.001953125 0 L 170.001953125 0 Z M 178.001953125 0 L 178.001953125 2 L 174.001953125 2 L 174.001953125 0 L 178.001953125 0 Z M 186.001953125 0 L 186.001953125 2 L 182.001953125 2 L 182.001953125 0 L 186.001953125 0 Z M 194.001953125 0 L 194.001953125 2 L 190.001953125 2 L 190.001953125 0 L 194.001953125 0 Z M 202.001953125 0 L 202.001953125 2 L 198.001953125 2 L 198.001953125 0 L 202.001953125 0 Z M 210.0029296875 0 L 210.0029296875 2 L 206.001953125 2 L 206.001953125 0 L 210.0029296875 0 Z M 218.0029296875 0 L 218.0029296875 2 L 214.0029296875 2 L 214.0029296875 0 L 218.0029296875 0 Z M 226.0029296875 0 L 226.0029296875 2 L 222.0029296875 2 L 222.0029296875 0 L 226.0029296875 0 Z M 234.0029296875 0 L 234.0029296875 2 L 230.0029296875 2 L 230.0029296875 0 L 234.0029296875 0 Z M 242.0029296875 0 L 242.0029296875 2 L 238.0029296875 2 L 238.0029296875 0 L 242.0029296875 0 Z M 250.0029296875 0 L 250.0029296875 2 L 246.0029296875 2 L 246.0029296875 0 L 250.0029296875 0 Z M 258.0029296875 0 L 258.0029296875 2 L 254.0029296875 2 L 254.0029296875 0 L 258.0029296875 0 Z M 266.0029296875 0 L 266.0029296875 2 L 262.0029296875 2 L 262.0029296875 0 L 266.0029296875 0 Z M 274.0029296875 0 L 274.0029296875 2 L 270.0029296875 2 L 270.0029296875 0 L 274.0029296875 0 Z M 282.0029296875 0 L 282.0029296875 2 L 278.0029296875 2 L 278.0029296875 0 L 282.0029296875 0 Z M 290.00390625 0 L 290.00390625 2 L 286.00390625 2 L 286.00390625 0 L 290.00390625 0 Z M 298.00390625 0 L 298.00390625 2 L 294.00390625 2 L 294.00390625 0 L 298.00390625 0 Z M 306.00390625 0 L 306.00390625 2 L 302.00390625 2 L 302.00390625 0 L 306.00390625 0 Z M 314.00390625 0 L 314.00390625 2 L 310.00390625 2 L 310.00390625 0 L 314.00390625 0 Z M 322.00390625 0 L 322.00390625 2 L 318.00390625 2 L 318.00390625 0 L 322.00390625 0 Z M 330.00390625 0 L 330.00390625 2 L 326.00390625 2 L 326.00390625 0 L 330.00390625 0 Z M 338.00390625 0 L 338.00390625 2 L 334.00390625 2 L 334.00390625 0 L 338.00390625 0 Z M 346.00390625 0 L 346.00390625 2 L 342.00390625 2 L 342.00390625 0 L 346.00390625 0 Z M 354.0048828125 0 L 354.0048828125 2 L 350.0048828125 2 L 350.0048828125 0 L 354.0048828125 0 Z M 362.0048828125 0 L 362.0048828125 2 L 358.0048828125 2 L 358.0048828125 0 L 362.0048828125 0 Z M 370.0048828125 0 L 370.0048828125 2 L 366.0048828125 2 L 366.0048828125 0 L 370.0048828125 0 Z M 378.0048828125 0 L 378.0048828125 2 L 374.0048828125 2 L 374.0048828125 0 L 378.0048828125 0 Z M 386.0048828125 0 L 386.0048828125 2 L 382.0048828125 2 L 382.0048828125 0 L 386.0048828125 0 Z M 394.0048828125 0 L 394.0048828125 2 L 390.0048828125 2 L 390.0048828125 0 L 394.0048828125 0 Z M 402.0048828125 0 L 402.0048828125 2 L 398.0048828125 2 L 398.0048828125 0 L 402.0048828125 0 Z M 410.0048828125 0 L 410.0048828125 2 L 406.0048828125 2 L 406.0048828125 0 L 410.0048828125 0 Z M 418.005859375 0 L 418.005859375 2 L 414.005859375 2 L 414.005859375 0 L 418.005859375 0 Z M 426.005859375 0 L 426.005859375 2 L 422.005859375 2 L 422.005859375 0 L 426.005859375 0 Z M 434.005859375 0 L 434.005859375 2 L 430.005859375 2 L 430.005859375 0 L 434.005859375 0 Z M 442.005859375 0 L 442.005859375 2 L 438.005859375 2 L 438.005859375 0 L 442.005859375 0 Z M 450.005859375 0 L 450.005859375 2 L 446.005859375 2 L 446.005859375 0 L 450.005859375 0 Z M 458.005859375 0 L 458.005859375 2 L 454.005859375 2 L 454.005859375 0 L 458.005859375 0 Z M 466.005859375 0 L 466.005859375 2 L 462.005859375 2 L 462.005859375 0 L 466.005859375 0 Z M 474.005859375 0 L 474.005859375 2 L 470.005859375 2 L 470.005859375 0 L 474.005859375 0 Z M 482.0068359375 0 L 482.0068359375 2 L 478.0068359375 2 L 478.0068359375 0 L 482.0068359375 0 Z M 490.0068359375 0 L 490.0068359375 2 L 486.0068359375 2 L 486.0068359375 0 L 490.0068359375 0 Z M 498.0068359375 0 L 498.0068359375 2 L 494.0068359375 2 L 494.0068359375 0 L 498.0068359375 0 Z M 506.0068359375 0 L 506.0068359375 2 L 502.0068359375 2 L 502.0068359375 0 L 506.0068359375 0 Z M 514.0068359375 0 L 514.0068359375 2 L 510.0068359375 2 L 510.0068359375 0 L 514.0068359375 0 Z M 522.0068359375 0 L 522.0068359375 2 L 518.0068359375 2 L 518.0068359375 0 L 522.0068359375 0 Z M 530.0068359375 0 L 530.0068359375 2 L 526.0068359375 2 L 526.0068359375 0 L 530.0068359375 0 Z M 538.0068359375 0 L 538.0068359375 2 L 534.0068359375 2 L 534.0068359375 0 L 538.0068359375 0 Z M 546.0078125 0 L 546.0078125 2 L 542.0068359375 2 L 542.0068359375 0 L 546.0078125 0 Z M 554.0078125 0 L 554.0078125 2 L 550.0078125 2 L 550.0078125 0 L 554.0078125 0 Z M 562.0078125 0 L 562.0078125 2 L 558.0078125 2 L 558.0078125 0 L 562.0078125 0 Z M 570.0078125 0 L 570.0078125 2 L 566.0078125 2 L 566.0078125 0 L 570.0078125 0 Z M 578.0078125 0 L 578.0078125 2 L 574.0078125 2 L 574.0078125 0 L 578.0078125 0 Z M 586.0078125 0 L 586.0078125 2 L 582.0078125 2 L 582.0078125 0 L 586.0078125 0 Z M 594.0078125 0 L 594.0078125 2 L 590.0078125 2 L 590.0078125 0 L 594.0078125 0 Z M 602.0078125 0 L 602.0078125 2 L 598.0078125 2 L 598.0078125 0 L 602.0078125 0 Z M 608.0078125 0 L 608.0078125 2 L 606.0087890625 2 L 606.0087890625 0 L 608.0078125 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_27_Stroke_
        width: 608
        height: 2
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 599
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_27_Stroke__ShapePath_0
            strokeWidth: 2
            strokeColor: "transparent"
            PathSvg {
                id: line_27_Stroke__PathSvg_0
                path: "M 2 0 L 2 2 L 0 2 L 0 0 L 2 0 Z M 10 0 L 10 2 L 6 2 L 6 0 L 10 0 Z M 18 0 L 18 2 L 14 2 L 14 0 L 18 0 Z M 26 0 L 26 2 L 22 2 L 22 0 L 26 0 Z M 34 0 L 34 2 L 30 2 L 30 0 L 34 0 Z M 42.0009765625 0 L 42.0009765625 2 L 38 2 L 38 0 L 42.0009765625 0 Z M 50.0009765625 0 L 50.0009765625 2 L 46.0009765625 2 L 46.0009765625 0 L 50.0009765625 0 Z M 58.0009765625 0 L 58.0009765625 2 L 54.0009765625 2 L 54.0009765625 0 L 58.0009765625 0 Z M 66.0009765625 0 L 66.0009765625 2 L 62.0009765625 2 L 62.0009765625 0 L 66.0009765625 0 Z M 74.0009765625 0 L 74.0009765625 2 L 70.0009765625 2 L 70.0009765625 0 L 74.0009765625 0 Z M 82.0009765625 0 L 82.0009765625 2 L 78.0009765625 2 L 78.0009765625 0 L 82.0009765625 0 Z M 90.0009765625 0 L 90.0009765625 2 L 86.0009765625 2 L 86.0009765625 0 L 90.0009765625 0 Z M 98.0009765625 0 L 98.0009765625 2 L 94.0009765625 2 L 94.0009765625 0 L 98.0009765625 0 Z M 106.0009765625 0 L 106.0009765625 2 L 102.0009765625 2 L 102.0009765625 0 L 106.0009765625 0 Z M 114.0009765625 0 L 114.0009765625 2 L 110.0009765625 2 L 110.0009765625 0 L 114.0009765625 0 Z M 122.0009765625 0 L 122.0009765625 2 L 118.0009765625 2 L 118.0009765625 0 L 122.0009765625 0 Z M 130.001953125 0 L 130.001953125 2 L 126.001953125 2 L 126.001953125 0 L 130.001953125 0 Z M 138.001953125 0 L 138.001953125 2 L 134.001953125 2 L 134.001953125 0 L 138.001953125 0 Z M 146.001953125 0 L 146.001953125 2 L 142.001953125 2 L 142.001953125 0 L 146.001953125 0 Z M 154.001953125 0 L 154.001953125 2 L 150.001953125 2 L 150.001953125 0 L 154.001953125 0 Z M 162.001953125 0 L 162.001953125 2 L 158.001953125 2 L 158.001953125 0 L 162.001953125 0 Z M 170.001953125 0 L 170.001953125 2 L 166.001953125 2 L 166.001953125 0 L 170.001953125 0 Z M 178.001953125 0 L 178.001953125 2 L 174.001953125 2 L 174.001953125 0 L 178.001953125 0 Z M 186.001953125 0 L 186.001953125 2 L 182.001953125 2 L 182.001953125 0 L 186.001953125 0 Z M 194.001953125 0 L 194.001953125 2 L 190.001953125 2 L 190.001953125 0 L 194.001953125 0 Z M 202.001953125 0 L 202.001953125 2 L 198.001953125 2 L 198.001953125 0 L 202.001953125 0 Z M 210.0029296875 0 L 210.0029296875 2 L 206.001953125 2 L 206.001953125 0 L 210.0029296875 0 Z M 218.0029296875 0 L 218.0029296875 2 L 214.0029296875 2 L 214.0029296875 0 L 218.0029296875 0 Z M 226.0029296875 0 L 226.0029296875 2 L 222.0029296875 2 L 222.0029296875 0 L 226.0029296875 0 Z M 234.0029296875 0 L 234.0029296875 2 L 230.0029296875 2 L 230.0029296875 0 L 234.0029296875 0 Z M 242.0029296875 0 L 242.0029296875 2 L 238.0029296875 2 L 238.0029296875 0 L 242.0029296875 0 Z M 250.0029296875 0 L 250.0029296875 2 L 246.0029296875 2 L 246.0029296875 0 L 250.0029296875 0 Z M 258.0029296875 0 L 258.0029296875 2 L 254.0029296875 2 L 254.0029296875 0 L 258.0029296875 0 Z M 266.0029296875 0 L 266.0029296875 2 L 262.0029296875 2 L 262.0029296875 0 L 266.0029296875 0 Z M 274.0029296875 0 L 274.0029296875 2 L 270.0029296875 2 L 270.0029296875 0 L 274.0029296875 0 Z M 282.0029296875 0 L 282.0029296875 2 L 278.0029296875 2 L 278.0029296875 0 L 282.0029296875 0 Z M 290.00390625 0 L 290.00390625 2 L 286.00390625 2 L 286.00390625 0 L 290.00390625 0 Z M 298.00390625 0 L 298.00390625 2 L 294.00390625 2 L 294.00390625 0 L 298.00390625 0 Z M 306.00390625 0 L 306.00390625 2 L 302.00390625 2 L 302.00390625 0 L 306.00390625 0 Z M 314.00390625 0 L 314.00390625 2 L 310.00390625 2 L 310.00390625 0 L 314.00390625 0 Z M 322.00390625 0 L 322.00390625 2 L 318.00390625 2 L 318.00390625 0 L 322.00390625 0 Z M 330.00390625 0 L 330.00390625 2 L 326.00390625 2 L 326.00390625 0 L 330.00390625 0 Z M 338.00390625 0 L 338.00390625 2 L 334.00390625 2 L 334.00390625 0 L 338.00390625 0 Z M 346.00390625 0 L 346.00390625 2 L 342.00390625 2 L 342.00390625 0 L 346.00390625 0 Z M 354.0048828125 0 L 354.0048828125 2 L 350.0048828125 2 L 350.0048828125 0 L 354.0048828125 0 Z M 362.0048828125 0 L 362.0048828125 2 L 358.0048828125 2 L 358.0048828125 0 L 362.0048828125 0 Z M 370.0048828125 0 L 370.0048828125 2 L 366.0048828125 2 L 366.0048828125 0 L 370.0048828125 0 Z M 378.0048828125 0 L 378.0048828125 2 L 374.0048828125 2 L 374.0048828125 0 L 378.0048828125 0 Z M 386.0048828125 0 L 386.0048828125 2 L 382.0048828125 2 L 382.0048828125 0 L 386.0048828125 0 Z M 394.0048828125 0 L 394.0048828125 2 L 390.0048828125 2 L 390.0048828125 0 L 394.0048828125 0 Z M 402.0048828125 0 L 402.0048828125 2 L 398.0048828125 2 L 398.0048828125 0 L 402.0048828125 0 Z M 410.0048828125 0 L 410.0048828125 2 L 406.0048828125 2 L 406.0048828125 0 L 410.0048828125 0 Z M 418.005859375 0 L 418.005859375 2 L 414.005859375 2 L 414.005859375 0 L 418.005859375 0 Z M 426.005859375 0 L 426.005859375 2 L 422.005859375 2 L 422.005859375 0 L 426.005859375 0 Z M 434.005859375 0 L 434.005859375 2 L 430.005859375 2 L 430.005859375 0 L 434.005859375 0 Z M 442.005859375 0 L 442.005859375 2 L 438.005859375 2 L 438.005859375 0 L 442.005859375 0 Z M 450.005859375 0 L 450.005859375 2 L 446.005859375 2 L 446.005859375 0 L 450.005859375 0 Z M 458.005859375 0 L 458.005859375 2 L 454.005859375 2 L 454.005859375 0 L 458.005859375 0 Z M 466.005859375 0 L 466.005859375 2 L 462.005859375 2 L 462.005859375 0 L 466.005859375 0 Z M 474.005859375 0 L 474.005859375 2 L 470.005859375 2 L 470.005859375 0 L 474.005859375 0 Z M 482.0068359375 0 L 482.0068359375 2 L 478.0068359375 2 L 478.0068359375 0 L 482.0068359375 0 Z M 490.0068359375 0 L 490.0068359375 2 L 486.0068359375 2 L 486.0068359375 0 L 490.0068359375 0 Z M 498.0068359375 0 L 498.0068359375 2 L 494.0068359375 2 L 494.0068359375 0 L 498.0068359375 0 Z M 506.0068359375 0 L 506.0068359375 2 L 502.0068359375 2 L 502.0068359375 0 L 506.0068359375 0 Z M 514.0068359375 0 L 514.0068359375 2 L 510.0068359375 2 L 510.0068359375 0 L 514.0068359375 0 Z M 522.0068359375 0 L 522.0068359375 2 L 518.0068359375 2 L 518.0068359375 0 L 522.0068359375 0 Z M 530.0068359375 0 L 530.0068359375 2 L 526.0068359375 2 L 526.0068359375 0 L 530.0068359375 0 Z M 538.0068359375 0 L 538.0068359375 2 L 534.0068359375 2 L 534.0068359375 0 L 538.0068359375 0 Z M 546.0078125 0 L 546.0078125 2 L 542.0068359375 2 L 542.0068359375 0 L 546.0078125 0 Z M 554.0078125 0 L 554.0078125 2 L 550.0078125 2 L 550.0078125 0 L 554.0078125 0 Z M 562.0078125 0 L 562.0078125 2 L 558.0078125 2 L 558.0078125 0 L 562.0078125 0 Z M 570.0078125 0 L 570.0078125 2 L 566.0078125 2 L 566.0078125 0 L 570.0078125 0 Z M 578.0078125 0 L 578.0078125 2 L 574.0078125 2 L 574.0078125 0 L 578.0078125 0 Z M 586.0078125 0 L 586.0078125 2 L 582.0078125 2 L 582.0078125 0 L 586.0078125 0 Z M 594.0078125 0 L 594.0078125 2 L 590.0078125 2 L 590.0078125 0 L 594.0078125 0 Z M 602.0078125 0 L 602.0078125 2 L 598.0078125 2 L 598.0078125 0 L 602.0078125 0 Z M 608.0078125 0 L 608.0078125 2 L 606.0087890625 2 L 606.0087890625 0 L 608.0078125 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Text {
        id: employee_Name_Lorem_Ipsum
        width: 202
        height: 17
        color: "#4e2d18"
        text: qsTr("Employee Name: Lorem Ipsum")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 419
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: pOS_POS_1
        width: 77
        height: 17
        color: "#4e2d18"
        text: qsTr("POS: POS 1")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 446
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Text {
        id: quantity_2
        width: 73
        height: 17
        color: "#4e2d18"
        text: qsTr("Quantity: 2")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 531
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Light
        font.family: "Inter"
    }

    Text {
        id: size_Venti_120_00_
        width: 136
        height: 17
        color: "#4e2d18"
        text: qsTr("Size: Venti (₱120.00)")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 554
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Light
        font.family: "Inter"
    }

    Text {
        id: strawberry_Latte
        width: 131
        height: 19
        color: "#4e2d18"
        text: qsTr("Strawberry Latte")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 501
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Text {
        id: total
        width: 39
        height: 19
        color: "#4e2d18"
        text: qsTr("Total")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 621
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Text {
        id: gcash
        width: 50
        height: 19
        color: "#4e2d18"
        text: qsTr("Gcash")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 689
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Text {
        id: element11
        width: 82
        height: 24
        color: "#4e2d18"
        text: qsTr("₱120.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1211
        anchors.topMargin: 620
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Text {
        id: element12
        width: 82
        height: 24
        color: "#4e2d18"
        text: qsTr("₱120.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1207
        anchors.topMargin: 500
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Text {
        id: element13
        width: 59
        height: 19
        color: "#4e2d18"
        text: qsTr("₱60.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1226
        anchors.topMargin: 689
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Text {
        id: maya
        width: 43
        height: 19
        color: "#4e2d18"
        text: qsTr("Maya")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 719
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Text {
        id: element14
        width: 59
        height: 19
        color: "#4e2d18"
        text: qsTr("₱60.00")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1226
        anchors.topMargin: 719
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Inter"
    }

    Shape {
        id: line_28_Stroke_
        width: 608
        height: 2
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 666
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_28_Stroke__ShapePath_0
            strokeWidth: 2
            strokeColor: "transparent"
            PathSvg {
                id: line_28_Stroke__PathSvg_0
                path: "M 2 0 L 2 2 L 0 2 L 0 0 L 2 0 Z M 10 0 L 10 2 L 6 2 L 6 0 L 10 0 Z M 18 0 L 18 2 L 14 2 L 14 0 L 18 0 Z M 26 0 L 26 2 L 22 2 L 22 0 L 26 0 Z M 34 0 L 34 2 L 30 2 L 30 0 L 34 0 Z M 42.0009765625 0 L 42.0009765625 2 L 38 2 L 38 0 L 42.0009765625 0 Z M 50.0009765625 0 L 50.0009765625 2 L 46.0009765625 2 L 46.0009765625 0 L 50.0009765625 0 Z M 58.0009765625 0 L 58.0009765625 2 L 54.0009765625 2 L 54.0009765625 0 L 58.0009765625 0 Z M 66.0009765625 0 L 66.0009765625 2 L 62.0009765625 2 L 62.0009765625 0 L 66.0009765625 0 Z M 74.0009765625 0 L 74.0009765625 2 L 70.0009765625 2 L 70.0009765625 0 L 74.0009765625 0 Z M 82.0009765625 0 L 82.0009765625 2 L 78.0009765625 2 L 78.0009765625 0 L 82.0009765625 0 Z M 90.0009765625 0 L 90.0009765625 2 L 86.0009765625 2 L 86.0009765625 0 L 90.0009765625 0 Z M 98.0009765625 0 L 98.0009765625 2 L 94.0009765625 2 L 94.0009765625 0 L 98.0009765625 0 Z M 106.0009765625 0 L 106.0009765625 2 L 102.0009765625 2 L 102.0009765625 0 L 106.0009765625 0 Z M 114.0009765625 0 L 114.0009765625 2 L 110.0009765625 2 L 110.0009765625 0 L 114.0009765625 0 Z M 122.0009765625 0 L 122.0009765625 2 L 118.0009765625 2 L 118.0009765625 0 L 122.0009765625 0 Z M 130.001953125 0 L 130.001953125 2 L 126.001953125 2 L 126.001953125 0 L 130.001953125 0 Z M 138.001953125 0 L 138.001953125 2 L 134.001953125 2 L 134.001953125 0 L 138.001953125 0 Z M 146.001953125 0 L 146.001953125 2 L 142.001953125 2 L 142.001953125 0 L 146.001953125 0 Z M 154.001953125 0 L 154.001953125 2 L 150.001953125 2 L 150.001953125 0 L 154.001953125 0 Z M 162.001953125 0 L 162.001953125 2 L 158.001953125 2 L 158.001953125 0 L 162.001953125 0 Z M 170.001953125 0 L 170.001953125 2 L 166.001953125 2 L 166.001953125 0 L 170.001953125 0 Z M 178.001953125 0 L 178.001953125 2 L 174.001953125 2 L 174.001953125 0 L 178.001953125 0 Z M 186.001953125 0 L 186.001953125 2 L 182.001953125 2 L 182.001953125 0 L 186.001953125 0 Z M 194.001953125 0 L 194.001953125 2 L 190.001953125 2 L 190.001953125 0 L 194.001953125 0 Z M 202.001953125 0 L 202.001953125 2 L 198.001953125 2 L 198.001953125 0 L 202.001953125 0 Z M 210.0029296875 0 L 210.0029296875 2 L 206.001953125 2 L 206.001953125 0 L 210.0029296875 0 Z M 218.0029296875 0 L 218.0029296875 2 L 214.0029296875 2 L 214.0029296875 0 L 218.0029296875 0 Z M 226.0029296875 0 L 226.0029296875 2 L 222.0029296875 2 L 222.0029296875 0 L 226.0029296875 0 Z M 234.0029296875 0 L 234.0029296875 2 L 230.0029296875 2 L 230.0029296875 0 L 234.0029296875 0 Z M 242.0029296875 0 L 242.0029296875 2 L 238.0029296875 2 L 238.0029296875 0 L 242.0029296875 0 Z M 250.0029296875 0 L 250.0029296875 2 L 246.0029296875 2 L 246.0029296875 0 L 250.0029296875 0 Z M 258.0029296875 0 L 258.0029296875 2 L 254.0029296875 2 L 254.0029296875 0 L 258.0029296875 0 Z M 266.0029296875 0 L 266.0029296875 2 L 262.0029296875 2 L 262.0029296875 0 L 266.0029296875 0 Z M 274.0029296875 0 L 274.0029296875 2 L 270.0029296875 2 L 270.0029296875 0 L 274.0029296875 0 Z M 282.0029296875 0 L 282.0029296875 2 L 278.0029296875 2 L 278.0029296875 0 L 282.0029296875 0 Z M 290.00390625 0 L 290.00390625 2 L 286.00390625 2 L 286.00390625 0 L 290.00390625 0 Z M 298.00390625 0 L 298.00390625 2 L 294.00390625 2 L 294.00390625 0 L 298.00390625 0 Z M 306.00390625 0 L 306.00390625 2 L 302.00390625 2 L 302.00390625 0 L 306.00390625 0 Z M 314.00390625 0 L 314.00390625 2 L 310.00390625 2 L 310.00390625 0 L 314.00390625 0 Z M 322.00390625 0 L 322.00390625 2 L 318.00390625 2 L 318.00390625 0 L 322.00390625 0 Z M 330.00390625 0 L 330.00390625 2 L 326.00390625 2 L 326.00390625 0 L 330.00390625 0 Z M 338.00390625 0 L 338.00390625 2 L 334.00390625 2 L 334.00390625 0 L 338.00390625 0 Z M 346.00390625 0 L 346.00390625 2 L 342.00390625 2 L 342.00390625 0 L 346.00390625 0 Z M 354.0048828125 0 L 354.0048828125 2 L 350.0048828125 2 L 350.0048828125 0 L 354.0048828125 0 Z M 362.0048828125 0 L 362.0048828125 2 L 358.0048828125 2 L 358.0048828125 0 L 362.0048828125 0 Z M 370.0048828125 0 L 370.0048828125 2 L 366.0048828125 2 L 366.0048828125 0 L 370.0048828125 0 Z M 378.0048828125 0 L 378.0048828125 2 L 374.0048828125 2 L 374.0048828125 0 L 378.0048828125 0 Z M 386.0048828125 0 L 386.0048828125 2 L 382.0048828125 2 L 382.0048828125 0 L 386.0048828125 0 Z M 394.0048828125 0 L 394.0048828125 2 L 390.0048828125 2 L 390.0048828125 0 L 394.0048828125 0 Z M 402.0048828125 0 L 402.0048828125 2 L 398.0048828125 2 L 398.0048828125 0 L 402.0048828125 0 Z M 410.0048828125 0 L 410.0048828125 2 L 406.0048828125 2 L 406.0048828125 0 L 410.0048828125 0 Z M 418.005859375 0 L 418.005859375 2 L 414.005859375 2 L 414.005859375 0 L 418.005859375 0 Z M 426.005859375 0 L 426.005859375 2 L 422.005859375 2 L 422.005859375 0 L 426.005859375 0 Z M 434.005859375 0 L 434.005859375 2 L 430.005859375 2 L 430.005859375 0 L 434.005859375 0 Z M 442.005859375 0 L 442.005859375 2 L 438.005859375 2 L 438.005859375 0 L 442.005859375 0 Z M 450.005859375 0 L 450.005859375 2 L 446.005859375 2 L 446.005859375 0 L 450.005859375 0 Z M 458.005859375 0 L 458.005859375 2 L 454.005859375 2 L 454.005859375 0 L 458.005859375 0 Z M 466.005859375 0 L 466.005859375 2 L 462.005859375 2 L 462.005859375 0 L 466.005859375 0 Z M 474.005859375 0 L 474.005859375 2 L 470.005859375 2 L 470.005859375 0 L 474.005859375 0 Z M 482.0068359375 0 L 482.0068359375 2 L 478.0068359375 2 L 478.0068359375 0 L 482.0068359375 0 Z M 490.0068359375 0 L 490.0068359375 2 L 486.0068359375 2 L 486.0068359375 0 L 490.0068359375 0 Z M 498.0068359375 0 L 498.0068359375 2 L 494.0068359375 2 L 494.0068359375 0 L 498.0068359375 0 Z M 506.0068359375 0 L 506.0068359375 2 L 502.0068359375 2 L 502.0068359375 0 L 506.0068359375 0 Z M 514.0068359375 0 L 514.0068359375 2 L 510.0068359375 2 L 510.0068359375 0 L 514.0068359375 0 Z M 522.0068359375 0 L 522.0068359375 2 L 518.0068359375 2 L 518.0068359375 0 L 522.0068359375 0 Z M 530.0068359375 0 L 530.0068359375 2 L 526.0068359375 2 L 526.0068359375 0 L 530.0068359375 0 Z M 538.0068359375 0 L 538.0068359375 2 L 534.0068359375 2 L 534.0068359375 0 L 538.0068359375 0 Z M 546.0078125 0 L 546.0078125 2 L 542.0068359375 2 L 542.0068359375 0 L 546.0078125 0 Z M 554.0078125 0 L 554.0078125 2 L 550.0078125 2 L 550.0078125 0 L 554.0078125 0 Z M 562.0078125 0 L 562.0078125 2 L 558.0078125 2 L 558.0078125 0 L 562.0078125 0 Z M 570.0078125 0 L 570.0078125 2 L 566.0078125 2 L 566.0078125 0 L 570.0078125 0 Z M 578.0078125 0 L 578.0078125 2 L 574.0078125 2 L 574.0078125 0 L 578.0078125 0 Z M 586.0078125 0 L 586.0078125 2 L 582.0078125 2 L 582.0078125 0 L 586.0078125 0 Z M 594.0078125 0 L 594.0078125 2 L 590.0078125 2 L 590.0078125 0 L 594.0078125 0 Z M 602.0078125 0 L 602.0078125 2 L 598.0078125 2 L 598.0078125 0 L 602.0078125 0 Z M 608.0078125 0 L 608.0078125 2 L 606.0087890625 2 L 606.0087890625 0 L 608.0078125 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_29_Stroke_
        width: 608
        height: 2
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 674
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_29_Stroke__ShapePath_0
            strokeWidth: 2
            strokeColor: "transparent"
            PathSvg {
                id: line_29_Stroke__PathSvg_0
                path: "M 2 0 L 2 2 L 0 2 L 0 0 L 2 0 Z M 10 0 L 10 2 L 6 2 L 6 0 L 10 0 Z M 18 0 L 18 2 L 14 2 L 14 0 L 18 0 Z M 26 0 L 26 2 L 22 2 L 22 0 L 26 0 Z M 34 0 L 34 2 L 30 2 L 30 0 L 34 0 Z M 42.0009765625 0 L 42.0009765625 2 L 38 2 L 38 0 L 42.0009765625 0 Z M 50.0009765625 0 L 50.0009765625 2 L 46.0009765625 2 L 46.0009765625 0 L 50.0009765625 0 Z M 58.0009765625 0 L 58.0009765625 2 L 54.0009765625 2 L 54.0009765625 0 L 58.0009765625 0 Z M 66.0009765625 0 L 66.0009765625 2 L 62.0009765625 2 L 62.0009765625 0 L 66.0009765625 0 Z M 74.0009765625 0 L 74.0009765625 2 L 70.0009765625 2 L 70.0009765625 0 L 74.0009765625 0 Z M 82.0009765625 0 L 82.0009765625 2 L 78.0009765625 2 L 78.0009765625 0 L 82.0009765625 0 Z M 90.0009765625 0 L 90.0009765625 2 L 86.0009765625 2 L 86.0009765625 0 L 90.0009765625 0 Z M 98.0009765625 0 L 98.0009765625 2 L 94.0009765625 2 L 94.0009765625 0 L 98.0009765625 0 Z M 106.0009765625 0 L 106.0009765625 2 L 102.0009765625 2 L 102.0009765625 0 L 106.0009765625 0 Z M 114.0009765625 0 L 114.0009765625 2 L 110.0009765625 2 L 110.0009765625 0 L 114.0009765625 0 Z M 122.0009765625 0 L 122.0009765625 2 L 118.0009765625 2 L 118.0009765625 0 L 122.0009765625 0 Z M 130.001953125 0 L 130.001953125 2 L 126.001953125 2 L 126.001953125 0 L 130.001953125 0 Z M 138.001953125 0 L 138.001953125 2 L 134.001953125 2 L 134.001953125 0 L 138.001953125 0 Z M 146.001953125 0 L 146.001953125 2 L 142.001953125 2 L 142.001953125 0 L 146.001953125 0 Z M 154.001953125 0 L 154.001953125 2 L 150.001953125 2 L 150.001953125 0 L 154.001953125 0 Z M 162.001953125 0 L 162.001953125 2 L 158.001953125 2 L 158.001953125 0 L 162.001953125 0 Z M 170.001953125 0 L 170.001953125 2 L 166.001953125 2 L 166.001953125 0 L 170.001953125 0 Z M 178.001953125 0 L 178.001953125 2 L 174.001953125 2 L 174.001953125 0 L 178.001953125 0 Z M 186.001953125 0 L 186.001953125 2 L 182.001953125 2 L 182.001953125 0 L 186.001953125 0 Z M 194.001953125 0 L 194.001953125 2 L 190.001953125 2 L 190.001953125 0 L 194.001953125 0 Z M 202.001953125 0 L 202.001953125 2 L 198.001953125 2 L 198.001953125 0 L 202.001953125 0 Z M 210.0029296875 0 L 210.0029296875 2 L 206.001953125 2 L 206.001953125 0 L 210.0029296875 0 Z M 218.0029296875 0 L 218.0029296875 2 L 214.0029296875 2 L 214.0029296875 0 L 218.0029296875 0 Z M 226.0029296875 0 L 226.0029296875 2 L 222.0029296875 2 L 222.0029296875 0 L 226.0029296875 0 Z M 234.0029296875 0 L 234.0029296875 2 L 230.0029296875 2 L 230.0029296875 0 L 234.0029296875 0 Z M 242.0029296875 0 L 242.0029296875 2 L 238.0029296875 2 L 238.0029296875 0 L 242.0029296875 0 Z M 250.0029296875 0 L 250.0029296875 2 L 246.0029296875 2 L 246.0029296875 0 L 250.0029296875 0 Z M 258.0029296875 0 L 258.0029296875 2 L 254.0029296875 2 L 254.0029296875 0 L 258.0029296875 0 Z M 266.0029296875 0 L 266.0029296875 2 L 262.0029296875 2 L 262.0029296875 0 L 266.0029296875 0 Z M 274.0029296875 0 L 274.0029296875 2 L 270.0029296875 2 L 270.0029296875 0 L 274.0029296875 0 Z M 282.0029296875 0 L 282.0029296875 2 L 278.0029296875 2 L 278.0029296875 0 L 282.0029296875 0 Z M 290.00390625 0 L 290.00390625 2 L 286.00390625 2 L 286.00390625 0 L 290.00390625 0 Z M 298.00390625 0 L 298.00390625 2 L 294.00390625 2 L 294.00390625 0 L 298.00390625 0 Z M 306.00390625 0 L 306.00390625 2 L 302.00390625 2 L 302.00390625 0 L 306.00390625 0 Z M 314.00390625 0 L 314.00390625 2 L 310.00390625 2 L 310.00390625 0 L 314.00390625 0 Z M 322.00390625 0 L 322.00390625 2 L 318.00390625 2 L 318.00390625 0 L 322.00390625 0 Z M 330.00390625 0 L 330.00390625 2 L 326.00390625 2 L 326.00390625 0 L 330.00390625 0 Z M 338.00390625 0 L 338.00390625 2 L 334.00390625 2 L 334.00390625 0 L 338.00390625 0 Z M 346.00390625 0 L 346.00390625 2 L 342.00390625 2 L 342.00390625 0 L 346.00390625 0 Z M 354.0048828125 0 L 354.0048828125 2 L 350.0048828125 2 L 350.0048828125 0 L 354.0048828125 0 Z M 362.0048828125 0 L 362.0048828125 2 L 358.0048828125 2 L 358.0048828125 0 L 362.0048828125 0 Z M 370.0048828125 0 L 370.0048828125 2 L 366.0048828125 2 L 366.0048828125 0 L 370.0048828125 0 Z M 378.0048828125 0 L 378.0048828125 2 L 374.0048828125 2 L 374.0048828125 0 L 378.0048828125 0 Z M 386.0048828125 0 L 386.0048828125 2 L 382.0048828125 2 L 382.0048828125 0 L 386.0048828125 0 Z M 394.0048828125 0 L 394.0048828125 2 L 390.0048828125 2 L 390.0048828125 0 L 394.0048828125 0 Z M 402.0048828125 0 L 402.0048828125 2 L 398.0048828125 2 L 398.0048828125 0 L 402.0048828125 0 Z M 410.0048828125 0 L 410.0048828125 2 L 406.0048828125 2 L 406.0048828125 0 L 410.0048828125 0 Z M 418.005859375 0 L 418.005859375 2 L 414.005859375 2 L 414.005859375 0 L 418.005859375 0 Z M 426.005859375 0 L 426.005859375 2 L 422.005859375 2 L 422.005859375 0 L 426.005859375 0 Z M 434.005859375 0 L 434.005859375 2 L 430.005859375 2 L 430.005859375 0 L 434.005859375 0 Z M 442.005859375 0 L 442.005859375 2 L 438.005859375 2 L 438.005859375 0 L 442.005859375 0 Z M 450.005859375 0 L 450.005859375 2 L 446.005859375 2 L 446.005859375 0 L 450.005859375 0 Z M 458.005859375 0 L 458.005859375 2 L 454.005859375 2 L 454.005859375 0 L 458.005859375 0 Z M 466.005859375 0 L 466.005859375 2 L 462.005859375 2 L 462.005859375 0 L 466.005859375 0 Z M 474.005859375 0 L 474.005859375 2 L 470.005859375 2 L 470.005859375 0 L 474.005859375 0 Z M 482.0068359375 0 L 482.0068359375 2 L 478.0068359375 2 L 478.0068359375 0 L 482.0068359375 0 Z M 490.0068359375 0 L 490.0068359375 2 L 486.0068359375 2 L 486.0068359375 0 L 490.0068359375 0 Z M 498.0068359375 0 L 498.0068359375 2 L 494.0068359375 2 L 494.0068359375 0 L 498.0068359375 0 Z M 506.0068359375 0 L 506.0068359375 2 L 502.0068359375 2 L 502.0068359375 0 L 506.0068359375 0 Z M 514.0068359375 0 L 514.0068359375 2 L 510.0068359375 2 L 510.0068359375 0 L 514.0068359375 0 Z M 522.0068359375 0 L 522.0068359375 2 L 518.0068359375 2 L 518.0068359375 0 L 522.0068359375 0 Z M 530.0068359375 0 L 530.0068359375 2 L 526.0068359375 2 L 526.0068359375 0 L 530.0068359375 0 Z M 538.0068359375 0 L 538.0068359375 2 L 534.0068359375 2 L 534.0068359375 0 L 538.0068359375 0 Z M 546.0078125 0 L 546.0078125 2 L 542.0068359375 2 L 542.0068359375 0 L 546.0078125 0 Z M 554.0078125 0 L 554.0078125 2 L 550.0078125 2 L 550.0078125 0 L 554.0078125 0 Z M 562.0078125 0 L 562.0078125 2 L 558.0078125 2 L 558.0078125 0 L 562.0078125 0 Z M 570.0078125 0 L 570.0078125 2 L 566.0078125 2 L 566.0078125 0 L 570.0078125 0 Z M 578.0078125 0 L 578.0078125 2 L 574.0078125 2 L 574.0078125 0 L 578.0078125 0 Z M 586.0078125 0 L 586.0078125 2 L 582.0078125 2 L 582.0078125 0 L 586.0078125 0 Z M 594.0078125 0 L 594.0078125 2 L 590.0078125 2 L 590.0078125 0 L 594.0078125 0 Z M 602.0078125 0 L 602.0078125 2 L 598.0078125 2 L 598.0078125 0 L 602.0078125 0 Z M 608.0078125 0 L 608.0078125 2 L 606.0087890625 2 L 606.0087890625 0 L 608.0078125 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_30_Stroke_
        width: 608
        height: 2
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 761
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_30_Stroke__ShapePath_0
            strokeWidth: 2
            strokeColor: "transparent"
            PathSvg {
                id: line_30_Stroke__PathSvg_0
                path: "M 2 0 L 2 2 L 0 2 L 0 0 L 2 0 Z M 10 0 L 10 2 L 6 2 L 6 0 L 10 0 Z M 18 0 L 18 2 L 14 2 L 14 0 L 18 0 Z M 26 0 L 26 2 L 22 2 L 22 0 L 26 0 Z M 34 0 L 34 2 L 30 2 L 30 0 L 34 0 Z M 42.0009765625 0 L 42.0009765625 2 L 38 2 L 38 0 L 42.0009765625 0 Z M 50.0009765625 0 L 50.0009765625 2 L 46.0009765625 2 L 46.0009765625 0 L 50.0009765625 0 Z M 58.0009765625 0 L 58.0009765625 2 L 54.0009765625 2 L 54.0009765625 0 L 58.0009765625 0 Z M 66.0009765625 0 L 66.0009765625 2 L 62.0009765625 2 L 62.0009765625 0 L 66.0009765625 0 Z M 74.0009765625 0 L 74.0009765625 2 L 70.0009765625 2 L 70.0009765625 0 L 74.0009765625 0 Z M 82.0009765625 0 L 82.0009765625 2 L 78.0009765625 2 L 78.0009765625 0 L 82.0009765625 0 Z M 90.0009765625 0 L 90.0009765625 2 L 86.0009765625 2 L 86.0009765625 0 L 90.0009765625 0 Z M 98.0009765625 0 L 98.0009765625 2 L 94.0009765625 2 L 94.0009765625 0 L 98.0009765625 0 Z M 106.0009765625 0 L 106.0009765625 2 L 102.0009765625 2 L 102.0009765625 0 L 106.0009765625 0 Z M 114.0009765625 0 L 114.0009765625 2 L 110.0009765625 2 L 110.0009765625 0 L 114.0009765625 0 Z M 122.0009765625 0 L 122.0009765625 2 L 118.0009765625 2 L 118.0009765625 0 L 122.0009765625 0 Z M 130.001953125 0 L 130.001953125 2 L 126.001953125 2 L 126.001953125 0 L 130.001953125 0 Z M 138.001953125 0 L 138.001953125 2 L 134.001953125 2 L 134.001953125 0 L 138.001953125 0 Z M 146.001953125 0 L 146.001953125 2 L 142.001953125 2 L 142.001953125 0 L 146.001953125 0 Z M 154.001953125 0 L 154.001953125 2 L 150.001953125 2 L 150.001953125 0 L 154.001953125 0 Z M 162.001953125 0 L 162.001953125 2 L 158.001953125 2 L 158.001953125 0 L 162.001953125 0 Z M 170.001953125 0 L 170.001953125 2 L 166.001953125 2 L 166.001953125 0 L 170.001953125 0 Z M 178.001953125 0 L 178.001953125 2 L 174.001953125 2 L 174.001953125 0 L 178.001953125 0 Z M 186.001953125 0 L 186.001953125 2 L 182.001953125 2 L 182.001953125 0 L 186.001953125 0 Z M 194.001953125 0 L 194.001953125 2 L 190.001953125 2 L 190.001953125 0 L 194.001953125 0 Z M 202.001953125 0 L 202.001953125 2 L 198.001953125 2 L 198.001953125 0 L 202.001953125 0 Z M 210.0029296875 0 L 210.0029296875 2 L 206.001953125 2 L 206.001953125 0 L 210.0029296875 0 Z M 218.0029296875 0 L 218.0029296875 2 L 214.0029296875 2 L 214.0029296875 0 L 218.0029296875 0 Z M 226.0029296875 0 L 226.0029296875 2 L 222.0029296875 2 L 222.0029296875 0 L 226.0029296875 0 Z M 234.0029296875 0 L 234.0029296875 2 L 230.0029296875 2 L 230.0029296875 0 L 234.0029296875 0 Z M 242.0029296875 0 L 242.0029296875 2 L 238.0029296875 2 L 238.0029296875 0 L 242.0029296875 0 Z M 250.0029296875 0 L 250.0029296875 2 L 246.0029296875 2 L 246.0029296875 0 L 250.0029296875 0 Z M 258.0029296875 0 L 258.0029296875 2 L 254.0029296875 2 L 254.0029296875 0 L 258.0029296875 0 Z M 266.0029296875 0 L 266.0029296875 2 L 262.0029296875 2 L 262.0029296875 0 L 266.0029296875 0 Z M 274.0029296875 0 L 274.0029296875 2 L 270.0029296875 2 L 270.0029296875 0 L 274.0029296875 0 Z M 282.0029296875 0 L 282.0029296875 2 L 278.0029296875 2 L 278.0029296875 0 L 282.0029296875 0 Z M 290.00390625 0 L 290.00390625 2 L 286.00390625 2 L 286.00390625 0 L 290.00390625 0 Z M 298.00390625 0 L 298.00390625 2 L 294.00390625 2 L 294.00390625 0 L 298.00390625 0 Z M 306.00390625 0 L 306.00390625 2 L 302.00390625 2 L 302.00390625 0 L 306.00390625 0 Z M 314.00390625 0 L 314.00390625 2 L 310.00390625 2 L 310.00390625 0 L 314.00390625 0 Z M 322.00390625 0 L 322.00390625 2 L 318.00390625 2 L 318.00390625 0 L 322.00390625 0 Z M 330.00390625 0 L 330.00390625 2 L 326.00390625 2 L 326.00390625 0 L 330.00390625 0 Z M 338.00390625 0 L 338.00390625 2 L 334.00390625 2 L 334.00390625 0 L 338.00390625 0 Z M 346.00390625 0 L 346.00390625 2 L 342.00390625 2 L 342.00390625 0 L 346.00390625 0 Z M 354.0048828125 0 L 354.0048828125 2 L 350.0048828125 2 L 350.0048828125 0 L 354.0048828125 0 Z M 362.0048828125 0 L 362.0048828125 2 L 358.0048828125 2 L 358.0048828125 0 L 362.0048828125 0 Z M 370.0048828125 0 L 370.0048828125 2 L 366.0048828125 2 L 366.0048828125 0 L 370.0048828125 0 Z M 378.0048828125 0 L 378.0048828125 2 L 374.0048828125 2 L 374.0048828125 0 L 378.0048828125 0 Z M 386.0048828125 0 L 386.0048828125 2 L 382.0048828125 2 L 382.0048828125 0 L 386.0048828125 0 Z M 394.0048828125 0 L 394.0048828125 2 L 390.0048828125 2 L 390.0048828125 0 L 394.0048828125 0 Z M 402.0048828125 0 L 402.0048828125 2 L 398.0048828125 2 L 398.0048828125 0 L 402.0048828125 0 Z M 410.0048828125 0 L 410.0048828125 2 L 406.0048828125 2 L 406.0048828125 0 L 410.0048828125 0 Z M 418.005859375 0 L 418.005859375 2 L 414.005859375 2 L 414.005859375 0 L 418.005859375 0 Z M 426.005859375 0 L 426.005859375 2 L 422.005859375 2 L 422.005859375 0 L 426.005859375 0 Z M 434.005859375 0 L 434.005859375 2 L 430.005859375 2 L 430.005859375 0 L 434.005859375 0 Z M 442.005859375 0 L 442.005859375 2 L 438.005859375 2 L 438.005859375 0 L 442.005859375 0 Z M 450.005859375 0 L 450.005859375 2 L 446.005859375 2 L 446.005859375 0 L 450.005859375 0 Z M 458.005859375 0 L 458.005859375 2 L 454.005859375 2 L 454.005859375 0 L 458.005859375 0 Z M 466.005859375 0 L 466.005859375 2 L 462.005859375 2 L 462.005859375 0 L 466.005859375 0 Z M 474.005859375 0 L 474.005859375 2 L 470.005859375 2 L 470.005859375 0 L 474.005859375 0 Z M 482.0068359375 0 L 482.0068359375 2 L 478.0068359375 2 L 478.0068359375 0 L 482.0068359375 0 Z M 490.0068359375 0 L 490.0068359375 2 L 486.0068359375 2 L 486.0068359375 0 L 490.0068359375 0 Z M 498.0068359375 0 L 498.0068359375 2 L 494.0068359375 2 L 494.0068359375 0 L 498.0068359375 0 Z M 506.0068359375 0 L 506.0068359375 2 L 502.0068359375 2 L 502.0068359375 0 L 506.0068359375 0 Z M 514.0068359375 0 L 514.0068359375 2 L 510.0068359375 2 L 510.0068359375 0 L 514.0068359375 0 Z M 522.0068359375 0 L 522.0068359375 2 L 518.0068359375 2 L 518.0068359375 0 L 522.0068359375 0 Z M 530.0068359375 0 L 530.0068359375 2 L 526.0068359375 2 L 526.0068359375 0 L 530.0068359375 0 Z M 538.0068359375 0 L 538.0068359375 2 L 534.0068359375 2 L 534.0068359375 0 L 538.0068359375 0 Z M 546.0078125 0 L 546.0078125 2 L 542.0068359375 2 L 542.0068359375 0 L 546.0078125 0 Z M 554.0078125 0 L 554.0078125 2 L 550.0078125 2 L 550.0078125 0 L 554.0078125 0 Z M 562.0078125 0 L 562.0078125 2 L 558.0078125 2 L 558.0078125 0 L 562.0078125 0 Z M 570.0078125 0 L 570.0078125 2 L 566.0078125 2 L 566.0078125 0 L 570.0078125 0 Z M 578.0078125 0 L 578.0078125 2 L 574.0078125 2 L 574.0078125 0 L 578.0078125 0 Z M 586.0078125 0 L 586.0078125 2 L 582.0078125 2 L 582.0078125 0 L 586.0078125 0 Z M 594.0078125 0 L 594.0078125 2 L 590.0078125 2 L 590.0078125 0 L 594.0078125 0 Z M 602.0078125 0 L 602.0078125 2 L 598.0078125 2 L 598.0078125 0 L 602.0078125 0 Z M 608.0078125 0 L 608.0078125 2 L 606.0087890625 2 L 606.0087890625 0 L 608.0078125 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Shape {
        id: line_31_Stroke_
        width: 608
        height: 2
        opacity: 0.5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 769
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_31_Stroke__ShapePath_0
            strokeWidth: 2
            strokeColor: "transparent"
            PathSvg {
                id: line_31_Stroke__PathSvg_0
                path: "M 2 0 L 2 2 L 0 2 L 0 0 L 2 0 Z M 10 0 L 10 2 L 6 2 L 6 0 L 10 0 Z M 18 0 L 18 2 L 14 2 L 14 0 L 18 0 Z M 26 0 L 26 2 L 22 2 L 22 0 L 26 0 Z M 34 0 L 34 2 L 30 2 L 30 0 L 34 0 Z M 42.0009765625 0 L 42.0009765625 2 L 38 2 L 38 0 L 42.0009765625 0 Z M 50.0009765625 0 L 50.0009765625 2 L 46.0009765625 2 L 46.0009765625 0 L 50.0009765625 0 Z M 58.0009765625 0 L 58.0009765625 2 L 54.0009765625 2 L 54.0009765625 0 L 58.0009765625 0 Z M 66.0009765625 0 L 66.0009765625 2 L 62.0009765625 2 L 62.0009765625 0 L 66.0009765625 0 Z M 74.0009765625 0 L 74.0009765625 2 L 70.0009765625 2 L 70.0009765625 0 L 74.0009765625 0 Z M 82.0009765625 0 L 82.0009765625 2 L 78.0009765625 2 L 78.0009765625 0 L 82.0009765625 0 Z M 90.0009765625 0 L 90.0009765625 2 L 86.0009765625 2 L 86.0009765625 0 L 90.0009765625 0 Z M 98.0009765625 0 L 98.0009765625 2 L 94.0009765625 2 L 94.0009765625 0 L 98.0009765625 0 Z M 106.0009765625 0 L 106.0009765625 2 L 102.0009765625 2 L 102.0009765625 0 L 106.0009765625 0 Z M 114.0009765625 0 L 114.0009765625 2 L 110.0009765625 2 L 110.0009765625 0 L 114.0009765625 0 Z M 122.0009765625 0 L 122.0009765625 2 L 118.0009765625 2 L 118.0009765625 0 L 122.0009765625 0 Z M 130.001953125 0 L 130.001953125 2 L 126.001953125 2 L 126.001953125 0 L 130.001953125 0 Z M 138.001953125 0 L 138.001953125 2 L 134.001953125 2 L 134.001953125 0 L 138.001953125 0 Z M 146.001953125 0 L 146.001953125 2 L 142.001953125 2 L 142.001953125 0 L 146.001953125 0 Z M 154.001953125 0 L 154.001953125 2 L 150.001953125 2 L 150.001953125 0 L 154.001953125 0 Z M 162.001953125 0 L 162.001953125 2 L 158.001953125 2 L 158.001953125 0 L 162.001953125 0 Z M 170.001953125 0 L 170.001953125 2 L 166.001953125 2 L 166.001953125 0 L 170.001953125 0 Z M 178.001953125 0 L 178.001953125 2 L 174.001953125 2 L 174.001953125 0 L 178.001953125 0 Z M 186.001953125 0 L 186.001953125 2 L 182.001953125 2 L 182.001953125 0 L 186.001953125 0 Z M 194.001953125 0 L 194.001953125 2 L 190.001953125 2 L 190.001953125 0 L 194.001953125 0 Z M 202.001953125 0 L 202.001953125 2 L 198.001953125 2 L 198.001953125 0 L 202.001953125 0 Z M 210.0029296875 0 L 210.0029296875 2 L 206.001953125 2 L 206.001953125 0 L 210.0029296875 0 Z M 218.0029296875 0 L 218.0029296875 2 L 214.0029296875 2 L 214.0029296875 0 L 218.0029296875 0 Z M 226.0029296875 0 L 226.0029296875 2 L 222.0029296875 2 L 222.0029296875 0 L 226.0029296875 0 Z M 234.0029296875 0 L 234.0029296875 2 L 230.0029296875 2 L 230.0029296875 0 L 234.0029296875 0 Z M 242.0029296875 0 L 242.0029296875 2 L 238.0029296875 2 L 238.0029296875 0 L 242.0029296875 0 Z M 250.0029296875 0 L 250.0029296875 2 L 246.0029296875 2 L 246.0029296875 0 L 250.0029296875 0 Z M 258.0029296875 0 L 258.0029296875 2 L 254.0029296875 2 L 254.0029296875 0 L 258.0029296875 0 Z M 266.0029296875 0 L 266.0029296875 2 L 262.0029296875 2 L 262.0029296875 0 L 266.0029296875 0 Z M 274.0029296875 0 L 274.0029296875 2 L 270.0029296875 2 L 270.0029296875 0 L 274.0029296875 0 Z M 282.0029296875 0 L 282.0029296875 2 L 278.0029296875 2 L 278.0029296875 0 L 282.0029296875 0 Z M 290.00390625 0 L 290.00390625 2 L 286.00390625 2 L 286.00390625 0 L 290.00390625 0 Z M 298.00390625 0 L 298.00390625 2 L 294.00390625 2 L 294.00390625 0 L 298.00390625 0 Z M 306.00390625 0 L 306.00390625 2 L 302.00390625 2 L 302.00390625 0 L 306.00390625 0 Z M 314.00390625 0 L 314.00390625 2 L 310.00390625 2 L 310.00390625 0 L 314.00390625 0 Z M 322.00390625 0 L 322.00390625 2 L 318.00390625 2 L 318.00390625 0 L 322.00390625 0 Z M 330.00390625 0 L 330.00390625 2 L 326.00390625 2 L 326.00390625 0 L 330.00390625 0 Z M 338.00390625 0 L 338.00390625 2 L 334.00390625 2 L 334.00390625 0 L 338.00390625 0 Z M 346.00390625 0 L 346.00390625 2 L 342.00390625 2 L 342.00390625 0 L 346.00390625 0 Z M 354.0048828125 0 L 354.0048828125 2 L 350.0048828125 2 L 350.0048828125 0 L 354.0048828125 0 Z M 362.0048828125 0 L 362.0048828125 2 L 358.0048828125 2 L 358.0048828125 0 L 362.0048828125 0 Z M 370.0048828125 0 L 370.0048828125 2 L 366.0048828125 2 L 366.0048828125 0 L 370.0048828125 0 Z M 378.0048828125 0 L 378.0048828125 2 L 374.0048828125 2 L 374.0048828125 0 L 378.0048828125 0 Z M 386.0048828125 0 L 386.0048828125 2 L 382.0048828125 2 L 382.0048828125 0 L 386.0048828125 0 Z M 394.0048828125 0 L 394.0048828125 2 L 390.0048828125 2 L 390.0048828125 0 L 394.0048828125 0 Z M 402.0048828125 0 L 402.0048828125 2 L 398.0048828125 2 L 398.0048828125 0 L 402.0048828125 0 Z M 410.0048828125 0 L 410.0048828125 2 L 406.0048828125 2 L 406.0048828125 0 L 410.0048828125 0 Z M 418.005859375 0 L 418.005859375 2 L 414.005859375 2 L 414.005859375 0 L 418.005859375 0 Z M 426.005859375 0 L 426.005859375 2 L 422.005859375 2 L 422.005859375 0 L 426.005859375 0 Z M 434.005859375 0 L 434.005859375 2 L 430.005859375 2 L 430.005859375 0 L 434.005859375 0 Z M 442.005859375 0 L 442.005859375 2 L 438.005859375 2 L 438.005859375 0 L 442.005859375 0 Z M 450.005859375 0 L 450.005859375 2 L 446.005859375 2 L 446.005859375 0 L 450.005859375 0 Z M 458.005859375 0 L 458.005859375 2 L 454.005859375 2 L 454.005859375 0 L 458.005859375 0 Z M 466.005859375 0 L 466.005859375 2 L 462.005859375 2 L 462.005859375 0 L 466.005859375 0 Z M 474.005859375 0 L 474.005859375 2 L 470.005859375 2 L 470.005859375 0 L 474.005859375 0 Z M 482.0068359375 0 L 482.0068359375 2 L 478.0068359375 2 L 478.0068359375 0 L 482.0068359375 0 Z M 490.0068359375 0 L 490.0068359375 2 L 486.0068359375 2 L 486.0068359375 0 L 490.0068359375 0 Z M 498.0068359375 0 L 498.0068359375 2 L 494.0068359375 2 L 494.0068359375 0 L 498.0068359375 0 Z M 506.0068359375 0 L 506.0068359375 2 L 502.0068359375 2 L 502.0068359375 0 L 506.0068359375 0 Z M 514.0068359375 0 L 514.0068359375 2 L 510.0068359375 2 L 510.0068359375 0 L 514.0068359375 0 Z M 522.0068359375 0 L 522.0068359375 2 L 518.0068359375 2 L 518.0068359375 0 L 522.0068359375 0 Z M 530.0068359375 0 L 530.0068359375 2 L 526.0068359375 2 L 526.0068359375 0 L 530.0068359375 0 Z M 538.0068359375 0 L 538.0068359375 2 L 534.0068359375 2 L 534.0068359375 0 L 538.0068359375 0 Z M 546.0078125 0 L 546.0078125 2 L 542.0068359375 2 L 542.0068359375 0 L 546.0078125 0 Z M 554.0078125 0 L 554.0078125 2 L 550.0078125 2 L 550.0078125 0 L 554.0078125 0 Z M 562.0078125 0 L 562.0078125 2 L 558.0078125 2 L 558.0078125 0 L 562.0078125 0 Z M 570.0078125 0 L 570.0078125 2 L 566.0078125 2 L 566.0078125 0 L 570.0078125 0 Z M 578.0078125 0 L 578.0078125 2 L 574.0078125 2 L 574.0078125 0 L 578.0078125 0 Z M 586.0078125 0 L 586.0078125 2 L 582.0078125 2 L 582.0078125 0 L 586.0078125 0 Z M 594.0078125 0 L 594.0078125 2 L 590.0078125 2 L 590.0078125 0 L 594.0078125 0 Z M 602.0078125 0 L 602.0078125 2 L 598.0078125 2 L 598.0078125 0 L 602.0078125 0 Z M 608.0078125 0 L 608.0078125 2 L 606.0087890625 2 L 606.0087890625 0 L 608.0078125 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }

    Text {
        id: pm1
        width: 158
        height: 19
        color: "#804e2d18"
        text: qsTr("25/05/2025 5:06 pm")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 677
        anchors.topMargin: 792
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Inter"
    }

    Item {
        id: nav
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 1338
        anchors.topMargin: 3
        anchors.bottomMargin: -3
        Image {
            id: rectangle_14
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_14_13.png"
        }

        Image {
            id: rectangle_44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_44_9.png"
        }

        Rectangle {
            id: rectangle_43
            width: 83
            height: 97
            color: "#424d2d18"
            radius: 12
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 9
            anchors.topMargin: 338
        }

        Item {
            id: group_100
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
            id: group_97
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

        Item {
            id: group_101
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 688
            anchors.bottomMargin: 267
            Text {
                id: dash_board
                width: 103
                height: 34
                color: "#4d2d18"
                text: qsTr("Dash\nboard")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 35
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
            }

            Bar_chart_2 {
                id: bar_chart_2
                width: 28
                height: 29
                anchors.top: parent.top
                state: "size_48"
                clip: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
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

        Text {
            id: receipts
            width: 85
            height: 20
            color: "#4e2d18"
            text: qsTr("Receipts")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 9
            anchors.topMargin: 395
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        List {
            id: element15
            width: 34
            height: 28
            anchors.top: parent.top
            anchors.topMargin: 362
            state: "size_48"
            clip: true
            anchors.horizontalCenterOffset: -3
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: group_99
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
            id: group_98
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

    Image {
        id: purchase_Order
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 297
        anchors.topMargin: 808
        source: "assets/purchase_Order.png"
    }

    Image {
        id: debit_Card
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 170
        anchors.topMargin: 712
        source: "assets/debit_Card.png"
    }

    Image {
        id: search
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 286
        anchors.topMargin: 503
        source: "assets/search.png"
    }

    Image {
        id: search1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 344
        anchors.topMargin: 754
        source: "assets/search1.png"
    }
}

/*##^##
Designer {
    D{i:0;uuid:"df0b2a94-ca7c-5c60-92b7-3c9af6692e9a"}D{i:1;uuid:"7831c404-242e-59c0-b391-e0d1b92a143e"}
D{i:2;uuid:"9e9a2d86-fa4f-5299-a349-78c66c6302fd"}D{i:3;uuid:"d4e5c7b7-1acd-505d-872f-575ad2bae95a"}
D{i:4;uuid:"5bf43802-b48f-583e-b881-2494c51fc764"}D{i:5;uuid:"c4449c20-5b94-5cb9-a47f-318f7b3c6c9d"}
D{i:6;uuid:"bcb36967-fd6e-57af-9c4a-3c8b07132e1a"}D{i:7;uuid:"e63a16eb-9c81-5d5e-8429-eaa444be4bc8"}
D{i:8;uuid:"347211a6-205f-5ffc-84d9-598be1784f38"}D{i:9;uuid:"3a74489e-5aa3-509c-902a-99f38e9e76fd"}
D{i:10;uuid:"171c0281-9b56-557c-a69e-65a08f9ebd21"}D{i:11;uuid:"ba52e920-4979-5069-9025-7331afb73fdd"}
D{i:12;uuid:"70370e82-9f4d-5f33-abcb-cabdca38bbb4"}D{i:13;uuid:"c2098730-12b4-5246-858e-b13d6ecdaf2b"}
D{i:14;uuid:"7d0b7888-5e0c-5671-8c9d-70b2e083cb8b"}D{i:15;uuid:"7d0b7888-5e0c-5671-8c9d-70b2e083cb8b_ShapePath_0"}
D{i:16;uuid:"7d0b7888-5e0c-5671-8c9d-70b2e083cb8b-PathSvg_0"}D{i:17;uuid:"09bb1761-3b2c-55e4-ad76-96057f125b08"}
D{i:18;uuid:"09bb1761-3b2c-55e4-ad76-96057f125b08_ShapePath_0"}D{i:19;uuid:"09bb1761-3b2c-55e4-ad76-96057f125b08-PathSvg_0"}
D{i:20;uuid:"6de764af-cd25-5621-b3f7-22b9565f3424"}D{i:21;uuid:"6de764af-cd25-5621-b3f7-22b9565f3424_ShapePath_0"}
D{i:22;uuid:"6de764af-cd25-5621-b3f7-22b9565f3424-PathSvg_0"}D{i:23;uuid:"e17bd481-d10a-5c0e-982b-13dd22a2dc8b"}
D{i:24;uuid:"e17bd481-d10a-5c0e-982b-13dd22a2dc8b_ShapePath_0"}D{i:25;uuid:"e17bd481-d10a-5c0e-982b-13dd22a2dc8b-PathSvg_0"}
D{i:26;uuid:"c066e834-34f2-5a73-9874-82b8b2d2f62a"}D{i:27;uuid:"c066e834-34f2-5a73-9874-82b8b2d2f62a_ShapePath_0"}
D{i:28;uuid:"c066e834-34f2-5a73-9874-82b8b2d2f62a-PathSvg_0"}D{i:29;uuid:"a7aca931-ed81-5d73-bf8a-4afed1282b96"}
D{i:30;uuid:"a7aca931-ed81-5d73-bf8a-4afed1282b96_ShapePath_0"}D{i:31;uuid:"a7aca931-ed81-5d73-bf8a-4afed1282b96-PathSvg_0"}
D{i:32;uuid:"afb664a0-7728-5e9c-b1b9-b9fe1f16da80"}D{i:33;uuid:"afb664a0-7728-5e9c-b1b9-b9fe1f16da80_ShapePath_0"}
D{i:34;uuid:"afb664a0-7728-5e9c-b1b9-b9fe1f16da80-PathSvg_0"}D{i:35;uuid:"f45bf1a3-fb01-59fd-a637-d22458d04fb6"}
D{i:36;uuid:"f45bf1a3-fb01-59fd-a637-d22458d04fb6_ShapePath_0"}D{i:37;uuid:"f45bf1a3-fb01-59fd-a637-d22458d04fb6-PathSvg_0"}
D{i:38;uuid:"1857c481-1832-5583-b937-aa3929b6fcdd"}D{i:39;uuid:"1857c481-1832-5583-b937-aa3929b6fcdd_ShapePath_0"}
D{i:40;uuid:"1857c481-1832-5583-b937-aa3929b6fcdd-PathSvg_0"}D{i:41;uuid:"a565484c-5e1f-55d6-802b-f6181ea75663"}
D{i:42;uuid:"a565484c-5e1f-55d6-802b-f6181ea75663_ShapePath_0"}D{i:43;uuid:"a565484c-5e1f-55d6-802b-f6181ea75663-PathSvg_0"}
D{i:44;uuid:"9767af50-70e9-5ae5-b111-849f3bb04f3e"}D{i:45;uuid:"835f4df8-29e6-555e-96ef-057e6dda8aa6"}
D{i:46;uuid:"6268e8d2-3db2-5b62-8827-fe6a62206547"}D{i:47;uuid:"4efe327f-c410-53b2-a603-8dd476db8489"}
D{i:48;uuid:"ed291094-ff63-52d7-af47-bb946dbfb8c9"}D{i:49;uuid:"cab5b5d7-e1ba-5311-a157-2dc766d0e87a"}
D{i:50;uuid:"522abf81-70c8-52dd-98f0-5b88ed8968ba"}D{i:51;uuid:"8bfb9ac6-961d-5a65-b590-c26c0b757785"}
D{i:52;uuid:"b87cc247-ee66-559a-bf3e-de99ccbec7ca"}D{i:53;uuid:"dc5aba49-b804-5a0d-bde4-96b89698de01"}
D{i:54;uuid:"8e0b01d5-e06f-55d2-9c08-8f8b58c80987"}D{i:55;uuid:"8a090906-3401-51cb-b45b-e38bfcdf1281"}
D{i:56;uuid:"d79dd90b-ab81-5843-a593-5c964e03d06c"}D{i:57;uuid:"6a3bc0f8-cfaa-5d14-b37b-0d165f173163"}
D{i:58;uuid:"c6b8363c-5b19-5a37-8a5f-8efca9d2bfe6"}D{i:59;uuid:"d3ea39ad-fba0-5f20-b3cc-43d7c5b916f6"}
D{i:60;uuid:"6477b894-ec9b-578a-8e2e-9f480643ed2a"}D{i:61;uuid:"1230008f-a658-53ca-b71c-620025d693ac"}
D{i:62;uuid:"edf05d29-374a-5ffe-ac2f-5d2946f6b42f"}D{i:63;uuid:"edf05d29-374a-5ffe-ac2f-5d2946f6b42f_ShapePath_0"}
D{i:64;uuid:"edf05d29-374a-5ffe-ac2f-5d2946f6b42f-PathSvg_0"}D{i:65;uuid:"2a91e8ed-f020-54b5-b9f0-156a92ed5927"}
D{i:66;uuid:"2a91e8ed-f020-54b5-b9f0-156a92ed5927_ShapePath_0"}D{i:67;uuid:"2a91e8ed-f020-54b5-b9f0-156a92ed5927-PathSvg_0"}
D{i:68;uuid:"1baf7988-bc50-52a4-8638-10a61048e6cc"}D{i:69;uuid:"1baf7988-bc50-52a4-8638-10a61048e6cc_ShapePath_0"}
D{i:70;uuid:"1baf7988-bc50-52a4-8638-10a61048e6cc-PathSvg_0"}D{i:71;uuid:"d73ba396-f760-5c9d-a4d8-0ea2bc7583ff"}
D{i:72;uuid:"c8779251-7be2-5286-9820-9f18e5930fde"}D{i:73;uuid:"02b36ba9-615b-5810-b164-f7a87732f334"}
D{i:74;uuid:"62e21a88-5d9f-52da-b0fa-f038fc16f666"}D{i:75;uuid:"80ea224c-baea-5dc4-8e24-58d3e2324fdf"}
D{i:76;uuid:"bb5d1577-0f08-5a4b-abb1-a2718fb53244"}D{i:77;uuid:"64aaeda7-d5f9-5d47-a677-ca28b30edb51"}
D{i:78;uuid:"e1282cb9-290e-5968-87eb-05f5bcb64eaa"}D{i:79;uuid:"495c77b2-8074-5c9e-ac74-05c37582f88c"}
D{i:80;uuid:"35aa9028-3539-562f-b652-cdb453c834ec"}D{i:81;uuid:"5933a65e-48ea-52c7-8554-ea8222e16d37"}
D{i:82;uuid:"ec60f67d-306f-5b08-b65f-abf34dfd7a74"}D{i:83;uuid:"34b9434a-96a7-5b9d-a287-db96f7997289"}
D{i:84;uuid:"34b9434a-96a7-5b9d-a287-db96f7997289_ShapePath_0"}D{i:85;uuid:"34b9434a-96a7-5b9d-a287-db96f7997289-PathSvg_0"}
D{i:86;uuid:"0fd39af2-9b6a-582d-956b-e05ce6acf337"}D{i:87;uuid:"0fd39af2-9b6a-582d-956b-e05ce6acf337_ShapePath_0"}
D{i:88;uuid:"0fd39af2-9b6a-582d-956b-e05ce6acf337-PathSvg_0"}D{i:89;uuid:"eea2b1ab-18fc-50f9-9920-515cfaa3a36c"}
D{i:90;uuid:"eea2b1ab-18fc-50f9-9920-515cfaa3a36c_ShapePath_0"}D{i:91;uuid:"eea2b1ab-18fc-50f9-9920-515cfaa3a36c-PathSvg_0"}
D{i:92;uuid:"e43dae0f-7d1c-506a-8817-a217c624b713"}D{i:93;uuid:"e43dae0f-7d1c-506a-8817-a217c624b713_ShapePath_0"}
D{i:94;uuid:"e43dae0f-7d1c-506a-8817-a217c624b713-PathSvg_0"}D{i:95;uuid:"c6250b3f-aad0-59af-ae67-18fcd7e83c99"}
D{i:96;uuid:"32ad3bc1-03ae-556e-9b29-575c74dd92f5"}D{i:97;uuid:"d0564c6e-5feb-5ab8-b014-242578b7829d"}
D{i:98;uuid:"c5548d22-3858-5a62-94c7-9f3b6649b3c7"}D{i:99;uuid:"a2ce3ffc-1cec-5ff2-861f-8177a1da0e79"}
D{i:100;uuid:"2d0ac6b1-45ae-5891-8789-a28eb2d0aade"}D{i:101;uuid:"c34a2609-8269-58b7-a80f-6c6da2069230"}
D{i:102;uuid:"93d880de-a40a-578b-a6f6-d111343227fc"}D{i:103;uuid:"7ee73f9c-bfc3-56a2-8d66-e5dd3ecd8b37"}
D{i:104;uuid:"d8f9c5ca-b5b5-59f3-838b-f12adb2c6338"}D{i:105;uuid:"fafc5086-2e96-5532-a3bd-7a4c7d96109b"}
D{i:106;uuid:"d2f39209-2498-5b65-9237-d4ec6b93bb39"}D{i:107;uuid:"927ce686-4319-58f0-8e0a-530f9fa80d73"}
D{i:108;uuid:"2b05f0db-1e8f-5d41-ba2a-249a57ea782e"}D{i:109;uuid:"03b77796-2996-5c90-b1fb-f91a776d0bb4"}
D{i:110;uuid:"0e324073-67aa-59b6-99a0-5519449605e3"}D{i:111;uuid:"ae30713e-9e57-519e-bb10-3df7c3fd978e"}
D{i:112;uuid:"227c5501-9d18-5083-ad58-0e6e73e6dd43"}D{i:113;uuid:"4af31c46-8c99-5449-b04d-02edfd40676d"}
D{i:114;uuid:"dc3ee4ab-062d-52b8-8ec2-bed612808a3b"}D{i:115;uuid:"c8c55244-8a62-572a-9b3d-9e617b59261b"}
D{i:116;uuid:"03779cf2-b8ce-5872-bc56-c39cc8712682"}D{i:117;uuid:"3111e1f1-1d29-57aa-b59d-2818b067b027"}
D{i:118;uuid:"3111e1f1-1d29-57aa-b59d-2818b067b027_ShapePath_0"}D{i:119;uuid:"3111e1f1-1d29-57aa-b59d-2818b067b027-PathSvg_0"}
D{i:120;uuid:"34358ff4-95ed-5b4f-8676-b43c1156931a"}D{i:121;uuid:"69c4aa43-9fde-5a7a-8280-0587b8ccfac8"}
D{i:122;uuid:"ffdc88d6-b630-5cd8-a524-6bc188167e1f"}D{i:123;uuid:"fc1ff6ca-49c6-5e72-88ac-a4e89667d05d"}
D{i:124;uuid:"de9b3f7c-b422-5add-94a8-b5f029bc2b1e"}D{i:125;uuid:"54c72af7-a6c7-51d8-b11b-54057c4dfa07"}
D{i:126;uuid:"023f4327-5b65-5eeb-a84c-2553af4794a8"}
}
##^##*/

