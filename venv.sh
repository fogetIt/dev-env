#!/bin/bash
# @Date:   2017-05-08 10:56:59
# @Last Modified time: 2018-01-23 16:17:53
virtualenv --version \
|| pip install virtualenv -i https://pypi.tuna.tsinghua.edu.cn/simple

: '
初始化环境目录
--system-site-packages  依赖系统的site-packages
--no-site-packages      不依赖系统的site-packages
-p $(which python)      指定python版本
'
[ "$1" = "del" ] \
&& (
    [ -d ../venv/bin ] \
    && rm -rf ../venv/
    ) \
|| (
    virtualenv ../venv --system-site-packages \
    && virtualenv -p $(which python) ../venv
    )