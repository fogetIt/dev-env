# gitlab 汉化版
# image TAG -> 8.8.6-ce.1
# docker pull registry.cn-hangzhou.aliyuncs.com/lab99/gitlab-ce-zh
FROM twang2218/gitlab-ce-zh:latest

# Dockerfile 只能有一条 CMD 命令
# 如果指定了多条命令，只有最后一条会被执行
CMD ["twang2218/gitlab-ce-zh:latest", "--detach", "--name gitlab-latest", "--publish 8001:80", "--publish 2222:22", "--publish 4433:443", "--hostname gitlab.tianxi.com", "--volume $HOME/softwares/docker/gitlab/conf:/etc/gitlab", "--volume $HOME/softwares/docker/gitlab/logs:/var/log/gitlab", "--volume $HOME/softwares/docker/gitlab/data:/var/opt/gitlab", "--restart=always"]
