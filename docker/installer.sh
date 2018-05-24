#!/bin/bash
echo "zj12315" | sudo -S echo "start"

# Array of supported versions
# declare -a versions=('trusty' 'xenial' 'yakkety');

if [ -z "$1" ]; then
    source /etc/lsb-release || (
        echo "Error: Release information not found"
        exit 1
    )
    CODENAME=${DISTRIB_CODENAME}
else
    CODENAME=${1}
fi

if ! docker -v; then
    # curl -O https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Add Docker repository key to APT keychain
    cat gpg | sudo apt-key add -
    # Update where APT will search for Docker Packages
    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${CODENAME} stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list
    sudo apt-fast -y install ca-certificates      #: 安装证书
    sudo apt-fast -y install apt-transport-https  #: 确保 apt 能使用 https
    # Verifies APT is pulling from the correct Repository
    sudo apt-cache policy docker-ce
    # Install kernel packages which allows us to use aufs storage driver if V14 (trusty/utopic)
    if [ "${CODENAME}" == "trusty" ]; then
        sudo apt-fast -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
    fi
    if [[ "${CODENAME}" == "bionic" ]]; then
        # ubuntu18.04 暂时（2018.5.24）无法安装最新版
        sudo apt-fast update
        sudo apt-fast -y install docker.io
    else
        sudo apt-fast -y install docker-ce
    fi
fi


if [[ "${CODENAME}" == "bionic" ]]; then
    curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` \
    -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
else
    docker-compose --version || sudo pip install docker-compose==1.13.0
fi

echo 'Installation completed, versions installed are:'
echo ''
echo -n 'Docker:         '
docker --version
echo -n 'Docker Compose: '
docker-compose --version


: <<'COMMENT'
注册阿里云，使用国内镜像加速
{
    "registry-mirrors": [
        "https://e92apzsu.mirror.aliyuncs.com",
        "https://docker.mirrors.ustc.edu.cn",
        "http://hub-mirror.c.163.com"
    ]
}
COMMENT
[[ -d /etc/docker ]] || sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://bsy887ib.mirror.aliyuncs.com"]
}
EOF
# sudo service docker restart
sudo systemctl daemon-reload
sudo systemctl restart docker


: <<'COMMENT'
# 将用户添加到 docker 组（安装时自动创建），避免输入 sudo
# 该操作需要重新登录才能生效
COMMENT
sudo usermod -aG docker $(whoami)
