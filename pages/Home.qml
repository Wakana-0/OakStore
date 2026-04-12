import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RinUI
import "../components"

FluentPage {
    title: qsTr("主页")

    Column {
        width: parent.width
        spacing: 3

        Text {
            typography: Typography.BodyStrong
            text: qsTr("优质应用")
            font.pixelSize: 20
        }

        Grid {
            width: parent.width
            columns: Math.floor(width / (340 + 6))
            rowSpacing: 12
            columnSpacing: 12
            layoutDirection: GridLayout.LeftToRight


            InfoClip {
                iconSource: "../assets/img/Application2.png"
                title: "Class Widgets 2"
                desc: "新，是理所当然的不同。"
                page: "../pages/AppManagement.qml"
            }
            InfoClip {
                iconSource: "../assets/img/Application2.png"
                title: "RinUI 官网"
                desc: "A Fluent Design System implementation for Qt Quick"
                url: "https://ui.rinlit.cn/zh/"   // 外部链接应使用 url 属性
            }
        }
        
        //GridLayout {
        //    columns: 3
        //    spacing: 10
        //    layoutDirection: Qt.LeftToRight
        //    Repeater {
        //        model: 6
        //        Text {
        //            text: modelData
        //        }
        //    }
        //}
        Text {
            typography: Typography.BodyStrong
            text: qsTr("类型2")
        }
        //GridLayout {
        //    columns: 3
        //    spacing: 10
        //    layoutDirection: Qt.LeftToRight
        //    Repeater {
        //        model: 6
        //        Text {
        //            text: modelData
        //        }
        //    }
        //}
        Text {
            typography: Typography.BodyStrong
            text: qsTr("类型3")
        }
        //GridLayout {
        //    columns: 3
        //    spacing: 10
        //    layoutDirection: Qt.LeftToRight
        //    Repeater {
        //        model: 6
        //        Text {
        //            text: modelData
        //        }
        //    }
        //}
    }
}