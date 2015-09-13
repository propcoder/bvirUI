/****************************************************************************
**
** Copyright (C) 2014 Alexander Rössler
** License: LGPL version 2.1
**
** This file is part of QtQuickVcp.
**
** All rights reserved. This program and the accompanying materials
** are made available under the terms of the GNU Lesser General Public License
** (LGPL) version 2.1 which accompanies this distribution, and is available at
** http://www.gnu.org/licenses/lgpl-2.1.html
**
** This library is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
** Lesser General Public License for more details.
**
** Contributors:
** Alexander Rössler @ The Cool Tool GmbH <mail DOT aroessler AT gmail DOT com>
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Machinekit.Application 1.0
import Machinekit.Service 1.0
import Machinekit.HalRemote.Controls 1.0

HalApplicationWindow {
    id: main

    name: "control"
    title: qsTr("bvirUI")
    width: 1024
    height: 600
    ready: true

    FontLoader {
        id: iconFont
        source: "icons/MaterialIcons-Regular.ttf"
    }

    Service {
        id: halrcompService
        type: "halrcomp"
    }

    Service {
        id: halrcmdService
        type: "halrcmd"
    }

    ApplicationCore {
        id: applicationCore
//        notifications: applicationNotifications
        applicationName: "bvirUI"
    }

    ApplicationToolBar {
        id: toolBar
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: main.height * 0.12
    }

    ListModel {
        id: cfglistmodel
        ListElement {
            hsl_text: "Pauzė\nlankui, s"
            //id: hsl0
            hsl_name: "hsl0"
            hsl_decimals: 1
            hsl_stepSize: 0.1
            hsl_minimumValue: 0
            hsl_maximumValue: 2.5
            hsl_value: 1.5
        }
        ListElement {
            hsl_text: "Sukabinimas, °"
            //id: hsl1
            hsl_name: "hsl1"
            hsl_decimals: 1
            hsl_stepSize: 0.1
            hsl_minimumValue: 0
            hsl_maximumValue: 10
            hsl_value: 6
        }
        ListElement {
            hsl_text: "Vir.\npradžia, °"
            //id: hsl2
            hsl_name: "hsl2"
            hsl_decimals: 0
            hsl_stepSize: 1
            hsl_minimumValue: -60
            hsl_maximumValue: 60
            hsl_value: 45
        }
        ListElement {
            hsl_text: "Perdengimas,\n°"
            //id: hsl3
            hsl_name: "hsl3"
            hsl_decimals: 1
            hsl_stepSize: 0.1
            hsl_minimumValue: 0
            hsl_maximumValue: 10
            hsl_value: 1.5
        }
        ListElement {
            hsl_text: "Greitis, °/min"
            //id: hsl4
            hsl_name: "hsl4"
            hsl_decimals: 0
            hsl_stepSize: 1
            hsl_minimumValue: 90
            hsl_maximumValue: 160
            hsl_value: 135
        }
    }

    ScrollView {
        id: scrollView
        //        enabled:  HalApplicationWindow.connected
        anchors.left: toolBar.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        Layout.fillWidth: true
        Layout.fillHeight: true
        //anchors.margins: Screen.pixelDensity
        contentItem:
        GridLayout {
            id: gridLayout1
            columns: 6
            columnSpacing: 10
            rows: 2
            anchors.fill: parent
            Layout.fillWidth: true
            Layout.fillHeight: true
            Label {
                id: label6
                text: qsTr("Būsena")
                font.pointSize: 14
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: false
            }

            Repeater {
                model: cfglistmodel
                Label {
                    text: qsTr(hsl_text)
                    font.pointSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: false
                }
            }

            GridLayout {
                id: gridLayout2
                columnSpacing: 10
                rowSpacing: 20
                columns: 2
                rows: 4
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter

                Label {
                    id: label7
                    text: qsTr("X, mm")
                    font.pointSize: 28
                    Layout.alignment: Qt.AlignHCenter
                }

                HalLabel {
                    name: "hlb_x"
                    horizontalAlignment: Text.AlignRight
    //                text: "0.000"
                    decimals: 3
                    font.pointSize: 28
                    Layout.alignment: Qt.AlignHCenter
                }

                Label {
                    id: label8
                    text: qsTr("A, °")
                    font.pointSize: 28
                    Layout.alignment: Qt.AlignHCenter
                }

                HalLabel {
                    id: hlb_a
                    name: "hlb_a"
                    horizontalAlignment: Text.AlignRight
    //                text: "0.000"
                    decimals: 3
                    font.pointSize: 28
                    Layout.alignment: Qt.AlignHCenter
                }

                Label {
                    id: label9
                    text: qsTr("Programa")
                    wrapMode: Text.NoWrap
                    font.pointSize: 22
                    verticalAlignment: Text.AlignVCenter
                }

                HalLed {
                    id: hld_runs
                    name: "hld_runs"
                    onColor: "#ff8800"
                    Layout.alignment: Qt.AlignHCenter
                }

                Label {
                    id: label10
                    text: qsTr("Virinimas")
                    font.pointSize: 22
                    verticalAlignment: Text.AlignVCenter
                }

                HalLed {
                    id: hld_tig
                    name: "hld_tig"
                    onColor: "#0000ff"
                    value: false
                    Layout.alignment: Qt.AlignHCenter
                }
            }

            Repeater {
                model: cfglistmodel
                HalSlider {
                    orientation: 0
                    maximumValueVisible: false
                    minimumValueVisible: false
                    tickmarksEnabled: false
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    
                    anchors.top: scrollView.top
                    anchors.bottom: scrollView.bottom
                    
                    name: hsl_name
                    decimals: hsl_decimals
                    stepSize: hsl_stepSize
                    minimumValue: hsl_minimumValue
                    maximumValue: hsl_maximumValue
                    value: hsl_value
                }
            }
        }
    }
}

