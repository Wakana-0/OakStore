import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI

// TODO: 完成应用详情页面
FluentPage {
    title: qsTr("应用详情")

    Column {
        width: parent.width
        spacing: 12

        Text {
            typography: Typography.BodyStrong
            text: modelData.name
            font.pixelSize: 24
        }

        RowLayout {
            spacing: 16

            Image {
                source: modelData.icon
                fillMode: Image.PreserveAspectFit
                Layout.preferredWidth: 80
                Layout.preferredHeight: 80
            }

            Column {
                Layout.fillWidth: true
                spacing: 6

                Text {
                    text: modelData.desc
                    typography: Typography.Body
                    color: Theme.currentTheme.colors.textSecondaryColor
                    wrapMode: Text.Wrap
                }

                // 可以添加更多的详细信息，如版本、开发者等
            }
        }

        // 可以在这里添加更多的组件，如安装按钮、截图等
    }
}