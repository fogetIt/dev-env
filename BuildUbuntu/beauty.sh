#!/bin/bash
# @Date:   2018-01-24 16:09:38
# @Last Modified time: 2018-01-24 16:21:29
# 美化
# 管理工具
sudo apt install docky -y
sudo apt-get install unity-tweak-tool -y

# themes/icons
# sudo apt-get install gtk2-engines-pixbuf gnome-themes-standard

sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
sudo apt-get install flatabulous-theme -y
sudo apt-get install ultra-flat-icons -y

# sudo add-apt-repository ppa:numix/ppa
# sudo apt-get update
# sudo apt-get install numix-gtk-theme numix-icon-theme-circle -y

# sudo add-apt-repository ppa:snwh/pulp
# sudo apt-get update
# sudo apt-get install paper-icon-theme -y

# sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 90127F5B
# echo "deb http://downloads.sourceforge.net/project/xenlism-wildfire/repo deb/" | sudo tee -a /etc/apt/sources.list
# sudo apt-get update
# sudo apt-get install xenlism-wildfire-icon-theme -y


# 指针
sudo add-apt-repository ppa:noobslab/macbuntu
sudo apt-get update
sudo apt-get install macbuntu-os-icons-lts-v7
sudo apt-get install macbuntu-os-ithemes-lts-v7
