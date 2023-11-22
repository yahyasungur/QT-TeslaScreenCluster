import QtQuick 2.0

Item {
    id: simulation
    property int speed: 0
    property int rpm: 0

    property int turnSignal: Qt.NoArrow

    property var currentDate: new Date()
    property string time: currentDate.toLocaleTimeString(Qt.locale("en_EN"), "hh:mm")

    property bool startupAnimation: true

    property int angleOffset: -135
    property double speedAngle: -135
    property double tachoAngle: -135

    SequentialAnimation {
        id: animation
        running: true
        loops: Animation.Infinite

        ParallelAnimation {
            PropertyAnimation {
                target: simulation
                property: "speed"
                from: 0
                to: useMetric ? 260: 140
                duration: 15000
                easing.type: Easing.InBounce
            }
            PropertyAnimation {
                target: simulation
                property: "speedAngle"
                from: angleOffset
                to: 100
                duration: 15000
                easing.type: Easing.InBounce
            }
            SequentialAnimation {
                ParallelAnimation {
                    PropertyAnimation {
                        target: simulation
                        property: "rpm"
                        from: 0
                        to: 3000
                        duration: 5000
                        easing.type: Easing.InOutSine
                    }
                    PropertyAnimation {
                        target: simulation
                        property: "tachoAngle"
                        from: angleOffset
                        to: -40
                        duration: 5000
                        easing.type: Easing.InOutSine
                    }
                }
                ParallelAnimation {
                    PropertyAnimation {
                        target: simulation
                        property: "rpm"
                        from: 3000
                        to: 5000
                        duration: 5000
                        easing.type: Easing.InOutSine
                    }
                    PropertyAnimation {
                        target: simulation
                        property: "tachoAngle"
                        from: -40
                        to: 26
                        duration: 5000
                        easing.type: Easing.InOutSine
                    }
                }
                ParallelAnimation {
                    PropertyAnimation {
                        target: simulation
                        property: "rpm"
                        from: 5000
                        to: 7000
                        duration: 5000
                        easing.type: Easing.InOutSine
                    }
                    PropertyAnimation {
                        target: simulation
                        property: "tachoAngle"
                        from: 26
                        to: 91
                        duration: 5000
                        easing.type: Easing.InOutSine
                    }
                }
            }
        }

        ParallelAnimation {
            PropertyAnimation {
                target: simulation
                property: "speed"
                from: useMetric ? 260: 140
                to: 0
                duration: 10000
                easing.type: Easing.OutBounce
            }
            PropertyAnimation {
                target: simulation
                property: "speedAngle"
                from: 100
                to: -135
                duration: 10000
                easing.type: Easing.OutBounce
            }
            SequentialAnimation {
                ParallelAnimation {
                    PropertyAnimation {
                        target: simulation
                        property: "rpm"
                        from: 7000
                        to: 5000
                        duration: 3000
                        easing.type: Easing.InOutSine
                    }
                    PropertyAnimation {
                        target: simulation
                        property: "tachoAngle"
                        from: 91
                        to: 26
                        duration: 3000
                        easing.type: Easing.InOutSine
                    }
                }
                ParallelAnimation {
                    PropertyAnimation {
                        target: simulation
                        property: "rpm"
                        from: 5000
                        to: 3000
                        duration: 3000
                        easing.type: Easing.InOutSine
                    }
                    PropertyAnimation {
                        target: simulation
                        property: "tachoAngle"
                        from: 26
                        to: -40
                        duration: 3000
                        easing.type: Easing.InOutSine
                    }
                }
                ParallelAnimation {
                    PropertyAnimation {
                        target: simulation
                        property: "rpm"
                        from: 3000
                        to: 0
                        duration: 4000
                        easing.type: Easing.InOutSine
                    }
                    PropertyAnimation {
                        target: simulation
                        property: "tachoAngle"
                        from: -40
                        to: angleOffset
                        duration: 4000
                        easing.type: Easing.InOutSine
                    }
                }
            }
        }
    }

    Timer {
        running: true
        property bool turnLeft: true
        repeat: true
        interval: 5000
        onTriggered: {
            turnLeft = !turnLeft
            if (turnLeft)
                turnSignal = Qt.LeftArrow
            else
                turnSignal = Qt.RightArrow
            stopSignaling.start()
        }
    }

    Timer {
        id: stopSignaling
        running: false
        interval: 2100
        onTriggered: turnSignal = Qt.NoArrow
    }

    function updateTime() {
        currentDate = new Date();
        time = currentDate.toLocaleTimeString(Qt.locale("en_EN"), "hh:mm");
    }

    Timer {
        interval: 30000
        repeat: true
        running: true

        onTriggered: {
            updateTime();
        }
    }
}
