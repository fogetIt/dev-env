#!/bin/bash
# @Date:   2017-05-18 22:44:33
# @Last Modified time: 2018-04-03 17:37:15
yum install gcc g++ libxslt-devel python-devel
yum install gcc-c++
yum install MySQL-python
yum -y install tree

# redhat kde
# 安装时选择 kde 包
# startkde

# centOS "Licence not accepted"
# 输入1，查看许可证
# 输入2，接受许可证
# 输入c，继续


# 启动模式
# 命令行模式 analogous to runlevel 3
# systemctl set-default multi-user.target
# 图形模式 analogous to runlevel 5
# systemctl set-default graphical.target


# 字体管理工具
# cp *.TTF /usr/share/fonts/xxx
# cd /usr/share/fonts/xxx
# chmod 755 *.TTF
# mkfontscale && mkfontdir && fc-cache -fv
# reboot
yum install -y fontconfig mkfontscale
