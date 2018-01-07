#!/bin/bash
# @Date:   2017-07-05 12:34:39
# @Last Modified time: 2018-01-07 10:54:22
: "基于Ubuntu16.04LTS，自动搭建开发环境"

# function 可以省略
function exit?() {
    # 接收带空格的参数
    # echo ${@:1}
    echo $*
    # 读取变量
    read -p ">>>" decide
    if [ "$decide" != 'Y' ]; then
        if [ "$decide" == 'n' ]; then
            exit 0
        else
            exit? $*
        fi
    fi
}


function create_directory() {
    path=$1
    if [ ! -d $path ]; then
        mkdir $path
    fi
}


# 工作路径、用户密码、下载路径
if [ $1 ]; then
    user_password=$1
    current_directory=$(pwd)
    working_directory=$(dirname $(pwd))
    installation_directory=$HOME/softwares
    export user_password
    export current_directory
    export working_directory
    export installation_directory

    main=$(pwd)/main
    chmod -R u+x $main \
    && main/_init.sh \
    && main/git.sh \
    && main/wine.sh \
    && main/sublime.sh \
    && main/atom.sh \
    && main/vim.sh \
    && main/jetbrains.sh \
    && main/pys.sh \
    && main/mongodb.sh \
    && main/mysql.sh \
    && main/uget.sh \
    && main/nodejs.sh \
    && main/zsh.sh \
    && main/golang.sh \


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
