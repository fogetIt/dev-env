#!/bin/bash
# @Date:   2017-04-26 13:50:34
# @Last Modified time: 2017-07-06 14:38:23
#
psd="123zhang"

echo $psd | sudo -S gitlab-ctl status
if [ $? != 0 ]; then
    # 安装依赖
    echo $psd | sudo -S \
        apt-fast install curl openssh-server ca-certificates postfix

    # 添加GitLab到apt仓库
    # curl -sS http://packages.gitlab.cc/install/gitlab-ce/script.deb.sh | sudo bash
    curl https://packages.gitlab.com/gpg.key 2> /dev/null | sudo apt-key add - &>/dev/null

    # 安装gitlab（版本号　≈　汉化包最新版本号）
    echo $psd | sudo -S \
        apt-fast update
    echo $psd | sudo -S \
        apt-fast -y install gitlab-ce=8.8.0-ce.0 --allow-unauthenticated

    # 加载配置
    echo $psd | sudo -S gitlab-ctl reconfigure
fi

: '低版本（8.9以下）需要手动添加apt源
su root
echo "deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu xenial main" > /etc/apt/sources.list.d/gitlab-ce.list
'

# 给脚本传参
hanization=$1
if [ $hanization == "zh" ]
    # 下载汉化包
    cd ~/softwares
    # echo "y" | git clone https://gitlab.com/larryli/gitlab.git
    echo "y" | git clone https://git.coding.net/larryli/gitlab.git

    # 生成标准patch
    cd gitlab
    git diff origin/8-8-stable origin/8-8-zh > /tmp/8.8.diff

    if [ $? == 0 ]; then
        # 关闭gitlab
        echo $psd | sudo -S \
            gitlab-ctl stop
        if [ $? == 0 ]; then
            # 应用汉化patch
            # cd /opt/gitlab/embedded/service/gitlab-rails && git apply /tmp/8.8.diff
            echo $psd | sudo -S \
                patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < /tmp/8.8.diff
        fi
        # 启动gitlab
        echo $psd | sudo -S \
            gitlab-ctl start
    fi

    cd ..
    rm -rf gitlab
    rm -rf /tmp/*.diff
fi