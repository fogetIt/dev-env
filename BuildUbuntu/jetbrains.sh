#!/bin/bash
# @Date:   2017-04-03 21:04:01s
# @Last Modified time: 2018-01-22 14:33:14
echo $PASSWORD | sudo -S echo -e "\033[1;;42m\n\033[0m"


function install_jetbrains() {
    url=$1
    name=$2
    title=$3
    if [ ! -f /usr/bin/$name ]; then
        cd $SOFTWARES \
        && find $SOFTWARES -name "$title" -type d | grep $title \
        || (
            find $SOFTWARES -name "$title*" -type f | grep $title.tar.gz \
            || wget -O $title.tar.gz $url \
            && (
                mkdir $title \
                && tar -zxvf $title.tar.gz -C $title --strip-components 1
                )
            ) \
        && sudo ln -sf $SOFTWARES/$title/bin/$name.sh /usr/bin/$name \
        && $name
        # 创建软链接(或者修改～/.bashrc)
        # 复制快捷键配置文件到配置文件目录
        cd $HOME/.$title*/config
        if [ ! -d ./keymaps/ ]; then
            mkdir keymaps
        fi
        sudo cp -f $DIR/jetBrains/DefaultCustom.xml ./keymaps/ \
        && echo "install $title successful"
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
title=GoLand
install_jetbrains $url $name $title
