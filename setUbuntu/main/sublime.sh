#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2017-12-26 16:11:03
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"

subl -v

if [ $? != 0 ]; then
    cd $installation_directory
    rm -rf sublime-text*
    : '通过sublime-text-imfix安装sublime、fcitx（小企鹅输入法框架，支持中文）'
    git clone https://github.com/lyfeyaj/sublime-text-imfix.git
    cd sublime-text-imfix
    echo "Y" | ./sublime-imfix
    if [ $? == 0 ]; then
        : 'open sublime to makesure created configuration folder!'
        subl
    fi
fi

read -p "Overwrite settings?[default no]" var
if [ "$var" ]; then
    cp -rf $working_directory/Sublime/* ~/.config/sublime-text-3/Packages/

    read -p "warn: please install package control![Y/n]" var
    if [ "$var" != "Y" ]; then
        if [ "$var" == "n" ]; then
            exit 0
        fi
    fi
fi
