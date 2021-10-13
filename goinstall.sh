#!/usr/bin/env source
if ! go version;then
  wget -c https://golang.org/dl/go1.17.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
  sed -i "2a\export PATH=\$PATH:/usr/local/go/bin" /etc/profile
  source /etc/profile
else
  echo "您早已安装过go了~"
fi