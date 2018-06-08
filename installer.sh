#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-04-30 00:00:38
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
which apt-fast     || sudo add-apt-repository -y ppa:apt-fast/stable
uget-gtk --version || sudo add-apt-repository -y ppa:t-tujikawa/ppa
uget-gtk --version || sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
sudo apt update
# ***************************************************************
sudo apt -y install language-pack-zh-hans \
                    apt-fast git \
                    openssh-server sshpass \
                    axel curl aria2 uget \
                    rar unrar unzip \
                    shutter dconf-tools \
                    tree terminator vim zsh \
                    net-tools iptables ufw gufw
which apt-fast && apt-fast --version | cat | head -n 2 || exit 0
sudo ufw enable && sudo ufw default deny
# ***************************************************************
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
read -p "Configure web tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    sudo apt -y install nginx redis-server \
                        mysql-server mysql-client \
                        mongodb-server mongodb-clients
)
# ***************************************************************
sudo apt -y install python-pip python3-pip \
                    ipython ipython3 \
                    bpython bpython3
virtualenv --version || sudo pip install virtualenv -i ${PYPI}
dpkg-query -S python-dev python3-dev || sudo apt -y install python-dev python3-dev
read -p "Configure python tools ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    sudo apt -y install python-tk python3-tk \
                        libmysqlclient-dev python-mysqldb
    pip3 list | grep QScintilla || pip3 install QScintilla -i ${PYPI}
    python  -c "import PyQt5;exit()" || sudo apt -y install python-pyqt5
)
# ***************************************************************
read -p "Configure zsh use oh-my-zsh ? [Y/n]" var && [[ "${var}" == "Y" ]] && (
    curl -L "${GITHUB_PREFIX}/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh
    [[ ${SHELL} == /usr/bin/zsh ]] || echo ${PASSWORD} | chsh -s `which zsh`
    pip install powerline-shell
    [[ -d "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme" \
    && `ls -A "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme"` != "" ]] || \
        git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git \
            "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme"
    [[ `ls -A "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme/powerline-fonts"` != "" ]] || \
        git clone https://github.com/powerline/fonts.git \
            "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme/powerline-fonts" \
    cd "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme/powerline-fonts" && ./install.sh \
    cd "${PATH_SOFTWARES}/oh-my-zsh-powerline-theme" && ./install_in_omz.sh
    grep 'install_powerline_precmd()' "${HOME}/.zshrc" || tee -a "${HOME}/.zshrc" <<-'EOF'
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
    grep '^ZSH_THEME="powerline"$' "${HOME}/.zshrc" \
    || sed -i s/^ZSH_THEME=\\\S\\\+$/ZSH_THEME=\"powerline\"/g "${HOME}/.zshrc" \
    || echo 'ZSH_THEME="powerline"' | tee -a "${HOME}/.zshrc"

    [[ -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" && \
    `ls -A "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"` !="" ]] || \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # plugins=(... zsh-syntax-highlighting)
)
# ***************************************************************
if [[ ! -d ${NVM_DIR} || ! -s "${NVM_DIR}/nvm.sh" || ! -s "${NVM_DIR}/bash_completion" ]]; then
    sudo apt -y install build-essential libssl-dev
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
    export NVM_DIR="${HOME}/.nvm"
    [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"
    [ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"
    node -v || nvm install --lts
    nvm ls-remote --lts | grep $(node -v) || nvm use --lts && nvm alias default 'lts/*'
fi
sudo apt install -y node-gyp
# ***************************************************************
sudo apt install -y screenfetch
if env | grep unity; then
    sudo apt install -y docky conky unity-tweak-tool
    sudo add-apt-repository ppa:papirus/papirus
    sudo apt update
else
    sudo apt install -y gnome-tweak-tool
: <<'COMMENT'
回收站、天气、色温、启动器、隐藏头部、托盘图标、断开 wifi
alt+F2，输入 r ，重启 gnome-shell
COMMENT
    sudo apt install -y \
        gnome-shell-extension-trash \
        gnome-shell-extension-weather \
        gnome-shell-extension-redshift \
        gnome-shell-extension-dashtodock \
        gnome-shell-extension-autohidetopbar \
        gnome-shell-extension-top-icons-plus \
        gnome-shell-extension-disconnect-wifi
fi
sudo apt install papirus-icon-theme -y
