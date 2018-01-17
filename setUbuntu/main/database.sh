#!/bin/bash
# @Date:   2017-04-03 21:12:33
# @Last Modified time: 2018-01-17 17:37:43
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"

# install mongodb
mongo --version || (
    sudo apt-fast update \
    && sudo apt-fast -y install mongodb
    )

# install mongobooster
# sudo find / -name mongobooster | grep mongobooster
sudo find ~/.config/ -name mongobooster | grep mongobooster \
|| (
    cd $installation_directory \
    && axel -n 16 \
    "http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage" \
    && chmod +x ./mongobooster*.AppImage \
    && sudo apt-get install libstdc++6 \
    && ./mongobooster*.AppImage
    )

: "
vim /etc/mongodb.conf
bind_ip = 0.0.0.0

sudo service mongodb stop
sudo service mongodb start
# 输入mongo进入mongodb交互式
"


mysql --version || sudo apt-get -y install mysql-server mysql-client

: "sudo vim /etc/mysql/my.cnf"