#!/usr/bin/expect
# @Date:   2018-03-30 13:42:38
# @Last Modified time: 2018-04-27 22:34:07
# 自动交互
# if [ $1 ]; then
# else
#     echo "need password"
#     exit 0
# fi
expect -v || sudo apt -y install expect
# set timeout 20
spawn /etc/init.d/nginx restart
expect "Password:" {send "123zhang"}
interact
