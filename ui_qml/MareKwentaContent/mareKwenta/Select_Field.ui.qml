import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: select_Field
    width: 240
    height: 70
    color: "transparent"
    property alias errorText: error.text
    property alias descriptionText: description.text
    property alias valueText: value.text
    property alias labelText: label.text
    state: "state_Default_Value_Type_Default"

    ColumnLayout {
        id: select_Field_layout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 8
        Text {
            id: label
            color: "#1e1e1e"
            text: qsTr("Label")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            lineHeight: 22
            lineHeightMode: Text.FixedHeight
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
            Layout.preferredHeight: 22
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        Text {
            id: description
            visible: false
            color: "#757575"
            text: qsTr("Description")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            lineHeight: 22
            lineHeightMode: Text.FixedHeight
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
            Layout.preferredHeight: 22
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        Rectangle {
            id: select
            color: "#ffffff"
            radius: 8
            border.color: "#d9d9d9"
            border.width: 1
            RowLayout {
                id: select_layout
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 16
                anchors.rightMargin: 12
                anchors.topMargin: 12
                anchors.bottomMargin: 12
                spacing: 8
                Text {
                    id: value
                    color: "#1e1e1e"
                    text: qsTr("Value")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignTop
                    lineHeight: 16
                    lineHeightMode: Text.FixedHeight
                    wrapMode: Text.Wrap
                    font.weight: Font.Normal
                    font.family: "Inter"
                    Layout.preferredHeight: 16
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                }

                Chevron_down {
                    id: chevron_down
                    state: "size_16"
                    clip: true
                    Layout.preferredWidth: 16
                    Layout.preferredHeight: 16
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                }
            }

            Image {
                id: options
                visible: false
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 4
                anchors.topMargin: 5
                source: "assets/options_state_Default_Value_Type_Default.png"
            }
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        Text {
            id: error
            visible: false
            color: "#900b09"
            text: qsTr("Error")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            lineHeight: 22
            lineHeightMode: Text.FixedHeight
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Inter"
            Layout.preferredHeight: 22
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }
    }

    Image {
        id: options1
        visible: false
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 4
        anchors.topMargin: 5
        source: "assets/options1_state_Default_Value_Type_Default.png"
    }
    states: [
        State {
            name: "state_Disabled_Value_Type_Placeholder"

            PropertyChanges {
                target: error
                visible: false
            }

            PropertyChanges {
                target: value
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: select
                color: "#d9d9d9"
                border.color: "#b2b2b2"
            }

            PropertyChanges {
                target: options1
                visible: false
                source: "assets/options1_state_Default_Value_Type_Default.png"
            }

            PropertyChanges {
                target: description
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: label
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: options
                visible: false
                source: "assets/options_state_Default_Value_Type_Default.png"
            }

            AnchorChanges {
                target: options1
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: select_Field
                height: 70
            }

            AnchorChanges {
                target: options
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "state_Disabled_Value_Type_Default"

            PropertyChanges {
                target: error
                visible: false
            }

            PropertyChanges {
                target: value
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: select
                color: "#d9d9d9"
                border.color: "#b2b2b2"
            }

            PropertyChanges {
                target: options1
                visible: false
                source: "assets/options1_state_Default_Value_Type_Default.png"
            }

            PropertyChanges {
                target: description
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: label
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: options
                visible: false
                source: "assets/options_state_Default_Value_Type_Default.png"
            }

            AnchorChanges {
                target: options1
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: select_Field
                height: 70
            }

            AnchorChanges {
                target: options
                anchors.verticalCenter: undefined
                anchors.left: undefined
                anchors.right: undefined
                anchors.top: undefined
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }
        },
        State {
            name: "state_Error_Value_Type_Placeholder"

            PropertyChanges {
                target: error
                visible: true
            }

            PropertyChanges {
                target: value
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: select
                color: "#ffffff"
                border.color: "#900b09"
            }

            AnchorChanges {
                target: options1
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: parent.top
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: options1
                visible: false
                source: "assets/options1_state_Error_Value_Type_Placeholder.png"
            }

            PropertyChanges {
                target: select_Field
                height: 100
            }

            AnchorChanges {
                target: options
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: parent.top
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: options
                visible: false
                source: "assets/options_state_Error_Value_Type_Placeholder.png"
            }

            PropertyChanges {
                target: description
                color: "#757575"
            }

            PropertyChanges {
                target: label
                color: "#1e1e1e"
            }
        },
        State {
            name: "state_Error_Value_Type_Default"

            PropertyChanges {
                target: error
                visible: true
            }

            PropertyChanges {
                target: select
                color: "#ffffff"
                border.color: "#900b09"
            }

            AnchorChanges {
                target: options1
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: parent.top
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: options1
                visible: false
                source: "assets/options1_state_Error_Value_Type_Default.png"
            }

            PropertyChanges {
                target: select_Field
                height: 100
            }

            AnchorChanges {
                target: options
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: parent.top
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: options
                visible: false
                source: "assets/options_state_Error_Value_Type_Default.png"
            }

            PropertyChanges {
                target: value
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: description
                color: "#757575"
            }

            PropertyChanges {
                target: label
                color: "#1e1e1e"
            }
        },
        State {
            name: "state_Default_Value_Type_Placeholder"

            PropertyChanges {
                target: value
                color: "#b3b3b3"
            }

            AnchorChanges {
                target: options1
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: parent.top
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: options1
                visible: false
                source: "assets/options1_state_Default_Value_Type_Placeholder.png"
            }

            AnchorChanges {
                target: options
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: parent.top
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: options
                visible: false
                source: "assets/options_state_Default_Value_Type_Placeholder.png"
            }

            PropertyChanges {
                target: error
                visible: false
            }

            PropertyChanges {
                target: select
                color: "#ffffff"
                border.color: "#d9d9d9"
            }

            PropertyChanges {
                target: select_Field
                height: 70
            }

            PropertyChanges {
                target: description
                color: "#757575"
            }

            PropertyChanges {
                target: label
                color: "#1e1e1e"
            }
        },
        State {
            name: "state_Default_Value_Type_Default"

            AnchorChanges {
                target: options1
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: parent.top
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            AnchorChanges {
                target: options
                anchors.verticalCenter: undefined
                anchors.left: parent.left
                anchors.right: undefined
                anchors.top: parent.top
                anchors.bottom: undefined
                anchors.horizontalCenter: undefined
                anchors.baseline: undefined
            }

            PropertyChanges {
                target: error
                visible: false
            }

            PropertyChanges {
                target: value
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: select
                color: "#ffffff"
                border.color: "#d9d9d9"
            }

            PropertyChanges {
                target: options1
                visible: false
                source: "assets/options1_state_Default_Value_Type_Default.png"
            }

            PropertyChanges {
                target: select_Field
                height: 70
            }

            PropertyChanges {
                target: description
                color: "#757575"
            }

            PropertyChanges {
                target: label
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: options
                visible: false
                source: "assets/options_state_Default_Value_Type_Default.png"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"16a4a147-8c6d-5935-8ada-5d1ea0f6de67"}D{i:1;uuid:"16a4a147-8c6d-5935-8ada-5d1ea0f6de67_VERTICAL"}
D{i:2;uuid:"2beeca06-03c5-59de-9e29-58c1590bac0b"}D{i:3;uuid:"46a22148-3a13-5c09-9a63-b97e36f6a12d"}
D{i:4;uuid:"545a6c76-dd4c-5d7b-a4b7-ff2b85dd3c78"}D{i:5;uuid:"545a6c76-dd4c-5d7b-a4b7-ff2b85dd3c78_HORIZONTAL"}
D{i:6;uuid:"ec1b050d-390d-5983-a434-0488058b8a64"}D{i:7;uuid:"f68a2f69-ee8a-581e-a272-72999a273630"}
D{i:8;uuid:"2da2c41f-f8dc-5838-a774-de226d83bf6a"}D{i:9;uuid:"04611cfd-df55-562e-abcb-1654457db4e5"}
D{i:10;uuid:"60948e36-0f22-54fd-9412-00ad91b11d39"}
}
##^##*/

