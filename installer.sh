#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-04-30 00:00:38
# 将配置信息加载到 session 的环境变量中
# sudo apt -y install language-pack-zh-hans
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
which apt-fast     || sudo add-apt-repository -y ppa:apt/stable
uget-gtk --version || sudo add-apt-repository -y ppa:t-tujikawa/ppa
uget-gtk --version || sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
sudo apt update
# ***************************************************************
which apt-fast || sudo apt -y install apt-fast
which apt-fast && apt-fast --version | cat | head -n 2 || exit 0
git --version  || sudo apt -y install git
# ***************************************************************
ssh -V        || sudo apt -y install openssh-server
which axel    || sudo apt -y install axel
which curl    || sudo apt -y install curl
which aria2c  || sudo apt -y install aria2
which rar     || sudo apt -y install rar
which unrar   || sudo apt -y install unrar   #: unrar e xxx.rar
which unzip   || sudo apt -y install unzip   #: unzip xxx.zip -d xxx
which shutter || sudo apt -y install shutter #: 截屏
which dconf   || sudo apt -y install dconf-tools
tree       --version || sudo apt -y install tree
ifconfig   --version || sudo apt -y install net-tools
uget-gtk   --version || sudo apt -y install uget
terminator --version || sudo apt -y install terminator
# dconf-tools: org -> gnome -> applications -> desktop -> terminal
# ***************************************************************
which vim || sudo apt -y install vim
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
iptables --version || sudo apt -y install iptables
ufw --version      || sudo apt -y install ufw
read -p "Configure firewall tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    sudo ufw enable && sudo ufw default deny
    sudo apt -y install gufw
)
# ***************************************************************
read -p "Configure web tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    nginx -v            || sudo apt -y install nginx
    mysql     --version || sudo apt -y install mysql-server mysql-client
    mongo     --version || sudo apt -y install mongodb-server mongodb-clients
    redis-cli --version || sudo apt -y install redis-server
)
# ***************************************************************
pip  --version || sudo apt -y install python-pip
pip3 --version || sudo apt -y install python3-pip
read -p "Configure python tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    ipython  --version || sudo apt -y install ipython
    ipython3 --version || sudo apt -y install ipython3
    bpython  --version || sudo apt -y install bpython
    bpython3 --version || sudo apt -y install bpython3

    virtualenv --version || sudo pip install virtualenv -i ${PYPI}

    python  -c "import Tkinter;exit()" || sudo apt -y install python-tk
    python3 -c "import tkinter;exit()" || sudo apt -y install python3-tk
    python  -c "import MySQLdb;exit()" || sudo apt -y install libmysqlclient-dev python-mysqldb

    dpkg-query -S python-dev || sudo apt -y install python-dev
    dpkg-query -S python3-dev || sudo apt -y install python3-dev
    pip3 list | grep QScintilla || pip3 install QScintilla -i ${PYPI}
    python  -c "import PyQt5;exit()" || sudo apt -y install python-pyqt5
)
# ***************************************************************
zsh --version || sudo apt -y install zsh
read -p "Configure zsh use oh-my-zsh ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    curl -L "${GITHUB_PREFIX}/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh
    [[ ${SHELL} == /usr/bin/zsh ]] || echo ${PASSWORD} | chsh -s `which zsh`
    pip install powerline-shell
    [[ -d "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme" ]] || (
        git clone \
            https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git \
            "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme" \
        && git clone \
            https://github.com/powerline/fonts.git \
            "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme/powerline-fonts" \
        && cd "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme/powerline-fonts" && ./install.sh \
        && cd "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme" && ./install_in_omz.sh
    )
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
ZSH_THEME='powerline'
EOF
    # 打开终端，选择 powerline 字体
    [[ $(grep '^ZSH_THEME="powerline"$' "${HOME}/.zshrc") ]] \
    || sed -i s/^ZSH_THEME=\\\S\\\+$/ZSH_THEME=\"powerline\"/g "${HOME}/.zshrc" \
    || echo 'ZSH_THEME="powerline"' | tee -a "${HOME}/.zshrc"

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # plugins=(... zsh-syntax-highlighting)
)
# ***************************************************************
read -p "Configure nodejs tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    export NVM_DIR="${HOME}/.nvm"
    if ! nvm --version; then
        if [[ ! -d ${NVM_DIR} || ! -s "${NVM_DIR}/nvm.sh" || ! -s "${NVM_DIR}/bash_completion" ]]; then
            sudo apt -y install build-essential libssl-dev
            curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
        fi
    fi
    [ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"
    [ -s "${NVM_DIR}/bash_completion" ] && . "${NVM_DIR}/bash_completion"

    node -v || nvm install --lts
    nvm ls-remote --lts | grep $(node -v) || nvm use --lts && nvm alias default 'lts/*'
    node-gyp -v || sudo apt install -y node-gyp
)
