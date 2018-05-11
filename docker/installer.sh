#!/bin/bash
if docker -v; then; else;
    # Add Docker repository key to APT keychain
    cat gpg | sudo apt-key add -
    # Update where APT will search for Docker Packages
    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${CODENAME} stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list

    # Ensure that CA certificates are installed
    sudo apt-fast -y install apt-transport-https ca-certificates
    # Verifies APT is pulling from the correct Repository
    sudo apt-cache policy docker-ce
    # Install kernel packages which allows us to use aufs storage driver if V14 (trusty/utopic)
    if [ "${CODENAME}" == "trusty" ]; then
        sudo apt-fast -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
    fi
    # Install Docker
    sudo apt-fast -y install docker-ce
    # Add user account to the docker group
    sudo usermod -aG docker $(whoami)
fi

docker-compose --version || sudo pip install docker-compose==1.13.0

echo 'Installation completed, versions installed are:'
echo ''
echo -n 'Docker:         '
docker --version
echo -n 'Docker Compose: '
docker-compose --version


: <<'COMMENT'
注册阿里云，使用国内镜像加速
http://www.cnblogs.com/atuotuo/p/6264800.html
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
