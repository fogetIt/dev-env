#!/bin/bash
# @Date:   2017-04-03 21:35:57
# @Last Modified time: 2017-08-15 15:03:28
node_url="https://nodejs.org/dist/v6.10.1/node-v6.10.1-linux-x64.tar.xz"

node -v && npm -v
if [ $? != 0 ]; then
    cd $SOFTWARES
    echo $USER_PASSWD | sudo -S \
        rm -rf ./node*
    wget -O node.tar.xz $node_url
    xz -d node.tar.xz
    tar -xvf node.tar

    if [ $? == 0 ]; then
        echo $USER_PASSWD | sudo -S \
            rm -rf /opt/node
        echo $USER_PASSWD | sudo -S \
            mv -f ./node*/ /opt/node
        # -f/--force————移动、创建软链接时覆盖旧的
        echo $USER_PASSWD | sudo -S \
            ln -sf /opt/node/bin/node /usr/bin/node

        : "使用npm命令
        方案一：创建npm软连接
        方案二：使用默认的npm"
        echo $USER_PASSWD | sudo -S \
            ln -sf /opt/node/bin/npm /usr/bin/npm
        : "设置prefix
        (npm全局命令安装目录：${prefix}/bin/)
        使npm安装的命令能够生效"
        # npm config list
        npm config set prefix /usr/local
    fi
fi
