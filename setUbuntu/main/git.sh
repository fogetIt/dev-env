#!/bin/bash
# @Date:   2017-04-01 13:44:31
# @Last Modified time: 2017-07-07 10:14:16
#
git --version
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        apt-fast -y install git

    if [ $? == 0 ]; then
        git config --global user.name "FengZhiMo"
        git config --global user.email "2271404280@qq.com"
        echo -e "\n" | ssh-keygen -t rsa -C "2271404280@qq.com"

        if [ $? == 0 ]; then
            echo "success"
        else
            echo "gitSettingsError"
        fi

    else
        echo "gitInstallError"
    fi
fi