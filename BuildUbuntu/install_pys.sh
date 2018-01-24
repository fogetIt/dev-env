#!/bin/bash
# @Date:   2017-09-06 18:26:32
# @Last Modified time: 2018-01-23 18:12:38
echo $PASSWORD | sudo -S echo -e "\033[1;;42m\n\033[0m"

pip --version || sudo apt-fast -y install python-pip
pip3 --version || sudo apt-fast -y install python3-pip
: '
# 写法2（只能以shell文件执行）
(
   echo "123zhang"
   sleep 1
   echo -e "\n"
   ) | sudo -S apt-fast install python-pip
# 写法3（只能以shell文件执行）
echo -e "\n" | (echo $user_password | sudo -S apt-fast install python-pip)
'

# 为指定的目录搭建独立的python虚拟环境
# 让不同的项目处于各自独立Python的环境中
virtualenv --version \
|| pip install virtualenv -i https://pypi.tuna.tsinghua.edu.cn/simple

# ipython, powered python shell
# bpython, powered python shell, only support linux
# ipython-notebook, ipython broswer tool
ipython -V || (
    sudo apt -y install ipython \
    && sudo apt-fast -y install ipython-notebook
    )
ipython3 -V || (
    sudo apt -y install ipython3 \
    && sudo apt-fast -y install ipython3-notebook
    )
bpython -V || pip install bpython


# Tkinter图形库
python -c "import Tkinter; exit()" || sudo apt-fast -y install python-tk
python3 -c "import tkinter; exit()" || sudo apt-fast -y install python3-tk


# libmysqlclient-dev，virtualenv的MySQLdb的依赖
python -c "import MySQLdb;exit()" \
|| sudo apt-fast -y install libmysqlclient-dev python-mysqldb


# TA-Lib、QScintilla依赖的.h头文件
dpkg-query -S python-dev || sudo apt-fast -y install python-dev
dpkg-query -S python3-dev || sudo apt-fast -y install python3-dev


# PyQt5
python -c "import PyQt5;exit()" || sudo apt-fast -y install python-pyqt5

# eric IDE依赖的所有python3库
# PyQt, sip and QScintilla
pip3 list | grep QScintilla || pip3 install QScintilla -i https://pypi.tuna.tsinghua.edu.cn/simple