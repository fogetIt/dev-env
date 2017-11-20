#!/bin/bash
# @Date:   2017-04-01 15:37:38
# @Last Modified time: 2017-11-14 14:02:05
if [ ! -d $github ]; then
    cd ~
    mkdir github
fi
cd ~/github
echo $USER_PASSWD | sudo -S rm -rf ./*
git init
git clone git@github.com:thinkMMP/tools.git
echo "success"
