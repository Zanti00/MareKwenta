import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: input_Field
    width: 240
    height: 70
    color: "transparent"
    property alias descriptionText: description.text
    property alias errorText: error.text
    property alias valueText: value.text
    property alias labelText: label.text
    state: "state_Default_Value_Type_Placeholder"

    ColumnLayout {
        id: input_Field_layout
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
            id: input
            color: "#ffffff"
            radius: 8
            border.color: "#d9d9d9"
            border.width: 1
            RowLayout {
                id: input_layout
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 16
                anchors.rightMargin: 16
                anchors.topMargin: 12
                anchors.bottomMargin: 12
                spacing: 0
                Text {
                    id: value
                    color: "#b3b3b3"
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
            }
            clip: true
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        Text {
            id: error
            visible: false
            color: "#1e1e1e"
            text: qsTr("Error")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            lineHeight: 22
            lineHeightMode: Text.FixedHeight
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Inter"
            Layout.preferredWidth: 38
            Layout.preferredHeight: 22
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }
    }
    states: [
        State {
            name: "state_Disabled_Value_Type_Default"

            PropertyChanges {
                target: input
                color: "#d9d9d9"
                border.color: "#b2b2b2"
            }

            PropertyChanges {
                target: label
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: error
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: value
                color: "#b3b3b3"
            }
        },
        State {
            name: "state_Disabled_Value_Type_Placeholder"

            PropertyChanges {
                target: input
                color: "#d9d9d9"
                border.color: "#b2b2b2"
            }

            PropertyChanges {
                target: label
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: error
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: value
                color: "#b3b3b3"
            }
        },
        State {
            name: "state_Error_Value_Type_Default"

            PropertyChanges {
                target: input
                color: "#ffffff"
                border.color: "#900b09"
            }

            PropertyChanges {
                target: error
                color: "#900b09"
            }

            PropertyChanges {
                target: value
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: label
                color: "#1e1e1e"
            }
        },
        State {
            name: "state_Error_Value_Type_Placeholder"

            PropertyChanges {
                target: input
                color: "#ffffff"
                border.color: "#900b09"
            }

            PropertyChanges {
                target: error
                color: "#900b09"
            }

            PropertyChanges {
                target: value
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: label
                color: "#1e1e1e"
            }
        },
        State {
            name: "state_Default_Value_Type_Default"

            PropertyChanges {
                target: value
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: input
                color: "#ffffff"
                border.color: "#d9d9d9"
            }

            PropertyChanges {
                target: error
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: label
                color: "#1e1e1e"
            }
        },
        State {
            name: "state_Default_Value_Type_Placeholder"

            PropertyChanges {
                target: input
                color: "#ffffff"
                border.color: "#d9d9d9"
            }

            PropertyChanges {
                target: error
                color: "#1e1e1e"
            }

            PropertyChanges {
                target: value
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: label
                color: "#1e1e1e"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"d978935f-4856-50c8-8fd1-da696b8506d9"}D{i:1;uuid:"d978935f-4856-50c8-8fd1-da696b8506d9_VERTICAL"}
D{i:2;uuid:"ff5f8312-f2d6-5155-9fbf-d1bb5ff9f7ea"}D{i:3;uuid:"cbeb7ce7-def3-5b7d-b745-b16766eb05b4"}
D{i:4;uuid:"73e0df90-293a-591d-b023-8b7db9dd24db"}D{i:5;uuid:"73e0df90-293a-591d-b023-8b7db9dd24db_HORIZONTAL"}
D{i:6;uuid:"e3b94033-46e8-5636-a32c-64770f01b896"}D{i:7;uuid:"81de7ee7-ed6d-5f5f-baf7-5b33d056ad46"}
}
##^##*/

