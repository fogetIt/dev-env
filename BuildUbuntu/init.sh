#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2018-01-23 18:08:56
echo $PASSWORD | sudo -S echo -e "\033[1;;42m\n\033[0m"

: "create SOFTWARES"
if [ ! -d $SOFTWARES ]; then
    mkdir $SOFTWARES
fi
# 启用root用户
# 修改root密码：sudo password root
sudo cp -f $PWD/50-ubuntu.conf \
    /usr/share/lightdm/lightdm.conf.d/

# 处理交互的命令，使之自动化完成
expect -v || sudo apt -y install expect

# ***************************************************************
# 多线程的命令行下载工具，替代 wget
which axel && axel -V | cat | head -n 2 || sudo apt install axel


# sudo vi /etc/apt-fast.conf
which apt-fast && apt-fast -v | cat | head -n 2 || (
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
    )

# wget          单线程下载
# uget+aria2    多线程下载
# 编辑——>设置——>插件——>aria2
uget-gtk --version || (
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
    sudo apt-fast update
    sudo apt-fast -y install uget
    sudo add-apt-repository -y ppa:t-tujikawa/ppa
    sudo apt-fast update
    sudo apt-fast -y install aria2
    )

# ***************************************************************
# for Windows softwares(e.g. qq)
wine --version || sudo apt-fast -y install wine


# ***************************************************************
git --version || sudo apt-fast -y install git

git --version && read -p \
    "warning
    generate id_rsa, id_rsa.pub in ~/.ssh? [Y/n]" var \
&& [ "$var" = "Y" ] \
&& (
    git config --global user.name "forgetIt" \
    && git config --global user.email "2271404280@qq.com" \
    && echo -e "\n" | ssh-keygen -t rsa -C "2271404280@qq.com" \
    && cat $HOME/.ssh/id_rsa.pub \
    && read -p \
        "warning
        copy and paste this public key to github! [Y/n]" var \
    && [ "$var" != "Y" ] \
    && exit 0
    )

git --version && read -p \
    "warning
    clone repositories? [Y/n]" var \
&& [ "$var" = "Y" ] \
&& (
    if [ ! -d $HOME/github ]; then
        mkdir $HOME/github
    fi
    cd $HOME/github \
    && sudo rm -rf ./* \
    && git init \
    && git clone git@github.com:forgetIt/tools.git \
    && echo "clone repositories success"
    )

# ***************************************************************
zsh --version || sudo apt -y install zsh

# list shells
# cat /etc/shells
# 使用oh-my-zsh配置zsh
[ $SHELL != /usr/bin/zsh ] \
&& echo $PASSWORD | chsh -s `which zsh` \
&& sudo apt-fast install curl -y \
&& curl -L \
    https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# echo $PASSWORD | chsh -s $(which bash) # 默认shell
# echo $PASSWORD | chsh -s $(which sh)

# vim ~/.zshrc
# ZSH_THEME='random' # 每次打开一个终端后随机出现一个主题
# https://www.zhihu.com/question/21418449
# 编辑-->配置文件首选项
