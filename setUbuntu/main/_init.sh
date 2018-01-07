#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2018-01-07 11:00:50
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"
# create installation_directory
# ***************************************************************
if [ ! -d $installation_directory ]; then
    mkdir $installation_directory
fi

# 启用root用户
sudo cp -f $current_directory/main/50-ubuntu.conf /usr/share/lightdm/lightdm.conf.d/
# 修改root密码
: "sudo password root"

# ***************************************************************
: '
expect，用来处理交互的命令，使之自动化完成
axel，多线程的命令行下载工具，替代 wget
'
expect -v || sudo apt -y install expect \
&& axel -V || sudo apt install axel


: 'apt-fast
手动修改线程数   sudo vi /etc/apt-fast.conf
'
sudo apt-fast -v
if [ $? != 0 ]; then
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
fi
