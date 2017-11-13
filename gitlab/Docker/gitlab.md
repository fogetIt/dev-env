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
