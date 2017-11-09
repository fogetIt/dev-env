#!/bin/bash
# @Date:   2017-04-03 21:04:01s
# @Last Modified time: 2017-09-06 10:59:27
#
: '
http://idea.iteblog.com/key.php
或者试用30天
'
keymap_file=$FATHER_DIR/JetBrains/DefaultCustom.xml

install_jetbrain_software() {
    url=$1
    name=$2
    title=$3
    which_link_file=/usr/bin/$name
    if [ ! -f $which_link_file ]; then
        cd $SOFTWARES \
        && rm -rf $SOFTWARES\$title* \
        && wget -O $title.tar.gz $url \
        && mkdir $title \
        && tar \
            -zxvf $title.tar.gz \
            -C $title \
            --strip-components 1 \
        && echo $USER_PASSWD | sudo -S \
            mv -fv ./$title/ /opt/$title/

        if [ $? == 0 ]; then
            : "创建软链接(或者修改～/.bashrc)"
            echo $USER_PASSWD | sudo -S \
                ln -sf /opt/$title/bin/$name.sh $which_link_file
            $name

            : "复制快捷键配置文件到配置文件目录"
            if [ $? == 0 ]; then
                cd ~/.$title*/config
                if [ ! -d ./keymaps/ ]; then
                    mkdir keymaps \
                    && echo $USER_PASSWD | sudo -S \
                        cp -f $keymap_file ./keymaps/ \
                    && echo install $title success
                fi
            fi
        fi
    fi
}
url="https://download.jetbrains.8686c.com/python/pycharm-professional-2017.2.tar.gz"
name=pycharm
title=PyCharm
install_jetbrain_software $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/webstorm/WebStorm-2017.2.tar.gz"
name=webstorm
title=WebStorm
install_jetbrain_software $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/idea/ideaIU-2017.2.2.tar.gz"
name=idea
title=IdeaIU
install_jetbrain_software $url $name $title
# ***************************************************************
url="https://download.jetbrains.8686c.com/go/gogland-172.3968.45.tar.gz"
name=gogland
title=Gogland
install_jetbrain_software $url $name $title