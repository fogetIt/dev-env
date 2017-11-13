#!/bin/bash
# @Date:   2017-11-13 15:34:58
# @Last Modified time: 2017-11-13 18:53:45
: "gitlab latest 汉化版
[github address](https://github.com/twang2218/gitlab-ce-zh)
[阿里云镜像库](https://dev.aliyun.com/search.html)
    lab99/gitlab-ce-zh
"
docker pull registry.cn-hangzhou.aliyuncs.com/lab99/gitlab-ce-zh
# docker run --name gitlab -p 6608:80 -it $IMAGE_ID
docker run --detach \
    --name gitlab \
    --publish 22:22 \  # must
    --publish 80:80 \  # must
    --publish 4436:443 \
    --hostname gitlab.tianxi.com \
    --volume $HOME/softwares/docker_gitlab/conf:/etc/gitlab \
    --volume $HOME/softwares/docker_gitlab/logs:/var/log/gitlab \
    --volume $HOME/softwares/docker_gitlab/data:/var/opt/gitlab \
    --restart=always \
    $IMAGE_ID