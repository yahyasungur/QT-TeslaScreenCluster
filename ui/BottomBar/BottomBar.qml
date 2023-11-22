import QtQuick 2.0

Rectangle {
    id: bottomBar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    height: parent.height / 14
    color: "#2E2E2E"

    Image {
        id: carSettingsIcon
        anchors {
            left: parent.left
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.75
        fillMode: Image.PreserveAspectFit

        source: carModeController.isClusterModeOn ? "qrc:/ui/assets/carSettingsIconRed.png" : "qrc:/ui/assets/carSettingsIcon.png"

        MouseArea {
            anchors.fill: parent
            onClicked: carModeController.setIsClusterModeOn(!carModeController.isClusterModeOn)
        }
    }

    HVACComponent {
        id: driverHVACControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: carSettingsIcon.right
            leftMargin: 130
        }

        hvacController: driverHVAC
    }

    VolumeComponent {
        id: volumeComponent
        anchors {
            right: parent.right
            rightMargin: 10
            top: parent.top
            bottom: parent.bottom
        }
    }

    HVACComponent {
        id: passengerHVACControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: volumeComponent.left
            rightMargin: 130
        }

        hvacController: passengerHVAC
    }
}
