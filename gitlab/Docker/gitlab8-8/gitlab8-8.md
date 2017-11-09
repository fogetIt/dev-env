##### 根据Dockerfile自动安装gitlab
```shell
# 生成一个TAG为8.8.6-ce.1的image
# 生成一个TAG为<none>的image
docker build --build-arg -f .
docker images
```

##### 关闭设置了--restart=always启动的容器
```shell
docker stop gitlab & docker update --restart=no gitlab
```

##### 初始化脚本
```shell
#!/bin/bash
docker run --detach \
    --hostname gitlab.test.com \
    --publish 4436:443 --publish 8066:80 --publish 2266:22 \
    --name gitlab \
    --volume $HOME/softwares/docker_gitlab/conf:/etc/gitlab \
    --volume $HOME/softwares/docker_gitlab/logs:/var/log/gitlab \
    --volume $HOME/softwares/docker_gitlab/data:/var/opt/gitlab \
    IMAGE_ID
```


##### 管理
```shell
vim $HOME/softwares/docker_gitlab/conf/gitlab.rb

# 重启
docker exec -it CONTAINER_ID gitlab-ctl reconfigure
docker exec -it CONTAINER_ID gitlab-ctl restart

# 备份
docker exec -it CONTAINER_ID gitlab-rake gitlab:backup:create --trace

# 检查
docker exec -it CONTAINER_ID gitlab-rake gitlab:check
docker exec -it CONTAINER_ID gitlab-rake gitlab:env:info

docker stop gitlab
docker start gitlab
```


### docker安装汉化版gitlab
- [dockerHub](https://github.com/twang2218/gitlab-ce-zh)

```shell
docker search gitlab
# gitlab latest
# aliyun----lab99/gitlab-ce-zh
docker pull registry.cn-hangzhou.aliyuncs.com/lab99/gitlab-ce-zh
docker run --name gitlab -p 6608:80 -it IMAGE_ID
```

[阿里云镜像库](https://dev.aliyun.com/search.html)