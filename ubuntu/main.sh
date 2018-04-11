#!/bin/bash
# @Date:   2017-07-05 12:34:39
# @Last Modified time: 2018-04-10 19:07:25
: <<'COMMENT'
基于 Ubuntu16.04LTS，自动搭建开发环境
设置---软件和更新---下载自
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

    # && ./apt-get.sh \
    chmod -R u+x ${ENV_PWD} \
    && ./unpack.sh \
    && ./py.sh
else
    echo "need password"
    exit 0
fi
