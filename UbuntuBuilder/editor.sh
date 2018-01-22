#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-01-22 14:31:49
echo $PASSWORD | sudo -S echo -e "\033[1;;42m\n\033[0m"

: '
sublime
通过sublime-text-imfix安装sublime、fcitx
fcitx：小企鹅输入法框架，支持中文
'
subl -v; [ $? = 0 ] || (
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

# **************************************************************
: '
vim        vi的超集
vim-tiny   没有GUI，只有命令行（功能少，但是体积小，速度快）
vim-gtk    GUI的vim（依赖于gtk）
vim-gnome  GNOME GUI的vim（依赖于gnome）
'
result=$(vim --version); [ $? = 0 ] \
&& echo ${result: 0:20} \
|| (
    sudo apt-fast -y install vim \
    && cp -f $DIR/vim/.vimrc $HOME/
    )
# sudo apt-fast -y install vim-gtk vim-gnome
# 建立插件目录，手动安装管理插件
if [ ! -d $SOFTWARES/plugins ]; then
    mkdir $SOFTWARES/plugins \
    && git clone git@github.com:VundleVim/Vundle.vim.git \
        $SOFTWARES/plugins/Vundle
fi

# **************************************************************
result=$(atom -v); [ $? = 0 ] \
&& echo ${result: 0:20} \
|| (
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-fast update
    sudo apt-fast -y install atom
    )
