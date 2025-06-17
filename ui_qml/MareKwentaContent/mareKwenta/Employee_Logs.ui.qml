import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15
import QtQuick.Studio.Components 1.0

Rectangle {
    id: employee_Logs
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias may_05_2026Text: may_05_2026.text
    property alias staff1Text: staff1.text
    property alias hrs_0_minsText: timein_text.text
    property alias receiptsText: receipts.text
    property alias mKText: mK.text
    property alias cash_BoxText: cash_Box.text
    property alias employee_1Text: employeename_text.text
    property alias wED_May_05Text: datelist_text.text
    property alias staffText: staff.text
    property alias ticketText: ticket.text

    Item {
        id: nav
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 1352
        Image {
            id: rectangle_14
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            anchors.topMargin: -8
            source: "assets/rectangle_14_9.png"
        }

        Item {
            id: group_68
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

        User {
            id: user
            width: 33
            height: 31
            anchors.top: parent.top
            anchors.topMargin: 243
            state: "size_48"
            clip: true
            anchors.horizontalCenterOffset: 0
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
            anchors.leftMargin: 19
            anchors.topMargin: 287
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Item {
            id: group_69
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 4
            anchors.rightMargin: 0
            anchors.topMargin: 353
            anchors.bottomMargin: 577
            Text {
                id: receipts
                width: 85
                height: 53
                color: "#4e2d18"
                text: qsTr("Receipts")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 41
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Light
                font.family: "Unbounded"
            }

            List {
                id: element
                width: 34
                height: 28
                anchors.top: parent.top
                state: "size_48"
                clip: true
                anchors.horizontalCenterOffset: -2
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Item {
            id: group_70
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
            id: group_8
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
            id: rectangle_43
            width: 83
            height: 97
            color: "#424d2d18"
            radius: 12
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 3
            anchors.topMargin: 225
        }
    }

    Text {
        id: may_05_2026
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
        id: staff1
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
        id: timeIn_Out
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 392
        anchors.rightMargin: 50
        anchors.topMargin: 126
        anchors.bottomMargin: -102
        Item {
            id: group_14
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 855
            Image {
                id: rectangle_8
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -8
                anchors.topMargin: -4
                source: "assets/rectangle_8_6.png"
            }

            Text {
                id: employeename_text
                width: 170
                height: 50
                color: "#4e2d18"
                text: qsTr("Employee 1")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 40
                anchors.topMargin: 31
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Text {
                id: timein_text
                width: 170
                height: 50
                color: "#4e2d18"
                text: qsTr("0 hrs\n0 mins")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 56
                anchors.topMargin: 65
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.styleName: "Regular"
                styleColor: "#4e2d18"
                style: Text.Normal
                font.weight: Font.Normal
                font.family: "Arial"
            }

            Input_Field {
                id: password_textbox
                width: 272
                height: 69
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 631
                anchors.topMargin: 38
                valueText: ""
                state: "state_Default_Value_Type_Default"
                labelText: qsTr("Password")
            }

            TextInput {
                id: password_input
                x: 647
                y: 76
                width: 239
                height: 27
                text: qsTr("")
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.NoWrap
                selectionColor: "#4e2d18"
                font.family: "Arial"
                echoMode: TextInput.Password
            }

            Button {
                id: edit_button
                x: 289
                y: 40
                width: 68
                height: 65
                text: qsTr("")
                icon.source: "assets/Edit.png"
                icon.color: "#03590f"
                display: AbstractButton.TextOnly
                background: Rectangle {
                    color: "#d4ffda"
                    radius: 72
                    border.color: "#03590f"
                }
                contentItem: Text {
                    color: "#03590f"
                    text: "IN"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.styleName: "Medium"
                    font.pointSize: 16
                    font.family: "Unbounded"
                }
            }

            Button {
                id: edit_button1
                x: 289
                y: 40
                width: 68
                height: 65
                text: qsTr("")
                icon.source: "assets/Edit.png"
                icon.color: "#03590f"
                display: AbstractButton.TextOnly
                contentItem: Text {
                    color: "#03590f"
                    text: "IN"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.styleName: "Medium"
                    font.pointSize: 16
                    font.family: "Unbounded"
                }
                background: Rectangle {
                    color: "#d4ffda"
                    radius: 72
                    border.color: "#03590f"
                }
            }

            Button {
                id: out_button
                x: 375
                y: 40
                width: 68
                height: 65
                text: qsTr("")
                icon.source: "assets/Edit.png"
                icon.color: "#03590f"
                display: AbstractButton.TextOnly
                contentItem: Text {
                    color: "#860707"
                    text: "OUT"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.styleName: "Medium"
                    font.pointSize: 13
                    font.family: "Unbounded"
                }
                background: Rectangle {
                    color: "#fadddd"
                    radius: 72
                    border.color: "#860707"
                }
            }
        }
    }

    Item {
        id: dateList
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 113
        anchors.rightMargin: 1071
        anchors.topMargin: 114
        anchors.bottomMargin: -7
        Item {
            id: group_3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 32
            anchors.topMargin: 2
            anchors.bottomMargin: 848
            Image {
                id: datelist_rectangle
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -8
                anchors.topMargin: 0
                source: "assets/rectangle_15_1.png"
            }

            Text {
                id: datelist_text
                width: 185
                height: 40
                color: "#f2efea"
                text: qsTr("WED, May 05")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 19
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.Medium
                font.family: "Unbounded"
            }
        }

        Shape {
            id: line_10_Stroke_
            width: 1
            height: 901
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 256
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_10_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_10_Stroke__PathSvg_0
                    path: "M 1 901.001953125 L 1.1368683772161603e-13 901.001953125 L 0 1.0451708942760263e-16 L 1 0 L 1 901.001953125 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#000000"
            }
            antialiasing: true
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"a1491e4f-ffad-50a5-9301-0f98b5c41925"}D{i:1;uuid:"7e68d1a7-296e-5d1d-af63-a6af5ea8fa38"}
D{i:2;uuid:"3be01d95-02ee-5205-b2e3-1a7b42e107e0"}D{i:3;uuid:"e8645e8a-8701-5d63-8e3f-f33363b40c0d"}
D{i:4;uuid:"10f0f8fc-7067-5319-a2e7-3052f11ffb02"}D{i:5;uuid:"247cd630-4fee-56cf-bc91-45eedb3eb414"}
D{i:6;uuid:"4771f128-bd14-549b-b159-d8005f4f3d09"}D{i:7;uuid:"d182f76d-8803-5c74-a08f-258b2cb0aa25"}
D{i:8;uuid:"f5064341-4900-54cd-803f-478dc5655a67"}D{i:9;uuid:"39594254-6fe3-5bd9-be24-ca169311a557"}
D{i:10;uuid:"e5c13c20-c97b-5960-8ccb-fec95edbae8e"}D{i:11;uuid:"76339d27-b4f7-522d-b800-5da5d2456edc"}
D{i:12;uuid:"c245d43e-3bbc-58d0-9ebd-a0ea283d1cac"}D{i:13;uuid:"7d0bd959-cc9c-59a8-a373-5bc8c67c6597"}
D{i:14;uuid:"4e7ea4de-29ef-5991-802d-64b042f83138"}D{i:15;uuid:"dd149ebb-e520-5616-a1c2-e70377febb87"}
D{i:16;uuid:"8ca0b211-5a36-5356-a74c-80709376af3e"}D{i:17;uuid:"8ca0b211-5a36-5356-a74c-80709376af3e_ShapePath_0"}
D{i:18;uuid:"8ca0b211-5a36-5356-a74c-80709376af3e-PathSvg_0"}D{i:19;uuid:"52fe3243-f5be-5ff8-ae88-cacca833a51e"}
D{i:20;uuid:"f6b0b5bb-4314-5aa3-885b-df6dfac73c31"}D{i:21;uuid:"97344097-6a53-5384-a8e8-9e7212a22b4e"}
D{i:22;uuid:"8107b872-1e73-59f0-907b-f2dd61e720b4"}D{i:27}D{i:28}D{i:29}D{i:31;uuid:"57293872-2d8c-5388-b4c7-5c9eee983df7"}
D{i:32;uuid:"5957f1ca-2b38-5eaa-9045-00ceb04e43e7"}D{i:33;uuid:"92ae6f3c-e293-51a4-853e-8f94f35980d5"}
D{i:34;uuid:"c11cd539-2c90-5316-a5b3-04d7bd4aef25"}D{i:35;uuid:"b0fc8abf-fbcc-5345-b976-eb74a8de8cf6"}
D{i:36;uuid:"101d6d29-e875-5537-bd8b-b694e8eba68a"}D{i:37;uuid:"706f4c69-3449-55dc-a6ba-efe2b15f9493"}
D{i:38;uuid:"9885cc44-40e1-5d96-b856-9f84cbb4077b"}D{i:39;uuid:"26226b7b-ae00-5225-bf2e-226916529f0c"}
D{i:40;uuid:"5c628d11-9b59-5997-81b1-23f672a4ad28"}D{i:41;uuid:"6d194a31-b7f6-59f6-83e9-88cb1d30f6db"}
D{i:42;uuid:"efbc5a65-995f-5268-a1d4-23dc7331d581"}D{i:43;uuid:"2fb36372-e340-5cc6-bba1-2e6185dc6c6b"}
D{i:44;uuid:"5b43c9b3-0198-54e8-a503-1e6cb4d2e927"}D{i:45;uuid:"365f14ce-0e7a-5c6a-b43d-fa14f8e7f083"}
D{i:46;uuid:"50d697d1-d065-587a-94f4-41411932a302"}D{i:47;uuid:"fe6f026d-4ba8-550a-aa33-e41bef58ae06"}
D{i:48;uuid:"c4a880af-4cb7-5c91-88bb-ab19528c6650"}D{i:49;uuid:"25fa6124-36e2-5d8e-a481-fcc18e20ddd4"}
D{i:50;uuid:"827e16bb-d571-526d-8d99-63706abfaee4"}D{i:51;uuid:"97de52fd-d324-50b0-8313-2f5aa2d805e4"}
D{i:52;uuid:"3d26b3c1-af46-5b47-a38d-3158b75cb11e"}D{i:53;uuid:"6df669d0-e18c-5d9a-b80e-6e4f38cf7e00"}
D{i:54;uuid:"1dbc8344-9f4b-56d7-a238-7bb8bf80c61e"}D{i:55;uuid:"ea05117b-6bc2-53a6-b26c-7274c33157e9"}
D{i:56;uuid:"3cee1688-ee90-50de-9152-6cb714767323"}D{i:57;uuid:"ce3437b9-3ce7-5c26-857f-42060a1d851b"}
D{i:58;uuid:"397fa3e3-afb7-5a69-9190-9200e4739448"}D{i:59;uuid:"d9da573d-7010-5d0a-8899-15a0097b909f"}
D{i:60;uuid:"f6c59465-3958-51ee-8e53-2962fd4e6ff9"}D{i:61;uuid:"32ed6c20-f447-5a50-b750-5f73ee11cbd9"}
D{i:62;uuid:"4f1e5642-c780-52c9-9007-353aa43fed28"}D{i:63;uuid:"af9d2521-a548-5c5c-b6da-2f5a2c75025a"}
D{i:64;uuid:"0666ef69-f553-5369-a5ef-9e8c105ea137"}D{i:65;uuid:"2c44dc54-4644-5efc-9eea-ecdb81548250"}
D{i:66;uuid:"2c44dc54-4644-5efc-9eea-ecdb81548250_ShapePath_0"}D{i:67;uuid:"2c44dc54-4644-5efc-9eea-ecdb81548250-PathSvg_0"}
}
##^##*/

