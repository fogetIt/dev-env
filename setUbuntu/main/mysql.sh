#!/bin/bash
# @Date:   2017-05-09 20:51:14
# @Last Modified time: 2018-01-10 17:08:20
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"

mysql --version || sudo apt-get -y install mysql-server mysql-client

: "sudo vim /etc/mysql/my.cnf"