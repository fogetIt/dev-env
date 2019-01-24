#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2018-04-30 00:00:38
set -e
set -x
PASSWD=${1}
info_log (){ echo -e "\033[32m=====> INFO: ${1}\033[0m";}
echo ${PASSWD} | sudo -S info_log "starting" || exit 1
sudo touch -f /opt/software.list
# *****************************************************************************
sudo echo -n '
# sudo passwd root; su root
[Seat:*]
user-session=ubuntu
greeter-show-manual-login=true
' > /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
# *****************************************************************************
which apt-fast || sudo add-apt-repository -y ppa:apt-fast/stable
if ! sudo apt policy uget | grep uget; then
    sudo add-apt-repository -y ppa:t-tujikawa/ppa
    sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
fi
set +e
sudo apt update
set -e
sudo apt -y install apt-fast
apt-fast --version | cat | head -n 2 || exit 0
sudo locale-gen zh_CN.UTF-8
sudo apt -y install rar unrar unzip \
    openssh-server net-tools iptables \
    axel curl aria2 ufw gufw uget git \
    screenfetch tree terminator vim zsh \
    dconf-tools shutter parcellite sshpass expect \
    build-essential libssl-dev node-gyp \
    python-pip python-pyqt5 python3-pip python3-dev \
    ipython3 bpython3 python3-tk libmysqlclient-dev python3-mysqldb \
    nginx redis-server mysql-server mysql-client mongodb-server mongodb-clients \
    subversion rapidsvn scite nautilus kdiff3
sudo snap install redis-desktop-manager
# *****************************************************************************
sudo ufw enable
sudo ufw default deny
# *****************************************************************************
echo ${PASSWD} | chsh -s `which zsh`
info_log ${SHELL}
# *****************************************************************************
git config --global user.name "forgetIt"
git config --global user.email "2271404280@qq.com"
[[ -f ${HOME}/.ssh/id_rsa.pub ]] || (
    echo -e "\n" | ssh-keygen -t rsa -C "2271404280@qq.com"
    cat ${HOME}/.ssh/id_rsa.pub
    read -p "Add public key to github!" var
    [[ "${var}" == "Y" ]] && x-www-browser 'https://github.com'
)
# *****************************************************************************
sudo pip install virtualenv powerline-shell -i https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install QScintilla -i https://pypi.tuna.tsinghua.edu.cn/simple
# *****************************************************************************
sudo find ${HOME}/.config/ -name mongobooster | grep mongobooster || (
    sudo apt install libstdc++6
    pushd /opt
        axel -n 6 -o nosqlbooster4mongo.AppImage \
https://s3.mongobooster.com/download/releasesv5/nosqlbooster4mongo-5.0.3.AppImage
        chmod +x nosqlbooster4mongo.AppImage
        ./nosqlbooster4mongo.AppImage
    popd
)
# *****************************************************************************
if ! grep 'wps-office' /opt/software.list; then
    sudo apt -y purge libreoffice*
    pushd /opt
        sudo axel -n 6 -o wps-office.deb \
http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb
        sudo dpkg -i wps-office.deb
    popd
    sudo echo 'wps-office' >> /opt/software.list
fi
# *****************************************************************************
if ! grep 'vimrc' /opt/software.list; then
    curl -fLo ${HOME}/.vimrc \
https://raw.githubusercontent.com/fogetIt/devenv/master/editor/vim/.vimrc
    curl -fLo /opt/vimrcs/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    sudo echo 'vimrc' >> /opt/software.list
fi
# *****************************************************************************
if ! grep 'oh-my-zsh' /opt/software.list; then
    curl -L \
