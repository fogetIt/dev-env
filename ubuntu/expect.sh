#!/usr/bin/expect
# @Date:   2018-03-30 13:42:38
# @Last Modified time: 2018-03-30 13:42:56
# set timeout 20
spawn /etc/init.d/nginx restart
expect "Password:" {send "123zhang!"}
interact
