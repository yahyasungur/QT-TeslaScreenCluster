import QtQuick 2.4

OverlayContainerForm {
    id: indicatorContainer

    // Safety critical icons
    property bool parkBrake: true ? true : false
    property bool flatTire: true ? true : false
    property bool fuelLevel: true ? true : false
    property bool seatbelt: true ? true : false
    property bool oilLevel: true ? true : false
    property bool brakeFailure: true ? true : false

    onParkBrakeChanged: {
        parkingBrakeColor = parkBrake ? "#e41e25" : "#222324";
    }

    onFlatTireChanged: {
        tyreFailureColor = flatTire ? "#e6bd32" : "#222324";
    }

    onFuelLevelChanged: {
        fuelLowColor = fuelLevel ? "#e41e25" : "#222324";
    }

    onOilLevelChanged: {
        oilLowColor = oilLevel ? "#e41e25" : "#222324";
    }

    onSeatbeltChanged: {
        seatbeltOffColor = seatbelt ? "#e41e25" : "#222324";
    }

    onBrakeFailureChanged: {
        brakeFailureColor = brakeFailure ? "#e41e25" : "#222324";
    }

    // Non-safety critical indicators
    property int turnSignal: true ? Qt.LeftArrow | Qt.RightArrow : simuData.turnSignal

    onTurnSignalChanged: {
        if (turnSignal !== Qt.NoArrow)
            signalTimer.restart();
        else
            signalTimer.stop();
        var turnLeft = (turnSignal & Qt.LeftArrow);
        var turnRight = (turnSignal & Qt.RightArrow);
        leftTurnSignalSource = turnLeft ? "qrc:/ui/assets/clusterScreen/icon_turnsignal_on.png"
                                        : "qrc:/ui/assets/clusterScreen/icon_turnsignal_off.png";
        rightTurnSignalSource = turnRight ? "qrc:/ui/assets/clusterScreen/icon_turnsignal_on.png"
                                          : "qrc:/ui/assets/clusterScreen/icon_turnsignal_off.png";
    }

    Timer {
        id: signalTimer
        interval: 500
        running: false
        repeat: true
        property bool flashing: false
        onTriggered: {
            flashing = !flashing
            var turnLeft = (flashing && (turnSignal & Qt.LeftArrow));
            var turnRight = (flashing && (turnSignal & Qt.RightArrow));
            leftTurnSignalSource = turnLeft ? "qrc:/ui/assets/clusterScreen/icon_turnsignal_on.png"
                                            : "qrc:/ui/assets/clusterScreen/icon_turnsignal_off.png";
            rightTurnSignalSource = turnRight ? "qrc:/ui/assets/clusterScreen/icon_turnsignal_on.png"
                                              : "qrc:/ui/assets/clusterScreen/icon_turnsignal_off.png";
        }
    }

    Component.onCompleted: {
        overlayBackground.visible = false;
        menuNavigation.scale = 0.75;
        menuNavigation.opacity = 0.5;
        menuMusic.scale = 0.75;
        menuMusic.opacity = 0.5;
        menuCall.scale = 0.75;
        menuCall.opacity = 0.5;
    }

    function select(menuIndex) {
        // settings - navigation - music - call
        menuSettings.scale = 0.75;
        menuSettings.opacity = 0.5;
        menuNavigation.scale = 0.75;
        menuNavigation.opacity = 0.5;
        menuMusic.scale = 0.75;
        menuMusic.opacity = 0.5;
        menuCall.scale = 0.75;
        menuCall.opacity = 0.5;

        switch (menuIndex) {
        case 1:
            menuSettings.scale = 1.0;
            menuSettings.opacity = 1.0;
            break;
        case 2:
            menuNavigation.scale = 1.0;
            menuNavigation.opacity = 1.0;
            break;
        case 3:
            menuMusic.scale = 1.0;
            menuMusic.opacity = 1.0;
            break;
        case 4:
            menuCall.scale = 1.0;
            menuCall.opacity = 1.0;
            break;
        }
    }

    // Handle content button clicks
    mouseAreaSettings.onClicked: {
        previousContentIndex = contentIndex;
        contentIndex = 1;
        selectContent(1);
    }

    mouseAreaNavigation.onClicked: {
        previousContentIndex = contentIndex;
        contentIndex = 2;
        selectContent(2);
    }

    mouseAreaMusic.onClicked: {
        previousContentIndex = contentIndex;
        contentIndex = 3;
        selectContent(3);
    }

    mouseAreaCall.onClicked: {
        previousContentIndex = contentIndex;
        contentIndex = 4;
        selectContent(4);
    }
}

