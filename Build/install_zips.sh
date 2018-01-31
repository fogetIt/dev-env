#!/bin/bash
# @Date:   2017-04-03 21:04:01s
# @Last Modified time: 2018-01-24 15:49:58
echo ${PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"

function jetbrains() {
    url=$1
    name=$2
    package=$3
    if [ ! -f "/usr/bin/${name}" ]; then
        if [ ! -d "/opt/${package}" ]; then
            cd ${SOFTWARES}
            if [ ! -f "${SOFTWARES}/${package}.tar.gz" ]; then
                wget -O "${package}.tar.gz" "${url}"
            fi
            sudo mkdir "/opt/${package}" \
            && sudo tar -zxvf "${package}.tar.gz" -C "/opt/${package}" --strip-components 1
        fi
        [ $? = 0 ] \
        && echo "download and uncompress zip package to /opt successful!" \
        && sudo ln -sf "/opt/${package}/bin/${name}.sh" "/usr/bin/${name}" \
        && "${name}" \
        && echo "create soft link successful!" \
        && cd ${HOME}/.${package}*/config \
        && (
            find ./ -name "keymaps" -type d | grep "keymaps" || mkdir keymaps
            ) \
        && sudo cp -f "${DIR}/jetBrains/DefaultCustom.xml" ./keymaps/ \
        && echo "copy keymaps settings successful!"
    fi
    echo "install ${name} successful!"
}


url="https://download.jetbrains.8686c.com/python/pycharm-professional-2017.3.3.tar.gz"
name="pycharm"
package="PyCharm"
jetbrains ${url} ${name} ${package}
# ***************************************************************
url="https://download.jetbrains.8686c.com/webstorm/WebStorm-2017.3.3.tar.gz"
name="webstorm"
package="WebStorm"
jetbrains ${url} ${name} ${package}
# ***************************************************************
url="https://download.jetbrains.8686c.com/idea/ideaIU-2017.2.2.tar.gz"
name="idea"
package="IdeaIU"
# jetbrains ${url} ${name} ${package}
# ***************************************************************
url="https://download.jetbrains.8686c.com/go/goland-2017.3.1.tar.gz"
name="goland"
package="GoLand"
jetbrains ${url} ${name} ${package}
# ***************************************************************
node -v && npm -v || (
    if [ ! -d /opt/node ]; then
        cd ${SOFTWARES}
        if [ ! -f "${SOFTWARES}/node.tar"]; then
            if [ ! -f "${SOFTWARES}/node.tar.xz" ]; then
                wget -O "node.tar.xz" \
                "https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-linux-x64.tar.xz"
            fi
            xz -d node.tar.xz
        fi
        sudo mkdir /opt/node \
        && sudo tar -xvf node.tar -C /opt/node --strip-components 1
    fi
    [ $? = 0 ] \
    && echo "download and uncompress zip package to /opt successful!" \
    && sudo ln -sf /opt/node/bin/node /usr/bin/node \
    && sudo ln -sf /opt/node/bin/npm /usr/bin/npm \
    && echo "create soft link successful!" \
    && npm config set prefix /usr/local
    )
# npm config list
# 使用npm命令
# 方案一：创建npm软连接
# 方案二：使用默认的npm

# 设置prefix
# (npm全局命令安装目录：${prefix}/bin/)
# 使npm安装的命令能够生效
# ***************************************************************
# go version || (
#     url="https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz"
#     name="go"
#     package="go"
#     uncompress2opt ${url} ${package} \
#     && export GOROOT=/opt/go \
#     && export GOPATH=$HOME/gocode \
#     && export PATH=$PATH:$GOROOT/bin:$GOPATH/bin \
#     && echo -e "please copy and paste the following message \
#         \033[0;31m \n\n \
#         export GOROOT=/opt/go \n \
#         export GOPATH=\$HOME/gocode \n \
#         export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin \n \
#         \033[0m" \
#     && sudo subl /etc/profile
#     )

# 配置环境变量
#     GOROOT    go安装的路径
#     GOPATH    默认安装包的路径

# GOPATH允许多个目录
#     分隔符
#         Windows;
#         Linux:
#     默认将go get获取的包存放在第一个目录下
#     约定有三个子目录
#         src    存放源代码(比如：.go .c .h .s等)
#         pkg    存放编译时生成的中间文件(比如：.a)
#         bin    编译后生成的可执行文件
#             为了方便，可以把此目录加入到 PATH 中
#             如果有多个目录，那么添加所有的bin目录
# ***************************************************************
# sudo find / -name mongobooster | grep mongobooster
sudo find ${HOME}/.config/ -name mongobooster | grep mongobooster || (
    cd ${SOFTWARES} \
    && axel -n 16 \
    "http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage" \
    && chmod +x ./mongobooster*.AppImage \
    && sudo apt-get install libstdc++6 \
    && ./mongobooster*.AppImage
    )