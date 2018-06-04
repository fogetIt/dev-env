#!/bin/bash
# @Author: forgetIt
# @Date:   2018-04-27 22:06:43
# @Last Modified by:   forgetIt
# @Last Modified time: 2018-04-29 20:29:39
source config && echo ${PASSWORD} | sudo -S echo "start"


# fonts
# Noto Sans Mono CJK KR Regular
sudo apt-fast -y install \
    fonts-mononoki \
    fonts-wqy-microhei \
    ttf-mscorefonts-installer

# wine3.0
wine --version || sudo apt-fast -y install wine-stable playonlinux winetricks

: <<'COMMENT'
# sublime
# https://github.com/lyfeyaj/sublime-text-imfix.git
cp -rf ../editor/sublime/* "${HOME}/.config/sublime-text-3/Packages/User/"
COMMENT


# icons-themes
sudo apt-fast install -y gnome-tweak-tool
sudo apt-fast install -y screenfetch
: <<'COMMENT'
回收站、天气、色温、启动器、隐藏头部、托盘图标、断开 wifi
alt+F2，输入 r ，重启 gnome-shell
COMMENT
sudo apt-fast install -y \
    gnome-shell-extension-trash \
    gnome-shell-extension-weather \
    gnome-shell-extension-redshift \
    gnome-shell-extension-dashtodock \
    gnome-shell-extension-autohidetopbar \
    gnome-shell-extension-top-icons-plus \
    gnome-shell-extension-disconnect-wifi
: <<'COMMENT'
设置 -> Dock
tweak -> 主题、图标
重启 gnome
    tweak -> 扩展 -> Dash to dock
    tweak -> 扩展 -> Hide top bar
COMMENT
# ************************************************************
sudo apt-fast install -y papirus-icon-theme
sudo apt-fast install -y numix-gtk-theme numix-icon-theme-circle
sudo apt-fast install -y arc-theme
# ************************************************************
sudo add-apt-repository ppa:snwh/pulp
sudo apt-fast update
sudo apt-fast install -y paper-icon-theme


: <<'COMMENT'
unpack and install
COMMENT
source config && echo ${PASSWORD} | sudo -S echo -e "\033[1;;42m\n\033[0m"

: <<'COMMENT'
# sudo apt-fast -y install libcanberra-gtk-module
tar -zxvf "PyCharm.tar.gz" -C PyCharm --strip-components 1
PyCharm/bin/pycharm.sh # 生成配置文件目录
# sudo ln -sf "$(pwd)/PyCharm/bin/pycharm.sh" "/usr/bin/pycharm"
cd ${HOME}/.PyCharm*/config
curl -fLo ./keymaps/Custom.xml --create-dirs \
    https://raw.githubusercontent.com/fogetIt/dev-env/master/editor/jetbrains/Custom.xml

nohup pycharm>~/jetbrains.log 2>&1 &
COMMENT
exit 0

# ***************************************************************
# curl -fLo "./go.tar.gz" https://studygolang.com/dl/golang/go1.9.2.linux-amd64.tar.gz
go version || (
    cd ${PATH_SOFTWARES} \
    && (
        [[ -d go ]] || mkdir go
    ) \
    && tar -zxvf go*.tar.gz -C go --strip-components 1 \
    && sudo ln -sf "${PATH_SOFTWARES}/go/bin/go" /usr/bin/go
    && export GOROOT=${HOME}/softwares/go \
    && export GOPATH=${HOME}/gocode \
    && export PATH=$PATH:${GOROOT}/bin:${GOPATH}/bin

    # go 语言安装的路径
    GOROOT='export GOROOT=${HOME}/softwares/go'
    # go 包安装路径（可以指定多个）
    #     src 存放源代码（比如：.go .c .h .s等）
    #     pkg 存放编译时生成的中间文件（比如：.a）
    #     bin 存放编译后生成的可执行文件
    #         为了方便，可以把此目录加入到 PATH
    #         如果有多个目录，那么添加所有的bin目录
    GOPATH='export GOPATH=${HOME}/gocode'
    PATH='export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin'

    grep ${PATH}   /etc/profile || tee -e ${PATH}
    grep ${GOROOT} /etc/profile || tee -e ${GOROOT}
    grep ${GOPATH} /etc/profile || tee -e ${GOPATH}
)
# ***************************************************************
sudo find ${HOME}/.config/ -name mongobooster | grep mongobooster || (
    cd ${PATH_SOFTWARES} \
    && axel -n 16 "http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage" \
    && chmod +x ./mongobooster*.AppImage \
    && sudo apt-get install libstdc++6 \
    && ./mongobooster*.AppImage
)
# ***************************************************************
perl -version || sudo apt-get install perl
# ***************************************************************
