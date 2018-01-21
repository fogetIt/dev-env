#!/bin/bash
# @Date:   2017-04-03 21:04:01s
# @Last Modified time: 2018-01-21 22:39:51
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"


function install_jetbrains() {
    url=$1
    name=$2
    title=$3
    link_file=/usr/bin/$name
    keymap_file=$(dirname $(pwd))/JetBrains/DefaultCustom.xml
    if [ ! -f $link_file ]; then
        cd $SOFTWARES \
        && rm -rf $SOFTWARES/$title* \
        && wget -O $title.tar.gz $url \
        && mkdir $title \
        && tar \
            -zxvf $title.tar.gz \
            -C $title \
            --strip-components 1 \
        && sudo rm -rf /opt/$title/ \
        && sudo mv ./$title/ /opt/$title/
        if [ $? == 0 ]; then
            : "
            创建软链接(或者修改～/.bashrc)
            复制快捷键配置文件到配置文件目录
            "
            sudo ln -sf /opt/$title/bin/$name.sh $link_file \
            && $name \
            && cd ~/.$title*/config
            if [ ! -d ./keymaps/ ]; then
                mkdir keymaps \
                && sudo cp -f $keymap_file ./keymaps/ \
                && echo install $title success
            fi
        fi
    fi
}

url="https://download.jetbrains.8686c.com/python/pycharm-professional-2017.3.3.tar.gz"
name=pycharm
title=PyCharm
install_jetbrains $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/webstorm/WebStorm-2017.3.3.tar.gz"
name=webstorm
title=WebStorm
install_jetbrains $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/idea/ideaIU-2017.2.2.tar.gz"
name=idea
title=IdeaIU
# install_jetbrains $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/go/goland-2017.3.1.tar.gz"
name=goland
title=Goland
install_jetbrains $url $name $title
