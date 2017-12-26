#!/bin/bash
# @Date:   2017-04-07 10:36:23
# @Last Modified time: 2017-12-26 16:06:25
: '
从Ubuntu 15.04开始, nm-tool 就已经不存在,代之以 nmcli
nmcli dev show 可以查看MAC, IP, DNS等信息
'

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