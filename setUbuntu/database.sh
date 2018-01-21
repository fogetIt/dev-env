#!/bin/bash
# @Date:   2017-04-03 21:12:33
# @Last Modified time: 2018-01-21 22:38:48
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"

# install mongodb
mongo --version; [ $? == 0 ] || (
    sudo apt-fast update \
    && sudo apt-fast -y install mongodb-server mongodb-clients
    )
: "
vim /etc/mongodb.conf
bind_ip = 0.0.0.0

sudo service mongodb stop
sudo service mongodb start

$ mongo
>>>
"

# install mongobooster
# sudo find / -name mongobooster | grep mongobooster
sudo find ~/.config/ -name mongobooster | grep mongobooster; [ $? == 0 ] \
|| (
    cd $SOFTWARES \
    && axel -n 16 \
    "http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage" \
    && chmod +x ./mongobooster*.AppImage \
    && sudo apt-get install libstdc++6 \
    && ./mongobooster*.AppImage
    )

mysql --version; [ $? == 0 ] || sudo apt-get -y install mysql-server mysql-client
: "sudo vim /etc/mysql/my.cnf"
