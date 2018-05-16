# gitlab 汉化版
# image TAG -> 8.8.6-ce.1
# docker pull registry.cn-hangzhou.aliyuncs.com/lab99/gitlab-ce-zh
FROM gitlab/gitlab-ce:8.8.6-ce.1
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

# Dockerfile 只能有一条 CMD 命令
# 如果指定了多条命令，只有最后一条会被执行
