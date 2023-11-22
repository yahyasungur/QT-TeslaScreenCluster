import QtQuick 2.4

ContactsContainerForm {
    id: contactsContainer

    property string imageBgSrc: redTheme ? "qrc:/ui/assets/clusterScreen/RedHighlight.png" :
                                           "qrc:/ui/assets/clusterScreen/BlueHighlight.png"
}
