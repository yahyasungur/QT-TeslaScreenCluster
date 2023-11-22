import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: contacts
    width: 680
    height: 680

    Image {
        id: image
        height: 680
        anchors.top: title.bottom
        anchors.topMargin: 0
        anchors.right: listView.right
        anchors.rightMargin: 0
        anchors.left: listView.left
        anchors.leftMargin: 0
        source: imageBgSrc
    }

    ListView {
        id: listView
        interactive: false
        contentHeight: 160
        anchors.top: title.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 3
        highlight: Image {
            source: "qrc:/ui/assets/clusterScreen/selectionBox.png"
        }
        currentIndex: selectedMenuIndex
        delegate: Item {
            width: listView.width
            height: 100
            Row {
                anchors.fill: parent
                anchors.leftMargin: 100
                spacing: 20

                Image {
                    source: face
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: name
                    color: "#ffffff"
                    opacity: itemOpacity
                    font.pixelSize: 50
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: selectedMenuIndex = index
            }
        }
        model: ListModel {
            ListElement {
                face: "qrc:/ui/assets/clusterScreen/simonedoe.png"
                name: "Simone Brown"
                itemOpacity: 1.0
            }

            ListElement {
                face: "qrc:/ui/assets/clusterScreen/timdoe.png"
                name: "Tim Davis"
                itemOpacity: 1.0
            }

            ListElement {
                face: "qrc:/ui/assets/clusterScreen/jimdoe.png"
                name: "Jim Johnson"
                itemOpacity: 1.0
            }

            ListElement {
                face: "qrc:/ui/assets/clusterScreen/lauradoe.png"
                name: "Laura Jones"
                itemOpacity: 1.0
            }

            ListElement {
                face: "qrc:/ui/assets/clusterScreen/janedoe.png"
                name: "Jane Smith"
                itemOpacity: 0.75
            }

            ListElement {
                face: "qrc:/ui/assets/clusterScreen/johndoe.png"
                name: "John Williams"
                itemOpacity: 0.5
            }
        }
    }

    Text {
        id: title
        x: 150
        width: 184
        height: 57
        color: "#ffffff"
        text: qsTr("Contacts")
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 60
    }
}

