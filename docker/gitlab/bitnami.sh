#!/bin/bash
# @Date:   2017-04-24 18:39:04
# @Last Modified time: 2018-01-31 10:48:58
psd="123zhang"

: '
bitnami-gitlab最新版只能找到虚拟机镜像（.ova）
https://bitnami.com/redirect/to/87432/bitnami-gitlab-8.2.3-4-linux-installer.run
https://bitnami.com/redirect/to/137156/bitnami-gitlab-8.14.0-0-linux-x64-installer.run
'

I="installed"

if [ $I != "installed" ]; then
    # 安装依赖
    echo $psd | sudo -S apt-get -y install openssh-server

    cd /home/zdd/software_download
    chmod +x ./bitnami-gitlab-8.14.0-0-linux-x64-installer.run
    ./bitnami-gitlab-8.14.0-0-linux-x64-installer.run
fi

# 127.0.0.1，默认端口80

cd /opt/gitlab-8.14.0-0

# 服务端 启动Gitlab
./ctlscript.sh start

# 查看GUI管理控制台
./manager-linux-x64.run