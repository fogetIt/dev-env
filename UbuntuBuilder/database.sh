#!/bin/bash
# @Date:   2017-04-03 21:12:33
# @Last Modified time: 2018-01-23 10:35:25
echo $PASSWORD | sudo -S echo -e "\033[1;;42m\n\033[0m"

mongo --version || sudo apt-fast -y install mongodb-server mongodb-clients

: <<'COMMENT'
vim /etc/mongodb.conf
bind_ip = 0.0.0.0

sudo service mongodb stop
sudo service mongodb start

$ mongo
>>>
COMMENT

# sudo find / -name mongobooster | grep mongobooster
sudo find $HOME/.config/ -name mongobooster | grep mongobooster || (
    cd $SOFTWARES \
    && axel -n 16 \
    "http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage" \
    && chmod +x ./mongobooster*.AppImage \
    && sudo apt-get install libstdc++6 \
    && ./mongobooster*.AppImage
    )

# sudo vim /etc/mysql/my.cnf
mysql --version || sudo apt-get -y install mysql-server mysql-client
