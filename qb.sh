#!/bin/bash

# docker安装
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
systemctl enable docker

# 启动qbittorrent
docker run -d \
  --name=qbittorrent \
  -p 7881:7881 \
  -p 7881:7881/udp \
  -p 18080:18080 \
  -v ~/config:/etc/qBittorrent \
  -v ~/downloads:/downloads \
  --restart unless-stopped \
  helloz/qbittorrent

# 启动files
docker run -d --name files -v /root/downloads:/var/www/html/content -p 3000:80 cjy0526/files:v1