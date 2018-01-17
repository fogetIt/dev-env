#!/bin/bash
# @Date:   2017-04-01 15:37:38
# @Last Modified time: 2018-01-17 17:51:17
if [ ! -d $github ]; then
    cd ~
    mkdir github
fi
cd ~/github
echo $user_password | sudo -S rm -rf ./*
git init
git clone git@github.com:forgetIt/tools.git
echo "success"
