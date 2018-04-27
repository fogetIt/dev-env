#!/usr/bin/expect
# @Date:   2018-03-30 13:42:38
# @Last Modified time: 2018-04-27 18:24:17
# if [ $1 ]; then
# else
#     echo "need password"
#     exit 0
# fi
# set timeout 20
spawn /etc/init.d/nginx restart
expect "Password:" {send "123zhang"}
interact
