#!/usr/bin/env bash
echo "请选择安装模式
1.ssr
2.v2ray
3.tgproxy
"
read -p "请输入数字：" choice

install_ssr() {
  wget -N https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocksR.sh
  /usr/bin/expect <<EOF
  set timeout -1
  spawn bash shadowsocksR.sh
  expect "(Default password: teddysun.com):"
  send "cjy123\r"
  expect "(Default port: "
  send "3389\r"
  expect "Which cipher you'd select(Default: aes-256-cfb):"
  send "4\r"
  expect "Which protocol you'd select(Default: origin):"
  send "1\r"
  expect "Which obfs you'd select(Default: plain):"
  send "2\r"
  expect "Press any key to start...or Press Ctrl+C to cancel"
  send "1"
  expect eof
EOF
  rm -f shadowsocksR.sh
}

# python version
install_tgproxy() {
  curl -o MTProtoProxyInstall.sh -L https://git.io/fjo34
  /usr/bin/expect <<EOF
  set timeout -1
  spawn bash MTProtoProxyInstall.sh
  expect "Select a port to proxy listen on it (-1 to randomize): "
  # default port has been set as 443 , need to send backspace first to clear
  send "\010\010\0108888\r"
  expect "MTSecret1"
  send "\010\010\010\010\010\010\010\010\010cobra\r"
  expect "Please select one"
  send "\r"
  expect "Do you want to limit users connected to this secret?"
  send "\r"
  expect "Do you want to add another secret?"
  send "\r"
  expect "Do want to restrict the connections? Select one:"
  send "\0101\r"
  expect "Do you want to setup the advertising tag?"
  send "\r"
  expect "Select a host that DPI thinks you are visiting (TLS_DOMAIN):"
  send "\010\010\010\010\010\010\010\010\010\010\010\010\010\010\010\010\010\010www.bytedance.com\r"
  expect "Press any key to install..."
  send "\r"
  expect eof
EOF
}

if [[ $choice == 1 ]]; then
  install_ssr

elif [ $choice = 3 ]; then
  install_tgproxy
fi
