#!/bin/bash
# @Date:   2017-04-20 11:26:20
# @Last Modified time: 2017-11-20 17:01:43
echo $USER_PASSWD | sudo -S echo -e "\033[1;;42m\n\033[0m"
: 'vim       vi的超集
vim-tiny     没有GUI，只有命令行（功能少，但是体积小，速度快）
vim-gtk      GUI的vim（依赖于gtk）
vim-gnome    GNOME GUI的vim（依赖于gnome）
'
cat vim --version
if [ $? != 0 ]; then
    sudo apt-fast -y install vim
    # echo $USER_PASSWD | sudo -S \
    #   apt-fast -y install vim-gtk
    # echo $USER_PASSWD | sudo -S \
    #   apt-fast -y install vim-gnome
fi

cp -f $FATHER_DIR/Vim/.vimrc ~/

: "手动安装管理插件"
if [ ! -d $SOFTWARES/plugins ]; then
    : "在任意目录建立插件目录"
    mkdir $SOFTWARES/plugins
    git clone git@github.com:VundleVim/Vundle.vim.git $SOFTWARES/plugins/Vundle
fi