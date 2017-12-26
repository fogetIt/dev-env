#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2017-12-26 16:23:18
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

# install downloaders
# ***************************************************************
: 'axel，多线程数的命令行下载工具（wget是单线程）'
axel -V
if [ $? != 0 ]; then
    sudo apt install axel
fi


: 'apt-fast
替代apt-get提升下载速度
手动修改线程数   sudo vi /etc/apt-fast.conf
'
sudo apt-fast -v
if [ $? != 0 ]; then
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
fi
