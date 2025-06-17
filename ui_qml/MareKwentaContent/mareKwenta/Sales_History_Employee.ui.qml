import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: sales_History_Employee
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
    property alias element11Text: element11.text
    property alias receiptsText: receipts.text
    property alias mKText: mK.text
    property alias saturday_25_May_2026Text: saturday_25_May_2026.text
    property alias element10Text: element10.text
    property alias sales_HistoryText: sales_History.text
    property alias gcashText: gcash.text
    property alias element7Text: element7.text
    property alias cash_BoxText: cash_Box.text
    property alias totalText: total.text
    property alias saturday_25_May_2025Text: saturday_25_May_2025.text
    property alias am1Text: am1.text
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
        id: sales_History
        width: 304
        height: 45
        color: "#4e2d18"
        text: qsTr("Sales History")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 33
        font.pixelSize: 36
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Bold
        font.family: "Unbounded"
    }

    Item {
        id: receiptList
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 142
        anchors.rightMargin: 914
        anchors.topMargin: 107
        anchors.bottomMargin: 44
        Image {
            id: rectangle_46
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            source: "assets/rectangle_46_4.png"
        }

        Text {
            id: saturday_25_May_2025
            width: 231
            height: 20
            color: "#708a2e"
            text: qsTr("Saturday 25 May 2025")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 16
            anchors.topMargin: 18
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: saturday_25_May_2026
            width: 231
            height: 20
            color: "#708a2e"
            text: qsTr("Saturday 25 May 2025")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 17
            anchors.topMargin: 136
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: saturday_25_May_2027
            width: 231
            height: 20
            color: "#708a2e"
            text: qsTr("Saturday 25 May 2025")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 18
            anchors.topMargin: 256
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: saturday_25_May_2028
            width: 231
            height: 20
            color: "#708a2e"
            text: qsTr("Saturday 25 May 2025")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 376
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: saturday_25_May_2029
            width: 231
            height: 20
            color: "#708a2e"
            text: qsTr("Saturday 25 May 2025")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 22
            anchors.topMargin: 496
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element
            width: 56
            height: 27
            color: "#4e2d18"
            text: qsTr("₱80.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 89
            anchors.topMargin: 63
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: element1
            width: 62
            height: 27
            color: "#4e2d18"
            text: qsTr("₱100.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 90
            anchors.topMargin: 181
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: element2
            width: 61
            height: 27
            color: "#4e2d18"
            text: qsTr("₱120.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 91
            anchors.topMargin: 301
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: element3
            width: 56
            height: 27
            color: "#4e2d18"
            text: qsTr("₱80.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 93
            anchors.topMargin: 421
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Text {
            id: element4
            width: 56
            height: 27
            color: "#4e2d18"
            text: qsTr("₱80.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 95
            anchors.topMargin: 541
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Shape {
            id: line_15_Stroke_
            width: 350
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 18
            anchors.topMargin: 122
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
            anchors.leftMargin: 18
            anchors.topMargin: 240
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
            anchors.leftMargin: 18
            anchors.topMargin: 360
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
            anchors.leftMargin: 20
            anchors.topMargin: 480
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
            anchors.leftMargin: 20
            anchors.topMargin: 600
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
            anchors.leftMargin: 16
            anchors.topMargin: 49
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
            anchors.leftMargin: 16
            anchors.topMargin: 166
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
            anchors.leftMargin: 17
            anchors.topMargin: 286
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
            anchors.leftMargin: 18
            anchors.topMargin: 406
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
            anchors.leftMargin: 20
            anchors.topMargin: 526
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
            width: 59
            height: 27
            color: "#804e2d18"
            text: qsTr("#1-1031")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 287
            anchors.topMargin: 73
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element6
            width: 63
            height: 27
            color: "#804e2d18"
            text: qsTr("#1-1029")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 288
            anchors.topMargin: 191
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element7
            width: 63
            height: 27
            color: "#804e2d18"
            text: qsTr("#1-1025")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 289
            anchors.topMargin: 311
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element8
            width: 63
            height: 27
            color: "#804e2d18"
            text: qsTr("#1-1075")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 291
            anchors.topMargin: 431
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element9
            width: 63
            height: 27
            color: "#804e2d18"
            text: qsTr("#1-2001")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 293
            anchors.topMargin: 551
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: am
            width: 52
            height: 20
            color: "#4e2d18"
            text: qsTr("10:24 am")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 91
            anchors.topMargin: 89
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Poppins"
        }

        Text {
            id: am1
            width: 53
            height: 20
            color: "#4e2d18"
            text: qsTr("10:50 am")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 92
            anchors.topMargin: 207
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Poppins"
        }

        Text {
            id: am2
            width: 50
            height: 20
            color: "#4e2d18"
            text: qsTr("5:00 am")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 93
            anchors.topMargin: 327
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Poppins"
        }

        Text {
            id: am3
            width: 52
            height: 20
            color: "#4e2d18"
            text: qsTr("10:24 am")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 95
            anchors.topMargin: 447
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Poppins"
        }

        Text {
            id: pm
            width: 49
            height: 20
            color: "#4e2d18"
            text: qsTr("7:00 pm")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 97
            anchors.topMargin: 566
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Poppins"
        }

        Image {
            id: bill
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 35
            anchors.topMargin: 72
            source: "assets/bill_1.png"
        }

        Image {
            id: bill1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 36
            anchors.topMargin: 190
            source: "assets/bill1_1.png"
        }

        Image {
            id: bill2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 37
            anchors.topMargin: 310
            source: "assets/bill2_1.png"
        }

        Image {
            id: bill3
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 39
            anchors.topMargin: 430
            source: "assets/bill3_1.png"
        }

        Image {
            id: bill4
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 41
            anchors.topMargin: 550
            source: "assets/bill4_1.png"
        }
    }

    Item {
        id: receipt
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 649
        anchors.rightMargin: 124
        anchors.topMargin: 276
        anchors.bottomMargin: 174
        Image {
            id: rectangle_48
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            source: "assets/rectangle_48_4.png"
        }

        Text {
            id: element10
            width: 138
            height: 48
            color: "#4e2d18"
            text: qsTr("#1-3028")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 263
            anchors.topMargin: 41
            font.pixelSize: 32
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Text {
            id: order_No_
            width: 76
            height: 24
            color: "#804e2d18"
            text: qsTr("Order No.")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 294
            anchors.topMargin: 89
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_25_Stroke_
            width: 608
            height: 2
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 127
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
            anchors.leftMargin: 28
            anchors.topMargin: 203
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
            anchors.leftMargin: 28
            anchors.topMargin: 323
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
            width: 214
            height: 21
            color: "#4e2d18"
            text: qsTr("Employee Name: Lorem Ipsum")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 143
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: pOS_POS_1
            width: 71
            height: 21
            color: "#4e2d18"
            text: qsTr("POS: POS 1")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 170
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: quantity_2
            width: 75
            height: 21
            color: "#4e2d18"
            text: qsTr("Quantity: 2")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 255
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Light
            font.family: "Poppins"
        }

        Text {
            id: size_Venti_120_00_
            width: 133
            height: 21
            color: "#4e2d18"
            text: qsTr("Size: Venti (₱120.00)")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 278
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Light
            font.family: "Poppins"
        }

        Text {
            id: strawberry_Latte
            width: 133
            height: 24
            color: "#4e2d18"
            text: qsTr("Strawberry Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 225
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Text {
            id: total
            width: 42
            height: 24
            color: "#4e2d18"
            text: qsTr("Total")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 345
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Text {
            id: gcash
            width: 53
            height: 24
            color: "#4e2d18"
            text: qsTr("Gcash")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 413
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Text {
            id: element11
            width: 75
            height: 30
            color: "#4e2d18"
            text: qsTr("₱120.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 562
            anchors.topMargin: 344
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Text {
            id: element12
            width: 75
            height: 30
            color: "#4e2d18"
            text: qsTr("₱120.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 558
            anchors.topMargin: 224
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Text {
            id: element13
            width: 56
            height: 24
            color: "#4e2d18"
            text: qsTr("₱60.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 577
            anchors.topMargin: 413
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Text {
            id: maya
            width: 47
            height: 24
            color: "#4e2d18"
            text: qsTr("Maya")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 443
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Text {
            id: element14
            width: 56
            height: 24
            color: "#4e2d18"
            text: qsTr("₱60.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 577
            anchors.topMargin: 443
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Shape {
            id: line_28_Stroke_
            width: 608
            height: 2
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 390
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
            anchors.leftMargin: 28
            anchors.topMargin: 398
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
            anchors.leftMargin: 28
            anchors.topMargin: 485
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
            anchors.leftMargin: 28
            anchors.topMargin: 493
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
            width: 164
            height: 24
            color: "#804e2d18"
            text: qsTr("25/05/2025 5:06 pm")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 516
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
        anchors.rightMargin: 1352
        anchors.topMargin: 3
        anchors.bottomMargin: -3
        Image {
            id: rectangle_14
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            anchors.topMargin: -8
            source: "assets/rectangle_14_15.png"
        }

        Item {
            id: group_65
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 14
            anchors.rightMargin: 13
            anchors.topMargin: 132
            anchors.bottomMargin: 827
            Text {
                id: ticket
                width: 62
                height: 21
                color: "#4d2d18"
                text: qsTr("Ticket")
                anchors.top: parent.top
                anchors.topMargin: 44
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
            id: group_66
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 19
            anchors.rightMargin: 20
            anchors.topMargin: 243
            anchors.bottomMargin: 703
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
                anchors.topMargin: 44
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
            }
        }

        Text {
            id: receipts
            width: 85
            height: 53
            color: "#4e2d18"
            text: qsTr("Receipts")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 4
            anchors.topMargin: 394
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
            anchors.topMargin: 353
            state: "size_48"
            clip: true
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: group_67
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.rightMargin: 8
            anchors.topMargin: 461
            anchors.bottomMargin: 458
            Text {
                id: cash_Box
                width: 71
                height: 53
                color: "#4e2d18"
                text: qsTr("Cash Box")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 52
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
            id: group_39
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            anchors.topMargin: 46
            anchors.bottomMargin: 920
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

        Rectangle {
            id: rectangle_44
            width: 83
            height: 97
            color: "#424d2d18"
            radius: 12
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 4
            anchors.topMargin: 333
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"fbbfca71-ef03-5802-9111-0ac13a9e5505"}D{i:1;uuid:"adb994d3-97aa-57a5-a768-b63a4e9977ca"}
D{i:2;uuid:"1d6bb80f-5370-5a8f-a2a3-8e1e972251e6"}D{i:3;uuid:"8b179f3a-acfa-52b4-8e00-c7d277fc2620"}
D{i:4;uuid:"4182a3c5-f1ac-5196-a5b0-14d679fb9108"}D{i:5;uuid:"5ef274de-3439-5a0f-9150-04b9539a5832"}
D{i:6;uuid:"c3cb1bdd-9eb2-5aae-a3c3-bd2488443eda"}D{i:7;uuid:"040393b9-1f67-5cff-923b-fbe1df7952a9"}
D{i:8;uuid:"15867b97-4fab-516e-a18e-2af87c526593"}D{i:9;uuid:"a5bd079e-2284-5758-91bb-727611d8f004"}
D{i:10;uuid:"2e50644d-2b1f-54bd-838e-f7405dfc3fad"}D{i:11;uuid:"43cf97ad-dde1-5a19-9119-a24f8ea5b575"}
D{i:12;uuid:"f604866f-9c07-5822-8d7c-35d9dc1f8f33"}D{i:13;uuid:"a26940b1-fd17-53a6-a753-0b3e216b2961"}
D{i:14;uuid:"24bb44ff-52be-5a67-a010-a57fde43d537"}D{i:15;uuid:"24bb44ff-52be-5a67-a010-a57fde43d537_ShapePath_0"}
D{i:16;uuid:"24bb44ff-52be-5a67-a010-a57fde43d537-PathSvg_0"}D{i:17;uuid:"737577d0-7704-54e4-8b19-acedcf6e20c3"}
D{i:18;uuid:"737577d0-7704-54e4-8b19-acedcf6e20c3_ShapePath_0"}D{i:19;uuid:"737577d0-7704-54e4-8b19-acedcf6e20c3-PathSvg_0"}
D{i:20;uuid:"9efefc85-7e4b-5c66-aa94-b7cc27f7772f"}D{i:21;uuid:"9efefc85-7e4b-5c66-aa94-b7cc27f7772f_ShapePath_0"}
D{i:22;uuid:"9efefc85-7e4b-5c66-aa94-b7cc27f7772f-PathSvg_0"}D{i:23;uuid:"abd1abd9-f22a-5075-8a59-bb511e5abb41"}
D{i:24;uuid:"abd1abd9-f22a-5075-8a59-bb511e5abb41_ShapePath_0"}D{i:25;uuid:"abd1abd9-f22a-5075-8a59-bb511e5abb41-PathSvg_0"}
D{i:26;uuid:"1c867f42-debe-5a45-9f47-78f758d8b420"}D{i:27;uuid:"1c867f42-debe-5a45-9f47-78f758d8b420_ShapePath_0"}
D{i:28;uuid:"1c867f42-debe-5a45-9f47-78f758d8b420-PathSvg_0"}D{i:29;uuid:"e396d270-0f48-5323-aeb6-aae3d0da6115"}
D{i:30;uuid:"e396d270-0f48-5323-aeb6-aae3d0da6115_ShapePath_0"}D{i:31;uuid:"e396d270-0f48-5323-aeb6-aae3d0da6115-PathSvg_0"}
D{i:32;uuid:"3ed982a6-d527-51ab-a236-c07d60beecac"}D{i:33;uuid:"3ed982a6-d527-51ab-a236-c07d60beecac_ShapePath_0"}
D{i:34;uuid:"3ed982a6-d527-51ab-a236-c07d60beecac-PathSvg_0"}D{i:35;uuid:"8ac9aa36-2ab0-55f0-bc81-ab2d10dd7948"}
D{i:36;uuid:"8ac9aa36-2ab0-55f0-bc81-ab2d10dd7948_ShapePath_0"}D{i:37;uuid:"8ac9aa36-2ab0-55f0-bc81-ab2d10dd7948-PathSvg_0"}
D{i:38;uuid:"24554e5c-7154-523e-948d-6b431178d885"}D{i:39;uuid:"24554e5c-7154-523e-948d-6b431178d885_ShapePath_0"}
D{i:40;uuid:"24554e5c-7154-523e-948d-6b431178d885-PathSvg_0"}D{i:41;uuid:"00b929ed-f6a1-518b-a6d9-19cdaf8e0c97"}
D{i:42;uuid:"00b929ed-f6a1-518b-a6d9-19cdaf8e0c97_ShapePath_0"}D{i:43;uuid:"00b929ed-f6a1-518b-a6d9-19cdaf8e0c97-PathSvg_0"}
D{i:44;uuid:"20b7d8eb-f6ff-57ef-9804-caed5edb6a84"}D{i:45;uuid:"ff0ce4ef-3a4a-5512-8bfd-f81f654704d1"}
D{i:46;uuid:"3646639f-5bc6-5010-af86-8e29cc3214b2"}D{i:47;uuid:"2d83fbf7-b925-5cf2-87e6-a4d82ba32b99"}
D{i:48;uuid:"c90718d8-dd8c-5a29-b1e0-ed6df06fb38f"}D{i:49;uuid:"4517f4a4-fa42-5224-90d8-4f9d301df1ae"}
D{i:50;uuid:"09fec322-2957-552c-b20d-1eb770b69aeb"}D{i:51;uuid:"d40fe897-d834-50fd-a19a-5dc44f1596c5"}
D{i:52;uuid:"6e8014ca-178b-5422-b2b6-c1d9518c2e19"}D{i:53;uuid:"459233f5-478f-5aab-b810-5af974ee134c"}
D{i:54;uuid:"ba6a5d4d-500a-5722-91a9-6d5669ded393"}D{i:55;uuid:"4877ffed-1f9c-5f12-936f-a0962f6ac7a7"}
D{i:56;uuid:"b2cb0616-c7df-54c1-8797-9f7952dddd8d"}D{i:57;uuid:"2ed4dbec-203d-58ff-a71a-f16564b1521e"}
D{i:58;uuid:"2102b498-f6f4-5f44-8985-1ff498a8f0b7"}D{i:59;uuid:"bb0d1732-46f0-5f8c-8b4b-479f4491c624"}
D{i:60;uuid:"4bcd74a3-2e1a-5df2-8268-a2f0cce7f7cb"}D{i:61;uuid:"157ce9b2-d98f-5ce4-b31d-b2b60b7dcac1"}
D{i:62;uuid:"0062a49c-3779-5bba-982f-a2d1d155bd87"}D{i:63;uuid:"fb37fa08-8661-5fb4-b299-424505457569"}
D{i:64;uuid:"fb37fa08-8661-5fb4-b299-424505457569_ShapePath_0"}D{i:65;uuid:"fb37fa08-8661-5fb4-b299-424505457569-PathSvg_0"}
D{i:66;uuid:"9db12027-db8f-5ed7-bf7f-4dc5dd135585"}D{i:67;uuid:"9db12027-db8f-5ed7-bf7f-4dc5dd135585_ShapePath_0"}
D{i:68;uuid:"9db12027-db8f-5ed7-bf7f-4dc5dd135585-PathSvg_0"}D{i:69;uuid:"f63af6a5-91a4-5964-b891-03c29c22918f"}
D{i:70;uuid:"f63af6a5-91a4-5964-b891-03c29c22918f_ShapePath_0"}D{i:71;uuid:"f63af6a5-91a4-5964-b891-03c29c22918f-PathSvg_0"}
D{i:72;uuid:"7e5ac961-b274-593c-9c31-ca16ce97ad4d"}D{i:73;uuid:"3a7f27ac-95b5-591c-8e63-2d29e29e4745"}
D{i:74;uuid:"c1a45fa4-52d1-5d3c-8989-2d7e5a28ca5f"}D{i:75;uuid:"9a2e54b9-37c5-5a1f-875d-34d7c71b5679"}
D{i:76;uuid:"40c518d4-fd53-5e2f-adf8-d4b064481462"}D{i:77;uuid:"06490657-d146-5460-a85d-bbdbc62b54c2"}
D{i:78;uuid:"69bfff22-a01b-5bbd-818c-39a2adf7f988"}D{i:79;uuid:"c428d74d-1deb-523b-9481-5d4ca11b51a7"}
D{i:80;uuid:"82d8b570-13fc-5b6f-90e6-2ff497487e51"}D{i:81;uuid:"c2fa0983-ac56-50ea-9e99-abc305f35f92"}
D{i:82;uuid:"53a0f84b-c33b-54c1-8617-cebded75d028"}D{i:83;uuid:"2e6debfc-030c-54cf-ba42-fdadabd7796d"}
D{i:84;uuid:"ba5de9fc-a028-581b-b9a6-58f1e56c7200"}D{i:85;uuid:"ba5de9fc-a028-581b-b9a6-58f1e56c7200_ShapePath_0"}
D{i:86;uuid:"ba5de9fc-a028-581b-b9a6-58f1e56c7200-PathSvg_0"}D{i:87;uuid:"b3cd7472-e250-54cb-8476-757001d9bda4"}
D{i:88;uuid:"b3cd7472-e250-54cb-8476-757001d9bda4_ShapePath_0"}D{i:89;uuid:"b3cd7472-e250-54cb-8476-757001d9bda4-PathSvg_0"}
D{i:90;uuid:"92680f19-4848-5833-a289-3f6a10173ea4"}D{i:91;uuid:"92680f19-4848-5833-a289-3f6a10173ea4_ShapePath_0"}
D{i:92;uuid:"92680f19-4848-5833-a289-3f6a10173ea4-PathSvg_0"}D{i:93;uuid:"12270968-6899-521b-8838-119aaf7d78cb"}
D{i:94;uuid:"12270968-6899-521b-8838-119aaf7d78cb_ShapePath_0"}D{i:95;uuid:"12270968-6899-521b-8838-119aaf7d78cb-PathSvg_0"}
D{i:96;uuid:"6454a1d4-fb3f-582d-956a-f12be688c965"}D{i:97;uuid:"476da7e4-201e-58ef-a52c-503a6bd15fd2"}
D{i:98;uuid:"ab56c6e7-0c7f-5ca0-bb0b-a75e754fb387"}D{i:99;uuid:"b4de480e-5bd9-5729-9f17-5989fa9c0514"}
D{i:100;uuid:"3370d586-ecff-5ba2-8037-502272eaa170"}D{i:101;uuid:"e94f2a8a-3b07-5384-8517-adf1cf8553de"}
D{i:102;uuid:"fe661bc2-632d-597c-8e35-e346d7f1e6d4"}D{i:103;uuid:"37efc1f9-d63f-5074-8ccc-e2612ebced8f"}
D{i:104;uuid:"9cd95066-7a25-5711-9be2-4cf222f17c01"}D{i:105;uuid:"a5c054c4-3ae9-525b-ae92-3044c8acc3b7"}
D{i:106;uuid:"6f32956b-76fa-55cf-ab9d-8c2966da427c"}D{i:107;uuid:"0550836d-2fc4-505c-b5db-db33e75b39da"}
D{i:108;uuid:"fa7493ab-409d-5e8a-a0f0-c7447834d5b6"}D{i:109;uuid:"9d85d821-4ec9-5210-8018-a3daaf789ca4"}
D{i:110;uuid:"723c83b5-aa8b-51b6-9738-333b7bbc6f80"}D{i:111;uuid:"7b22eee2-e82d-530b-b8ac-2771d3f3f2fe"}
D{i:112;uuid:"2605a70a-d58d-5949-880c-531cc7bc961e"}D{i:113;uuid:"2605a70a-d58d-5949-880c-531cc7bc961e_ShapePath_0"}
D{i:114;uuid:"2605a70a-d58d-5949-880c-531cc7bc961e-PathSvg_0"}D{i:115;uuid:"e2d47c1a-0ed2-51d1-a68f-7d90e76809da"}
}
##^##*/

