# 自动安装gitlab8.8.6
: "
# 生成一个TAG为8.8.6-ce.1的image
# 生成一个TAG为<none>的image
sudo docker build --build-arg -f .
sudo docker images
"
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