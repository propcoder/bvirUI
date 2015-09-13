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
import QtQuick.Controls.Styles 1.3
import Machinekit.HalRemote.Controls 1.0
import Machinekit.Application.Controls 1.0

Tab {
//ApplicationWindow {
//    width: 600
//    height: 500

    id: cmdtab
    title: qsTr("Komandos")
    anchors.fill: parent
//    anchors.fill: parent
    property int fontsize: Math.max(width, height) / 24

    ColumnLayout {
        id: cmdgrid
//        flow: GridLayout.TopToBottom
        anchors.fill: parent
        enabled: true //halRemoteComponent.connected
//        columns: 2
//        rows: 2

//        MdiCommandAction {
//            id: mdi_cmd
//            enableHistory: false
////            command: "o<sub1> call"
//            command: "G4 P5"
//            _ready: true
//            core: main
//        }

//        Button {
//            text: "MDI_Action"
//            Layout.fillHeight: true
//            Layout.fillWidth: true
//            onClicked: mdi_cmd.trigger()
//            MdiCommandAction {
//                id: mdi_cmd
//                enableHistory: false
//    //            command: "o<sub1> call"
//                command: "G4P5"
//            }
//        }

        HalButton {
            name: "hbt_mdi0"
            text: qsTr("Nurodyti virinimo pabaigos poziciją")
            style: ButtonStyle {
                label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    font.pixelSize: cmdtab.fontsize
                    text: control.text
                }
            }
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        HalButton {
            name: "hbt_mdi1"
            text: qsTr("Suvirinti nuo dabartinės pozicijos")
            style: ButtonStyle {
                label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    font.pixelSize: cmdtab.fontsize
                    text: control.text
                }
            }
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        HalButton {
            name: "hbt_mdi2"
            text: qsTr("---")
            style: ButtonStyle {
                label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    font.pixelSize: cmdtab.fontsize
                    text: control.text
                }
            }
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        HalButton {
            name: "hbt_mdi3"
            text: qsTr("---")
            style: ButtonStyle {
                label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    font.pixelSize: cmdtab.fontsize
                    text: control.text
                }
            }
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
