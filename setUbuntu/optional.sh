#!/bin/bash
# @Date:   2017-06-08 14:43:35
# @Last Modified time: 2018-01-21 22:36:01

# markdown编辑器
: "typora
https://www.typora.io/#linux
"
which typora
if [ $? != 0 ]; then
    # optional, but recommended
    echo $user_password | sudo -S \
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
    # add Typora's repository
    echo $user_password | sudo -S \
        add-apt-repository 'deb https://typora.io ./linux/'
    echo $user_password | sudo -S \
        apt-fast update
    # install typora
    echo $user_password | sudo -S \
        apt-fast install typora
fi

: "haroopad
http://pad.haroopress.com/user.html
"

: "REMARKABLE
https://remarkableapp.github.io/linux.html
"

# ************************************************************
# ubuntu16.04LTS重启网卡
sudo ifconfig enp5s0 down
sudo ifconfig enp5s0 up


: '
UFW     Uncomplicated Firewall（简单的防火墙）————iptables的前端
Gufw    UFW的图形界面前端，Gufw自称是世界上最简单的防火墙
'
user_password="123zhang"


echo $user_password | sudo -S ufw version
if [ $? != 0 ]; then
    # 安装/卸载iptables
    apt-get install iptables
    # apt-get remove iptables
fi

echo $user_password | sudo -S ufw status
#
# 关闭/开启防火墙
# ufw disable
# ufw enable
#
# 系统启动时自动开启。关闭所有外部对本机的访问，但本机访问外部正常
# ufw default deny
#
# 关闭 ubuntu 防火墙的其余命令
# iptables -P INPUT ACCEPT
# iptables -P FORWARD ACCEPT
# iptables -P OUTPUT ACCEPT
# iptables -F
#
# 开放端口
# sudo ufw allow 80/tcp
#
# iptables -I INPUT -p tcp --dport 80 -j ACCEPT
# iptables-persistent————持久化端口信息
# apt-get install iptables-persistent
# service iptables-persistent save

# 安装gufw
# sudo apt-get install gufw

# *****************************************************************
svn --version --quiet; [ $? != 0 ] \
&& sudo apt-fast -y install subversion