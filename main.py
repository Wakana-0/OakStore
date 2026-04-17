import sys
import json
from pathlib import Path
from PySide6.QtWidgets import QApplication
from PySide6.QtCore import QObject, Slot, Signal, Property
from RinUI.core import RinUIWindow

class AppInfo(QObject):
    appsLoaded = Signal()

    def __init__(self):
        super().__init__()
        self._apps = []
        # 建议这里只存 URL，加载逻辑分开写
        self.source_url = "..."

    @Property(list, notify=appsLoaded)
    def appList(self):
        return self._apps

    def loadApps_local(self):
        try:
            with open('./data/app_info.json', 'r', encoding='utf-8') as f:
                raw_data = json.load(f)
                self._apps = raw_data.get("apps", [])
                self.appsLoaded.emit()
        except FileNotFoundError:
            print("错误：找不到 JSON 文件")
        except json.JSONDecodeError:
            print("错误：JSON 格式不正确")

if __name__ == "__main__":
    app = QApplication(sys.argv)

    # --- 新增/修改部分 ---
    # 1. 创建数据管理器实例
    store_provider = AppInfo()
    # 2. 加载本地 JSON 数据（如果不调用这个，appList 就是空的）
    store_provider.loadApps_local()

    qml_path = Path(__file__).resolve().parent / "main.qml"
    window = RinUIWindow(str(qml_path))

    # 3. 将实例注入 QML 上下文，名字必须叫 "appStoreProvider"
    # 这样 Home.qml 里的 model: appStoreProvider.appList 才能找到目标
    window.engine.rootContext().setContextProperty("appStoreProvider", store_provider)
    # --------------------

    sys.exit(app.exec())