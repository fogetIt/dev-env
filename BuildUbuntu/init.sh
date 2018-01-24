#!/bin/bash
# @Date:   2017-04-24 18:50:16
# @Last Modified time: 2018-01-24 13:59:52
echo $PASSWORD | sudo -S echo -e "\033[1;;42m\n\033[0m"

: "create SOFTWARES"
if [ ! -d $SOFTWARES ]; then
    mkdir $SOFTWARES
fi
# 启用root用户
# 修改root密码：sudo password root
sudo cp -f $PWD/50-ubuntu.conf \
    /usr/share/lightdm/lightdm.conf.d/
# ***************************************************************
# sudo vi /etc/apt-fast.conf
which apt-fast && apt-fast -v | cat | head -n 2 || (
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo apt-get update
    sudo apt-get -y install apt-fast
    )
# ***************************************************************
# 多线程的命令行下载工具，替代 wget
which axel && axel -V | cat | head -n 2 || sudo apt install axel
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
# 通过sublime-text-imfix安装sublime、fcitx
# fcitx：小企鹅输入法框架，支持中文
subl -v || (
    cd $SOFTWARES \
    && rm -rf sublime-text* \
    && git clone https://github.com/lyfeyaj/sublime-text-imfix.git \
    && cd sublime-text-imfix \
    && echo "Y" | ./sublime-imfix \
    && subl
    # open sublime to makesure created configuration folder
)

read -p "warning
    overwrite sublime settings? [Y/n]" var \
&& [ "$var" = "Y" ] \
&& cp -rf $DIR/sublime/* \
    $HOME/.config/sublime-text-3/Packages/ \

read -p \
    "warning
    please install package control!"
# ***************************************************************
# for Windows softwares(e.g. qq)
wine --version || sudo apt-fast -y install wine
# ***************************************************************