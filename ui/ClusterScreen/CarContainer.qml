import QtQuick 2.0
import QtMultimedia 5.9

Item {
    id: carContainer
    width: 750
    height: width

    property string videoSrc: redTheme ? "qrc:/ui/assets/clusterScreen/videos/car.avi" : "qrc:/ui/assets/clusterScreen/videos/carblue.avi"
    property string imageSrc: redTheme ? "qrc:/ui/assets/clusterScreen/2D/CarOverview.png" :
                                         "qrc:/ui/assets/clusterScreen/2D/CarOverviewBlue.png"

    Component.onCompleted: {
        videOutput.start();
    }

    Image {
        id: carImage
        width: 700;
        height: width
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: imageSrc
        opacity: 0.0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }

    VideoOutput {
        id: videOutput
        anchors.fill: parent
        source: mediaPlayer

        MediaPlayer {
            id: mediaPlayer
            source: videoSrc
            autoLoad: false
            loops: 10

            property int passess: 0

            onStopped: carImage.opacity = 0.8;
            onPositionChanged: {
                if (passess === 4) {
                    curtain.opacity = 0.0;
                } else {
                    passess++;
                }
            }
        }

        function start() { mediaPlayer.play() }
        function stop() { mediaPlayer.stop() }
        function seek(position) { mediaPlayer.seek(position); }
    }

    Rectangle {
        id: curtain
        anchors.fill: parent
        color: "black"
        opacity: 1.0

        Behavior on opacity {
            NumberAnimation { duration: 100 }
        }
    }

}

