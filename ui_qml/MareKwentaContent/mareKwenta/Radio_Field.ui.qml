import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.15
import QtQuick.Layouts 1.15

Rectangle {
    id: radio_Field
    width: 340
    height: 44
    color: "transparent"
    property alias descriptionText: description.text
    property alias labelText: label.text
    state: "state_Default_Value_Type_Checked"

    ColumnLayout {
        id: radio_Field_layout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 0
        Rectangle {
            id: checkbox_and_Label
            color: "transparent"
            RowLayout {
                id: checkbox_and_Label_layout
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                spacing: 12
                Rectangle {
                    id: radio1
                    color: "#e6e6e6"
                    radius: 9999
                    border.color: "#2c2c2c"
                    border.width: 1
                    ArcItem {
                        id: radio
                        width: 10
                        height: 10
                        anchors.verticalCenter: parent.verticalCenter
                        strokeWidth: 0
                        strokeStyle: 0
                        strokeColor: "transparent"
                        outlineArc: true
                        fillColor: "#1e1e1e"
                        end: 450.00001
                        begin: 90
                        arcWidth: 5
                        antialiasing: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    clip: true
                    Layout.preferredWidth: 16
                    Layout.preferredHeight: 16
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                }

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
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                }
            }
            Layout.preferredHeight: 22
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        Rectangle {
            id: description_Row
            color: "transparent"
            RowLayout {
                id: description_Row_layout
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                spacing: 12
                Rectangle {
                    id: space
                    color: "transparent"
                    clip: true
                    Layout.preferredWidth: 16
                    Layout.preferredHeight: 16
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                }

                Text {
                    id: description
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
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                }
            }
            Layout.preferredHeight: 22
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }
    }
    states: [
        State {
            name: "state_Disabled_Value_Type_Checked"

            PropertyChanges {
                target: radio
                fillColor: "#b3b3b3"
            }

            PropertyChanges {
                target: description
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: radio1
                color: "#d9d9d9"
                border.color: "#b3b3b3"
            }

            PropertyChanges {
                target: label
                color: "#b3b3b3"
            }

            PropertyChanges {
                target: description_Row
                opacity: 0.5
            }
        },
        State {
            name: "state_Disabled_Value_Type_Unchecked"

            PropertyChanges {
                target: radio
                visible: false
                fillColor: "#b3b3b3"
            }

            PropertyChanges {
                target: radio1
                color: "#d9d9d9"
                border.color: "#b3b3b3"
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
            name: "state_Default_Value_Type_Unchecked"

            PropertyChanges {
                target: radio
                visible: false
                fillColor: "#f5f5f5"
            }

            PropertyChanges {
                target: radio1
                color: "#ffffff"
                border.color: "#757575"
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
            name: "state_Default_Value_Type_Checked"

            PropertyChanges {
                target: radio
                fillColor: "#1e1e1e"
            }

            PropertyChanges {
                target: description
                color: "#757575"
            }

            PropertyChanges {
                target: radio1
                color: "#e6e6e6"
                border.color: "#2c2c2c"
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
    D{i:0;uuid:"62de99dd-c2aa-59f3-98d7-96cd7467e374"}D{i:1;uuid:"62de99dd-c2aa-59f3-98d7-96cd7467e374_VERTICAL"}
D{i:2;uuid:"b9993dd4-da25-5e26-b03f-5dce796b773c"}D{i:3;uuid:"b9993dd4-da25-5e26-b03f-5dce796b773c_HORIZONTAL"}
D{i:4;uuid:"be69c029-a81f-5118-86c8-e8dbea7b754b"}D{i:5;uuid:"8cac85ce-4eab-5b84-bb61-88a5c5b0edf5"}
D{i:6;uuid:"94e5385b-6dd0-579b-82c6-5f51b9b3cdba"}D{i:7;uuid:"86a61c22-772e-5c7e-bcd4-a03f7f71939f"}
D{i:8;uuid:"86a61c22-772e-5c7e-bcd4-a03f7f71939f_HORIZONTAL"}D{i:9;uuid:"356d84d5-5e15-5f33-8397-be4fe4150c85"}
D{i:10;uuid:"d90082f8-d67e-5303-a196-77ca7c9bea9f"}
}
##^##*/

