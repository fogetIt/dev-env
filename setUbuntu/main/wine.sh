#!/bin/bash
# @Date:   2017-04-05 11:32:35
# @Last Modified time: 2017-12-26 16:06:27
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"
: "wine
用于运行Windows程序（qq依赖）
"
wine --version
if [ $? != 0 ]; then
    sudo apt-fast -y install wine
fi
