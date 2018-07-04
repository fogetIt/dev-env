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
    if [[ ${CODENAME} == "bionic" ]]; then
        sudo apt install docker.io -y
    else
        # curl -O https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        # Add Docker repository key to APT keychain
        cat gpg | sudo apt-key add -
        # Update where APT will search for Docker Packages
        echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${CODENAME} stable" | \
            sudo tee /etc/apt/sources.list.d/docker.list
        sudo apt -y install ca-certificates      #: 安装证书
        sudo apt -y install apt-transport-https  #: 确保 apt 能使用 https
        # Verifies APT is pulling from the correct Repository
        sudo apt-cache policy docker-ce
        # Install kernel packages which allows us to use aufs storage driver if V14 (trusty/utopic)
        sudo apt -y install docker-ce
    fi
fi

if [[ ${CODENAME} == "bionic" ]]; then
    pip install backports.ssl_match_hostname
fi
sudo pip install docker-compose==1.21.2

if ! docker-machine --version; then
    base=https://github.com/docker/machine/releases/download/v0.14.0 && \
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && \
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

