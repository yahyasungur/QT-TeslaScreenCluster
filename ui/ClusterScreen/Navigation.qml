import QtQuick 2.0

Item {
    id: root

    width: 2560; height: 960

    function fadeIn() {
        clusterGradient.fadeIn();
    }
    function fadeOut() {
        clusterGradient.fadeOut();
    }

    Image {
        id: fakeMap
        source: "qrc:/ui/assets/clusterScreen/Map.png"
        y: -580
        width: 2560
        height: 1540
    }

    ClusterGradient {
        id: clusterGradient
        y: -580
        width: fakeMap.width
        height: fakeMap.height + 580
        topAndBottomCurtainHeight: 680
    }

    PropertyAnimation {
        target: fakeMap
        property: "y"
        loops: Animation.Infinite
        duration: 60000
        running: true
        from: -580
        to: 0
    }
}
