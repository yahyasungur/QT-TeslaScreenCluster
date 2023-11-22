import QtQuick 2.0

Rectangle {
    id: rightScreen
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    width: parent.width * 2/3

    MapComponent {
        id: mapComponent
        anchors.fill: parent
    }

    Image {
        id: lockIcon
        anchors {
            left: parent.left
            top: parent.top
            margins: 8
        }
        width: parent.width / 45
        fillMode: Image.PreserveAspectFit
        source: (systemHandler.carLocked ? "qrc:/ui/assets/lockIcon.png" : "qrc:/ui/assets/unlockIcon.png")

        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked( !systemHandler.carLocked )
        }
    }

    Text {
        id: dateTimeDisplay
        anchors {
            left: lockIcon.right
            leftMargin: 25
            bottom: lockIcon.bottom
        }
        font.pixelSize: 16
        font.bold: false
        color: "black"

        text: systemHandler.currentTime
    }

    Text {
        id: outdoorTemperatureDisplay
        anchors {
            left: dateTimeDisplay.right
            leftMargin: 25
            bottom: lockIcon.bottom
        }
        font.pixelSize: 16
        font.bold: false
        color: "black"

        text: systemHandler.outdoorTemp + "°C"
    }

    Image {
        id: userIcon
        anchors {
            left: outdoorTemperatureDisplay.right
            leftMargin: 25
            bottom: lockIcon.bottom
        }
        width: parent.width / 50
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/userIcon.png"
    }

    Text {
        id: userNameDisplay
        anchors {
            left: userIcon.right
            leftMargin: 3
            bottom: lockIcon.bottom
        }
        font.pixelSize: 14
        font.bold: false
        color: "black"

        text: systemHandler.userName
    }

    NavigationSearchBox {
        id: navigationSearchBox
        anchors {
            left: lockIcon.left
            top: lockIcon.bottom
            topMargin: 11
        }
        width: parent.width * 5/15
        height: parent.height / 13
    }
}
