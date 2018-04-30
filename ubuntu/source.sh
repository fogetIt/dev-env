#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-04-30 00:00:38
: <<'COMMENT'
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
# ***************************************************************
# ppa
source_count=1
which apt-fast || (
    sudo add-apt-repository -y ppa:apt-fast/stable
    let source_count++
)
uget-gtk --version || (
    sudo add-apt-repository -y ppa:t-tujikawa/ppa
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
    let source_count++
)
[[ ${source_count} == 1 ]] || sudo apt-get update
# ***************************************************************
which apt-fast || sudo apt-get -y install apt-fast && apt-fast --version | cat | head -n 2
which vim      || (
    sudo apt-fast -y install vim
    curl -sLf https://spacevim.org/install.sh | bash
)
git --version  || sudo apt-fast -y install git
# ***************************************************************
ssh -V      || sudo apt-fast -y install openssh-server
nginx -v    || sudo apt-fast -y install nginx
which axel  || sudo apt-fast -y install axel
which curl  || sudo apt-fast -y install curl
which unrar || sudo apt-fast -y install unrar  # unrar e xxx
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

# oh-my-zsh
[[ ${SHELL} != /usr/bin/zsh ]] \
&& curl -L "https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh \
&& echo ${PASSWORD} | chsh -s `which zsh`
