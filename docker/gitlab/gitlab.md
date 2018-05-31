gitlab 汉化版
=============
- [github][address]

[address]: https://github.com/twang2218/gitlab-ce-zh
- latest
```bash
docker pull registry.cn-hangzhou.aliyuncs.com/lab99/gitlab-ce-zh
```

##### 关闭设置了 `--restart=always` 启动的容器
```bash
docker stop gitlab & docker update --restart=no gitlab
```

##### 管理
```bash
vim $HOME/USER_SOFTWARES/docker_gitlab/conf/gitlab.rb

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

##### 添加/修改端口映射
```bash
# 提交一个运行中的容器为镜像
docker commit CONTAINER_ID gitlab:1.0
docker run ...
```
