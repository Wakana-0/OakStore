import json
import pathlib
from loguru import logger


class Initialization:
    """
    初始化配置文件
    """

    def __init__(self, workDir=None, configSubdir='config'):
        """
        初始化配置类
        :param workDir: 工作目录，默认为当前目录
        :param configSubdir: 配置文件的子目录名称，默认 config
        """
        # 设置工作目录
        if workDir is None:
            self.workDir = pathlib.Path.cwd()  # 当前工作目录
        else:
            self.workDir = pathlib.Path(workDir)

        # 确保工作目录存在
        self.workDir.mkdir(parents=True, exist_ok=True)
        self.configDir = self.workDir / configSubdir

        logger.info(f"工作目录: {self.workDir.absolute()}")
        logger.info(f"配置目录: {self.configDir}")

    def initConfig(self):
        """
        初始化主配置文件
        :return: bool
        """
        try:
            # 确保配置目录存在
            self.configDir.mkdir(parents=True, exist_ok=True)

            # 构建完整的配置文件路径
            configPath = self.configDir / "config.json"

            # 初始数据
            data = {
                "path": {
                    "cachePath": "./cache",
                    "appInstallPath": "./APP"
                },
                "url": {
                    "cloudConfig": "https://github.com/OakStore/OakStore/raw/refs/heads/cloudConfig/cloud.json"
                }
            }

            # 写入文件
            with configPath.open('w', encoding='utf-8') as f:
                json.dump(data, f, indent=4, ensure_ascii=False)

            logger.info(f"已初始化配置文件: {configPath}")
            return True

        except PermissionError:
            logger.error("初始化配置文件失败，没有足够的写入权限")
            return False
        except OSError as e:
            logger.error(f"初始化配置文件失败，系统错误: {e}")
            return False
        return True
