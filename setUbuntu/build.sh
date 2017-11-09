#!/bin/bash
# @Date:   2017-07-05 12:34:39
# @Last Modified time: 2017-09-06 18:39:20
: "基于Ubuntu16.04LTS，自动搭建个人开发环境"

# 声明shell函数，可以省略function关键字
is_exit_or_not() {
    # 接收带空格的参数
    # echo ${@:1}
    echo $*
    # 读取变量
    read -p ">>>" decide
    if [ "$decide" != 'Y' ]; then
        if [ "$decide" == 'n' ]; then
            exit 0
        else
            is_exit_or_not $*
        fi
    fi
}


# 工作路径、用户密码、下载路径
WORKSPACE=$(pwd)
USER_PASSWD="123zhang"
SOFTWARES=$HOME/softwares
FATHER_DIR=$(dirname $(pwd))
export USER_PASSWD
export FATHER_DIR
export SOFTWARES


main=$WORKSPACE/main
chmod -R u+x $main

main/__init__.sh
main/expect.sh
main/git.sh
main/wine.sh
main/sublime.sh
main/atom.sh
main/vim.sh
main/jetbrains.sh
main/pys.sh
main/mongodb.sh
main/mysql.sh
main/uget.sh
main/nodejs.sh
main/zsh.sh
main/gogland.sh


: "
optional=$WORKSPACE/optional
chmod -R u+x $optional
optional/svn.sh
optional/markdown.sh
"

warn="warn: create or overwrite github folder![Y/n]" \
    && is_exit_or_not $warn \
    && cat $HOME/.ssh/id_rsa.pub

warn="warn: please add pub key to github![Y/n]" \
    && is_exit_or_not $warn \
    && github=$HOME/github \
    && export github \
    && $WORKSPACE/git_pull.sh
