import QtQuick 2.0

Item {
    id: root
    width: 680
    height: 680
    Rectangle {
        id: helpItem
        width: parent.width
        height: parent.height
        color: "black"
        Text {
            id: helpText
            width: parent.width
            anchors.centerIn: parent
            text: "Copyright (C) 2023 Yahya Sungur"
            color: "#ffffff"
            anchors.horizontalCenterOffset: 0
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
        }
    }
}
