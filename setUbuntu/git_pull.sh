#!/bin/bash
# @Date:   2017-04-01 15:37:38
# @Last Modified time: 2017-12-26 16:06:42
if [ ! -d $github ]; then
    cd ~
    mkdir github
fi
cd ~/github
echo $user_password | sudo -S rm -rf ./*
git init
git clone git@github.com:thinkMMP/tools.git
echo "success"
