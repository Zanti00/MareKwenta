import QtQuick
import "mareKwenta"
import QtQuick.Window 2.1

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "MareKwenta"

    Login {
        id: mainScreen
    }

}

