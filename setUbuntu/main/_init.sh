#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2017-11-20 16:59:58
echo $USER_PASSWD | sudo -S echo -e "\033[1;;42m\n\033[0m"
# create softwares directory
# ***************************************************************
if [ ! -d $SOFTWARES ]; then
    mkdir ~/softwares
    # 启用root用户
    sudo cp -f $main/50-ubuntu.conf /usr/share/lightdm/lightdm.conf.d/
    : "修改root密码
    sudo passwd root
    "
fi

# install downloaders
# ***************************************************************
: 'axel，可以指定线程数的命令行下载工具（wget是单线程）'
axel -V
if [ $? != 0 ]; then
    sudo apt install axel
fi


: 'apt-fast    替代apt-get提升下载速度
手动修改线程数    sudo vi /etc/apt-fast.conf
'
sudo apt-fast -v
if [ $? != 0 ]; then
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
fi
