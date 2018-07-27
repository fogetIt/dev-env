#!/bin/bash
# @Author: forgetIt
# @Date:   2018-04-27 22:06:43
# @Last Modified by:   forgetIt
# @Last Modified time: 2018-04-29 20:29:39

: <<'COMMIT'
16.04 unity
------------
:docky: 系统启动器
:conky: 显示系统信息
:unity-tweak-tool: 系统管理工具
COMMIT
    # 动态壁纸包
    sudo add-apt-repository ppa:fyrmir/livewallpaper-daily
    sudo apt update
    sudo apt install livewallpaper livewallpaper-config livewallpaper-indicator

    # sublime
    # https://github.com/lyfeyaj/sublime-text-imfix.git
    cp -rf ../editor/sublime/* "${HOME}/.config/sublime-text-3/Packages/User/"


: <<'COMMIT'
18.04 gnome3
------------
设置 -> Dock
tweak -> 主题、图标
重启 gnome
    tweak -> 扩展 -> Dash to dock
    tweak -> 扩展 -> Hide top bar
COMMIT
    sudo apt install -y numix-gtk-theme numix-icon-theme*
    sudo apt install -y arc-theme
    # ************************************************************
    sudo add-apt-repository ppa:snwh/pulp
    sudo apt update
    sudo apt install -y paper-icon-theme


: <<'COMMIT'
ubuntu-mate
-------------
COMMIT
    sudo apt install ubuntu-mate* fcitx-sunpinyin pastebinit
    fcitx-diagnose | pastebinit
    # 首选项 -> 语言支持


: <<'COMMIT'
spacevim
--------
COMMIT
    curl -sLf https://spacevim.org/install.sh | bash


: <<'COMMIT'
16.04 QQ
---------
COMMIT
    sudo apt install wine
    sudo dpkg -i crossover-15_15.0.3-1_all.deb
    sudo dpkg -i crossover-15_15.0.3-1_all-free.deb
    sudo dpkg -i deepin-crossover-helper_1.0deepin0_all.deb
    sudo dpkg -i apps.com.qq.im_8.1.17255deepin11_i386.deb
    # vim /usr/bin/killqq
    ps aux | grep -v grep | grep wine | cut -c 9-15 | xargs kill
    ps aux | grep -v grep | grep QQ | cut -c 9-15 | xargs kill
    ps aux | grep -v grep | grep qq | cut -c 9-15 | xargs kill
    pkill  plugplay.exe
    pkill  explorer.exe
    pkill  services.exe


: <<'COMMIT'
16.04 icons-themes
------------------
COMMIT
    sudo apt install -y gtk2-engines-pixbuf gnome-themes-standard

    sudo add-apt-repository ppa:numix/ppa
    sudo apt update
    sudo apt install numix-icon-theme*


: <<'COMMIT'
node
-----
COMMIT
    xz -kfd node*.tar.xz
    mkdir node
    tar -xvf node*.tar -C node --strip-components 1
    sudo ln -sf "./node/bin/node" /usr/local/bin/node
    sudo ln -sf "./node/bin/npm" /usr/local/bin/npm
    npm config set prefix /usr/local
    # npm config list
    # npm 全局命令安装目录：${prefix}/bin/


: <<'COMMIT'
go
---
GOROOT 包安装路径（可以指定多个）
    src 存放源代码（比如：.go .c .h .s等）
    pkg 存放编译时生成的中间文件（比如：.a）
    bin 存放编译后生成的可执行文件
        为了方便，可以把此目录加入到 PATH
        如果有多个目录，那么添加所有的bin目录
COMMIT
    # curl -fLo "./go.tar.gz" https://studygolang.com/dl/golang/go1.9.2.linux-amd64.tar.gz
    mkdir go
    tar -zxvf go*.tar.gz -C go --strip-components 1
    sudo ln -sf "${PATH_SOFTWARES}/go/bin/go" /usr/local/bin/go
    grep 'export GOROOT=${HOME}/go'                        /etc/profile || tee -e 'export GOROOT=${HOME}/go'
    grep 'export GOPATH=${HOME}/gocode'                    /etc/profile || tee -e 'export GOPATH=${HOME}/gocode'
    grep 'export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin' /etc/profile || tee -e 'export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin'
    source /etc/profile


: <<'COMMIT'
pycharm
-------
COMMIT
    # sudo apt -y install libcanberra-gtk-module
    mkdir Pycharm
    tar -zxvf "PyCharm.tar.gz" -C PyCharm --strip-components 1
    # sudo ln -sf Pycharm/bin/pycharm.sh /usr/local/bin/pycharm
    # 启动一次，生成配置文件目录
    cd ${HOME}/.PyCharm*/config
    curl -fLo ./keymaps/Custom.xml --create-dirs https://raw.githubusercontent.com/fogetIt/dev-env/master/editor/jetbrains/Custom.xml
    nohup charm>~/jetbrains.log 2>&1 &


: <<'COMMIT'
其它
--------
COMMIT

    # fonts
    sudo apt -y install fonts-mononoki fonts-wqy-microhei ttf-mscorefonts-installer
    # wine3.0
    sudo apt -y install wine-stable playonlinux winetricks
    # ***************************************************************
    sudo find ${HOME}/.config/ -name mongobooster | grep mongobooster || (
        cd ${PATH_SOFTWARES} && \
        url="http://s3.mongobooster.com/download/3.5/mongobooster-3.5.5-x86_64.AppImage" \
        axel -n 16 $url && \
        chmod +x ./mongobooster*.AppImage && \
        sudo apt install libstdc++6 && \
        ./mongobooster*.AppImage
    )
    # ***************************************************************
    sudo apt install perl


: <<'COMMIT'
svn 客户端
--------
COMMIT
cd;sudo apt install rapidsvn scite nautilus kdiff3 -y


: <<'COMMIT'
内存管理
--------
COMMIT
sudo sync;free -m