#!/bin/bash
# @Date:   2017-04-01 15:37:38
# @Last Modified time: 2017-08-13 17:54:20
if [ ! -d $github ]; then
    cd ~
    mkdir github
fi
cd ~/github
echo $USER_PASSWD | sudo -S rm -rf ./*
git init
git clone git@github.com:FengZhiMo/docTree.git
git clone git@github.com:FengZhiMo/free_spider.git
git clone git@github.com:FengZhiMo/open_dj.git
git clone git@github.com:FengZhiMo/tools.git
echo "success"
