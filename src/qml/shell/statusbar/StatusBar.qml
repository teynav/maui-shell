import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import org.kde.kirigami 2.7 as Kirigami
import org.mauikit.controls 1.2 as Maui
import org.maui.cask 1.0 as Cask

import "items"
import "items/calendar"

Rectangle
{
    id: control
    Layout.fillWidth: true
    implicitHeight: 32
    RowLayout
    {
        anchors.fill: parent

        Cask.PanelSection
        {
            id: _notificationsSection
            Layout.fillWidth: true
            Layout.fillHeight: true
            position : ToolBar.Header
            popWidth: 500
            alignment: Qt.AlignLeft

            CalendarItem
            {
                onClicked: _notificationsSection.open(card.index)
            }

            Cask.PanelItem
            {
                icon.name: "notifications"
                onClicked: _notificationsSection.open(card.index)

                card: Cask.PanelCard
                {
                    width: parent.width
                    padding: 0
                    title: _nof.count + " " + qsTr("Notifications")
                    headBar.visible: true
                    headBar.leftContent: ToolButton
                    {
                        icon.name: "configure"
                    }

                    headBar.rightContent: ToolButton
                    {
                        icon.name: "edit-clear-all"
                    }

                    ListView
                    {
                        id: _nof
                        width: parent.width
                        height: Math.min(500, contentHeight)
                        boundsBehavior: ListView.StopAtBounds
                        model: 10
                        spacing: Maui.Style.space.medium
                        delegate: Maui.ItemDelegate
                        {
                            width: parent.width
                            height: 80

                            Maui.ListItemTemplate
                            {
                                anchors.fill: parent
                                iconSource: "documentinfo"
                                label1.text: "Notification Title"
                                label2.text: "Blach some infor about the notification"
                                iconSizeHint: Maui.Style.iconSizes.medium
                                spacing: Maui.Style.space.medium
                            }

                            onClicked: _nof.model--

                        }
                    }
                }
            }
        }

        Cask.PanelSection
        {
            id: _statusSection
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignRight

            position : ToolBar.Header
            alignment: Qt.AlignRight

            popWidth: 500            



            Cask.PanelItem
            {
                visible: !isMobile
                icon.name: "mic-ready"
                iconSize: 16
                onClicked: _statusSection.open(card.index)

                card: Cask.PanelCard
                {
                    width: parent.width
//                    implicitHeight: _tooglesGrid.implicitHeight

                    Grid
                    {
                        id:_tooglesGrid
                        width: parent.width
                        height: implicitHeight
                        columnSpacing: Maui.Style.space.medium
                        rowSpacing: columnSpacing
                        columns: 3
                        rows: 2

//                        model: ["network-bluetooth", "input-keyboard-virtual", "rotation-allowed","webcam", "accessories-calculator",  "settings-configure"]
                         ItemDelegate
                        {
                            height: 64
                            width: height
                            background: Rectangle
                            {
                                color: Qt.darker(Kirigami.Theme.backgroundColor)
                                opacity: 0.8
                                radius: 12
                            }

                            Kirigami.Icon
                            {
                                source: "network-bluetooth"
                                anchors.centerIn: parent
                                height: Maui.Style.iconSizes.medium
                                width: height
                            }
                        }

                         ItemDelegate
                        {
                            height: 64
                            width: 120
                            background: Rectangle
                            {
                                color: Qt.darker(Kirigami.Theme.backgroundColor)
                                opacity: 0.8
                                radius: 12
                            }

                            Kirigami.Icon
                            {
                                source: "network-bluetooth"
                                anchors.centerIn: parent
                                height: Maui.Style.iconSizes.medium
                                width: height
                            }
                        }
                    }

                }
            }

            Cask.PanelItem
            {
                visible: !isMobile
                iconSize: 16

                icon.name: "headphones"
                onClicked: _statusSection.open(card.index)

                card: Cask.PanelCard
                {
                    width: parent.width
                    padding: 0

                    Maui.ListItemTemplate
                    {
                        width: parent.width
                        height: 100

                        imageSource: "qrc:/Nina Simone_I Put A Spell On You_1965.jpg"
                        imageSizeHint: 90
                        spacing: Maui.Style.space.medium

                        label1.text: "That's Him Over There"
                        label2.text: "Nina Simone"
                    }

                    footBar.visible: true
                    footBar.middleContent: [
                        ToolButton
                        {
                            id: babeBtnIcon
                            icon.name: "love"
                        },

                        Maui.ToolActions
                        {
                            expanded: true
                            autoExclusive: false
                            checkable: false

                            Action
                            {
                                icon.name: "media-skip-backward"
                            }

                            Action
                            {
                                text: qsTr("Play and pause")
                                icon.name: "media-playback-start"
                            }

                            Action
                            {
                                text: qsTr("Next")
                                icon.name: "media-skip-forward"
                            }
                        },

                        ToolButton
                        {
                            icon.name: "media-playlist-shuffle"
                        }
                    ]
                }
            }

            Cask.PanelItem
            {
                visible: !isMobile
                iconSize: 16

                icon.name: "audio-volume-medium"
                onClicked: _statusSection.open(card.index)

                card: Cask.PanelCard
                {
                    width: parent.width

                    Column
                    {
                        height: 100
                        width: parent.width

                        Label
                        {
                            text: qsTr("Volume")
                        }

                        Slider
                        {
                            width: parent.width
                        }

                        Label
                        {
                            text: qsTr("Brigtness")
                        }


                        Slider
                        {
                            width: parent.width
                        }
                    }


                }
            }



            Cask.PanelItem
            {
                display: ToolButton.TextBesideIcon
                icon.name: "battery-080"
                text: "80%"
                onClicked: _statusSection.open(card.index)

                card: Cask.PanelCard
                {
                    width: parent.width

                    RowLayout
                    {
                        width: parent.width
                        height: 64
                        Repeater
                        {
                            model: ["system-reboot", "system-shutdown", "system-lock-screen","webcam", "system-suspend"]
                            delegate:  Item
                            {
                                Layout.fillHeight: true
                                Layout.fillWidth: true

                                Kirigami.Icon
                                {
                                    anchors.centerIn: parent
                                    source: modelData
                                    height: Maui.Style.iconSizes.medium
                                    width: height
                                }
                            }
                        }
                    }
                }
            }

            NetworkItem
            {
                onClicked: _statusSection.open(card.index)
            }

        }
    }
}

