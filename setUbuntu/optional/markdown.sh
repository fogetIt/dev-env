#!/bin/bash
# @Date:   2017-06-08 14:43:35
# @Last Modified time: 2017-07-07 10:16:34
#
# markdown编辑器
: "typora
https://www.typora.io/#linux
"
which typora
if [ $? != 0 ]; then
    # optional, but recommended
    echo $USER_PASSWD | sudo -S \
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
    # add Typora's repository
    echo $USER_PASSWD | sudo -S \
        add-apt-repository 'deb https://typora.io ./linux/'
    echo $USER_PASSWD | sudo -S \
        apt-fast update
    # install typora
    echo $USER_PASSWD | sudo -S \
        apt-fast install typora
fi

: "haroopad
http://pad.haroopress.com/user.html
"

: "REMARKABLE
https://remarkableapp.github.io/linux.html
"