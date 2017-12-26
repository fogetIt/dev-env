#!/bin/bash
# @Date:   2017-04-01 13:44:31
# @Last Modified time: 2017-12-26 16:06:39
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"

git --version
if [ $? != 0 ]; then
    sudo apt-fast -y install git

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