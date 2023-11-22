import QtQuick 2.0

Item {
    property string backgroungColor: "#2E2E2E"

    Connections {
        target: volumeController
        ignoreUnknownSignals: true
        function onVolumeLevelChanged() {
            volumeIcon.visible = false
            visibleTimer.start()
        }
    }

    Timer {
        id: visibleTimer
        interval: 500
        repeat: false
        onTriggered: {
            volumeIcon.visible = true
        }
    }

    width: 90 * (parent.width / 1280)

    Rectangle {
        id: decrementButton
        radius: 18
        anchors {
            right: volumeIcon.left
            rightMargin: 4
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: backgroungColor
        Text {
            id: decrementText
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 15
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: volumeController.incrementVolume(-1)
        }
    }

    Image {
        id: volumeIcon
        height: parent.height * 0.65
        fillMode: Image.PreserveAspectFit
        anchors {
            right: incrementButton.left
            rightMargin: 4
            verticalCenter: parent.verticalCenter
        }
        source: {
            switch (volumeController.volumeLevel){
                case 0:
                    return "qrc:/ui/assets/volume0.png"
                case 1:
                    return "qrc:/ui/assets/volume1.png"
                case 2:
                    return "qrc:/ui/assets/volume2.png"
                case 3:
                default:
                    return "qrc:/ui/assets/volume3.png"
            }
        }
    }

    Text {
        id: volumeLevelText
        visible: !volumeIcon.visible
        anchors {
            centerIn: volumeIcon
        }
        color: "white"
        font.pixelSize: 16
        text: (volumeController.volumeLevel * 33.3)
    }

    Rectangle {
        id: incrementButton
        radius: 18
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: backgroungColor
        Text {
            id: incrementText
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 15
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: volumeController.incrementVolume(+1)
        }
    }
}
