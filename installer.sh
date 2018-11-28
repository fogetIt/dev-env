#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-04-30 00:00:38
set -e
set -x
PASSWORD=${1}
GITHUB_RAW="https://raw.githubusercontent.com"
TSINGHUA_PYPI="https://pypi.tuna.tsinghua.edu.cn/simple"
info_log ()
{
    echo -e "\033[32m=====> INFO: ${1}\033[0m"
}
echo ${PASSWORD} | sudo -S info_log "starting" || exit 1
if [[ ! -f /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf ]]; then
    touch /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
fi
sudo tee /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf <<EOF
# sudo passwd root; su root
[Seat:*]
user-session=ubuntu
greeter-show-manual-login=true
EOF
# ***************************************************************
which apt-fast || sudo add-apt-repository -y ppa:apt-fast/stable
if ! sudo apt policy uget | grep uget; then
    sudo add-apt-repository -y ppa:t-tujikawa/ppa
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
fi
set +e
sudo apt update
set -e
sudo apt -y install apt-fast || exit 0
apt-fast --version | cat | head -n 2 || exit 0
sudo locale-gen zh_CN.UTF-8
sudo apt -y install \
    rar unrar unzip \
    axel curl aria2 uget git \
    openssh-server sshpass \
    net-tools iptables ufw gufw \
    libmysqlclient-dev python-mysqldb \
    python-pip ipython bpython python-tk python-dev \
    python3-pip ipython3 bpython3 python3-tk python3-dev \
    tree terminator vim zsh shutter screenfetch dconf-tools
sudo ufw enable
sudo ufw default deny
# ***************************************************************
read -p "Configure vim editor ? [Y/n]" var
if [[ "${var}" == "Y" ]]; then
    curl -fLo "${HOME}/.vimrc" "${GITHUB_RAW}/fogetIt/dev-env/master/editor/vim/.vimrc"
    curl -fLo "/opt/vimrcs/autoload/plug.vim" --create-dirs "${GITHUB_RAW}/junegunn/vim-plug/master/plug.vim"
fi
# ***************************************************************
read -p "Configure github ssh key ? [Y/n]" var
if [[ "${var}" == "Y" ]]; then
    git config --global user.name "forgetIt"
    git config --global user.email "2271404280@qq.com"
    echo -e "\n" | ssh-keygen -t rsa -C "2271404280@qq.com"
    cat ${HOME}/.ssh/id_rsa.pub
    read -p "Add public key to github!"
fi
# ***************************************************************
read -p "Configure web tools ? [Y/n]" var
if [[ "${var}" == "Y" ]]; then
    sudo apt -y install nginx redis-server mysql-server mysql-client mongodb-server mongodb-clients
    sudo snap install redis-desktop-manager
fi
# ***************************************************************
info_log "Configure python tools!"
virtualenv --version || sudo pip install virtualenv -i ${TSINGHUA_PYPI}
pip3 list | grep QScintilla || pip3 install QScintilla -i ${TSINGHUA_PYPI}
python  -c "import PyQt5;exit()" || sudo apt -y install python-pyqt5
# ***************************************************************
read -p "Configure zsh use oh-my-zsh ? [Y/n]" var
if [[ "${var}" == "Y" ]]; then
    curl -L "${GITHUB_RAW}/robbyrussell/oh-my-zsh/master/tools/install.sh" | sh
    [[ ${SHELL} == /usr/bin/zsh ]] || echo ${PASSWORD} | chsh -s `which zsh`

    pip install powerline-shell
    pushd /opt
        if [[ ! -d oh-my-zsh-powerline-theme || -z `ls -A oh-my-zsh-powerline-theme` ]]; then
            git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
        fi
        pushd oh-my-zsh-powerline-theme
            if [[ ! -d powerline-fonts || -z `ls -A powerline-fonts` ]]; then
                git clone https://github.com/powerline/fonts.git powerline-fonts
            fi
            pushd powerline-fonts
                ./install.sh
            popd
            ./install_in_omz.sh
        popd
    popd
    if ! grep 'install_powerline_precmd()' "${HOME}/.zshrc"; then
        # -'EOF'
        tee -a "${HOME}/.zshrc" <<-'EOF'
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
    fi
    # 打开终端，选择 powerline 字体
    sed -i s/^ZSH_THEME=\\\S\\\+$/ZSH_THEME=\"powerline\"/g "${HOME}/.zshrc"
    if ! grep '^ZSH_THEME="powerline"$' "${HOME}/.zshrc"; then
        echo 'ZSH_THEME="powerline"' | tee -a "${HOME}/.zshrc"
    fi
    pushd "${HOME}/.oh-my-zsh/custom"
        if [[ ! -d plugins/zsh-syntax-highlighting || -z `ls -A plugins/zsh-syntax-highlighting` ]]; then
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            ${ZSH_CUSTOM:-$(pwd)}/plugins/zsh-syntax-highlighting
        fi
    popd
    # plugins=(... zsh-syntax-highlighting)
fi
# ***************************************************************
info_log "Configure nodejs tools!"
if [[ ! -d ${NVM_DIR} || ! -s "${NVM_DIR}/nvm.sh" || ! -s "${NVM_DIR}/bash_completion" ]]; then
    sudo apt -y install build-essential libssl-dev node-gyp
    curl -o- "${GITHUB_RAW}/creationix/nvm/v0.33.2/install.sh" | bash
    export NVM_DIR="${HOME}/.nvm"
    source "${NVM_DIR}/nvm.sh"
    source "${NVM_DIR}/bash_completion"
    node -v || nvm install --lts
    nvm ls-remote --lts | grep $(node -v) || nvm use --lts && nvm alias default 'lts/*'
fi
# npm 包安装的下载源
npm config set registry "https://registry.npm.taobao.org"
# node-gyp 编译 c++ 扩展所需源码的下载源
npm config set disturl "https://npm.taobao.org/dist"
# node-pre-gyp 下载各平台编译好的二进制包的下载源
# npm i --{module_name}_binary_host_mirror=http_address
npm config set grpc_node_binary_host_mirror https://npm.taobao.org/mirrors/grpc
npm config set node_sqlite3_binary_host_mirror https://npm.taobao.org/mirrors/sqlite3

npm config set ELECTRON_MIRROR https://npm.taobao.org/mirrors/electron
npm config set SASS_BINARY_SITE https://npm.taobao.org/mirrors/node-sass
npm config set SELENIUM_CDNURL https://npm.taobao.org/mirrors/selenium
npm config set PHANTOMJS_CDNURL https://npm.taobao.org/dist/phantomjs
npm config set OPERADRIVER_CDNURL https://npm.taobao.org/mirrors/operadriver
npm config set CHROMEDRIVER_CDNURL http://npm.taobao.org/mirrors/chromedriver
info_log $(npm config get registry)
# ***************************************************************
read -p "Configure desktop environment ? [Y/n]" var
if [[ "${var}" == "Y" ]]; then
    if env | grep unity; then
        sudo apt install -y unity-tweak-tool docky conky
        sudo add-apt-repository ppa:papirus/papirus -y
        set +e
        sudo apt update
        set -e
	sudo apt install gtk-redshift redshift python-appindicator -y
    else
        sudo apt install -y gnome-tweak-tool
        # 回收站、天气、色温、启动器、隐藏头部、托盘图标、断开 wifi
        # 重启 gnome-shell: alt+F2 --> r
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
fi
read -p "Configure console setup ? [Y/n]" var
if [[ "${var}" == "Y" ]]; then
    sudo dpkg-reconfigure console-setup
fi
