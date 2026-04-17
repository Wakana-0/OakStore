import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI

Clip{
    width: 340
    height: 88
    radius: 12

    property var modelData

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 22
        anchors.rightMargin: 22
        spacing: 16

        Image {
        // TODO: 完善应用图标设置
            Layout.alignment: Qt.AlignVCenter
            source: modelData.icon
            fillMode: Image.PreserveAspectFit
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
        }
        Column {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            spacing: 3

            RowLayout {
                width: parent.width

                Text {
                    width: parent.width
                    typography: Typography.BodyStrong
                    font.pixelSize: 16
                    text: modelData.name
                }

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    icon.name: "ic_fluent_arrow_download_20_filled"
                    text: qsTr("下载")
                }
            }
            // 简介 desc
            Text {
                width: parent.width
                text: modelData.desc
                elide: Text.ElideRight
                maximumLineCount: 1

                typography: Typography.Caption
                color: Theme.currentTheme.colors.textSecondaryColor
                // 宽度控制
                Layout.preferredWidth: font.pixelSize * 0.6 * 20
            }
        }
    }
    onClicked: dialog.open()
    // 点击后打开对话框显示详细信息
    Dialog {
        id: dialog
        modal: true
        title: qsTr("应用信息")
        implicitWidth: 800

        standardButtons: Dialog.None | Dialog.Close
        RowLayout {
            anchors.fill: contentItem
            spacing: 12          // 图片与文字列之间更紧凑

            Image {
                Layout.alignment: Qt.AlignVCenter
                source: modelData.icon
                fillMode: Image.PreserveAspectFit
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
            }
            Column {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                spacing: 6       // 标题与描述之间稍宽松

                Text {
                    width: parent.width
                    typography: Typography.BodyStrong
                    font.pixelSize: 16
                    text: modelData.name
                }

                RowLayout {
                    width: parent.width

                    Text {
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignLeft
                        color: "gray"
                        font.pixelSize: 12
                        text: modelData.developer + " | v" + modelData.version
                    }
                }
            }
        }
        Text {
            Layout.fillWidth: true
            text: modelData.desc
        }

    }
}