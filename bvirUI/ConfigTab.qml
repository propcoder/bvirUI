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
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0

Tab {
    id: configTab
//ApplicationWindow {
//    width: 1024
//    height: 600

    title: qsTr("Parametrai")
    anchors.fill: parent
    property int fontsize: width / 26

    GridLayout {
        id: cfggrid
        flow: GridLayout.TopToBottom
        anchors.bottomMargin: 10
        enabled: true //halRemoteComponent.connected
        columns: 5
        rows: 2
        anchors.fill: parent

        Label {
            id: label1
            text: "Pauzė\nlankui, s"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: false
            font.pixelSize: configTab.fontsize
        }
        HalSlider {
            name: "hsl0"
            halPin.direction: HalPin.IO
            value: 1.5
            decimals: 1
            stepSize: 0.1
            orientation: 0
            maximumValue: 2.5
            maximumValueVisible: false
            minimumValueVisible: false
            smooth: false
            tickmarksEnabled: false
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Label {
            id: label2
            text: "Sukabinimas,\n°"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: false
            font.pixelSize: configTab.fontsize
        }
        HalSlider {
            name: "hsl1"
            halPin.direction: HalPin.IO
            value: 6
            minimumValue: 0.5
            decimals: 1
            stepSize: 0.1
            orientation: 0
            maximumValue: 10
            maximumValueVisible: false
            minimumValueVisible: false
            smooth: false
            tickmarksEnabled: false
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Label {
            id: label3
            text: "Vir.\npradžia, °"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: false
            font.pixelSize: configTab.fontsize
        }
        HalSlider {
            name: "hsl2"
            halPin.direction: HalPin.IO
            value: 45
            minimumValue: -60
            decimals: 0
            stepSize: 0.1
            orientation: 0
            maximumValue: 60
            maximumValueVisible: false
            minimumValueVisible: false
            smooth: false
            tickmarksEnabled: false
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Label {
            id: label4
            text: "Perdengimas,\n°"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: false
            font.pixelSize: configTab.fontsize
        }        
        HalSlider {
            name: "hsl3"
            halPin.direction: HalPin.IO
            value: 2
            decimals: 1
            stepSize: 0.1
            orientation: 0
            maximumValue: 10
            maximumValueVisible: false
            minimumValueVisible: false
            smooth: false
            tickmarksEnabled: false
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Label {
            id: label5
            text: "Greitis,\n°/min"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: false
            font.pixelSize: configTab.fontsize
        }
        HalSlider {
            name: "hsl4"
            halPin.direction: HalPin.IO
            minimumValue: 90
            maximumValue: 160
            value: 135
            decimals: 0
            stepSize: 0.1
            orientation: 0
            maximumValueVisible: false
            minimumValueVisible: false
            smooth: false
            tickmarksEnabled: false
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
