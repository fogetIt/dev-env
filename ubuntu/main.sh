#!/bin/bash
# @Date:   2017-07-05 12:34:39
# @Last Modified time: 2018-03-27 13:49:14
# 基于 Ubuntu16.04LTS，自动搭建开发环境
: <<'COMMENT'
# 设置---软件和更新---下载自---其他站点---中国---http://mirrors.aliyun.com/ubuntu
sudo apt-get update
sudo apt-get upgrade
COMMENT


if [ $1 ]; then
    ENV_PWD=$(pwd)
    ENV_DIR=$(dirname $(pwd))
    ENV_PASSWORD=$1
    ENV_SOFTWARES=$HOME/softwares
    export ENV_PWD
    export ENV_DIR
    export ENV_PASSWORD
    export ENV_SOFTWARES

    chmod -R u+x ${ENV_PWD} \
    && _init.sh \
    && _apts.sh \
    && _zips.sh \
    && _pys.sh
else
    echo "need password"
fi
