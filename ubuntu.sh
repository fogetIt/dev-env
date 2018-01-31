#!/bin/bash
# @Date:   2017-07-05 12:34:39
# @Last Modified time: 2018-01-31 11:18:01
# 基于 Ubuntu16.04LTS，自动搭建开发环境
# 设置---软件和更新---下载自---其他站点---中国---http://mirrors.aliyun.com/ubuntu
# sudo apt-get update
# sudo apt-get upgrade

# function 可以省略
# function exit?() {
#     read -p $* decide
#     [ "$decide" != 'Y' -a "$decide" == 'n' ] && exit 0 || exit? $*
# }

# $(pwd) 执行 shell 时的当前路径
# shell 互相调用，不会影响 $(pwd)
# cd 命令会影响 $(pwd)
if [ $1 ]; then
    cd ./Build
    PWD=$(pwd)             # ./Build
    DIR=$(dirname $(pwd))  # ./
    PASSWORD=$1
    SOFTWARES=$HOME/softwares
    export PWD
    export DIR
    export PASSWORD
    export SOFTWARES

    chmod -R u+x $(pwd) \
    && ./init.sh \
    && ./install_apts.sh \
    && ./install_zips.sh \
    && ./install_pys.sh
else
    echo "need password"
fi
