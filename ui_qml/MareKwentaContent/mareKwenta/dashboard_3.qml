import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15
import QtQuick.Studio.Components 1.0

Rectangle {
    id: dashboard_Sales_Summary
    width: 1440
    height: 952
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias all_dayText: all_day.text
    property alias element1Text: element1.text
    property alias element12Text: element12.text
    property alias gross_ProfitsText: gross_Profits.text
    property alias mKText: mK.text
    property alias month_03Text: month_03.text
    property alias receiptsText: receipts.text
    property alias element11Text: element11.text
    property alias headerText: header.text
    property alias inventoryText: inventory.text
    property alias month_04Text: month_04.text
    property alias element10Text: element10.text
    property alias refundsText: refunds.text
    property alias net_SalesText: net_Sales.text
    property alias element7Text: element7.text
    property alias cash_BoxText: cash_Box.text
    property alias month_00Text: month_00.text
    property alias dash_boardText: dash_board.text
    property alias discountsText: discounts.text
    property alias month_02Text: month_02.text
    property alias element6Text: element6.text
    property alias element14Text: element14.text
    property alias sales_SummaryText: sales_Summary.text
    property alias gross_Sales1Text: gross_Sales1.text
    property alias element15Text: element15.text
    property alias month_05Text: month_05.text
    property alias elementText: element.text
    property alias element2Text: element2.text
    property alias element9Text: element9.text
    property alias element13Text: element13.text
    property alias month_01Text: month_01.text
    property alias element5Text: element5.text
    property alias gross_SalesText: gross_Sales.text
    property alias ticketText: ticket.text
    property alias element8Text: element8.text
    property alias element3Text: element3.text
    property alias element4Text: element4.text

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
        anchors.bottomMargin: 781
        Image {
            id: rectangle_47
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            source: "assets/rectangle_47_2.png"
        }

        Text {
            id: sales_Summary
            width: 160
            height: 30
            color: "#4d2d18"
            text: qsTr("Sales Summary")
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
            source: "assets/rectangle_48_2.png"
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
            id: rectangle_51
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 870
            anchors.topMargin: 2
            source: "assets/rectangle_51_2.png"
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
            id: chevron_down2
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
            id: group_40
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 843
            anchors.rightMargin: 253
            anchors.topMargin: 20
            anchors.bottomMargin: 584
            Text {
                id: element1
                width: 74
                height: 18
                color: "#31b452"
                text: qsTr("+₱20,000.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 33
                anchors.topMargin: 68
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: net_Sales
                width: 75
                height: 24
                color: "#4e2d18"
                text: qsTr("Net Sales")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 33
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: element2
                width: 152
                height: 36
                color: "#4d6443"
                text: qsTr("₱ 200,00.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 32
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.DemiBold
                font.family: "Poppins"
            }
        }

        Item {
            id: group_39
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 1094
            anchors.rightMargin: 51
            anchors.topMargin: 21
            anchors.bottomMargin: 584
            Text {
                id: element3
                width: 55
                height: 18
                color: "#c30e0e"
                text: qsTr("-₱500.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 67
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: gross_Profits
                width: 100
                height: 24
                color: "#4e2d18"
                text: qsTr("Gross Profits")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 3
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: element4
                width: 98
                height: 36
                color: "#4d6443"
                text: qsTr("₱ 145.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 33
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.DemiBold
                font.family: "Poppins"
            }
        }

        Item {
            id: group_43
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 627
            anchors.rightMargin: 523
            anchors.topMargin: 22
            anchors.bottomMargin: 583
            Text {
                id: element5
                width: 55
                height: 18
                color: "#c30e0e"
                text: qsTr("-₱500.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 67
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: discounts
                width: 80
                height: 24
                color: "#4e2d18"
                text: qsTr("Discounts")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 3
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: element6
                width: 98
                height: 36
                color: "#4d6443"
                text: qsTr("₱ 145.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 33
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.DemiBold
                font.family: "Poppins"
            }
        }

        Item {
            id: group_44
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 357
            anchors.rightMargin: 793
            anchors.topMargin: 22
            anchors.bottomMargin: 583
            Text {
                id: element7
                width: 33
                height: 18
                color: "#757575"
                text: qsTr("₱0.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 67
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: refunds
                width: 66
                height: 24
                color: "#4e2d18"
                text: qsTr("Refunds")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 3
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: element8
                width: 98
                height: 36
                color: "#4d6443"
                text: qsTr("₱ 0.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 33
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.DemiBold
                font.family: "Poppins"
            }
        }

        Text {
            id: gross_Sales
            width: 106
            height: 27
            color: "#4e2d18"
            text: qsTr("Gross Sales")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 52
            anchors.topMargin: 153
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Poppins"
        }

        Item {
            id: group_45
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 82
            anchors.rightMargin: 1034
            anchors.topMargin: 21
            anchors.bottomMargin: 581
            Text {
                id: element9
                width: 102
                height: 18
                color: "#31b452"
                text: qsTr("+₱287.00(+100%)")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 70
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: gross_Sales1
                width: 94
                height: 24
                color: "#4e2d18"
                text: qsTr("Gross Sales")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 4
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Normal
                font.family: "Poppins"
            }

            Text {
                id: element10
                width: 131
                height: 36
                color: "#4d6443"
                text: qsTr("₱ 287.00")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 1
                anchors.topMargin: 33
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.DemiBold
                font.family: "Poppins"
            }
        }

        Text {
            id: month_00
            width: 79
            height: 29
            color: "#4e2d18"
            text: qsTr("Month, 00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 150
            anchors.topMargin: 606
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: month_01
            width: 79
            height: 29
            color: "#4e2d18"
            text: qsTr("Month, 00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 342
            anchors.topMargin: 606
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: month_02
            width: 79
            height: 29
            color: "#4e2d18"
            text: qsTr("Month, 00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 534
            anchors.topMargin: 606
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: month_03
            width: 79
            height: 29
            color: "#4e2d18"
            text: qsTr("Month, 00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 726
            anchors.topMargin: 606
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: month_04
            width: 79
            height: 29
            color: "#4e2d18"
            text: qsTr("Month, 00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 918
            anchors.topMargin: 606
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: month_05
            width: 79
            height: 29
            color: "#4e2d18"
            text: qsTr("Month, 00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1110
            anchors.topMargin: 606
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_13_Stroke_
            width: 1030
            height: 2
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 161
            anchors.topMargin: 333
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_13_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_13_Stroke__PathSvg_0
                    path: "M 1030.0008544921875 1.2249444723129272 L 1030.000244140625 2.0257256031036377 L 0 0.8007810115814209 L 0.0006346879526972771 0 L 1030.0008544921875 1.2249444723129272 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Shape {
            id: line_15_Stroke_
            width: 1030
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 161
            anchors.topMargin: 250
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_15_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_15_Stroke__PathSvg_0
                    path: "M 1030.0009765625 0 L 1030.0009765625 0.7998046875 L 0 0.7998046875 L 0 0 L 1030.0009765625 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Shape {
            id: line_16_Stroke_
            width: 1030
            height: 1
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 161
            anchors.topMargin: 412
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_16_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_16_Stroke__PathSvg_0
                    path: "M 1030 0 L 1030 0.7998046875 L 0 0.7998046875 L 0 2.8421709430404007e-13 L 1030 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Shape {
            id: line_18_Stroke_
            width: 1029
            height: 4
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 162
            anchors.topMargin: 490
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_18_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_18_Stroke__PathSvg_0
                    path: "M 1028.999267578125 0 L 1029.001220703125 0.7998024225234985 L 0.001903585041873157 4.474632263183594 L 0 3.6748299598693848 L 1028.999267578125 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Shape {
            id: line_19_Stroke_
            width: 1030
            height: 3
            opacity: 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 161
            anchors.topMargin: 574
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_19_Stroke__ShapePath_0
                strokeWidth: 0.8
                strokeColor: "transparent"
                PathSvg {
                    id: line_19_Stroke__PathSvg_0
                    path: "M 1030.000244140625 2.4498860836029053 L 1029.9990234375 3.249689817428589 L 0 0.7998036742210388 L 0.0012678266502916813 0 L 1030.000244140625 2.4498860836029053 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        ArcItem {
            id: ellipse_11
            width: 15
            height: 17
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 171
            anchors.topMargin: 567
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#4d6443"
            end: 450.00001
            begin: 90
            arcWidth: 7.5
            antialiasing: true
        }

        ArcItem {
            id: ellipse_12
            width: 15
            height: 17
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 366
            anchors.topMargin: 567
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#4d6443"
            end: 450.00001
            begin: 90
            arcWidth: 7.5
            antialiasing: true
        }

        ArcItem {
            id: ellipse_13
            width: 15
            height: 17
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 561
            anchors.topMargin: 567
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#4d6443"
            end: 450.00001
            begin: 90
            arcWidth: 7.5
            antialiasing: true
        }

        ArcItem {
            id: ellipse_14
            width: 15
            height: 17
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 756
            anchors.topMargin: 567
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#4d6443"
            end: 450.00001
            begin: 90
            arcWidth: 7.5
            antialiasing: true
        }

        ArcItem {
            id: ellipse_15
            width: 15
            height: 17
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 951
            anchors.topMargin: 567
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#4d6443"
            end: 450.00001
            begin: 90
            arcWidth: 7.5
            antialiasing: true
        }

        ArcItem {
            id: ellipse_16
            width: 15
            height: 17
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1146
            anchors.topMargin: 567
            strokeWidth: 0
            strokeStyle: 0
            strokeColor: "transparent"
            outlineArc: true
            fillColor: "#4d6443"
            end: 450.00001
            begin: 90
            arcWidth: 7.5
            antialiasing: true
        }

        Shape {
            id: line_20_Stroke_
            width: 200
            height: 90
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 959
            anchors.topMargin: 486
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_20_Stroke__ShapePath_0
                strokeWidth: 2
                strokeColor: "transparent"
                PathSvg {
                    id: line_20_Stroke__PathSvg_0
                    path: "M 193.72203063964844 0.4182627201080322 C 196.42755460739136 -0.7463061809539795 199.27975052595139 0.6042945384979248 200.0919647216797 3.435617446899414 C 200.904178917408 6.266940355300903 199.3686556816101 9.506195068359375 196.6631317138672 10.670763969421387 C 194.27168345451355 11.70004153251648 191.76723086833954 10.763401508331299 190.6568603515625 8.576801300048828 L 0.5514914393424988 90.40597534179688 L 0 88.48351287841797 L 190.10536193847656 6.6543402671813965 C 189.85500925779343 4.097553014755249 191.3306336402893 1.4477187395095825 193.72203063964844 0.4182627201080322 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d6443"
            }
            antialiasing: true
        }

        Shape {
            id: line_21_Stroke_
            width: 82
            height: 409
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 875
            anchors.topMargin: 165
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_21_Stroke__ShapePath_0
                strokeWidth: 2
                strokeColor: "transparent"
                PathSvg {
                    id: line_21_Stroke__PathSvg_0
                    path: "M 0 0.38392579555511475 L 1.9628043174743652 0 L 81.96278381347656 408.9964599609375 L 79.99998474121094 409.3804016113281 L 0 0.38392579555511475 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d6443"
            }
            antialiasing: true
        }

        Shape {
            id: line_22_Stroke_
            width: 121
            height: 416
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 760
            anchors.topMargin: 160
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_22_Stroke__ShapePath_0
                strokeWidth: 2
                strokeColor: "transparent"
                PathSvg {
                    id: line_22_Stroke__PathSvg_0
                    path: "M 113.0859146118164 10.102091789245605 C 111.02901482582092 8.849107384681702 109.83406728506088 6.333691120147705 110.31845092773438 3.915957450866699 C 110.89711499214172 1.0278866291046143 113.65251803398132 -0.6257956624031067 116.47330474853516 0.22218084335327148 C 119.29407262802124 1.0701709985733032 121.11147260665894 4.09850811958313 120.53290557861328 6.98659610748291 C 119.99464100599289 9.673269033432007 117.57271885871887 11.290671557188034 114.96665954589844 10.820772171020508 L 1.880556344985962 415.8868713378906 L 0 415.1672058105469 L 113.0859146118164 10.102091789245605 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d6443"
            }
            antialiasing: true
        }

        Shape {
            id: line_23_Stroke_
            width: 11
            height: 89
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 1149
            anchors.topMargin: 487
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_23_Stroke__ShapePath_0
                strokeWidth: 2
                strokeColor: "transparent"
                PathSvg {
                    id: line_23_Stroke__PathSvg_0
                    path: "M 0.0035253409296274185 5.0496721267700195 C 0.10974214412271976 2.106248378753662 2.5796124935150146 -0.15103771910071373 5.520712375640869 0.007904190570116043 C 8.461812257766724 0.16684610024094582 10.759805262088776 2.681795120239258 10.654000282287598 5.625241279602051 C 10.560287237167358 8.227221727371216 8.619434118270874 10.292601495981216 6.138730525970459 10.627283096313477 L 3.3272922039031982 88.68800354003906 L 1.3302061557769775 88.580078125 L 4.141644477844238 10.519356727600098 C 1.6946399211883545 9.91837364435196 -0.09018770419061184 7.651652574539185 0.0035253409296274185 5.0496721267700195 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d6443"
            }
            antialiasing: true
        }

        Shape {
            id: line_24_Stroke_
            width: 391
            height: 3
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 373
            anchors.topMargin: 574
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_24_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_24_Stroke__PathSvg_0
                    path: "M 391.00335693359375 2.449882984161377 L 390.9991760253906 3.4498744010925293 L 0 0.9999912977218628 L 0.0041757370345294476 0 L 391.00335693359375 2.449882984161377 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Shape {
            id: line_25_Stroke_
            width: 108
            height: 169
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 263
            anchors.topMargin: 404
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_25_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_25_Stroke__PathSvg_0
                    path: "M 0 0.6912930011749268 L 0.7225745320320129 0 L 107.72235107421875 167.81698608398438 L 106.99977111816406 168.50828552246094 L 0 0.6912930011749268 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Shape {
            id: line_26_Stroke_
            width: 88
            height: 161
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 176
            anchors.topMargin: 409
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_26_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_26_Stroke__PathSvg_0
                    path: "M 86.99980163574219 0 L 87.7755355834961 0.6310656666755676 L 0.7757294178009033 161.098388671875 L 0 160.4673309326172 L 86.99980163574219 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }

        Text {
            id: element11
            width: 63
            height: 29
            color: "#4e2d18"
            text: qsTr("₱200.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 52
            anchors.topMargin: 237
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element12
            width: 59
            height: 29
            color: "#4e2d18"
            text: qsTr("₱150.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 56
            anchors.topMargin: 319
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element13
            width: 59
            height: 29
            color: "#4e2d18"
            text: qsTr("₱100.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 56
            anchors.topMargin: 399
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element14
            width: 54
            height: 29
            color: "#4e2d18"
            text: qsTr("₱50.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 61
            anchors.topMargin: 481
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Text {
            id: element15
            width: 44
            height: 29
            color: "#4e2d18"
            text: qsTr("₱0.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 65
            anchors.topMargin: 560
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Poppins"
        }

        Shape {
            id: line_5_Stroke_
            width: 145
            height: 4
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 56
            anchors.topMargin: 116
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_5_Stroke__ShapePath_0
                strokeWidth: 4
                strokeColor: "transparent"
                PathSvg {
                    id: line_5_Stroke__PathSvg_0
                    path: "M 144.99998474121094 0 L 144.99998474121094 3.999999761581421 L 0 3.999999761581421 L 0 0 L 144.99998474121094 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
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
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_15.png"

            Rectangle {
                id: rectangle8
                x: 18
                y: 775
                width: 78
                height: 85
                color: "#ffffff"
                radius: 12
            }

            Rectangle {
                id: rectangle9
                x: 18
                y: 657
                width: 78
                height: 85
                color: "#ffffff"
                radius: 12
            }

            Rectangle {
                id: rectangle7
                x: 18
                y: 541
                width: 78
                height: 85
                color: "#ffffff"
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
                y: 191
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
                    display: AbstractButton.IconOnly
                    background: Rectangle {
                        color: "#f2efea"
                        border.color: "#f2efea"
                    }
                    Text {
                        id: inventory
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
                    display: AbstractButton.IconOnly
                    background: Rectangle {
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
                        id: receipts
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
                    display: AbstractButton.IconOnly
                    Text {
                        id: cash_Box
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
                        id: ticket
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
                    display: AbstractButton.IconOnly
                    Text {
                        id: dash_board
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
                id: mK
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
D{i:2;uuid:"d74184c6-dc83-5d4f-bf8b-da33057a4b85"}D{i:3;uuid:"9987167a-b7b8-528b-a78e-b7612e4956da"}
D{i:4;uuid:"78084015-75cd-5bf8-a11b-49940034117a"}D{i:5;uuid:"4ed9edd0-03c7-5b86-997d-1cb45a6a4698"}
D{i:6;uuid:"eab92f40-2c22-5e36-86b0-f1fe4515ab39"}D{i:7;uuid:"428e9a99-9045-5990-baa3-91ddd5593456"}
D{i:8;uuid:"5bc2131c-cd70-5e8f-af26-daaeef4faeed"}D{i:9;uuid:"f16b1049-f81b-5120-9ced-99817db98bda"}
D{i:10;uuid:"8c545cbc-d0e9-53ea-bab0-17270c4b22e8"}D{i:11;uuid:"e778e0d4-0b01-5119-baca-7c5a57be4f2c"}
D{i:12;uuid:"0ac3afd7-fb6d-5069-9756-7b9d3ad1507d"}D{i:13;uuid:"170efd29-a029-5cd8-b4f3-a27e1ac9ca14"}
D{i:14;uuid:"2b53486c-2824-5205-b1b7-bb7c81a78311"}D{i:15;uuid:"2b53486c-2824-5205-b1b7-bb7c81a78311_ShapePath_0"}
D{i:16;uuid:"2b53486c-2824-5205-b1b7-bb7c81a78311-PathSvg_0"}D{i:17;uuid:"ee5764bc-9782-5906-8f14-2c7074a69c49"}
D{i:18;uuid:"f72ca242-40b2-51ae-80fa-76e88888cb79"}D{i:19;uuid:"16173cda-48b1-5aa2-b8ae-ed3c96e1c125"}
D{i:20;uuid:"ebc04f0a-1e00-5f0d-ac29-08404d30b2df"}D{i:21;uuid:"237c19cf-e6ce-579d-b3d2-a18c1604d57a"}
D{i:22;uuid:"5390b722-d671-5773-af7e-2121fed01942"}D{i:23;uuid:"9ef6f4fe-2a20-5731-a5c4-cd87d86b73d8"}
D{i:24;uuid:"cf6710fd-b9a9-5c1c-bb86-584e3b8284d0"}D{i:25;uuid:"e5154245-64d7-5a08-8c82-2918978501e2"}
D{i:26;uuid:"75a3ec9c-7367-5152-a89f-1207f86787a8"}D{i:27;uuid:"9b5a2a98-c5dd-5394-8aee-c24922aa8d38"}
D{i:28;uuid:"2c4d4737-7068-56c3-961b-5b1285384529"}D{i:29;uuid:"826df6ee-7e95-5380-9806-357771edffba"}
D{i:30;uuid:"763f8239-2b1d-514b-8dae-55526a5039c1"}D{i:31;uuid:"2fdbd72b-da70-5dfe-969f-9e5c0ec51e49"}
D{i:32;uuid:"30820d8e-e5b2-53a6-a524-be739abfba37"}D{i:33;uuid:"4163d150-a3ec-505a-9a44-5de9383557bf"}
D{i:34;uuid:"a9b8a50e-64ff-512e-83f6-b403bdad43a1"}D{i:35;uuid:"c68f45d7-63b4-50ad-a57f-1d683c521f79"}
D{i:36;uuid:"5120aa3f-cbba-51c8-a7f2-07c29adedd8d"}D{i:37;uuid:"a4c85ae4-2e69-5532-a331-5daeb5f3db49"}
D{i:38;uuid:"e0171f3a-6df4-5789-b199-34b13952a588"}D{i:39;uuid:"01d62403-8fd7-5cbf-9d04-123b49c6e171"}
D{i:40;uuid:"b0fd0b35-65fd-59c5-bb3e-5c157e9a7b56"}D{i:41;uuid:"eeeff401-0669-5596-a21d-f5524954f7b0"}
D{i:42;uuid:"fad282c1-fbfb-56f3-9075-e6d0aee7039c"}D{i:43;uuid:"c5b409a5-d3cc-557d-89e2-3e14cb9967cc"}
D{i:44;uuid:"e6383c93-e269-55d8-8cd9-ca48c90dc521"}D{i:45;uuid:"e6383c93-e269-55d8-8cd9-ca48c90dc521_ShapePath_0"}
D{i:46;uuid:"e6383c93-e269-55d8-8cd9-ca48c90dc521-PathSvg_0"}D{i:47;uuid:"cb191512-77d4-5829-9fb0-53d4dfd1cd0d"}
D{i:48;uuid:"cb191512-77d4-5829-9fb0-53d4dfd1cd0d_ShapePath_0"}D{i:49;uuid:"cb191512-77d4-5829-9fb0-53d4dfd1cd0d-PathSvg_0"}
D{i:50;uuid:"71ce0d21-d4cb-5b79-8df8-bf19313e4136"}D{i:51;uuid:"71ce0d21-d4cb-5b79-8df8-bf19313e4136_ShapePath_0"}
D{i:52;uuid:"71ce0d21-d4cb-5b79-8df8-bf19313e4136-PathSvg_0"}D{i:53;uuid:"5f116365-5c65-5974-aa4b-c4a80ccad882"}
D{i:54;uuid:"5f116365-5c65-5974-aa4b-c4a80ccad882_ShapePath_0"}D{i:55;uuid:"5f116365-5c65-5974-aa4b-c4a80ccad882-PathSvg_0"}
D{i:56;uuid:"751c7576-d6c3-5b2d-8feb-afa2ff84ee1a"}D{i:57;uuid:"751c7576-d6c3-5b2d-8feb-afa2ff84ee1a_ShapePath_0"}
D{i:58;uuid:"751c7576-d6c3-5b2d-8feb-afa2ff84ee1a-PathSvg_0"}D{i:59;uuid:"93b2b560-7f77-5e8a-ad3f-1c8919edcc73"}
D{i:60;uuid:"ae55dc6b-686e-5ead-8898-b908df98d6f4"}D{i:61;uuid:"3c346ff9-bbb9-5a51-a4ab-07493425f7ca"}
D{i:62;uuid:"e7f65876-a524-5c1d-99d6-3c406fc9e1d1"}D{i:63;uuid:"a43825f4-fcb0-5faf-ad21-ecfc4b8510d3"}
D{i:64;uuid:"6ab47827-43b8-5063-b841-5ac2811eed10"}D{i:65;uuid:"8d55823f-848d-5ab5-bfc3-68d164e85a23"}
D{i:66;uuid:"8d55823f-848d-5ab5-bfc3-68d164e85a23_ShapePath_0"}D{i:67;uuid:"8d55823f-848d-5ab5-bfc3-68d164e85a23-PathSvg_0"}
D{i:68;uuid:"c9b3e560-7bff-5fa5-892b-8993a8171de7"}D{i:69;uuid:"c9b3e560-7bff-5fa5-892b-8993a8171de7_ShapePath_0"}
D{i:70;uuid:"c9b3e560-7bff-5fa5-892b-8993a8171de7-PathSvg_0"}D{i:71;uuid:"a0cc3ab5-c7f5-58f9-8dba-49b5a2334911"}
D{i:72;uuid:"a0cc3ab5-c7f5-58f9-8dba-49b5a2334911_ShapePath_0"}D{i:73;uuid:"a0cc3ab5-c7f5-58f9-8dba-49b5a2334911-PathSvg_0"}
D{i:74;uuid:"2c66dd8a-5e56-5d52-bc34-fe89861c408c"}D{i:75;uuid:"2c66dd8a-5e56-5d52-bc34-fe89861c408c_ShapePath_0"}
D{i:76;uuid:"2c66dd8a-5e56-5d52-bc34-fe89861c408c-PathSvg_0"}D{i:77;uuid:"32064dee-f553-5cf5-a08c-b9c054467067"}
D{i:78;uuid:"32064dee-f553-5cf5-a08c-b9c054467067_ShapePath_0"}D{i:79;uuid:"32064dee-f553-5cf5-a08c-b9c054467067-PathSvg_0"}
D{i:80;uuid:"b5eb8b2b-d5f6-5456-b064-ea2f026dca72"}D{i:81;uuid:"b5eb8b2b-d5f6-5456-b064-ea2f026dca72_ShapePath_0"}
D{i:82;uuid:"b5eb8b2b-d5f6-5456-b064-ea2f026dca72-PathSvg_0"}D{i:83;uuid:"204062c0-e236-5400-b87c-be3b6dd764af"}
D{i:84;uuid:"204062c0-e236-5400-b87c-be3b6dd764af_ShapePath_0"}D{i:85;uuid:"204062c0-e236-5400-b87c-be3b6dd764af-PathSvg_0"}
D{i:86;uuid:"9388eeab-136d-5015-88b2-6c3a7c9dd35f"}D{i:87;uuid:"8a2ff975-f815-5bd9-9b3d-68237a6f8564"}
D{i:88;uuid:"0b2e50fd-48c7-5b06-884f-399306081da0"}D{i:89;uuid:"c1573897-6fdb-5474-9491-e52d5a6d8b24"}
D{i:90;uuid:"99e61923-2b44-5c41-804d-19e3bac16def"}D{i:91;uuid:"a08eda3b-b91a-554d-9a33-bfebef809246"}
D{i:92;uuid:"a08eda3b-b91a-554d-9a33-bfebef809246_ShapePath_0"}D{i:93;uuid:"a08eda3b-b91a-554d-9a33-bfebef809246-PathSvg_0"}
D{i:94;uuid:"feefb81f-68fa-5f81-8539-e60df2e2de51"}D{i:95;uuid:"a83d6f29-cff0-5705-896b-91e6e265ff9e"}
}
##^##*/

