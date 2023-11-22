import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: settings

    property alias listview: listView
    property alias helpItem: helpItem
    property alias titleText: title.text
    property alias highlightSpeed: listView.highlightMoveDuration

    width: 680
    height: 680

    Image {
        id: image
        height: 680
        anchors.top: title.bottom
        anchors.topMargin: 0
        anchors.right: listView.right
        anchors.rightMargin: 0
        anchors.left: listView.left
        anchors.leftMargin: 0
        source: imageBgSrc
    }

    ListView {
        id: listView
        interactive: false
        contentHeight: 160
        anchors.top: title.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 3
        highlight: Image {
            source: "qrc:/ui/assets/clusterScreen/selectionBox.png"
        }
        currentIndex: selectedMenuIndex
        delegate: settingsListDelegate
        model: mainModel
    }

    Text {
        id: title
        x: 150
        width: 184
        height: 57
        color: "#ffffff"
        text: qsTr("Settings")
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 60
    }
    Help {
        id: helpItem
        x: 0
        y: -16
        visible: false
        width: 680
        height: 753
        MouseArea {
            anchors.fill: parent
            onClicked: helpItem.visible = false
        }
    }
}
