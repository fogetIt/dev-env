#!/bin/bash
if [[ ${1} ]]; then
    VM=${1}
else
    VM=default
fi
# docker-machine ssh ${VM} > /dev/null 2>&1 << eeooff
docker-machine ssh ${VM} << eeooff
[[ -d /etc/docker ]] || sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://bsy887ib.mirror.aliyuncs.com"]
}
EOF
exit
eeooff