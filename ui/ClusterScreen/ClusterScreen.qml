import QtQuick 2.0

Rectangle {
    id: mainview
    anchors {
        top: parent.top
        right: parent.right
        left: parent.left
        bottom: bottomBar.top
    }
    color: "black"

    property bool startupAnimation: true
    property bool allowSelection: true

    property int contentIndex: 4
    property int previousContentIndex: 0
    property int maxContentIndex: 5

    property int selectedMenuIndex: 0
    property int maxMenuIndex: 5

    property int topZ: 1000
    // Settings
    property bool useMetric: true
    property bool redTheme: true
    property string esc: "On"
    property string trafficSigns: "Recognition"
    property string autoHighBeam: "On"
    property string hdLampDelay: "20 seconds"
    property string auxHeater: "On"
    property string parkHeater: "Time 2"
    property string chimesPark: "Off"
    property string chimesInfo: "Off"
    property string chimesWarning: "On"

    OverlayContainer {
        id: indicatorPane
        scale: mainview.width / 2560
        anchors.centerIn: mainview
        z: 1000

        Image {
            id: topLineImg
            width: 958; height: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.menuBottom
            anchors.topMargin: -10
            source: "qrc:/ui/assets/clusterScreen/2D/MenuTopLineCrop.png"
        }
        Image {
            id: bottomLineImg
            width: 958; height: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.tellTalesTop
            anchors.bottomMargin: 20
            source: "qrc:/ui/assets/clusterScreen/2D/MenuBottomLineCrop.png"
        }
    }

    Gauges {
        id: gauges
        z: 1000 - 1
        state: "Driving"
        anchors.centerIn: mainview

        function setState(index) {
            if (index === 2) {
                state = "Navigation";
                content.item.fadeIn();
            } else {
                state = "Driving";
            }
        }

        onGaugeClicked: {
            resetGauges(false);
        }
    }

    Loader {
        id: content
        scale: mainview.width / 2560
        source: "qrc:/ui/ClusterScreen/Navigation.qml"
        anchors.centerIn: parent
        z: 1000 - 2

        onSourceChanged: {
            gauges.setState( contentIndex );
        }
    }

    Keys.onRightPressed: {
        menuSelect(true);
    }

    Keys.onLeftPressed: {
        menuSelect(false);
    }

    Keys.onUpPressed: {
        selectedMenuIndex--;
        if (selectedMenuIndex < 0)
            selectedMenuIndex = 0;
    }

    Keys.onDownPressed: {
        selectedMenuIndex++;
        if (selectedMenuIndex > maxMenuIndex)
            selectedMenuIndex = maxMenuIndex;
    }

    onUseMetricChanged: {
        resetGauges(true);
    }

    SimuData {
        id: simuData
        startupAnimation: mainview.startupAnimation

        onTimeChanged: {
            indicatorPane.time.text = time;
        }
        onSpeedChanged: {
            gauges.speedText = speed;
        }
        onSpeedAngleChanged: {
            gauges.speedNeedle.speedNeedle.rotation = speedAngle;
        }
        onRpmChanged: {
            var rpmVal = (Math.round(rpm / 100) * 100) / 1000;
            gauges.tachoText = rpmVal.toFixed(1);
        }
        onTachoAngleChanged: {
            gauges.tachoNeedle.tachoNeedle.rotation = tachoAngle;
        }
    }

    function menuSelect(next) {
        if (!allowSelection)
            return;

        previousContentIndex = contentIndex;

        // settings - navigation - music - call - car
        if (next)
            contentIndex++;
        else
            contentIndex--;

        if (contentIndex > maxContentIndex)
            contentIndex = 1;
        else if (contentIndex < 1)
            contentIndex = maxContentIndex;

        selectContent(contentIndex);
    }

    function selectContent(index) {
        if (previousContentIndex === index)
            return;

        selectedMenuIndex = 0;
        indicatorPane.select(index);

        if (previousContentIndex === 2) { // from Navigation
            allowSelection = false;
            selectionTimer.start();
        } else if (previousContentIndex === 5) { // from Car
            allowSelection = false;
            selectionTimer.start();
        }

        switch (index) {
        case 1: // Settings
            content.source = "qrc:/ui/ClusterScreen/SettingsContainer.qml";
            break;
        case 2: // Navigation
            allowSelection = false;
            selectionTimer.start();
            content.source = "qrc:/ui/ClusterScreen/Navigation.qml";
            break;
        case 3: // Music
            content.source = "qrc:/ui/ClusterScreen/MusicContainer.qml";
            break;
        case 4: // Call
            content.source = "qrc:/ui/ClusterScreen/ContactsContainer.qml";
            break;
        case 5: // Car
            //allowSelection = false;
            //selectionTimer.start();
            //content.source = "qrc:/ui/ClusterScreen/CarContainer.qml";
            break;
        }
    }

    function resetGauges(shutdown) {
        simuData.speed = 0;
        simuData.rpm = 0;
        simuData.speedAngle = simuData.angleOffset;
        simuData.tachoAngle = simuData.angleOffset
    }

    Timer {
        id: selectionTimer
        interval: 1000
        onTriggered: allowSelection = true;
    }
}
