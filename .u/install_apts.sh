#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-02-07 15:49:33
echo ${ENV_PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"

# **************************************************************
: <<"COMMENT"
vim         super vi
vim-tiny    no GUI, only Terminal, light but speed
vim-gtk     vim with gtk GUI
vim-gnome   vim with gnome GUI
COMMENT
which vim && vim --version | cat | head -n 2 || (
    sudo apt-fast -y install vim \
    && cp -f ${ENV_DIR}/vim/.vimrc ${HOME}/
    )
# sudo apt-fast -y install vim-gtk vim-gnome
[[ ! -d ${ENV_SOFTWARES}/plugins ]] \
&& mkdir ${ENV_SOFTWARES}/plugins \
&& git clone git@github.com:VundleVim/Vundle.vim.git ${ENV_SOFTWARES}/plugins/Vundle
# **************************************************************
which atom && atom -v | cat | head -n 2 || (
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-fast update
    sudo apt-fast -y install atom
    )
# **************************************************************
mongo --version || sudo apt-fast -y install mongodb-server mongodb-clients

: <<'COMMENT'
$ vim /etc/mongodb.conf
    bind_ip = 0.0.0.0
$ sudo service mongodb stop
$ sudo service mongodb start
$ mongo
COMMENT
# **************************************************************
# sudo vim /etc/mysql/my.cnf
mysql --version || sudo apt-fast -y install mysql-server mysql-client
# **************************************************************
# 处理交互的命令，使之自动化完成
expect -v || sudo apt -y install expect
# ***************************************************************
: <<"COMMENT"
conky              show system infomation on desktop
docky              system initiator
unity-tweak-tool   system manager
theme and icons    beautify ubuntu
COMMENT
which conky && conky -v | cat | head -n 2 || sudo apt-fast install conky -y
which docky && docky -v | cat | head -n 2 || sudo apt install docky -y
which unity-tweak-tool || (
    sudo apt-fast install unity-tweak-tool -y
    sudo add-apt-repository ppa:noobslab/themes    # flat theme
    sudo add-apt-repository ppa:noobslab/icons     # flat icons
    sudo add-apt-repository ppa:noobslab/macbuntu  # mac themes/icons/points
    sudo apt-fast update
    sudo apt-fast install -y flatabulous-theme ultra-flat-icons
    sudo apt-fast install -y macbuntu-os-icons-lts-v7 macbuntu-os-ithemes-lts-v7
)
# ***************************************************************
: <<"COMMENT"
Ctrl+Shift+O
Ctrl+Shift+E
Ctrl+Shift+F
Ctrl+D
COMMENT
terminator --version || sudo apt -y install terminator -y
# ***************************************************************
zsh --version || sudo apt -y install zsh
# cat /etc/shells
# use oh-my-zsh deploy zsh
[[ ${SHELL} != /usr/bin/zsh ]] \
&& echo ${ENV_PASSWORD} | chsh -s `which zsh` \
&& curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh


# chsh -s $(which bash)
# chsh -s $(which sh)

# vim ~/.zshrc
# ZSH_THEME='random'
# ZSH_THEME='intheloop'
# 编辑-->配置文件首选项
# ***************************************************************
ssh -V || sudo apt-get install openssh-server -y
# ***************************************************************
