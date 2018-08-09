#!/bin/bash
echo "12345" | sudo -S echo "start"
set -e

if ! docker -v; then
    # Add Docker repository key to APT keychain
    # curl -O https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    cat gpg | sudo apt-key add -
: <<'COMMIT'
    # Update where APT will search for Docker Packages
    SOURCE="https://download.docker.com/linux/ubuntu"
    source /etc/lsb-release
    echo "deb [arch=amd64] ${SOURCE} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/docker.list
COMMIT
    SOURCE="https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu"
    sudo add-apt-repository "deb [arch=amd64] ${SOURCE} $(lsb_release) -cs stable"
    # 安装证书，确保 apt 能使用 https
    sudo apt -y install ca-certificates apt-transport-https
    set +e
    sudo apt update
    set -e
    # Verifies APT is pulling from the correct Repository
    sudo apt-cache policy docker-ce
    # Install kernel packages which allows us to use aufs storage driver if V14 (trusty/utopic)
    sudo apt -y install docker-ce
fi

sudo pip install docker-compose

if ! docker-machine --version; then
    base=https://github.com/docker/machine/releases/download/v0.14.0
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
    sudo install /tmp/docker-machine /usr/local/bin/docker-machine
fi

echo -n 'Docker:         '
docker --version
echo -n 'Docker Compose: '
docker-compose --version
echo -n 'Docker Machine: '
docker-machine --version


: <<'COMMENT'
注册阿里云，使用国内镜像加速
registry-mirrors
http://hub-mirror.c.163.com
https://docker.mirrors.ustc.edu.cn
https://e92apzsu.mirror.aliyuncs.com
COMMENT
[[ -d /etc/docker ]] || sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://bsy887ib.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
# sudo service docker restart
sudo systemctl restart docker
if ! docker ps -q; then
    echo "添加用户到 docker 组，避免输入 sudo"
    sudo usermod -aG docker $(whoami)
    echo "重新登录使 docker 组新用户生效"
    exit 0
fi

