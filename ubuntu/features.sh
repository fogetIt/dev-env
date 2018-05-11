#!/bin/bash
# @Author: forgetIt
# @Date:   2018-04-27 22:06:43
# @Last Modified by:   forgetIt
# @Last Modified time: 2018-04-29 20:29:39
source config && echo ${PASSWORD} | sudo -S echo "start"


# fonts
sudo apt-fast -y install \
    fonts-mononoki \
    fonts-wqy-microhei \
    ttf-mscorefonts-installer

# wine3.0
wine --version || (
    sudo apt-fast -y install wine-stable playonlinux
    # sudo apt-fast -y install winetricks
)

# wine QQ
: <<'COMMENT'
winecfg -> Library
    *ntoskrnl.exe(disable)
    *txplatform.exe(disable)
    *riched20(native than builtin)
COMMENT


: <<'COMMENT'
# sublime
# https://github.com/lyfeyaj/sublime-text-imfix.git
cp -rf ../editor/sublime/* "${HOME}/.config/sublime-text-3/Packages/User/"
COMMENT


# icons-themes
sudo apt-fast install -y gnome-tweak-tool
sudo apt-fast install -y screenfetch
sudo apt-fast install -y gnome-shell-extension-dashtodock
sudo apt-fast install -y gnome-shell-extension-autohidetopbar
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
