#!/bin/bash
# @Author: forgetIt
# @Date:   2018-04-27 22:06:43
# @Last Modified by:   forgetIt
# @Last Modified time: 2018-04-29 20:29:39
source config && echo ${PASSWORD} | sudo -S echo "start"


# sudo apt-fast -y install fonts-wqy-microhei
# sudo apt-fast -y install ttf-mscorefonts-installer

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

# InterQQ
: <<'COMMENT'
winecfg -> Library
    *ntoskrnl.exe(disable)
    *txplatform.exe(disable)
    *riched20(native than builtin)
COMMENT

