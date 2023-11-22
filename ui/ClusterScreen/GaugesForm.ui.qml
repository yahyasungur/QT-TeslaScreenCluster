import QtQuick 2.4

Item {
    id: root

    property alias tachoMeter: tachoMeter
    property alias speedMeter: speedMeter

    property alias tachoText: tachoText.text
    property alias speedText: speedText.text

    property alias tachoNeedleRpm: tachoNeedle.vehicleRpm
    property alias speedNeedleSpeed: speedNeedle.vehicleSpeed

    property alias tachoNumRect: tachoNumRect
    property alias speedNumRect: speedNumRect
    property alias tachoCorner: tachoCorner
    property alias speedCorner: speedCorner
    property alias tachoNeedle: tachoNeedle
    property alias speedNeedle: speedNeedle
    property alias speedImage: speedImage

    width: 1920
    height: 720

    Item {
        id: tachoMeter
        width: 612
        height: width
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: tachoImage
            x: 0
            y: 0
            width: parent.width
            height: width
            source: tachoImageSrc
            visible: true
        }
    } // tachoMeter

    Rectangle {
        id: tachoNumRect
        x: 216
        y: 270
        width: 180
        height: width
        color: "#000000"
        radius: width

        Text {
            id: tachoText
            color: "#ffffff"
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 60
        }
        Text {
            id: tachoUnitText
            color: "#ffffff"
            text: root.tachoUnit
            anchors.horizontalCenterOffset: -35
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.top: tachoText.bottom
            anchors.topMargin: -5
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }
        Text {
            id: tachoUnitSpecText
            color: "#ffffff"
            text: root.tachoUnitSpec
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: tachoUnitText.verticalCenter
            anchors.left: tachoUnitText.right
            anchors.rightMargin: 2
            font.pixelSize: 20
        }
        z: 1000
    }
    TachoNeedle {
        id: tachoNeedle
        x: 0
        y: 25
        width: 612
        height: width
        z: tachoNumRect.z - 1
    }
    Rectangle {
        id: tachoCorner
        scale: 3.0
        opacity: 0.0
        x: 212
        y: 266
        width: tachoNumRect.width + 8
        height: width
        radius: width
        color: "transparent"
        border.color: "white"
        border.width: 7
    }

    Item {
        id: speedMeter
        x: 1440
        width: 612
        height: width
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: speedImage
            x: 0
            y: 0
            width: parent.width
            height: width
            source: speedImageSrc
            visible: true
        }
    } // speedMeter

    Rectangle {
        id: speedNumRect
        x: 1524
        y: 270
        width: 180
        height: width
        radius: width
        color: "#000000"

        Text {
            id: speedText
            x: 150
            color: "#ffffff"
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 60
        }
        Text {
            id: speedUnitText
            x: 150
            color: "#ffffff"
            text: root.speedUnit
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.top: speedText.bottom
            anchors.topMargin: -5
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }

        z: 1000
    }

    SpeedNeedle {
        id: speedNeedle
        x: 654
        y: 25
        width: 612
        height: width
        z: speedNumRect.z - 1
    }
    Rectangle {
        id: speedCorner
        scale: 3.0
        opacity: 0.0
        x: 1520
        y: 266
        width: speedNumRect.width + 8
        height: width
        radius: width
        color: "transparent"
        border.color: "white"
        border.width: 7
    }
}

