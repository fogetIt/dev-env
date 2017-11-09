#!/bin/bash
# @Date:   2017-05-07 15:33:16
# @Last Modified time: 2017-07-07 10:14:05
: 'Expect，用来处理交互的命令，使之自动化完成'
expect -v
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        apt -y install expect
fi