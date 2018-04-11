#!/bin/bash
# @Date:   2017-04-03 21:04:01s
# @Last Modified time: 2018-04-11 14:16:56
source config
echo ${PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"


function tar2opt() {
    package=${1}
    unpackage_path="/opt/${package}"
    package_file="${PATH_SOFTWARES}/${package}.tar.gz"

    if [[ ! -f ${package_file} ]]; then
        echo "Can't find ${package} package!"
        return
    fi

    [[ -d ${unpackage_path} ]] || (
        sudo mkdir ${unpackage_path} \
        && sudo tar \
            -zxvf ${package_file} \
            -C ${unpackage_path} \
            --strip-components 1 \
    )
    echo "**********Unpackage ${package} successfully!**********"
}


gz_installer() {
    name=${1};package=${2};starter=${3}

    shortcut="/usr/bin/${name}"
    entry="/opt/${package}/bin/${starter}"
    [[ -f ${shortcut} ]] || (
        tar2opt ${package} \
        && sudo ln -sf ${entry} ${shortcut}
    )

    echo "**********Install ${name} successfully!**********"
}


function jetbrains() {
    name=${1};package=${2};starter=${3}
    gz_installer ${name} ${package} ${starter}
    ${name} && (
        cd ${HOME}/.${package}*/config \
        && (
            find ./ -name "keymaps" -type d | grep "keymaps" || mkdir keymaps
            ) \
        && sudo cp -f "${PATH_DEVENV}/editor/JetBrains.xml" ./keymaps/ \
        && echo "**********Set ${name} keymaps successfully!**********"
    ) || echo "**********Failed!**********"
}


jetbrains "pycharm"  "PyCharm"  "pycharm.sh"
jetbrains "webstorm" "WebStorm" "webstorm.sh"
# jetbrains "goland"   "GoLand"   "goland.sh"
# jetbrains "idea"     "IdeaIU"   "idea.sh"
# ***************************************************************
node -v && npm -v || (
    if [[ ! -d /opt/node ]]; then
        cd ${PATH_SOFTWARES}
        if [[ ! -f "${PATH_SOFTWARES}/node.tar" ]]; then
            if [[ ! -f "${PATH_SOFTWARES}/node.tar.xz" ]]; then
                wget -O "node.tar.xz" \
                    "https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-linux-x64.tar.xz"
            fi
            xz -d node.tar.xz
        fi
        sudo mkdir /opt/node \
        && sudo tar -xvf node.tar -C /opt/node --strip-components 1
    fi
    [[ $? == 0 ]] \
    && echo "download and uncompress zip package to /opt successful!" \
    && sudo ln -sf /opt/node/bin/node /usr/bin/node \
    && sudo ln -sf /opt/node/bin/npm /usr/bin/npm \
    && echo "create soft link successful!" \
    && npm config set prefix /usr/local
    )
# npm config list
# npm全局命令安装目录：${prefix}/bin/
# ***************************************************************
go version || (
    cd ${PATH_SOFTWARES} \
    && [[ ! -f "./go.tar.gz" ]] \
    && wget -O "go.tar.gz" "https://studygolang.com/dl/golang/go1.9.2.linux-amd64.tar.gz"

    gz_installer "go" "go" "go" \
    && export GOROOT=/opt/go \
    && export GOPATH=${HOME}/gocode \
    && export PATH=$PATH:${GOROOT}/bin:${GOPATH}/bin

    # go 语言安装的路径
    GOROOT='export GOROOT=/opt/go'
    # go 包安装路径（可以指定多个）
    #     src 存放源代码（比如：.go .c .h .s等）
    #     pkg 存放编译时生成的中间文件（比如：.a）
    #     bin 存放编译后生成的可执行文件
    #         为了方便，可以把此目录加入到 PATH
    #         如果有多个目录，那么添加所有的bin目录
    GOPATH='export GOPATH=${HOME}/gocode'
    PATH='export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin'

    grep ${PATH}   /etc/profile || tee -e ${PATH}
    grep ${GOROOT} /etc/profile || tee -e ${GOROOT}
    grep ${GOPATH} /etc/profile || tee -e ${GOPATH}
)
# ***************************************************************
sudo find ${HOME}/.config/ -name mongobooster | grep mongobooster || (
    cd ${PATH_SOFTWARES} \
    && axel -n 16 "http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage" \
    && chmod +x ./mongobooster*.AppImage \
    && sudo apt-get install libstdc++6 \
    && ./mongobooster*.AppImage
    )
