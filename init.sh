#!/bin/bash
read -p "输入系统的新密码:" newpass

# let expect can access ${newpass}
export newpass=${newpass}

# install necessary software
apt update
apt install expect curl vim git -y

# change passwd
/usr/bin/expect << EOF
spawn passwd
expect "Enter new UNIX password:"
send "${newpass}\r"
expect "Retype new UNIX password: "
send "${newpass}\r"
expect eof
EOF

# change TimeZone to 'Asia/Shanghai' 
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# change python version to 3.9 and install pip
sleep 5
apt install software-properties-common -y

/usr/bin/expect << EOF
spawn add-apt-repository ppa:deadsnakes/ppa
expect " to continue or Ctrl-c to cancel adding it."
send "\r\r"
expect eof
EOF


apt update
sleep 5
apt install python3.9 python3.9-distutils python3.9-dev -y
if python3.9 --version;then
  rm /usr/bin/python3
  ln -s /usr/bin/python3.9 /usr/bin/python3
  # Install pip
  wget https://bootstrap.pypa.io/get-pip.py  --no-check-certificate
  python3 get-pip.py
  rm -f get-pip.py
fi




# Install docker
curl -fsSL get.docker.com -o get-docker.sh
sleep 5
sh get-docker.sh
systemctl enable docker
rm -f get-docker.sh

# Install bbrplus.
# [warning] this step will reboot and after reboot,we still need to input ./tcp to start bbrplus
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
chmod +x tcp.sh
/usr/bin/expect << EOF
set timeout -1
spawn ./tcp.sh
expect {
"请输入数字" { send "2\r"; exp_continue }
"需要重启VPS后，才能开启BBRplus，是否现在重启" { send "Y\r" }
}
expect eof
EOF