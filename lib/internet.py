import requests
from loguru import logger
from pathlib import Path
import time


def download(url, savePath="./Download", speed=0, progress_callback=None):
    """
    下载文件，支持进度回调和限速。
    返回 True/False 表示成功与否。
    """
    save_dir = Path(savePath)
    save_dir.mkdir(parents=True, exist_ok=True)

    filename = url.split('/')[-1].split('?')[0]
    if not filename:
        filename = "download_file"

    filepath = save_dir / filename
    logger.info(f"准备下载: {filename} 到 {filepath.absolute()}")

    try:
        response = requests.get(url, stream=True, timeout=10)
        response.raise_for_status()

        total_size = int(response.headers.get('content-length', 0))
        downloaded = 0
        start_time = time.time()
        chunk_size = 8192

        with open(filepath, 'wb') as f:
            for chunk in response.iter_content(chunk_size=chunk_size):
                if not chunk:
                    continue
                f.write(chunk)
                downloaded += len(chunk)

                if total_size > 0 and progress_callback:
                    progress = int((downloaded / total_size) * 100)
                    progress_callback(progress)

                if speed > 0:
                    elapsed = time.time() - start_time
                    expected_time = downloaded / (speed * 1024)
                    if elapsed < expected_time:
                        time.sleep(expected_time - elapsed)

        logger.success(f"文件已存至: {filepath}")

        if progress_callback:
            progress_callback(100)

        return True

    except Exception as e:
        logger.error(f"下载出错: {e}")
        if filepath.exists():
            filepath.unlink()
        if progress_callback:
            progress_callback(0)
        return False