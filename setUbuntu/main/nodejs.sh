#!/bin/bash
# @Date:   2017-04-03 21:35:57
# @Last Modified time: 2018-01-17 17:48:01
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"
node_url="http://cdn.npm.taobao.org/dist/node/v8.9.0/node-v8.9.0-linux-x64.tar.xz"

# -f/--force————移动、创建软链接时覆盖旧的
node -v && npm -v || (
    cd $installation_directory \
    && sudo rm -rf ./node* \
    && wget -O node.tar.xz $node_url \
    && xz -d node.tar.xz \
    && tar -xvf node.tar \
    && sudo rm -rf /opt/node \
    && sudo mv -f ./node*/ /opt/node \
    && sudo ln -sf /opt/node/bin/node /usr/bin/node \
    && sudo ln -sf /opt/node/bin/npm /usr/bin/npm \
    && npm config set prefix /usr/local
    )

# npm config list
: "
使用npm命令
方案一：创建npm软连接
方案二：使用默认的npm
"
: "
设置prefix
(npm全局命令安装目录：${prefix}/bin/)
使npm安装的命令能够生效
"