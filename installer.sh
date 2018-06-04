#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-04-30 00:00:38
: <<'COMMENT'
sudo apt-get update
sudo apt-get upgrade
chmod -R u+x "$(pwd)/*.sh"
COMMENT
# 将配置信息加载到 session 的环境变量中
source config && echo ${PASSWORD} | sudo -S echo "start" || exit 1

[[ -d ${PATH_SOFTWARES} ]] || mkdir ${PATH_SOFTWARES}

[[ -f ${ROOT_CONFIG_FILE} ]] || touch ${ROOT_CONFIG_FILE} \
&& sudo tee ${ROOT_CONFIG_FILE} <<-'EOF'
# sudo passwd root; su root
[Seat:*]
user-session=ubuntu
greeter-show-manual-login=true
EOF
# ***************************************************************
# ppa
which apt-fast     || sudo add-apt-repository -y ppa:apt-fast/stable
uget-gtk --version || sudo add-apt-repository -y ppa:t-tujikawa/ppa
uget-gtk --version || sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
sudo apt-get update
# ***************************************************************
which apt-fast || sudo apt-get -y install apt-fast
which apt-fast && apt-fast --version | cat | head -n 2 || exit 0
git --version  || sudo apt-fast -y install git
# ***************************************************************
# sudo apt install rar
ssh -V        || sudo apt-fast -y install openssh-server
which axel    || sudo apt-fast -y install axel
which curl    || sudo apt-fast -y install curl
which aria2c  || sudo apt-fast -y install aria2
which unzip   || sudo apt-fast -y install unzip   #: unzip xxx.zip -d xxx
which unrar   || sudo apt-fast -y install unrar   #: unrar e xxx.rar
which shutter || sudo apt-fast -y install shutter #: 截屏
which dconf   || sudo apt-fast -y install dconf-tools
tree       --version || sudo apt-fast -y install tree
ifconfig   --version || sudo apt-fast -y install net-tools
uget-gtk   --version || sudo apt-fast -y install uget
terminator --version || sudo apt-fast -y install terminator
# dconf-tools: org -> gnome -> applications -> desktop -> terminal
# ***************************************************************
which vim || sudo apt-fast -y install vim
read -p "Configure vim editor ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    curl -fLo "${HOME}/.vimrc" \
        "${GITHUB_PREFIX}/fogetIt/dev-env/master/editor/vim/.vimrc"
    curl -fLo "${HOME}/softwares/vimrcs/autoload/plug.vim" --create-dirs \
        "${GITHUB_PREFIX}/junegunn/vim-plug/master/plug.vim"
)
# ***************************************************************
read -p "Configure github ssh key ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    git config --global user.name ${GITHUB_NAME} \
    && git config --global user.email ${GITHUB_EMAIL} \
    && echo -e "\n" | ssh-keygen -t rsa -C ${GITHUB_EMAIL} \
    && cat ${HOME}/.ssh/id_rsa.pub \
    && read -p "add public key to github!"
)
# ***************************************************************
iptables --version || sudo apt-fast -y install iptables
ufw --version      || sudo apt-fast -y install ufw
read -p "Configure firewall tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    sudo ufw enable && sudo ufw default deny
    sudo apt-fast -y install gufw
)
# ***************************************************************
read -p "Configure web tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    nginx -v            || sudo apt-fast -y install nginx
    mysql     --version || sudo apt-fast -y install mysql-server mysql-client
    mongo     --version || sudo apt-fast -y install mongodb-server mongodb-clients
    redis-cli --version || sudo apt-fast -y install redis-server
)
# ***************************************************************
pip  --version || sudo apt-fast -y install python-pip
pip3 --version || sudo apt-fast -y install python3-pip
read -p "Configure python tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    # powered python shell
    ipython  --version || sudo apt-fast -y install ipython
    ipython3 --version || sudo apt-fast -y install ipython3
    bpython  --version || sudo apt-fast -y install bpython
    bpython3 --version || sudo apt-fast -y install bpython3

    virtualenv --version || sudo pip install virtualenv -i ${PYPI}

    python  -c "import Tkinter;exit()" || sudo apt-fast -y install python-tk
    python3 -c "import tkinter;exit()" || sudo apt-fast -y install python3-tk
    python  -c "import MySQLdb;exit()" || sudo apt-fast -y install libmysqlclient-dev python-mysqldb

    dpkg-query -S python-dev || sudo apt-fast -y install python-dev
    dpkg-query -S python3-dev || sudo apt-fast -y install python3-dev
    pip3 list | grep QScintilla || pip3 install QScintilla -i ${PYPI}
    python  -c "import PyQt5;exit()" || sudo apt-fast -y install python-pyqt5
)
# ***************************************************************
zsh --version || sudo apt-fast -y install zsh
read -p "Configure zsh use oh-my-zsh ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    curl -L "${GITHUB_PREFIX}/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh
    [[ ${SHELL} == /usr/bin/zsh ]] || echo ${PASSWORD} | chsh -s `which zsh`
    pip install powerline-shell
    cat "${HOME}/.zshrc" | grep 'install_powerline_precmd()' || tee -a "${HOME}/.zshrc" <<-'EOF'
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}
function install_powerline_precmd() {
for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
    return
    fi
done
precmd_functions+=(powerline_precmd)
}
if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
EOF
)
# ***************************************************************
read -p "Configure nodejs tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    if ! nvm --version; then
        sudo apt-fast -y install build-essential libssl-dev
        curl -o- "${GITHUB_PREFIX}/creationix/nvm/v0.33.2/install.sh" | bash
    fi

    export NVM_DIR="${HOME}/.nvm"
    [ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"
    [ -s "${NVM_DIR}/bash_completion" ] && . "${NVM_DIR}/bash_completion"

    node -v || nvm install --lts
    nvm ls-remote --lts | grep $(node -v) || nvm use --lts && nvm alias default 'lts/*'
    # sudo chmod -R 777 ${HOME}/.npm
)
