import QtQuick 2.0

Item {
    property string backgroungColor: "#2E2E2E"
    property var hvacController

    width: 90 * (parent.width / 1280)

    Rectangle {
        id: decrementButton
        radius: 18
        anchors {
            left: parent.left
            top: parent.top
            topMargin: 5
            bottom: parent.bottom
            bottomMargin: 5
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
            onClicked: hvacController.incrementTargetTemperature(-1)
        }
    }

    Text {
        id: targetTemperatureText
        anchors {
            left: decrementButton.right
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }
        color: "white"
        font.pixelSize: 24
        font.bold: false
        text: hvacController.targetTemperature
    }

    Rectangle {
        id: incrementButton
        radius: 18
        anchors {
            left: targetTemperatureText.right
            leftMargin: 10
            top: parent.top
            topMargin: 5
            bottom: parent.bottom
            bottomMargin: 5
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
            onClicked: hvacController.incrementTargetTemperature(+1)
        }
    }
}
