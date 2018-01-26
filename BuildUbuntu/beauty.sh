#!/bin/bash
# @Date:   2018-01-24 16:09:38
# @Last Modified time: 2018-01-26 14:32:05
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


# electronic wechat
git clone https://github.com/geeeeeeeeek/electronic-wechat.git \
&& cd electronic-wechat \
&& npm install --registry=https://registry.npm.taobao.org \
&& npm start
: <<'COMMENT'
# pack into an app
npm run build:osx
npm run build:linux
npm run build:win32
npm run build:win64
COMMENT

: <<'COMMENT'
# youdao 1.1.0
[youdao-dict](http://codown.youdao.com/cidian/linux/youdao-dict_1.0.2~ubuntu_amd64.deb)

sudo apt-get install libcwidget3v5 aptitude-common aptitude

sudo dpkg -i youdao-dict*
COMMENT

# [QQ](http://blog.csdn.net/ysy950803/article/details/52958538)
# [下载](https://pan.baidu.com/s/1kV0u7Nh)，密码: 7vit
# 有可能部分中文乱码，但是不影响聊天、使用
# 卸载其它版的`QQ`，顺序安装
sudo apt-get install wine
sudo dpkg -i crossover-15_15.0.3-1_all.deb
sudo dpkg -i crossover-15_15.0.3-1_all-free.deb
sudo apt-get install libgsm1 libgstreamer0.10-0 libgstreamer-plugins-base0.10-0
sudo dpkg -i deepin-crossover-helper_1.0deepin0_all.deb
sudo dpkg -i apps.com.qq.im_8.1.17255deepin11_i386.deb
: 'vim /usr/bin/killqq'
ps aux | grep -v grep | grep wine |cut -c 9-15 | xargs kill
ps aux | grep -v grep | grep QQ |cut -c 9-15 | xargs kill
ps aux | grep -v grep | grep qq |cut -c 9-15 | xargs kill
pkill  plugplay.exe
pkill  explorer.exe
pkill  services.exe


# chorme
sudo apt-get install libindicator7 libappindicator1
sudo dpkg -i google-chorme-*
