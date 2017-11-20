#!/bin/bash
# @Date:   2017-04-03 21:35:57
# @Last Modified time: 2017-11-20 17:01:00
echo $USER_PASSWD | sudo -S echo -e "\033[1;;42m\n\033[0m"
node_url="https://nodejs.org/dist/v6.10.1/node-v6.10.1-linux-x64.tar.xz"

node -v && npm -v
if [ $? != 0 ]; then
    cd $SOFTWARES
    sudo rm -rf ./node*
    wget -O node.tar.xz $node_url
    xz -d node.tar.xz
    tar -xvf node.tar

    if [ $? == 0 ]; then
        sudo rm -rf /opt/node
        sudo mv -f ./node*/ /opt/node
        # -f/--force————移动、创建软链接时覆盖旧的
        sudo ln -sf /opt/node/bin/node /usr/bin/node

        : "使用npm命令
        方案一：创建npm软连接
        方案二：使用默认的npm"
        sudo ln -sf /opt/node/bin/npm /usr/bin/npm
        : "设置prefix
        (npm全局命令安装目录：${prefix}/bin/)
        使npm安装的命令能够生效"
        # npm config list
        npm config set prefix /usr/local
    fi
fi
