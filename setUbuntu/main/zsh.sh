#!/bin/bash
# @Date:   2017-07-27 10:45:53
# @Last Modified time: 2017-11-20 17:01:52
echo $USER_PASSWD | sudo -S echo -e "\033[1;;42m\n\033[0m"

zsh --version
if [ $? != 0 ]; then
    : "安装"
    sudo apt -y install zsh
fi

: "查看发行版的可用shell"
# cat /etc/shells
: "判断当前shell"
if [ $SHELL != /usr/bin/zsh ]; then
    : "设置terminal的默认shell环境"
    echo $USER_PASSWD | chsh -s `which zsh`
    : "使用oh-my-zsh配置zsh"
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi
# echo $USER_PASSWD | chsh -s $(which bash) # 默认shell
# echo $USER_PASSWD | chsh -s $(which sh)

: "
vim ~/.zshrc
ZSH_THEME="random" # 每次打开一个终端后随机出现一个主题
https://www.zhihu.com/question/21418449
编辑-->配置文件首选项
"