#!/bin/bash
# @Date:   2017-06-08 14:43:35
# @Last Modified time: 2018-01-23 09:54:42
echo $PASSWORD | sudo -S echo -e "\033[1;;42m\n\033[0m"
# markdown编辑器
: "
typora
https://www.typora.io/#linux
"
which typora
if [ $? != 0 ]; then
    sudo apt-key adv \
        --keyserver keyserver.ubuntu.com \
        --recv-keys BA300B7755AFCFAE
    sudo add-apt-repository 'deb https://typora.io ./linux/'
    sudo apt-fast update
    sudo apt-fast install typora
fi

# ************************************************************
# ubuntu16.04LTS重启网卡
sudo ifconfig enp5s0 down
sudo ifconfig enp5s0 up


: '
UFW     Uncomplicated Firewall（简单的防火墙）————iptables的前端
Gufw    UFW的图形界面前端，Gufw自称是世界上最简单的防火墙
'

sudo ufw version
if [ $? != 0 ]; then
    apt-get install iptables
    # apt-get remove iptables
fi

sudo ufw status
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