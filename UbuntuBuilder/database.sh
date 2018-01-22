#!/bin/bash
# @Date:   2017-04-03 21:12:33
# @Last Modified time: 2018-01-22 14:25:54
echo $PASSWORD | sudo -S echo -e "\033[1;;42m\n\033[0m"

# install mongodb
mongo --version; [ $? = 0 ] || sudo apt-fast -y install mongodb-server mongodb-clients

: <<'COMMENT'
vim /etc/mongodb.conf
bind_ip = 0.0.0.0

sudo service mongodb stop
sudo service mongodb start

$ mongo
>>>
COMMENT

# install mongobooster
# sudo find / -name mongobooster | grep mongobooster
sudo find $HOME/.config/ -name mongobooster | grep mongobooster; [ $? = 0 ] \
|| (
    cd $SOFTWARES \
    && axel -n 16 \
    "http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage" \
    && chmod +x ./mongobooster*.AppImage \
    && sudo apt-get install libstdc++6 \
    && ./mongobooster*.AppImage
    )

# install mysql
# sudo vim /etc/mysql/my.cnf
mysql --version; [ $? = 0 ] || sudo apt-get -y install mysql-server mysql-client
