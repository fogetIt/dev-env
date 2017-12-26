#!/bin/bash
# @Date:   2017-05-07 15:33:16
# @Last Modified time: 2017-12-26 16:06:40
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"
: 'expect，用来处理交互的命令，使之自动化完成'
expect -v
if [ $? != 0 ]; then
    sudo apt -y install expect
fi