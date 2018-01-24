#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-01-24 16:38:56
echo ${PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"

# **************************************************************
# vim        super vi
# vim-tiny   no GUI,only Terminal,light but speed
# vim-gtk    vim with gtk GUI
# vim-gnome  vim with gnome GUI
which vim && vim --version | cat | head -n 2 || (
    sudo apt-fast -y install vim \
    && cp -f ${DIR}/vim/.vimrc ${HOME}/
    )
# sudo apt-fast -y install vim-gtk vim-gnome
if [ ! -d ${SOFTWARES}/plugins ]; then
    mkdir ${SOFTWARES}/plugins \
    && git clone git@github.com:VundleVim/Vundle.vim.git \
        ${SOFTWARES}/plugins/Vundle
fi
# **************************************************************
which atom && atom -v | cat | head -n 2 || (
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-fast update
    sudo apt-fast -y install atom
    )
# **************************************************************
mongo --version || sudo apt-fast -y install mongodb-server mongodb-clients

: <<'COMMENT'
vim /etc/mongodb.conf
bind_ip = 0.0.0.0

sudo service mongodb stop
sudo service mongodb start

$ mongo
>>>
COMMENT
# **************************************************************
# sudo vim /etc/mysql/my.cnf
mysql --version || sudo apt-fast -y install mysql-server mysql-client
# **************************************************************
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
# 处理交互的命令，使之自动化完成
expect -v || sudo apt -y install expect
# ***************************************************************
which curl && curl --version | cat | head -n 1 || sudo apt-fast install curl -y
# ***************************************************************
zsh --version || sudo apt -y install zsh
# cat /etc/shells
# 使用oh-my-zsh配置zsh
[ ${SHELL} != /usr/bin/zsh ] \
&& echo ${PASSWORD} | chsh -s `which zsh` \
&& curl -L \
    https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh


# chsh -s $(which bash)
# chsh -s $(which sh)

# vim ~/.zshrc
# ZSH_THEME='random' # 每次打开一个终端后随机出现一个主题
# https://www.zhihu.com/question/21418449
# 编辑-->配置文件首选项
# ***************************************************************