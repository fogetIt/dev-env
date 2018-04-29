#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-04-27 22:33:45
: <<'COMMENT'
自动搭建 Ubuntu18.04LTS 开发环境
设置 -> 软件和更新 -> 下载自
sudo apt-get update
sudo apt-get upgrade
chmod -R u+x $(pwd)
COMMENT
# 将配置信息加载到 session 的环境变量中
source config && echo ${PASSWORD} | sudo -S echo "start"

[[ -d ${PATH_SOFTWARES} ]] || mkdir ${PATH_SOFTWARES}

(
    [[ -f ${ROOT_CONFIG_FILE} ]] || touch ${ROOT_CONFIG_FILE}
    ) && echo "${ROOT_CONFIG}" | sudo tee ${ROOT_CONFIG_FILE}

subl -v || (
    cd ${PATH_SOFTWARES} \
    && rm -rf sublime-text* \
    && git clone https://github.com/lyfeyaj/sublime-text-imfix.git \
    && cd sublime-text-imfix \
    && echo "Y" | ./sublime-imfix \
    && subl
)
sublime_conf_path="${HOME}/.config/sublime-text-3/Packages/User/"
read -p "Rewrite sublime settings? [Y/n]" var && (
    [[ "${var}" == "Y" ]] \
    && cp -rf ${PATH_DEVENV}/editor/sublime/* ${sublime_conf_path}
)
# ***************************************************************
# ppa
source_count=1
which apt-fast || (
    sudo add-apt-repository -y ppa:apt-fast/stable
    let source_count++
    )
which atom || (
    sudo add-apt-repository -y ppa:webupd8team/atom
    let source_count++
    )
uget-gtk --version || (
    sudo add-apt-repository -y ppa:t-tujikawa/ppa
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
    let source_count++
    )

[[ ${source_count} == 1 ]] || sudo apt-get update
which apt-fast || sudo apt-get -y install apt-fast
apt-fast --version | cat | head -n 2
git --version  || sudo apt-fast -y install git

# ***************************************************************
ssh -V      || sudo apt-fast -y install openssh-server
nginx -v    || sudo apt-fast -y install nginx
which vim   || sudo apt-fast -y install vim
which axel  || sudo apt-fast -y install axel
which curl  || sudo apt-fast -y install curl
which atom  || sudo apt-fast -y install atom
which unrar || sudo apt-fast -y install unrar  # unrar e xxx
which conky || sudo apt-fast -y install conky
which docky || sudo apt-fast -y install docky
zsh        --version || sudo apt-fast -y install zsh
tree       --version || sudo apt-fast -y install tree
mysql      --version || sudo apt-fast -y install mysql-server mysql-client
mongo      --version || sudo apt-fast -y install mongodb-server mongodb-clients
uget-gtk   --version || sudo apt-fast -y install aria2 uget
redis-cli  --version || sudo apt-fast -y install redis-server
terminator --version || sudo apt-fast -y install terminator
# ***************************************************************
pip      --version || sudo apt-fast -y install python-pip
pip3     --version || sudo apt-fast -y install python3-pip
ipython  --version || sudo apt-fast -y install ipython
ipython3 --version || sudo apt-fast -y install ipython3
bpython  --version || sudo apt-fast -y install bpython
bpython3 --version || sudo apt-fast -y install bpython3
# ipython-notebook
# ipython3-notebook
virtualenv --version || sudo pip install virtualenv -i ${PIP_SOURCE}

python  -c "import Tkinter;exit()" || sudo apt-fast -y install python-tk
python3 -c "import tkinter;exit()" || sudo apt-fast -y install python3-tk
python  -c "import MySQLdb;exit()" || sudo apt-fast -y install libmysqlclient-dev python-mysqldb

dpkg-query -S python-dev || sudo apt-fast -y install python-dev
dpkg-query -S python3-dev || sudo apt-fast -y install python3-dev
pip3 list | grep QScintilla || pip3 install QScintilla -i ${PIP_SOURCE}
python  -c "import PyQt5;exit()" || sudo apt-fast -y install python-pyqt5
# ***************************************************************
read -p "To configure ssh key? [Y/n]" var && (
    [[ "${var}" == "Y" ]] \
    && git config --global user.name ${GIT_NAME} \
    && git config --global user.email ${GIT_EMAIL} \
    && echo -e "\n" | ssh-keygen -t rsa -C ${GIT_EMAIL} \
    && cat ${HOME}/.ssh/id_rsa.pub \
    && read -p "add public key to github!"
)

vim_plugins_path="${PATH_SOFTWARES}/plugins"
vim_vundle_repository=git@github.com:VundleVim/Vundle.vim.git
read -p "To configure vim? [Y/n]" var && (
    [[ "${var}" == "Y" ]] \
    && cp -f ${PATH_DEVENV}/editor/vim/.vimrc ${HOME}/ \
    && [[ ! -d ${vim_plugins_path} ]] \
    && mkdir ${vim_plugins_path} \
    && git clone ${vim_vundle_repository} "${vim_plugins_path}/Vundle"
)

# oh-my-zsh
[[ ${SHELL} != /usr/bin/zsh ]] \
&& echo ${PASSWORD} | chsh -s `which zsh` \
&& curl -L "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh
