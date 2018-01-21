#!/bin/bash
# @Date:   2017-09-06 18:26:32
# @Last Modified time: 2018-01-21 22:44:56
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"
: "
下载
解压到指定目录(/opt/go)
配置环境变量
    GOROOT    go安装的路径
    GOPATH    默认安装包的路径

GOPATH允许多个目录
    分隔符
        Windows;
        Linux:
    默认将go get获取的包存放在第一个目录下
    约定有三个子目录
        src    存放源代码(比如：.go .c .h .s等)
        pkg    存放编译时生成的中间文件(比如：.a)
        bin    编译后生成的可执行文件
            为了方便，可以把此目录加入到 PATH 中
            如果有多个目录，那么添加所有的bin目录
"

go version; [ $? == 0 ] || (
    url= "https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz"

    cd $SOFTWARES \
    && wget -O go.tar.gz $url
    && sudo mkdir /opt/go \
    && sudo tar \
        -zxvf go.tar.gz \
        -C /opt/go \
        --strip-components 1 \
    && export GOROOT=/opt/go \
    && export GOPATH=$HOME/gocode \
    && export PATH=$PATH:$GOROOT/bin:$GOPATH/bin \
    && echo -e "please copy and paste the following message \
        \033[0;31m \n\n \
        export GOROOT=/opt/go \n \
        export GOPATH=\$HOME/gocode \n \
        export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin \n \
        \033[0m" \
    && sudo subl /etc/profile
    )

: "
命令行修改环境变量
    立即生效，重启失效
        export ***
修改配置文件
    重启生效
        subl /etc/profile
    立即生效
        source /etc/profile
    "

: "echo -e '...'
显示颜色、换行
"

# ****************************************************************************
# -f/--force————移动、创建软链接时覆盖旧的
node -v && npm -v; [ $? == 0 ] || (
    url="https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-linux-x64.tar.xz"

    cd $SOFTWARES \
    && sudo rm -rf ./node* \
    && wget -O node.tar.xz $url \
    && xz -d node.tar.xz \
    && tar -xvf node.tar \
    && sudo rm -rf /opt/node \
    && sudo mv -f ./node*/ /opt/node \
    && sudo ln -sf /opt/node/bin/node /usr/bin/node \
    && sudo ln -sf /opt/node/bin/npm /usr/bin/npm \
    && npm config set prefix /usr/local
    )

# npm config list
: "
使用npm命令
方案一：创建npm软连接
方案二：使用默认的npm
"
: "
设置prefix
(npm全局命令安装目录：${prefix}/bin/)
使npm安装的命令能够生效
"


# ****************************************************************************
pip --version; [ $? == 0 ] || sudo apt-fast -y install python-pip
pip3 --version; [ $? == 0 ] || sudo apt-fast -y install python3-pip
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

: '
virtualenv
为指定的目录搭建独立的python虚拟环境
让不同的项目处于各自独立Python的环境中
'
virtualenv --version; [ $? == 0 ] \
|| pip install virtualenv -i https://pypi.tuna.tsinghua.edu.cn/simple

: '
ipython
Python shell 的一个交互加强版
ipython-notebook
ipython 的 broswer 交互工具
'
ipython -V; [ $? == 0 ] || sudo apt -y install ipython
ipython3 -V; [ $? == 0 ] || sudo apt -y install ipython3
ipython netbook -V; [ $? == 0 ] || sudo apt-fast -y install ipython-notebook
ipython3 netbook -V; [ $? == 0 ] || sudo apt-fast -y install ipython3-notebook

: "
bpython
only support linux
自动补全、自动提示的IDE
"
bpython -V; [ $? == 0 ] || pip install bpython

: 'Tkinter图形库'
python -c "import Tkinter; exit()"; [ $? == 0 ] || sudo apt-fast -y install python-tk
python3 -c "import tkinter; exit()"; [ $? == 0 ] || sudo apt-fast -y install python3-tk


: 'libmysqlclient-dev，virtualenv的MySQLdb的依赖'
python -c "import MySQLdb;exit()"; [ $? == 0 ] \
|| sudo apt-fast -y install libmysqlclient-dev python-mysqldb


: 'TA-Lib、QScintilla依赖的.h头文件'
dpkg-query -S python-dev; [ $? == 0 ] || sudo apt-fast -y install python-dev
dpkg-query -S python3-dev; [ $? == 0 ] || sudo apt-fast -y install python3-dev


: 'PyQt5'
python -c "import PyQt5;exit()"; [ $? == 0 ] || sudo apt-fast -y install python-pyqt5

: '
eric IDE依赖的所有python3库
PyQt, sip and QScintilla
'
pip3 list | grep QScintilla; [ $? == 0 ] \
|| pip3 install QScintilla -i https://pypi.tuna.tsinghua.edu.cn/simple