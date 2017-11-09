#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2017-07-07 13:43:35

# create softwares directory
# ***************************************************************
if [ ! -d $SOFTWARES ]; then
    mkdir ~/softwares
    # 启用root用户
    echo $USER_PASSWD | sudo -S \
        cp -f $main/50-ubuntu.conf /usr/share/lightdm/lightdm.conf.d/
    : "修改root密码
    sudo passwd root
    "
fi

# install downloaders
# ***************************************************************
: 'axel，可以指定线程数的命令行下载工具（wget是单线程）'
axel -V
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        apt install axel
fi


: 'apt-fast    替代apt-get提升下载速度
手动修改线程数    sudo vi /etc/apt-fast.conf
'
echo $USER_PASSWD | sudo -S \
    apt-fast -v
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        add-apt-repository -y ppa:saiarcot895/myppa
    echo $USER_PASSWD | sudo -S \
        apt-get update
    echo $USER_PASSWD | sudo -S \
        apt-get -y install apt-fast
fi
