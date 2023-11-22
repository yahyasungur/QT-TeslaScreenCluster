import QtQuick 2.0

Item {
    id: root

    property alias tachoNeedle: tachoNeedle
    property int vehicleRpm: 0
    property int offset: -135

    x: 0
    y: 0
    width: 5
    height: 188

    Image {
        id: tachoNeedle
        x: parent.x
        y: parent.y
        width: parent.width
        height: parent.height
        source: needleSrc
        transformOrigin: Item.Center
        rotation: offset
    }
}
