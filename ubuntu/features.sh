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
sudo apt-fast install -y gnome-tweak-tool
sudo apt-fast install -y gnome-shell-extensions
sudo apt-fast install -y gnome-shell-extension-dashtodock
sudo apt-fast install -y gnome-shell-extension-hide-activities
: <<'COMMENT'
设置 -> Dock
tweak -> 主题、图标
重启 gnome -> tweak -> 扩展 -> Dash to dock
COMMENT
# ************************************************************
sudo apt-fast install -y papirus-icon-theme
sudo apt-fast install -y numix-gtk-theme numix-icon-theme-circle
sudo apt-fast install -y arc-theme
sudo apt-fast install -y gtk2-engines-pixbuf gnome-themes-standard
# ************************************************************
sudo add-apt-repository ppa:snwh/pulp
sudo apt-fast update
sudo apt-fast install -y paper-icon-theme


vim_plugins_path="${PATH_SOFTWARES}/plugins"
vim_vundle_repository=git@github.com:VundleVim/Vundle.vim.git
read -p "To configure vim? [Y/n]" var && (
    [[ "${var}" == "Y" ]] \
    && cp -f ${PATH_DEVENV}/editor/vim/.vimrc ${HOME}/ \
    && [[ ! -d ${vim_plugins_path} ]] \
    && mkdir ${vim_plugins_path} \
    && git clone ${vim_vundle_repository} "${vim_plugins_path}/Vundle"
)
