#!/bin/bash
# @Date:   2017-05-08 10:56:59
# @Last Modified time: 2017-07-04 10:06:44
virtualenv --version
if [ $? != 0 ]; then
    pip install virtualenv -i https://pypi.tuna.tsinghua.edu.cn/simple
fi


if [ "$1" == "del" ]; then
    if [ -d ../venv/bin ]; then
        rm -rf ../venv/
    fi
else
    : '初始化环境目录
    --system-site-packages/--no-site-packages    依赖/不依赖系统的site-packages
    -p /usr/bin/python                           指定python版本
                                                 which python（在启动虚拟环境之后会改变）
    '
    if [ ! -d ../venv/bin ]; then
        virtualenv ../venv --no-site-packages
        virtualenv -p /usr/bin/python ../venv
    fi
fi