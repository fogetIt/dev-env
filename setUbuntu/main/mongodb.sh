#!/bin/bash
# @Date:   2017-04-03 21:12:33
# @Last Modified time: 2017-11-20 17:00:36
echo $USER_PASSWD | sudo -S echo -e "\033[1;;42m\n\033[0m"

# install mongodb
mongo --version
if [ $? != 0 ]; then
    sudo apt-fast update
    sudo apt-fast -y install mongodb
fi


# install mongobooster
# sudo find / -name mongobooster | grep mongobooster
if [ ! -d ~/.config/mongobooster ]; then
    cd $SOFTWARES
    # echo $USER_PASSWD | sudo -S apt-get install libstdc++6
    axel -n 16 \
    "http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage"
    chmod +x ./mongobooster*.AppImage
    ./mongobooster*.AppImage
fi

: "
vim /etc/mongodb.conf
bind_ip = 0.0.0.0

sudo service mongodb stop
sudo service mongodb start
# 输入mongo进入mongodb交互式
"