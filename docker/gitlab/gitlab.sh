#!/bin/bash
# @Date:   2017-11-13 15:34:58
# @Last Modified time: 2018-01-10 13:22:39
: "gitlab latest 汉化版
[github address](https://github.com/twang2218/gitlab-ce-zh)
[阿里云镜像库](https://dev.aliyun.com/search.html)
    lab99/gitlab-ce-zh
"
docker pull registry.cn-hangzhou.aliyuncs.com/lab99/gitlab-ce-zh
# docker run --name gitlab -p 6608:80 -it $IMAGE_ID
docker run \
    --detach \
    --name gitlab \
    --publish 8001:80 \  # must
    --publish 2222:22 \  # 需要配置.ssh/config
    --publish 4433:443 \
    --hostname gitlab.tianxi.com \
    --volume $HOME/softwares/docker/gitlab/conf:/etc/gitlab \
    --volume $HOME/softwares/docker/gitlab/logs:/var/log/gitlab \
    --volume $HOME/softwares/docker/gitlab/data:/var/opt/gitlab \
    --restart=always \
    $IMAGE_ID