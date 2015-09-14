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
import QtQuick.Window 2.0
import Machinekit.Controls 1.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Service 1.0
import Machinekit.HalRemote.Controls 1.0

HalApplicationWindow {
    width: 1024
    height: 600
    id: main
    anchors.fill: parent
    name: "control"
    title: qsTr("bvirUI")
    ready: true
    property int fontsize: Math.min(width, height) / 24
    property int statewidth: width * 0.3

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
        notifications: applicationNotifications
        applicationName: "bvirUI"
    }

    RowLayout {
        id: rowLayout1
        anchors.fill: parent

        Item {
            id: toolbaritem
//            Layout.fillWidth: false
//            Layout.fillHeight: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: parent.width - Math.min(parent.height, parent.width) / 8
//            height: childrenRect.height
            ApplicationToolBar {
                id: toolbar
                anchors.fill: parent
                anchors.margins: 1
//                width: parent.width
//                height: parent.height
            }
        }

        GridLayout {
            id: stategrid
            flow: GridLayout.LeftToRight
            columns: 2
            rows: 5
            anchors.left: toolbaritem.right
//            anchors.right: parent.right
//            anchors.rightMargin: parent.width * 0.65
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: parent.height * 0.05
            anchors.bottomMargin: anchors.topMargin
            anchors.leftMargin: width * 0.04
            anchors.rightMargin: anchors.leftMargin
            columnSpacing: parent.width * 0.01
            rowSpacing: parent.height * 0.05

//            Layout.maximumWidth: 300

            Label {
                Layout.fillWidth: false
                Layout.fillHeight: false
                text: qsTr("Programa")
                wrapMode: Text.NoWrap
                fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: main.fontsize
                verticalAlignment: Text.AlignVCenter
            }

            HalLed {
                name: "hld_runs"
                onColor: "#ff8800"
                Layout.alignment: Qt.AlignHCenter
                implicitWidth: main.fontsize * 1.5
                implicitHeight: implicitWidth
            }

            Label {
                Layout.fillWidth: false
                Layout.fillHeight: false
                text: qsTr("Virinimas")
                fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: main.fontsize
                verticalAlignment: Text.AlignVCenter
            }
            HalLed {
                name: "hld_tig"
                onColor: "#0000ff"
                value: false
                Layout.alignment: Qt.AlignHCenter
                implicitWidth: main.fontsize * 1.5
                implicitHeight: implicitWidth
            }

            Label {
                Layout.fillWidth: false
                Layout.fillHeight: false
                text: qsTr("X, mm")
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: main.fontsize
                Layout.alignment: Qt.AlignHCenter
            }

            HalLabel {
                Layout.fillWidth: false
                Layout.fillHeight: false
                name: "hlb_x"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
//                text: "0.000"
                decimals: 3
                fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: main.fontsize
                Layout.alignment: Qt.AlignHCenter
            }

            Label {
                Layout.fillWidth: false
                Layout.fillHeight: false
                text: qsTr("A, °   ")
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: main.fontsize
                Layout.alignment: Qt.AlignHCenter
            }

            HalLabel {
                id: hlb_a
                Layout.fillWidth: false
                Layout.fillHeight: false
                name: "hlb_a"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
//                text: "0.000"
                decimals: 3
                fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: main.fontsize
                Layout.alignment: Qt.AlignHCenter
            }

            HalRoundGauge {
                id: hgauge_a
                name: "hgauge_a"
                invert: false
                z0BorderValue: 0.8
                value: 90
                tickmarkLabelsVisible: false
                decimals: 1
                endAngle: 1
                startAngle: 0
                stepSize: 30
                maximumValue: 360
//                anchors.margins: width * 0.03
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: hlb_a.bottom
                Layout.columnSpan: 2
            }
            ApplicationNotifications {
                id: applicationNotifications
                anchors.fill: parent
                anchors.margins: 2
                messageWidth: parent.width
            }
        }
        TabView {
            id: tabview
            anchors.margins: parent.width * 0.01
            anchors.left: stategrid.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            ShutdownAction {
                id: shutdownaction
            }
            ConfigTab {
                id: cfgtab
                anchors.margins: parent.width * 0.01
                onLoaded: cmdtab.active = true // Forcing to create tabs on startup
            }
            CommandTab {
                id: cmdtab
                anchors.margins: parent.width * 0.01
                onLoaded: cfgtab.active = true // Forcing to create tabs on startup
            }
            Tab {
                title: qsTr("Atsijungti")
                onActiveChanged: {
                    main.disconnect()
                }
            }
            Tab {
                title: qsTr("Išjungti")
                onActiveChanged: {
                    shutdownaction.trigger()
                    main.disconnect()
                }
            }
        }
    }
}
