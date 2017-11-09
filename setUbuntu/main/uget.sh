#!/bin/bash
# @Date:   2017-05-05 10:27:59
# @Last Modified time: 2017-07-07 10:15:58
: '
wget          单线程，下载速度慢
uget+aria2    多线程下载
uGet--->编辑--->设置--->插件--->aria2
'
uget-gtk --version
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        add-apt-repository -y ppa:plushuang-tw/uget-stable
    echo $USER_PASSWD | sudo -S \
        apt-fast update
    echo $USER_PASSWD | sudo -S \
        apt-fast -y install uget
    echo $USER_PASSWD | sudo -S \
        add-apt-repository -y ppa:t-tujikawa/ppa
    echo $USER_PASSWD | sudo -S \
        apt-fast update
    echo $USER_PASSWD | sudo -S \
        apt-fast -y install aria2
fi
