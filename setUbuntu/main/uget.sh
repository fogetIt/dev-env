#!/bin/bash
# @Date:   2017-05-05 10:27:59
# @Last Modified time: 2017-12-26 16:06:29
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"
: '
wget          单线程，下载速度慢
uget+aria2    多线程下载
uGet--->编辑--->设置--->插件--->aria2
'
uget-gtk --version
if [ $? != 0 ]; then
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
    sudo apt-fast update
    sudo apt-fast -y install uget
    sudo add-apt-repository -y ppa:t-tujikawa/ppa
    sudo apt-fast update
    sudo apt-fast -y install aria2
fi
