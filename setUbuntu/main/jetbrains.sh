#!/bin/bash
# @Date:   2017-04-03 21:04:01s
# @Last Modified time: 2017-11-20 17:08:35
echo $USER_PASSWD | sudo -S echo -e "\033[1;;42m\n\033[0m"
: '
http://idea.iteblog.com/key.php
或者试用30天
'
keymap_file=$FATHER_DIR/JetBrains/DefaultCustom.xml

function install_jetbrains() {
    url=$1
    name=$2
    title=$3
    link_file=/usr/bin/$name
    if [ ! -f $link_file ]; then
        # && rm -rf $SOFTWARES/$title* \
        # && wget -O $title.tar.gz $url \
        cd $SOFTWARES \
        && mkdir $title \
        && tar \
            -zxvf $title.tar.gz \
            -C $title \
            --strip-components 1 \
        && sudo rm -rf /opt/$title/ \
        && sudo mv ./$title/ /opt/$title/
        if [ $? == 0 ]; then
            : "创建软链接(或者修改～/.bashrc)"
            sudo ln -sf /opt/$title/bin/$name.sh $link_file
            $name

            : "复制快捷键配置文件到配置文件目录"
            if [ $? == 0 ]; then
                cd ~/.$title*/config
                if [ ! -d ./keymaps/ ]; then
                    mkdir keymaps \
                    && sudo cp -f $keymap_file ./keymaps/ \
                    && echo install $title success
                fi
            fi
        fi
    fi
}
url="https://download.jetbrains.8686c.com/python/pycharm-professional-2017.2.tar.gz"
name=pycharm
title=PyCharm
install_jetbrains $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/webstorm/WebStorm-2017.2.tar.gz"
name=webstorm
title=WebStorm
install_jetbrains $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/idea/ideaIU-2017.2.2.tar.gz"
name=idea
title=IdeaIU
install_jetbrains $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/go/goland-173.3727.24.tar.gz"
name=goland
title=Gogland
install_jetbrains $url $name $title