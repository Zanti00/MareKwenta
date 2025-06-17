import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: button_Danger
    width: 75
    height: 40
    color: "#ec221f"
    radius: 8
    border.color: "#c00f0c"
    border.width: 1
    property alias buttonText: button.text
    state: "variant_Primary_State_Default_Size_Medium"
    clip: true

    RowLayout {
        id: button_Danger_layout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.topMargin: 12
        anchors.bottomMargin: 12
        spacing: 8
        Star {
            id: star
            visible: false
            state: "size_16"
            clip: true
            Layout.preferredWidth: 16
            Layout.preferredHeight: 16
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Text {
            id: button
            color: "#fee9e7"
            text: qsTr("Button")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            lineHeight: 16
            lineHeightMode: Text.FixedHeight
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Inter"
            Layout.preferredWidth: 52
            Layout.preferredHeight: 16
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        X {
            id: element
            visible: false
            state: "size_16"
            clip: true
            Layout.preferredWidth: 16
            Layout.preferredHeight: 16
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
    }
    states: [
        State {
            name: "variant_Subtle_State_Disabled_Size_Small"

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button_Danger
                width: 67
                height: 32
                color: "#d9d9d9"
                border.color: "#b3b3b3"
            }

            PropertyChanges {
                target: button
                color: "#b3b3b3"
            }
        },
        State {
            name: "variant_Primary_State_Disabled_Size_Small"

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button_Danger
                width: 67
                height: 32
                color: "#d9d9d9"
                border.color: "#b3b3b3"
            }

            PropertyChanges {
                target: button
                color: "#b3b3b3"
            }
        },
        State {
            name: "variant_Subtle_State_Disabled_Size_Medium"

            PropertyChanges {
                target: button_Danger
                width: 75
                height: 40
                color: "#d9d9d9"
                border.color: "#b3b3b3"
            }

            PropertyChanges {
                target: button
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Primary_State_Disabled_Size_Medium"

            PropertyChanges {
                target: button_Danger
                width: 75
                height: 40
                color: "#d9d9d9"
                border.color: "#b3b3b3"
            }

            PropertyChanges {
                target: button
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Subtle_State_Hover_Size_Small"

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button_Danger
                width: 67
                height: 32
                color: "#fdd3d0"
                border.color: "#900b09"
            }

            PropertyChanges {
                target: button
                color: "#900b09"
            }
        },
        State {
            name: "variant_Subtle_State_Default_Size_Small"

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button_Danger
                width: 67
                height: 32
                color: "transparent"
                border.color: "#c00f0c"
            }

            PropertyChanges {
                target: button
                color: "#900b09"
            }
        },
        State {
            name: "variant_Primary_State_Hover_Size_Small"

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button_Danger
                width: 67
                height: 32
                color: "#c00f0c"
                border.color: "#900b09"
            }

            PropertyChanges {
                target: button
                color: "#fee9e7"
            }
        },
        State {
            name: "variant_Primary_State_Default_Size_Small"

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button_Danger
                width: 67
                height: 32
                color: "#ec221f"
                border.color: "#c00f0c"
            }

            PropertyChanges {
                target: button
                color: "#fee9e7"
            }
        },
        State {
            name: "variant_Subtle_State_Hover_Size_Medium"

            PropertyChanges {
                target: button_Danger
                width: 75
                height: 40
                color: "#fdd3d0"
                border.color: "#900b09"
            }

            PropertyChanges {
                target: button
                color: "#900b09"
            }

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Subtle_State_Default_Size_Medium"

            PropertyChanges {
                target: button_Danger
                width: 75
                height: 40
                color: "transparent"
                border.color: "#c00f0c"
            }

            PropertyChanges {
                target: button
                color: "#900b09"
            }

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Primary_State_Hover_Size_Medium"

            PropertyChanges {
                target: button_Danger
                width: 75
                height: 40
                color: "#c00f0c"
                border.color: "#900b09"
            }

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }

            PropertyChanges {
                target: button
                color: "#fee9e7"
            }
        },
        State {
            name: "variant_Primary_State_Default_Size_Medium"

            PropertyChanges {
                target: button_Danger_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }

            PropertyChanges {
                target: button_Danger
                width: 75
                height: 40
                color: "#ec221f"
                border.color: "#c00f0c"
            }

            PropertyChanges {
                target: button
                color: "#fee9e7"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"a43bece0-9e19-5a08-89a5-cc00e964078c"}D{i:1;uuid:"a43bece0-9e19-5a08-89a5-cc00e964078c_HORIZONTAL"}
D{i:2;uuid:"a9c1a6d4-d295-50ea-a18f-7a0578854b79"}D{i:3;uuid:"cd80b6e8-ec0a-5e68-805c-ad0b790fb160"}
D{i:4;uuid:"0e54a121-0519-547c-aba7-c59ce58e4872"}
}
##^##*/

