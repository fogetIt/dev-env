#!/bin/bash
# @Date:   2017-04-26 13:50:34
# @Last Modified time: 2017-12-26 16:00:10
echo "123" || sudo -S echo "start"

: <<'COMMIT'
# bitnami-gitlab
# https://bitnami.com/redirect/to/87432/bitnami-gitlab-8.2.3-4-linux-installer.run
# https://bitnami.com/redirect/to/137156/bitnami-gitlab-8.14.0-0-linux-x64-installer.run

sudo apt-fast -y install openssh-server
chmod +x ./bitnami-gitlab-8.14.0-0-linux-x64-installer.run
# 默认端口80
./bitnami-gitlab-8.14.0-0-linux-x64-installer.run
/opt/gitlab-8.14.0-0/ctlscript.sh start     # 启动服务端
/opt/gitlab-8.14.0-0/manager-linux-x64.run  # 启动 GUI 管理控制台
COMMIT

# 安装依赖
sudo apt-fast install curl openssh-server ca-certificates postfix
echo "deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu xenial main" | \
    sudo tee /etc/apt/sources.list.d/gitlab-ce.list
sudo apt-fast update
sudo apt-fast -y install gitlab-ce=8.8.0-ce.0 --allow-unauthenticated
sudo gitlab-ctl reconfigure

# gitlab版本号　≈　汉化包版本号
if [ ${1} == "zh" ]; then
    sudo gitlab-ctl stop

    GITLAB=/tmp/gitlab
    # git clone https://gitlab.com/larryli/gitlab.git ${GITLAB} \
    git clone https://git.coding.net/larryli/gitlab.git ${GITLAB} \
    && echo "生成汉化补丁" \
    && cd ${GITLAB} && git diff origin/8-8-stable origin/8-8-zh > ../zh_CN.diff \
    && echo "应用汉化补丁" \
    && sudo patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < ../zh_CN.diff \
    && echo "清理" \
    && cd .. && rm -rf ${GITLAB} zh_CN.diff

    sudo gitlab-ctl start
fi

if [ ${1} == "del" ]; then
    sudo gitlab-ctl stop
    sudo gitlab-ctl uninstall
    # uninstall
    sudo dpkg -r gitlab-ce
    sudo apt-get remove gitlab
    sudo apt-get remove gitlab-ce
    sudo apt-get purge gitlab
    sudo apt-get purge --auto-remove gitlab
    sudo apt-get remove --auto-remove gitlab
    echo "Y" | sudo apt autoremove gitlab-ce
    # clean
    sudo rm -rf /etc/gitlab
    sudo rm -rf /opt/gitlab
    sudo rm -rf /etc/apt/sources.list.d/gitlab*
fi
