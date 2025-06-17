import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: header_Auth
    width: 178
    height: 32
    color: "transparent"
    state: "state_Logged_Out"

    RowLayout {
        id: header_Auth_layout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 12
        Button {
            id: button
            state: "variant_Neutral_State_Default_Size_Small"
            clip: true
            buttonText: qsTr("Sign in")
            Layout.preferredHeight: 32
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }

        Button {
            id: button1
            state: "variant_Primary_State_Default_Size_Small"
            clip: true
            buttonText: qsTr("Register")
            Layout.preferredHeight: 32
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }

        Avatar {
            id: avatar
            visible: false
            state: "type_Image_Size_Large_Shape_Circle"
            clip: true
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }

        Chevron_down {
            id: chevron_down
            visible: false
            state: "size_16"
            clip: true
            Layout.preferredWidth: 16
            Layout.preferredHeight: 16
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }
    }
    states: [
        State {
            name: "state_Logged_In_Hover"

            PropertyChanges {
                target: avatar
                visible: true
            }

            PropertyChanges {
                target: header_Auth
                width: 88
                height: 56
                color: "#f5f5f5"
                radius: 8
            }

            PropertyChanges {
                target: header_Auth_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 8
                anchors.bottomMargin: 8
                spacing: 8
            }

            PropertyChanges {
                target: chevron_down
                visible: true
            }

            PropertyChanges {
                target: button1
                visible: false
            }

            PropertyChanges {
                target: button
                visible: false
            }
        },
        State {
            name: "state_Logged_In"

            PropertyChanges {
                target: avatar
                visible: true
            }

            PropertyChanges {
                target: header_Auth
                width: 88
                height: 56
                color: "transparent"
                radius: 8
            }

            PropertyChanges {
                target: header_Auth_layout
                anchors.leftMargin: 12
                anchors.rightMargin: 12
                anchors.topMargin: 8
                anchors.bottomMargin: 8
                spacing: 8
            }

            PropertyChanges {
                target: chevron_down
                visible: true
            }

            PropertyChanges {
                target: button1
                visible: false
            }

            PropertyChanges {
                target: button
                visible: false
            }
        },
        State {
            name: "state_Logged_Out"

            PropertyChanges {
                target: avatar
                visible: false
            }

            PropertyChanges {
                target: header_Auth
                width: 178
                height: 32
                color: "transparent"
            }

            PropertyChanges {
                target: header_Auth_layout
                spacing: 12
            }

            PropertyChanges {
                target: chevron_down
                visible: false
            }

            PropertyChanges {
                target: button1
                visible: true
            }

            PropertyChanges {
                target: button
                visible: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;uuid:"a0608d6a-ca29-5ad5-9d6e-62c56301db26"}D{i:1;uuid:"a0608d6a-ca29-5ad5-9d6e-62c56301db26_HORIZONTAL"}
D{i:2;uuid:"69b4a819-edbc-5b55-8e5e-b7822b174571"}D{i:3;uuid:"fed7f161-1ad1-5f45-b988-5935ae2e5e29"}
D{i:4;uuid:"ea92f20d-166a-57c6-8010-b82674247f49"}D{i:5;uuid:"ec46b487-498d-5d5c-904d-00c647b641bd"}
}
##^##*/

