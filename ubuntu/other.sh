#!/bin/bash
# @Author: forgetIt
# @Date:   2018-04-27 22:06:43
# @Last Modified by:   forgetIt
# @Last Modified time: 2018-04-29 20:29:39
source config && echo ${PASSWORD} | sudo -S echo "start"


# fonts
sudo apt-fast -y install fonts-wqy-microhei
sudo apt-fast -y install ttf-mscorefonts-installer

# wine3.0
wine --version || (
    sudo apt-fast -y install wine-stable winetricks
    winetricks wenquanyi

    sudo apt-fast -y install \
        winbind \
        playonlinux \
        wine-binfmt \
        dosbox \
        wine32-preloader:i386 \
        wine64-preloader \
        tor
)

# wine QQ
: <<'COMMENT'
winecfg -> Library
    *ntoskrnl.exe(disable)
    *txplatform.exe(disable)
    *riched20(native than builtin)
COMMENT


# sublime
# https://github.com/lyfeyaj/sublime-text-imfix.git
cp -rf ${PATH_DEVENV}/editor/sublime/* "${HOME}/.config/sublime-text-3/Packages/User/"


# themes&icons
# 系统管理工具
# sudo apt-fast install unity-tweak-tool -y
sudo apt-fast install gnome-tweak-tool -y
sudo apt-cache search icon-theme
# ************************************************************
sudo apt-fast install papirus-icon-theme
# ************************************************************
sudo apt-fast install gtk2-engines-pixbuf gnome-themes-standard
# ************************************************************
sudo add-apt-repository ppa:numix/ppa
sudo apt-fast update
sudo apt-fast install numix-gtk-theme numix-icon-theme-circle -y
# ************************************************************
sudo add-apt-repository ppa:snwh/pulp
sudo apt-fast update
sudo apt-fast install paper-icon-theme -y
