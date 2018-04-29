#!/bin/bash
# @Date:   2017-04-03 21:04:01s
# @Last Modified time: 2018-04-11 15:22:05
source config && echo ${PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"

function jetbrains() {
    cd ${PATH_SOFTWARES} \
    && [[ -d "./${package}" ]] || mkdir "./${package}" \
    && tar -zxvf "${package}.tar.gz" -C "${package}" --strip-components 1 \
    && sudo ln -sf "${package}/bin/${entry}" "/usr/bin/${name}"
}

jetbrains "pycharm"  "PyCharm"  "pycharm.sh"
# jetbrains "webstorm" "WebStorm" "webstorm.sh"
# jetbrains "goland"   "GoLand"   "goland.sh"
# jetbrains "idea"     "IdeaIU"   "idea.sh"
# ***************************************************************
# https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-linux-x64.tar.xz
node -v && npm -v || (
    cd ${PATH_SOFTWARES} \
    && xz -d node.tar.xz \
    && [[ -d node ]] || mkdir node \
    && tar -xvf node.tar -C node --strip-components 1
    && sudo ln -sf node/bin/node /usr/bin/node \
    && sudo ln -sf node/bin/npm /usr/bin/npm \
    && npm config set prefix /usr/local
)
# npm config list
# npm全局命令安装目录：${prefix}/bin/
# ***************************************************************
# https://studygolang.com/dl/golang/go1.9.2.linux-amd64.tar.gz
go version || (
    cd ${PATH_SOFTWARES} \
    && [[ -d go ]] || mkdir go \
    && tar -zxvf go.tar.gz -C go --strip-components 1 \
    && sudo ln -sf go/bin/go /usr/bin/go
    && export GOROOT=${HOME}/softwares/go \
    && export GOPATH=${HOME}/gocode \
    && export PATH=$PATH:${GOROOT}/bin:${GOPATH}/bin

    # go 语言安装的路径
    GOROOT='export GOROOT=${HOME}/softwares/go'
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