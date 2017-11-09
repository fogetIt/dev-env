#!/bin/bash
# @Date:   2017-09-06 18:26:32
# @Last Modified time: 2017-09-08 15:36:35
: "下载
--->解压到指定目录(/opt/go)
--->配置环境变量
    GOROOT    go安装的路径
    GOPATH    默认安装包的路径

GOPATH允许多个目录
    分隔符
        Windows    ;
        Linux      :
    默认将go get获取的包存放在第一个目录下
    约定有三个子目录
        src    存放源代码(比如：.go .c .h .s等)
        pkg    存放编译时生成的中间文件(比如：.a)
        bin    编译后生成的可执行文件
            为了方便，可以把此目录加入到 PATH 中
            如果有多个目录，那么添加所有的bin目录
"

go version
if [ $? != 0 ]; then
    goland_url="https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz"

    cd $SOFTWARES \
    && wget -O go.tar.gz $goland_url \
    && echo $USER_PASSWD | sudo -S \
        mkdir /opt/go \
    && echo $USER_PASSWD | sudo -S \
        tar \
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
    && echo $USER_PASSWD | sudo -S \
        subl /etc/profile
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
fi

: "echo -e "..."
-e
显示颜色、换行
"