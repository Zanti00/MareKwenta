// Product_Panel.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Rectangle {
    id: product_panel_root
    objectName: "product_panel_root"
    width: 878
    height: 938
    color: "#f2efea"

    // --- Signal ---
    signal product_clicked(string product_name, string product_type)

    property string currentTab: "All"

    ListModel {
        id: product_full_model
        ListElement { name: "Americano"; image: "images/americano.png"; category: "Coffee"; productType: "Coffee" }
        ListElement { name: "Cafe Latte"; image: "images/cafe_latte.png"; category: "Coffee"; productType: "Coffee" }
        ListElement { name: "Caramel Macchiato"; image: "images/caramel_macc.png"; category: "Coffee"; productType: "Coffee" }
        ListElement { name: "Mocha"; image: "images/mocha.png"; category: "Coffee"; productType: "Coffee" }
        ListElement { name: "Cappuccino"; image: "images/cappuccino.png"; category: "Coffee"; productType: "Coffee" }
        ListElement { name: "Matcha Latte"; image: "images/matcha.png"; category: "Non-Coffee"; productType: "Matcha" }
        ListElement { name: "Chocolate"; image: "images/chocolate.png"; category: "Non-Coffee"; productType: "Chocolate" }
        ListElement { name: "Strawberry Frappe"; image: "images/sb_frappe.png"; category: "Non-Coffee"; productType: "Frappe" }
        ListElement { name: "Caramel Frappe"; image: "images/caramel_frappe.png"; category: "Non-Coffee"; productType: "Frappe" }
        ListElement { name: "Chocolate Chip Frappe"; image: "images/choc_chip_frappe.png"; category: "Non-Coffee"; productType: "Frappe" }
        ListElement { name: "Tocilog"; image: "images/tocilog.png"; category: "Food";productType: "Food" }
        ListElement { name: "Garlic Rice"; image: "images/garlic_rice.png"; category: "Food" ;productType: "Food"}
        ListElement { name: "Pork Siomai Rice"; image: "images/pork_siomai_rice.png"; category: "Food";productType: "Food" }
        ListElement { name: "Hamsilog"; image: "images/hamsilog.png"; category: "Food";productType: "Food" }
    }

    ListModel {
        id: product_filtered_model
    }

    function update_filtered_model() {
        product_filtered_model.clear()

        for (var i = 0; i < product_full_model.count; ++i) {
            var item = product_full_model.get(i)
            if (product_panel_root.currentTab === "All" || item.category === product_panel_root.currentTab) {
                product_filtered_model.append(item)
            }
        }
    }

    onCurrentTabChanged: {
        update_filtered_model()
    }

    Component.onCompleted: {
        update_filtered_model()
    }

    TabBar {
        id: custom_tab_bar

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 17
        anchors.rightMargin: 17
        anchors.topMargin: 13
        height: 40
        currentIndex: {
            if (product_panel_root.currentTab === "All") return 0;
            if (product_panel_root.currentTab === "Coffee") return 1;
            if (product_panel_root.currentTab === "Non-Coffee") return 2;
            if (product_panel_root.currentTab === "Food") return 3;
            return 0;
        }

        background: Rectangle {
            color: product_panel_root.color
            radius: 18
            border.color: "#d0c9c2"
            border.width: 1
        }

        TabButton {
            text: "All"
            font.family: "Unbounded"
            font.weight: Font.Bold
            font.pixelSize: 15
            padding:10
            focusPolicy: Qt.NoFocus
            background: Rectangle { color: "transparent"; radius: 16 }
            contentItem: Text { text: parent.text; font: parent.font; color: "#4e2d18"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
            onClicked: product_panel_root.currentTab = "All"
            indicator: Rectangle { anchors.bottom: parent.bottom; anchors.horizontalCenter: parent.horizontalCenter; width: parent.width * 0.7; height: 2; color: "#4e2d18"; visible: parent.checked }
        }

        TabButton {
            text: "Coffee"
            font.family: "Unbounded"
            font.weight: Font.Bold
            font.pixelSize: 15
            focusPolicy: Qt.NoFocus
            background: Rectangle { color: "transparent"; radius: 16 }
            contentItem: Text { text: parent.text; font:parent.font; color: "#4e2d18"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
            padding: 10
            onClicked: product_panel_root.currentTab = "Coffee"
            indicator: Rectangle { anchors.bottom: parent.bottom; anchors.horizontalCenter: parent.horizontalCenter; width: parent.width * 0.7; height: 2; color: "#4e2d18"; visible: parent.checked }
        }
        TabButton {
            text: "Non-Coffee"
            font.family: "Unbounded"
            font.weight: Font.Bold
            font.pixelSize: 15
            focusPolicy: Qt.NoFocus
            background: Rectangle { color: "transparent"; radius: 16 }
            contentItem: Text { text: parent.text; font: parent.font; color: "#4e2d18"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
            padding: 10
            onClicked: product_panel_root.currentTab = "Non-Coffee"
            indicator: Rectangle { anchors.bottom: parent.bottom; anchors.horizontalCenter: parent.horizontalCenter; width: parent.width * 0.7; height: 2; color: "#4e2d18"; visible: parent.checked }
        }
        TabButton {
            text: "Food"
            font.family: "Unbounded"
            font.weight: Font.Bold
            font.pixelSize: 15
            focusPolicy: Qt.NoFocus
            background: Rectangle { color: "transparent"; radius: 16 }
            contentItem: Text { font:parent.font; text: parent.text; color: "#4e2d18"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
            padding: 10
            onClicked: product_panel_root.currentTab = "Food"
            indicator: Rectangle { anchors.bottom: parent.bottom; anchors.horizontalCenter: parent.horizontalCenter; width: parent.width * 0.7; height: 2; color: "#4e2d18"; visible: parent.checked }
        }
    }

    ScrollView {
        id: scroll_view_products
        anchors {
            top: custom_tab_bar.bottom
            topMargin: 20
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 30
            rightMargin: 0
        }

        GridView {
            id: product_grid
            width: parent.width
            height: contentHeight
            model: product_filtered_model
            cellWidth: 205
            cellHeight: 230

            delegate: Product_Buttonroot {
                product_name: name
                product_image_source: image
                product_type: productType
                onClicked: {
                    product_panel_root.product_clicked(product_name, product_type)
                }
            }
        }
    }
}
