# 相关链接
+ 代码仓库: [https://github.com/lwmacct/250211-cr-rsync](https://github.com/lwmacct/250211-cr-rsync)
+ 语雀文档: [https://www.yuque.com/lwmacct/docker-run/rsync](https://www.yuque.com/lwmacct/docker-run/rsync)
# 功能特点
+ 基于最新版本的rsync服务
+ 提供两个预配置的共享目录：
    - `share`: 可读写的共享目录
    - `public`: 只读的公共目录
+ 使用tini作为初始化系统
+ 自动化的服务管理

# 运行容器
```bash
#!/usr/bin/env bash

__main() {

  {
    # 镜像准备
    _image1="1181.s.kuaicdn.cn:11818/ghcr.io/lwmacct/250211-cr-rsync:latest-t2502110"
    _image2="$(docker images -q $_image1)"
    if [[ "$_image2" == "" ]]; then
      docker pull $_image1
      _image2="$(docker images -q $_image1)"
    fi
  }

  _apps_name="rsync"
  _apps_data="/data/$_apps_name"
  cat <<EOF | docker compose -p "$_apps_name" -f - up -d --remove-orphans
services:
  main:
    container_name: $_apps_name
    image: "$_image2"
    restart: always
    network_mode: host
    volumes:
      - $_apps_data:/apps/data
    environment:
      - TZ=Asia/Shanghai
EOF
}

__help() {
  cat <<EOF

EOF
}

__main

```

