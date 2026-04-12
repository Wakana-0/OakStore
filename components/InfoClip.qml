import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI

Clip {
    id: root
    width: 340
    height: 88
    radius: 12

    property string url: modelData?.url ?? ""
    property string page: modelData?.page ?? ""
    property string iconSource: modelData?.icon ?? null
    property string title: modelData?.title ?? ""
    property string desc: modelData?.desc ?? ""
    property bool isNew: modelData?.added ?? false
    property bool isUpdated: modelData?.updated ?? false

    InfoBadge {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 12
        width: 8
        height: 8
        text: "·"
        visible: root.isNew || root.isUpdated
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 22
        anchors.rightMargin: 22
        spacing: 16

        Image {
            Layout.alignment: Qt.AlignVCenter
            source: root.iconSource
            fillMode: Image.PreserveAspectFit
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
        }
        Column {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            spacing: 3

            Text {
                width: parent.width
                typography: Typography.BodyStrong
                font.pixelSize: 16
                text: root.title
            }
            Text {
                width: parent.width
                typography: Typography.Caption
                color: Theme.currentTheme.colors.textSecondaryColor
                text: root.desc
            }
        }
    }
    onClicked: dialog.open()
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
                source: root.iconSource
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
                    text: root.title
                }
                Text {
                    width: parent.width
                    typography: Typography.Caption
                    color: Theme.currentTheme.colors.textSecondaryColor
                    text: root.desc
                }
            }
        }
        Text {
            Layout.fillWidth: true
            text: qsTr("Class Widgets 2 是新一代的电子化课程表展示工具，基于比前代更新的架构与设计语言重写。 相比 Class Widgets 1 ，本项目在设计、交互、功能等方面将全面提升。")
        }

    }
}