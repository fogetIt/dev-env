#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2018-01-21 22:39:40
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"

: "create SOFTWARES"
[ ! -d $SOFTWARES ] && mkdir $SOFTWARES

: "
启用root用户
修改root密码：sudo password root
"
sudo cp -f \
    $(pwd)/main/50-ubuntu.conf \
    /usr/share/lightdm/lightdm.conf.d/


# ***************************************************************
: '
expect，用来处理交互的命令，使之自动化完成
axel，多线程的命令行下载工具，替代 wget
'
expect -v; [ $? == 0 ] || sudo apt -y install expect
axel -V; [ $? == 0 ] || sudo apt install axel


: '
apt-fast
手动修改线程数   sudo vi /etc/apt-fast.conf
'
apt-fast -v | cat | head -n 1; [ $? == 0 ] || (
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
    )

: '
wget          单线程，下载速度慢
uget+aria2    多线程下载
uGet--->编辑--->设置--->插件--->aria2
'
uget-gtk --version; [ $? == 0 ] || (
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable \
    && sudo apt-fast update \
    && sudo apt-fast -y install uget \
    && sudo add-apt-repository -y ppa:t-tujikawa/ppa \
    && sudo apt-fast update \
    && sudo apt-fast -y install aria2
    )

# ***************************************************************
: "
wine
用于运行Windows程序（qq依赖）
"
wine --version; [ $? == 0 ] || sudo apt-fast -y install wine


# ***************************************************************
git --version; [ $? == 0 ] \
|| (
    sudo apt-fast -y install git \
    && git config --global user.name "forgetIt" \
    && git config --global user.email "2271404280@qq.com" \
    && echo -e "\n" | ssh-keygen -t rsa -C "2271404280@qq.com" \
    && cat $HOME/.ssh/id_rsa.pub \
    && read -p "please copy paste this public key to you github"
    )

# [ ! -d $github ] \
# && mkdir $HOME/github \
# && cd $HOME/github \
# && sudo rm -rf ./* \
# && git init \
# && git clone git@github.com:forgetIt/tools.git \
# && echo "success"

# ***************************************************************
zsh --version; [ $? == 0 ] || sudo apt -y install zsh

: "
查看发行版的可用shell
cat /etc/shells
"

# 使用oh-my-zsh配置zsh
[ $SHELL != /usr/bin/zsh ] \
&& echo $user_password | chsh -s `which zsh` \
&& sudo apt-fast install curl -y \
&& curl -L \
    https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# echo $user_password | chsh -s $(which bash) # 默认shell
# echo $user_password | chsh -s $(which sh)

: "
vim ~/.zshrc
ZSH_THEME='random' # 每次打开一个终端后随机出现一个主题
https://www.zhihu.com/question/21418449
编辑-->配置文件首选项
"
