import QtQuick 2.0

Rectangle {
    id: navigationSearchBox
    radius: 5
    color: "#FBFAFA"

    Image {
        id: searchIcon
        anchors {
            left: parent.left
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.45
        fillMode: Image.PreserveAspectFit

        source: "qrc:/ui/assets/searchIcon.png"
    }

    Text {
        id: searchText
        visible: navigationTextInput.text === ""
        anchors {
            left: searchIcon.right
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: 15
        color: "#7f7a7a"
        text: qsTr("Navigate")
    }

    TextInput {
        id: navigationTextInput
        clip: true
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: searchIcon.right
            leftMargin: 30
            rightMargin: 8
        }
        font.pixelSize: 15
        verticalAlignment: Text.AlignVCenter

    }
}
