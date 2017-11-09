#!/bin/bash
# @Date:   2017-04-27 13:31:21
# @Last Modified time: 2017-07-06 10:16:50
psd="123zhang"

docker -v
: "安装默认版本docker
echo $psd | sudo -S apt -y install docker.io
"
###################
# 安装最新版本Docker
###################
if [ $? != 0 ]; then
    echo $psd | sudo -S apt-fast update
    # 确保APT能使用https方式工作，并且CA证书已安装了
    echo $psd | sudo -S apt-fast -y install curl apt-transport-https ca-certificates

    : "
    使用官网脚本
    wget -qO- https://get.docker.com/ | sh

    使用DaoCloud脚本
    curl -sSL https://get.daocloud.io/docker | sh
    "
    # 使用阿里云脚本
    curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
fi


: '使用国内镜像加速
注册阿里云
http://www.cnblogs.com/atuotuo/p/6264800.html
'
psd="123zhang"
echo $psd | sudo -S cp -f ./daemon.json /etc/docker/

# 重启守护进程
echo $psd | sudo -S service docker restart