import QtQuick 2.9
import QtQuick.Window 2.2
import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"
import "ui/ClusterScreen"

Window {
    visible: true
    width: 1920
    height: 1020
    title: qsTr("Tesla Infotaiment")

    LeftScreen {
        id: leftScreen
        visible: !carModeController.isClusterModeOn
    }

    RightScreen {
        id: rightScreen
        visible: !carModeController.isClusterModeOn
    }

    ClusterScreen {
        id: clusterScreen
        visible: carModeController.isClusterModeOn
        onVisibleChanged: selectContent(2)
    }

    BottomBar {
        id: bottomBar
    }
}
