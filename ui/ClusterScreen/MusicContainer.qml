import QtQuick 2.4

MusicContainerForm {
    id: musicContainer

    property int album: selectedMenuIndex
    property string imageBgSrc: redTheme ? "qrc:/ui/assets/clusterScreen/musicBackground.png" :
                                           "qrc:/ui/assets/clusterScreen/musicBackgroundBlue.png"

    PropertyAnimation {
        id: progressAnimation
        duration: 60000
        running: true
        target: progressBar
        property: "value"
        from: 0.
        to: 1.
    }

    onAlbumChanged: {
        progressAnimation.restart();
        switch (album) {
        case 0:
            artistText = "Arch Enemy";
            albumText = "Will To Power";
            albumCoverSource = "qrc:/ui/assets/clusterScreen/album1.png";
            break;
        case 1:
            artistText = "Battle Beast";
            albumText = "Unholy Savior";
            albumCoverSource = "qrc:/ui/assets/clusterScreen/album2.png";
            break;
        case 2:
            artistText = "Machine Head";
            albumText = "Bloodstone & Diamonds";
            albumCoverSource = "qrc:/ui/assets/clusterScreen/album3.png";
            break;
        case 3:
            artistText = "Metallica";
            albumText = "Master of Puppets";
            albumCoverSource = "qrc:/ui/assets/clusterScreen/album4.png";
            break;
        case 4:
            artistText = "Sabaton";
            albumText = "Primo Victoria";
            albumCoverSource = "qrc:/ui/assets/clusterScreen/album5.png";
            break;
        case 5:
            artistText = "Sabaton";
            albumText = "The Last Stand";
            albumCoverSource = "qrc:/ui/assets/clusterScreen/album6.png";
            break;
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            selectedMenuIndex++;
            if (selectedMenuIndex > maxMenuIndex)
                selectedMenuIndex = 0;
        }
    }
}
