import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RinUI
import "../components"

FluentPage {
    title: qsTr("主页")

    Column {
        width: parent.width
        spacing: 12 // 增加一点间距，美观一些

        Text {
            typography: Typography.BodyStrong
            text: qsTr("优质应用")
            font.pixelSize: 20
        }

        Grid {
            width: parent.width
            // 保持你原有的自动计算列数逻辑
            columns: Math.floor(width / (340 + 6))
            rowSpacing: 12
            columnSpacing: 12
            layoutDirection: GridLayout.LeftToRight

            // 【关键修改】使用 Repeater 动态生成
            Repeater {
                // 绑定 Python 传过来的列表
                model: appStoreProvider.appList

                delegate: InfoClip {
                    // 将整行数据传给 InfoClip 内部的 property var modelData
                    modelData: model.modelData

                    // 如果你需要保留原有的某些手动设置，可以在这里逻辑映射
                    // 但建议全部走 JSON 数据驱动
                }
            }
        }

        Text {
            typography: Typography.BodyStrong
            text: qsTr("新应用")
        }

        // 可以在这里如法炮制其他的 Repeater
        Text {
            typography: Typography.BodyStrong
            text: qsTr("类型3")
        }
    }
}