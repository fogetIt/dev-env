#!/bin/bash
# @Date:   2017-07-05 12:34:39
# @Last Modified time: 2018-01-21 22:46:17
# 基于Ubuntu16.04LTS，自动搭建开发环境

# function 可以省略
function exit?() {
    # read -p ${@:1} decide  # 接收带空格的参数
    read -p $* decide
    [ "$decide" != 'Y' -a "$decide" == 'n' ] && exit 0 || exit? $*
}

: "
当前路径：$(pwd)
    执行 shell 时的当前路径
工作路径：$(dirname $(pwd))

shell 互相调用，不会影响 $(pwd), $(dirname $(pwd))
"
if [ $1 ]; then
    PASSWORD=$1                # 用户密码
    SOFTWARES=$HOME/softwares  # 下载路径
    export user_password
    export SOFTWARES

    main=$(pwd)/main
    chmod -R u+x $main \
    && init.sh \
    && editor.sh \
    && jetbrains.sh \
    && database.sh \
    && lauguage.sh

    : "
    optional=$(pwd)/optional
    chmod -R u+x $optional
    optional/svn.sh
    optional/markdown.sh
    "

    warn="warn: create or overwrite github folder![Y/n]" \
        && exit? $warn \
        && cat $HOME/.ssh/id_rsa.pub

    warn="warn: please add pub key to github![Y/n]" \
        && exit? $warn \
        && github=$HOME/github \
        && export github \
        && $(pwd)/git_pull.sh
else
    echo "need password"
fi
