#!/bin/bash
# @Date:   2017-04-01 14:27:49
# @Last Modified time: 2017-11-20 17:01:06
echo $USER_PASSWD | sudo -S echo -e "\033[1;;42m\n\033[0m"

pip --version
if [ $? != 0 ]; then
    sudo apt-fast -y install python-pip
fi
pip3 --version
if [ $? != 0 ]; then
    sudo apt-fast -y install python3-pip
fi
: '
# 写法2（只能以shell文件执行）
(
   echo "123zhang"
   sleep 1
   echo -e "\n"
   ) | sudo -S apt-fast install python-pip
# 写法3（只能以shell文件执行）
echo -e "\n" | (echo $USER_PASSWD | sudo -S apt-fast install python-pip)
'

: 'virtualenv
为指定的目录搭建独立的python虚拟环境
让不同的项目处于各自独立Python的环境中
'
virtualenv --version
if [ $? != 0 ]; then
    pip install virtualenv
    # easy_install virtualenv
fi

: '
ipython————Python shell的一个交互加强版
ipython-notebook————ipython的broswer交互工具
'
ipython -V
if [ $? != 0 ]; then
    sudo apt -y install ipython
fi
ipython3 -V
if [ $? != 0 ]; then
    sudo apt -y install ipython3
fi
ipython netbook -V
if [ $? != 0 ]; then
    sudo apt-fast -y install ipython-notebook
fi
ipython3 netbook -V
if [ $? != 0 ]; then
    sudo apt-fast -y install ipython3-notebook
fi


: 'Tkinter图形库'
python -c "import Tkinter; exit()"
if [ $? != 0 ]; then
    sudo apt-fast -y install python-tk
fi
python3 -c "import tkinter; exit()"
if [ $? != 0 ]; then
    sudo apt-fast -y install python3-tk
fi


: 'libmysqlclient-dev————virtualenv的MySQLdb的依赖'
python -c "import MySQLdb;exit()"
if [ $? != 0 ]; then
    sudo apt-fast -y install libmysqlclient-dev
    sudo apt-fast -y install python-mysqldb
fi


: 'TA-Lib、QScintilla依赖的.h头文件'
dpkg-query -S python-dev
if [ $? != 0 ]; then
    sudo apt-fast -y install python-dev
fi
dpkg-query -S python3-dev
if [ $? != 0 ]; then
    sudo apt-fast -y install python3-dev
fi


: 'PyQt5'
python -c "import PyQt5;exit()"
if [ $? != 0 ]; then
    sudo apt-fast -y install python-pyqt5
fi
: 'eric IDE依赖的所有python3库
PyQt, sip and QScintilla
'
pip3 list | grep QScintilla
if [ $? != 0 ]; then
    pip3 install QScintilla -i https://pypi.tuna.tsinghua.edu.cn/simple
fi

: "
创建python虚拟环境
virtualenv ./ --no-site-packages -p /usr/bin/python
"