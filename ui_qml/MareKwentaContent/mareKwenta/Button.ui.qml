import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: button1
    width: 75
    height: 40
    color: "#2c2c2c"
    radius: 8
    border.color: "#2c2c2c"
    border.width: 1
    property alias buttonText: button.text
    state: "variant_Primary_State_Default_Size_Medium"
    clip: true

    RowLayout {
        id: button_layout
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
            color: "#f5f5f5"
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
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
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
            name: "variant_Subtle_State_Hover_Size_Small"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
                width: 67
                height: 32
                color: "transparent"
                border.color: "#d9d9d9"
            }

            PropertyChanges {
                target: button
                color: "#1e1e1e"
            }
        },
        State {
            name: "variant_Subtle_State_Default_Size_Small"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
                width: 67
                height: 32
                color: "transparent"
                border.color: "#2c2c2c"
            }

            PropertyChanges {
                target: button
                color: "#1e1e1e"
            }
        },
        State {
            name: "variant_Neutral_State_Disabled_Size_Small"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
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
            name: "variant_Neutral_State_Hover_Size_Small"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
                width: 67
                height: 32
                color: "#cdcdcd"
                border.color: "#767676"
            }

            PropertyChanges {
                target: button
                color: "#1e1e1e"
            }
        },
        State {
            name: "variant_Neutral_State_Default_Size_Small"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
                width: 67
                height: 32
                color: "#e3e3e3"
                border.color: "#767676"
            }

            PropertyChanges {
                target: button
                color: "#1e1e1e"
            }
        },
        State {
            name: "variant_Primary_State_Disabled_Size_Small"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
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
            name: "variant_Primary_State_Hover_Size_Small"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
                width: 67
                height: 32
                color: "#1e1e1e"
                border.color: "#2c2c2c"
            }

            PropertyChanges {
                target: button
                color: "#f5f5f5"
            }
        },
        State {
            name: "variant_Primary_State_Default_Size_Small"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 8
                anchors.bottomMargin: 8
            }

            PropertyChanges {
                target: button1
                width: 67
                height: 32
                color: "#2c2c2c"
                border.color: "#2c2c2c"
            }

            PropertyChanges {
                target: button
                color: "#f5f5f5"
            }
        },
        State {
            name: "variant_Subtle_State_Disabled_Size_Medium"

            PropertyChanges {
                target: button1
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
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Subtle_State_Hover_Size_Medium"

            PropertyChanges {
                target: button1
                width: 75
                height: 40
                color: "transparent"
                border.color: "#d9d9d9"
            }

            PropertyChanges {
                target: button
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Subtle_State_Default_Size_Medium"

            PropertyChanges {
                target: button1
                width: 75
                height: 40
                color: "transparent"
                border.color: "#2c2c2c"
            }

            PropertyChanges {
                target: button
                color: "#303030"
            }

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Neutral_State_Disabled_Size_Medium"

            PropertyChanges {
                target: button1
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
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Neutral_State_Hover_Size_Medium"

            PropertyChanges {
                target: button1
                width: 75
                height: 40
                color: "#cdcdcd"
                border.color: "#767676"
            }

            PropertyChanges {
                target: button
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Neutral_State_Default_Size_Medium"

            PropertyChanges {
                target: button1
                width: 75
                height: 40
                color: "#e3e3e3"
                border.color: "#767676"
            }

            PropertyChanges {
                target: button
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Primary_State_Disabled_Size_Medium"

            PropertyChanges {
                target: button1
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
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }
        },
        State {
            name: "variant_Primary_State_Hover_Size_Medium"

            PropertyChanges {
                target: button1
                width: 75
                height: 40
                color: "#1e1e1e"
                border.color: "#2c2c2c"
            }

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }

            PropertyChanges {
                target: button
                color: "#f5f5f5"
            }
        },
        State {
            name: "variant_Primary_State_Default_Size_Medium"

            PropertyChanges {
                target: button_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
            }

            PropertyChanges {
                target: button1
                width: 75
                height: 40
                color: "#2c2c2c"
                border.color: "#2c2c2c"
            }

            PropertyChanges {
                target: button
                color: "#f5f5f5"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"8e9f1679-d499-5791-bede-2230c6c43e62"}D{i:1;uuid:"8e9f1679-d499-5791-bede-2230c6c43e62_HORIZONTAL"}
D{i:2;uuid:"edaedd93-8eae-5bbc-b5c3-dd3a4a0a7a7a"}D{i:3;uuid:"3b24ec62-fc84-58cb-affe-14bd7bd1f21f"}
D{i:4;uuid:"ad4cb446-6dc2-566c-804e-f120aae62ca2"}
}
##^##*/

