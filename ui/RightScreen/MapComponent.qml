import QtQuick 2.0
import QtLocation 5.9
import QtPositioning 5.8

Item {
    Plugin {
        id: mapPlugin
        name: "osm";
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(39.93, 32.85) // Ankara
        zoomLevel: 14
    }
}
