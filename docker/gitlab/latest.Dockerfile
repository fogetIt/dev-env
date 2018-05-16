# gitlab 汉化版
#
# docker build --build-arg -f .  #: image TAG -> 8.8.6-ce.1
#
# FROM gitlab/gitlab-ce:8.8.6-ce.1
# docker pull registry.cn-hangzhou.aliyuncs.com/lab99/gitlab-ce-zh
FROM twang2218/gitlab-ce-zh:latest
MAINTAINER Tao Wang <twang2218@gmail.com>

RUN echo "" \
    && echo "# git clone https://git.coding.net/larryli/gitlab.git" \
    && git clone https://git.coding.net/larryli/gitlab.git \
    && echo "# Generating translation patch" \
    && cd gitlab \
    && git diff origin/8-8-stable origin/8-8-zh > ../zh_CN.diff \
    && echo "# Patching" \
    && patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < ../zh_CN.diff \
    && echo "# Cleaning" \
    && cd .. \
    && rm -rf gitlab \
    && rm *.diff


CMD ''
# docker run \
#     --detach \
#     --name gitlab-latest \
#     --publish 8001:80 \
#     --publish 2222:22 \
#     --publish 4433:443 \
#     --hostname gitlab.tianxi.com \
#     --volume $HOME/softwares/docker/gitlab/conf:/etc/gitlab \
#     --volume $HOME/softwares/docker/gitlab/logs:/var/log/gitlab \
#     --volume $HOME/softwares/docker/gitlab/data:/var/opt/gitlab \
#     --restart=always \
#     twang2218/gitlab-ce-zh:latest
