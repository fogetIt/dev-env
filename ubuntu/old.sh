#!/bin/bash
# @Author: forgetIt
# @Date:   2018-04-27 22:06:43
# @Last Modified by:   forgetIt
# @Last Modified time: 2018-04-29 20:29:39

: <<'COMMENT'
ubuntu16.04 unity 桌面美化
docky               系统启动器
conky               显示系统信息
unity-tweak-tool    系统管理工具
COMMENT
which docky || sudo apt-fast -y install docky
which conky || sudo apt-fast -y install conky
sudo apt-fast -y install unity-tweak-tool


: <<'COMMENT'
ubuntu16.04 QQ
- `参考 <http://blog.csdn.net/ysy950803/article/details/52958538>`_
- `下载 <https://pan.baidu.com/s/1kV0u7Nh>`_ ，密码: 7vit

按顺序安装
COMMENT

sudo apt-get install wine
sudo dpkg -i crossover-15_15.0.3-1_all.deb
sudo dpkg -i crossover-15_15.0.3-1_all-free.deb
sudo dpkg -i deepin-crossover-helper_1.0deepin0_all.deb
sudo dpkg -i apps.com.qq.im_8.1.17255deepin11_i386.deb
# vim /usr/bin/killqq
ps aux | grep -v grep | grep wine |cut -c 9-15 | xargs kill
ps aux | grep -v grep | grep QQ |cut -c 9-15 | xargs kill
ps aux | grep -v grep | grep qq |cut -c 9-15 | xargs kill
pkill  plugplay.exe
pkill  explorer.exe
pkill  services.exe
