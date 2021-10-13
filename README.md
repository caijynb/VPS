## init.sh
✩✩✩ 建议VPS重装之后都运行这个脚本 ✩✩✩

更改系统密码、安装curl vim git 、更改时区为上海、安装python3.9、安装pip
(当且仅当python3.9安装成功会去安装) 、安装docker、安装bbrplus
（需要重启后手动`./tcp.sh`输入数字7开启加速）


## network.sh
用于安装代理软件的脚本
### ssr
用的是秋水逸冰的脚本，配置文件去`/etc/shadowsocks.json`改

完事`/etc/init.d/shadowsocks restart`重启一下

### v2ray
todo

### tgproxy
https://github.com/HirbodBehnam/MTProtoProxyInstaller

python版

## goinstall.sh
用于安装go