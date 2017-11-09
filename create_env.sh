#!/bin/bash
# @Date:   2017-05-08 10:56:59
# @Last Modified time: 2017-07-04 10:06:44
virtualenv --version
if [ $? != 0 ]; then
    pip install virtualenv -i https://pypi.tuna.tsinghua.edu.cn/simple
fi

cd ..
if [ "$1" == "del" ]; then
    if [ -d ./bin ]; then
        : '删除虚拟环境
        删除virtualenn生成的环境目录、文件'
        rm -rf ./bin/
        rm -rf ./lib/
        rm -rf ./local/
        rm -rf ./include/
        rm -f ./pip-selfcheck.json
    fi
else
    : '初始化环境目录
    --no-site-packages        不依赖系统的site-packages
    --system-site-packages    使用系统的site-packages
    -p /usr/bin/python        指定python版本
    '
    virtualenv ./ --no-site-packages
    # which python（在启动虚拟之后会改变）
    virtualenv -p /usr/bin/python ./
fi