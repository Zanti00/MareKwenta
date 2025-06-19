/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
import MareKwenta
import QtQuick.Studio.DesignEffects


Rectangle {
    width: Constants.width
    height: Constants.height
    color: "#f2efea"

    Loader{
        source: "assets/Entry_Page_Employee.ui.qml"

    }

    Text {
        color: "#4e2d18"
        text: qsTr("Hello, User")
        font.pixelSize: 38
        font.styleName: "Medium"
        font.family: "Unbounded"
        anchors.verticalCenterOffset: -457
        anchors.horizontalCenterOffset: -494
        anchors.centerIn: parent
    }

    Frame {
        id: frame
        x: 945
        y: 0
        width: 495
        height: 1024
        data: [
            DesignEffect {
                effects: [
                    DesignDropShadow {
                        color: "#21000000"
                        blur: 24
                        offsetY: 0
                        offsetX: -22
                    }
                ]
            }
        ]

        Rectangle {
            id: rectangle
            x: 0
            y: 0
            width: 495
            height: 1024
            color: "#f2efea"
        }

    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 88
        height: 1029
        color: "#ffffff"
    }
}
