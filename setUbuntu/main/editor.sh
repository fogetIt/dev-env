#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-01-17 18:01:05
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"

: '
sublime
通过sublime-text-imfix安装sublime、fcitx
fcitx：小企鹅输入法框架，支持中文
'
subl -v || (
    cd $installation_directory \
    && rm -rf sublime-text* \
    && git clone https://github.com/lyfeyaj/sublime-text-imfix.git \
    && cd sublime-text-imfix \
    && echo "Y" | ./sublime-imfix \
    && subl
    : 'open sublime to makesure created configuration folder!'
)

read -p "Overwrite settings?[default no]" var
if [ "$var" ]; then
    cp -rf $working_directory/Sublime/* ~/.config/sublime-text-3/Packages/

    read -p "warn: please install package control![Y/n]" var
    if [ "$var" != "Y" ]; then
        echo ""
    elif [ "$var" == "n" ]; then
        exit 0
    fi
fi

# **************************************************************
: '
vim        vi的超集
vim-tiny   没有GUI，只有命令行（功能少，但是体积小，速度快）
vim-gtk    GUI的vim（依赖于gtk）
vim-gnome  GNOME GUI的vim（依赖于gnome）
'
vim --version | cat | head -n 1 || sudo apt-fast -y install vim
# sudo apt-fast -y install vim-gtk vim-gnome

cp -f $working_directory/Vim/.vimrc ~/

: "
建立插件目录，手动安装管理插件
"
[ ! -d $installation_directory/plugins ] \
&& mkdir $installation_directory/plugins \
&& git clone git@github.com:VundleVim/Vundle.vim.git \
    $installation_directory/plugins/Vundle

# **************************************************************
atom -v || (
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-fast update
    sudo apt-fast -y install atom
    )