https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    sudo echo 'oh-my-zsh' >> /opt/software.list
fi
# *****************************************************************************
if ! grep 'powerline-theme' /opt/software.list; then
    pushd /opt
        sudo rm -rf oh-my-zsh-powerline-theme
        git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
        pushd oh-my-zsh-powerline-theme
            sudo rm -rf powerline-fonts
            git clone https://github.com/powerline/fonts.git powerline-fonts
            pushd powerline-fonts
                /bin/sh install.sh
            popd
            /bin/sh install_in_omz.sh
        popd
    popd
    pushd "${HOME}/.oh-my-zsh/custom"
        if [[ ! -d plugins/zsh-syntax-highlighting || -z `ls -A plugins/zsh-syntax-highlighting` ]]; then
            git clone \
https://github.com/zsh-users/zsh-syntax-highlighting.git \
            ${ZSH_CUSTOM:-$(pwd)}/plugins/zsh-syntax-highlighting
        fi
    popd
    # plugins=(... zsh-syntax-highlighting)
    sudo echo 'powerline-theme' >> /opt/software.list
fi
# *****************************************************************************
echo -n 'function powerline_precmd() { PS1="$(powerline-shell --shell zsh $?)"; }
function install_powerline_precmd() { for s in "${precmd_functions[@]}"; do
if [ "$s" = "powerline_precmd" ]; then; return; fi; done; precmd_functions+=(powerline_precmd); }
[ "$TERM" != "linux" ] && install_powerline_precmd' > ${HOME}/.powerline-shell
if ! grep '^source ${HOME}/.powerline-shell$' "${HOME}/.zshrc"; then
    echo 'source ${HOME}/.powerline-shell' | tee -a "${HOME}/.zshrc"
fi
# 打开终端，选择 powerline 字体
sed -i s/^ZSH_THEME=\\\S\\\+$/ZSH_THEME=\"powerline\"/g "${HOME}/.zshrc"
if ! grep '^ZSH_THEME="powerline"$' "${HOME}/.zshrc"; then
    echo 'ZSH_THEME="powerline"' | tee -a "${HOME}/.zshrc"
fi
# *****************************************************************************
if [[ ! command -v nvm ]]; then
    curl -o- \
https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    [[ -d ${NVM_DIR} ]] || export NVM_DIR="${HOME}/.nvm"
    [[ -s "${NVM_DIR}/nvm.sh" ]] || source "${NVM_DIR}/nvm.sh"
    [[ -s "${NVM_DIR}/bash_completion" ]] && \. "${NVM_DIR}/bash_completion"
    node -v || nvm install --lts
    nvm ls-remote --lts | grep $(node -v) || nvm use --lts && nvm alias default 'lts/*'
fi
# npm 包安装的下载源
npm config set registry "https://registry.npm.taobao.org"
npm list tldr -g || npm install tldr -g
# node-gyp 编译 c++ 扩展所需源码的下载源
npm config set disturl "https://npm.taobao.org/dist"
# node-pre-gyp 各平台编译好的二进制包的下载源
# npm i --{module_name}_binary_host_mirror=http_address
npm config set SELENIUM_CDNURL https://npm.taobao.org/mirrors/selenium
npm config set ELECTRON_MIRROR https://npm.taobao.org/mirrors/electron
npm config set PHANTOMJS_CDNURL https://npm.taobao.org/dist/phantomjs
npm config set SASS_BINARY_SITE https://npm.taobao.org/mirrors/node-sass
npm config set OPERADRIVER_CDNURL https://npm.taobao.org/mirrors/operadriver
npm config set CHROMEDRIVER_CDNURL http://npm.taobao.org/mirrors/chromedriver
npm config set grpc_node_binary_host_mirror https://npm.taobao.org/mirrors/grpc
npm config set node_sqlite3_binary_host_mirror https://npm.taobao.org/mirrors/sqlite3
info_log $(npm config get registry)
if ! grep 'desktop-environment' /opt/software.list; then
    if env | grep unity; then
        sudo apt install -y unity-tweak-tool docky conky
        sudo add-apt-repository ppa:papirus/papirus -y
        set +e
        sudo apt update
        set -e
	    sudo apt install gtk-redshift redshift python-appindicator -y
    else
        sudo apt install -y gnome-tweak-tool
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
    sudo echo 'desktop-environment' >> /opt/software.list
fi
