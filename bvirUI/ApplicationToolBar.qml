import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import Machinekit.Controls 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.HalRemote 1.0

Rectangle {
    color: systemPalette.dark
    anchors.fill: parent
//    height: main.height
//    width: height * 0.125

    SystemPalette { id: systemPalette }

    FontLoader {
        id: iconFont
        source: "icons/MaterialIcons-Regular.ttf"
    }

    ColumnLayout {
        id: toolBar
        anchors.fill: parent

        TouchButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            action : EstopAction { id: estopAction }
            iconSource: ""
            FontIcon { // report
                text: "\ue160"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            action : PowerAction { }
            iconSource: ""
            FontIcon { // settings-power
                text: "\ue8c6"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            action : HomeAxisAction { }
            iconSource: ""
            FontIcon { // settings-power
                text: "\ue88a"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            action : ReopenAction { }
            iconSource: ""
            FontIcon { // refresh
                text: "\ue5d5"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            action : RunProgramAction { }
            iconSource: ""
            FontIcon { // play_arrow
                text: "\ue037"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            action : PauseResumeProgramAction { }
            iconSource: ""
            FontIcon { // pause
                text: "\ue034"; color: systemPalette.light
            }
        }
        TouchButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            action : StopProgramAction { }
            iconSource: ""
            FontIcon { // stop
                text: "\ue047"; color: systemPalette.light
            }
        }

        TouchButton {
            Layout.fillWidth: true
            Layout.fillHeight: true

            iconSource: ""
            checkable: true
            FontIcon { // pause???
                text: "\ue036"; color: systemPalette.light
            }

            HalPin {
                id: hp_os_ison
                name: "hp_os_ison"
                type: HalPin.Bit
                direction: HalPin.In
            }
            HalPin {
                id: hp_os_on
                name: "hp_os_on"
                type: HalPin.Bit
                direction: HalPin.Out
                value: parent.checked
            }
            HalPin {
                id: hp_os_off
                name: "hp_os_off"
                type: HalPin.Bit
                direction: HalPin.Out
                value: !parent.checked
            }
            onCheckedChanged: {
                hp_os_on.value = checked
                hp_os_off.value = !checked
            }
            checked: _ready && (hp_os_ison.value)
        }
    }
}
