#!/bin/bash
# @Date:   2017-04-05 11:32:35
# @Last Modified time: 2017-07-07 10:16:14
: "wine
用于运行Windows程序（qq依赖）
"
wine --version
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        apt-fast -y install wine
fi
