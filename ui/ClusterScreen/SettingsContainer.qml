import QtQuick 2.4

SettingsContainerForm {
    id: settingsContainer

    property string imageBgSrc: redTheme ? "qrc:/ui/assets/clusterScreen/RedHighlight.png" :
                                           "qrc:/ui/assets/clusterScreen/BlueHighlight.png"
    property string menuBackSrc: redTheme ? "qrc:/ui/assets/clusterScreen/MenuBack.png" :
                                            "qrc:/ui/assets/clusterScreen/MenuBackBlue.png"
    property var modelMap: ({ 0:displayModel, 1: daModel, 2: lightningModel,
                                3: chimesModel, 4: convenienceModel })
    property var previousModel: mainModel
    property int subMenuLevel: 0
    property string currentSetting: ""
    property string currentSubSetting: ""

    onSubMenuLevelChanged: {
        if (subMenuLevel === 0) {
            setMainMenu();
            highlightSpeed = 600;
        } else if (subMenuLevel === 1) {
            currentSubSetting = "";
            listview.model = previousModel;
            titleText = currentSetting;
            highlightSpeed = 200;
        }
    }
    onCurrentSettingChanged: {
        titleText = currentSetting;
    }
    onCurrentSubSettingChanged: {
        titleText = currentSubSetting;
    }

    function handleMenu() {
        if (subMenuLevel === 0) {
            setMenu(selectedMenuIndex);
            // Reset selectedMenuIndex
            selectedMenuIndex = 0;
        } else if (subMenuLevel === 1) {
            handleSubMenu(selectedMenuIndex);
            // Reset selectedMenuIndex
            selectedMenuIndex = 0;
        } else {
            handleAction(selectedMenuIndex);
        }
    }
    function setMainMenu() {
        listview.model = mainModel;
        titleText = qsTr("Settings");
    }
    function setMenu(selectedIndex) {
        if (selectedIndex === listview.count - 1) {
            helpItem.visible = true;
        } else {
            currentSetting = listview.model.get(selectedIndex).name;
            previousModel = modelMap[selectedMenuIndex];
            subMenuLevel++;
        }
    }
    function handleSubMenu(selectedIndex) {
        if (selectedIndex === listview.count - 1) {
            subMenuLevel--;
        } else {
            appendMenuActions(selectedIndex);
            subMenuLevel++;
        }
    }
    function appendMenuActions(selectedIndex) {
        if (listview.model === displayModel) {
            if (selectedIndex === 0) {
                listview.model = displayColorModel
            } else {
                listview.model = displayUnitModel
            }
        } else if (listview.model === daModel) {
            currentSubSetting = listview.model.get(selectedIndex).name;
            if (selectedIndex === 0) {
                listview.model = daESCModel;
            } else {
                listview.model = daTrafficModel;}
        } else if (listview.model === lightningModel) {
            currentSubSetting = listview.model.get(selectedIndex).name;
            if (selectedIndex === 0) {
                listview.model = lightningAutoModel;
            } else {
                listview.model = lightningHdlampModel;
            }
        } else if (listview.model === chimesModel) {
            currentSubSetting = listview.model.get(selectedIndex).name;
            if (selectedIndex === 0) {
                listview.model = chimesParkModel;
            } else if (selectedIndex === 1) {
                listview.model = chimesInfoModel;
            } else {
                listview.model = chimesWarningModel;
            }
        } else if (listview.model === convenienceModel) {
            currentSubSetting = listview.model.get(selectedIndex).name;
            if (selectedIndex === 0) {
                listview.model = convenienceAuxModel;
            } else {
                listview.model = convenienceParkHeaterModel
            }
        }
    }
    function handleAction(selectedIndex) {
        if (selectedIndex === listview.count -1) {
            subMenuLevel--;
        } else {
            var selectedOption = listview.model.get(selectedIndex).name;
            if (listview.model === displayColorModel) {

            } else if (listview.model === displayUnitModel) {
                useMetric = selectedOption === qsTr("Kph") ? true : false
            } else if (listview.model === daESCModel) {
                esc = selectedOption;
            } else if (listview.model === daTrafficModel) {
                trafficSigns = selectedOption;
            } else if (listview.model === lightningAutoModel) {
                autoHighBeam = selectedOption;
            } else if (listview.model === lightningHdlampModel) {
                hdLampDelay = selectedOption;
            } else if (listview.model === chimesParkModel) {
                chimesPark = selectedOption;
            } else if (listview.model === chimesInfoModel) {
                chimesInfo = selectedOption;
            } else if (listview.model === chimesWarningModel) {
                chimesWarning = selectedOption;
            } else if (listview.model === convenienceAuxModel) {
                auxHeater = selectedOption;
            } else if (listview.model === convenienceParkHeaterModel) {
                parkHeater = selectedOption;
            }
        }
    }
    function getCheckVisibility(itemName) {
        var result = false;
        if (listview.model === displayColorModel) {
            if (itemName === qsTr("Red") && redTheme) {
                result =  true;
            } else if (itemName === qsTr("Blue") && !redTheme) {
                result = true;
            }
        } else if (listview.model === displayUnitModel) {
            if (itemName === qsTr("Kph") && useMetric) {
                result = true;
            } else if (itemName === qsTr("Mph") && !useMetric) {
                result = true;
            }
        } else if (listview.model === daESCModel) {
            return itemName === esc ? true : false;
        } else if (listview.model === daTrafficModel) {
            return itemName === trafficSigns ? true : false;
        } else if (listview.model === lightningAutoModel) {
            return itemName === autoHighBeam ? true : false;
        } else if (listview.model === lightningHdlampModel) {
            return itemName === hdLampDelay ? true : false;
        } else if (listview.model === chimesParkModel) {
            return itemName === chimesPark ? true : false;
        } else if (listview.model === chimesInfoModel) {
            return itemName === chimesInfo ? true : false;
        } else if (listview.model === chimesWarningModel) {
            return itemName === chimesWarning ? true : false;
        } else if (listview.model === convenienceAuxModel) {
            return itemName === auxHeater ? true : false;
        } else if (listview.model === convenienceParkHeaterModel) {
            return itemName === parkHeater ? true : false;
        }
        return result;
    }

    Component {
      id: settingsListDelegate
      Item {
          width: listview.width
          height: 100
          Text {
              id: itemText
              text: name
              visible: name !== qsTr("Back")
              color: "#ffffff"
              opacity: itemOpacity
              font.pixelSize: 50
              anchors.verticalCenter: parent.verticalCenter
              anchors.horizontalCenter: parent.horizontalCenter
          }
          Image {
              id: backIcon
              source: menuBackSrc
              visible: name === qsTr("Back")
              fillMode: Image.PreserveAspectFit
              anchors.verticalCenter: parent.verticalCenter
              anchors.horizontalCenter: parent.horizontalCenter
          }
          Text {
              id: checkMark
              text: "\u2713"
              visible: getCheckVisibility(itemText.text)
              color: "#ffffff"
              opacity: itemOpacity
              font.pixelSize: 50
              anchors.verticalCenter: parent.verticalCenter
              anchors.right: itemText.left
              anchors.rightMargin: 20
          }
          MouseArea {
              anchors.fill: parent
              onClicked:  {
                  if (selectedMenuIndex !== index) {
                    selectedMenuIndex = index;
                    highlightTimer.start();
                  } else {
                    selectedMenuIndex = index;
                    handleMenu();
                  }
              }
          }
      }
    }

    Timer {
        id: highlightTimer
        interval: highlightSpeed === 200 ? 500 : 1000
        onTriggered: { handleMenu(); }
    }

    ListModel {
        id: mainModel
        ListElement {
            name: qsTr("Display")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Driver Assist")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Lighting")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Chimes")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Convenience")
            itemOpacity: 0.75
        }
        ListElement {
            name: qsTr("Help")
            itemOpacity: 0.5
        }
    }

    ListModel {
        id: displayModel
        ListElement {
            name: qsTr("Color")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Units")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
    }

    ListModel {
        id: displayColorModel
        ListElement {
            name: qsTr("Red")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Blue")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
    }

    ListModel {
        id: displayUnitModel
        ListElement {
            name: qsTr("Kph")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Mph")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
    }

    ListModel {
        ListElement {
            name: qsTr("ESC")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Traffic Signs")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: daModel
    }

    ListModel {
        ListElement {
            name: qsTr("On")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Sport mode")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Off")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: daESCModel
    }

    ListModel {
        ListElement {
            name: qsTr("Recognition")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Speed warning")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: daTrafficModel
    }

    ListModel {
        ListElement {
            name: qsTr("Auto highbeam")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Hdlamp delay")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: lightningModel
    }

    ListModel {
        ListElement {
            name: qsTr("On")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Off")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: lightningAutoModel
    }

    ListModel {
        ListElement {
            name: qsTr("Manual")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("20 seconds")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("40 seconds")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("60 seconds")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: lightningHdlampModel
    }

    ListModel {
        ListElement {
            name: qsTr("Park slot found")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Information")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Warning")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: chimesModel
    }

    ListModel {
        ListElement {
            name: qsTr("On")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Off")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: chimesParkModel
    }

    ListModel {
        ListElement {
            name: qsTr("On")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Off")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: chimesInfoModel
    }

    ListModel {
        ListElement {
            name: qsTr("On")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Off")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: chimesWarningModel
    }

    ListModel {
        ListElement {
            name: qsTr("On")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Off")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: onOffModel
    }

    ListModel {
        ListElement {
            name: qsTr("Aux heater")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Park heater")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: convenienceModel
    }

    ListModel {
        ListElement {
            name: qsTr("On")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Off")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: convenienceAuxModel
    }

    ListModel {
        ListElement {
            name: qsTr("Time 1")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Time 2")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Once")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Heat now")
            itemOpacity: 1.0
        }
        ListElement {
            name: qsTr("Back")
            itemOpacity: 0.5
        }
        id: convenienceParkHeaterModel
    }
}

