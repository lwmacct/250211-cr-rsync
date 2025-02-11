#!/usr/bin/env bash
# Admin https://www.yuque.com/lwmacct

__main() {
    mkdir -p /apps/data/logs
    {
        : # 初始化文件
        echo "首次运行，初始化文件"
        if [ ! -f "/apps/data/.init" ]; then
            tar -vcpf - -C /apps/file . | (cd / && tar -xpf - --skip-old-files) && touch /apps/data/.init
        fi
    }
    exec bash /apps/data/script/start.sh >/apps/data/logs/start.log 2>&1
}

__main
