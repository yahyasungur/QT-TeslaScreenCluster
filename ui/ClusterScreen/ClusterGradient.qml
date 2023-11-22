import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root

    width: 100
    height: 100

    property double topAndBottomCurtainHeight: 100
    property double leftAndRightCurtainWidth: 100

    property double topGradientHeight: 200
    property double leftGradientWidth: 200
    property double rightGradientWidth: 200
    property double bottomGradientHeight: 200

    property string curtainColor: "black"
    property string gradientStartColor: "black"
    property string gradientStopColor: "transparent"

    property double gradientTopStopPoint: 0.5
    property double gradientLeftStopPoint: 0.6
    property double gradientRightStopPoint: 0.8
    property double gradientBottomStopPoint: 0.8

    function fadeIn() {
        fadeInAnimation.start();
    }
    function fadeOut() {
        fadeOutAnimation.start();
    }

    // Top gradient
    Rectangle {
        id: top
        anchors.top: parent.top
        width: parent.width
        height: topAndBottomCurtainHeight
        color: curtainColor

        LinearGradient {
            width: parent.width
            height: topGradientHeight
            anchors.top: parent.bottom
            start: Qt.point(0, 0)
            end: Qt.point(0, height)
            gradient: Gradient {
                GradientStop { position: 0.0; color: gradientStartColor }
                GradientStop { position: gradientTopStopPoint; color: gradientStopColor }
            }
        }
    }

    // Left gradient
    Rectangle {
        id: left
        width: leftAndRightCurtainWidth
        height: parent.height
        anchors.left: parent.left
        color: curtainColor

        LinearGradient {
            width: leftGradientWidth
            height: parent.height
            anchors.left: parent.right
            start: Qt.point(0, 0)
            end: Qt.point(width, 0)
            gradient: Gradient {
                GradientStop { position: 0.0; color: gradientStartColor }
                GradientStop { position: gradientLeftStopPoint; color: gradientStopColor }
            }
        }
    }

    // Right gradient
    Rectangle {
        id: right
        width: leftAndRightCurtainWidth
        height: parent.height
        anchors.right: parent.right
        color: curtainColor

        LinearGradient {
            width: rightGradientWidth
            height: parent.height
            anchors.right: parent.left
            start: Qt.point(0, 0)
            end: Qt.point(width, 0)
            gradient: Gradient {
                GradientStop { position: 0.0; color: gradientStopColor }
                GradientStop { position: gradientRightStopPoint; color: gradientStartColor }
            }
        }
    }

    // Bottom gradient
    Rectangle {
        id: bottom
        width: parent.width
        height: topAndBottomCurtainHeight
        anchors.bottom: parent.bottom
        color: curtainColor

        LinearGradient {
            width: parent.width
            height: bottomGradientHeight
            anchors.bottom: parent.top
            start: Qt.point(0, 0)
            end: Qt.point(0, height)
            gradient: Gradient {
                GradientStop { position: 0.0; color: gradientStopColor }
                GradientStop { position: gradientBottomStopPoint; color: gradientStartColor }
            }
        }
    }

    Rectangle {
        id: viewFiller
        anchors.fill: parent
        opacity: 1.0
        color: "black"
    }

    SequentialAnimation {
        id: fadeInAnimation
        running: false
        loops: 1

        PauseAnimation { duration: 300 }
        ParallelAnimation {
            PropertyAnimation {
                target: viewFiller
                properties: "opacity"
                from: 0.3
                to: 0.0
                duration: 300
            }
        }
    }

    SequentialAnimation {
        id: fadeOutAnimation
        running: false
        loops: 1

        PauseAnimation { duration: 300 }
        ParallelAnimation {
            PropertyAnimation {
                target: viewFiller
                properties: "opacity"
                from: 0.0
                to: 0.3
                duration: 300
            }
        }
    }
}

