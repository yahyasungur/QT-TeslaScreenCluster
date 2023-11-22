import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: music
    width: 680
    height: 680
    property alias albumText: album.text
    property alias artistText: artist.text
    property alias albumCoverSource: albumCover.source
    property alias progressBar: progressBar

    Image {
        id: image
        anchors.fill: parent
        source: imageBgSrc
    }

    Text {
        id: title
        x: 150
        width: 184
        height: 57
        color: "#ffffff"
        text: qsTr("Music")
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 60
    }

    ProgressBar {
        id: progressBar
        y: 484
        opacity: 0.5
        to: 1
        anchors.left: albumContainer.left
        anchors.leftMargin: 0
        anchors.right: albumContainer.right
        anchors.rightMargin: 0
        value: 0
    }

    Text {
        id: album
        x: 329
        y: 148
        color: "#ffffff"
        text: qsTr("Will To Power")
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 2
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 40
    }

    Text {
        id: artist
        x: 329
        y: 94
        color: "#ffffff"
        text: qsTr("Arch Enemy")
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 2
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 40
    }

    Rectangle {
        id: albumContainer
        x: 212
        y: 212
        width: 276
        height: 276
        color: "#00000000"
        radius: 15
        border.color: "#00000000"
        border.width: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: albumCover
            x: 0
            y: 0
            width: 256
            height: 256
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/ui/assets/clusterScreen/album1.png"
        }
    }
}
