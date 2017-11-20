##### 关闭设置了--restart=always启动的容器
```shell
sudo docker stop gitlab & sudo docker update --restart=no gitlab
```

##### 管理
```shell
vim $HOME/softwares/docker_gitlab/conf/gitlab.rb

# 重启
sudo docker exec -it CONTAINER_ID gitlab-ctl reconfigure
sudo docker exec -it CONTAINER_ID gitlab-ctl restart

# 备份
sudo docker exec -it CONTAINER_ID gitlab-rake gitlab:backup:create --trace

# 检查
sudo docker exec -it CONTAINER_ID gitlab-rake gitlab:check
sudo docker exec -it CONTAINER_ID gitlab-rake gitlab:env:info

sudo docker stop gitlab
sudo docker start gitlab
```

##### 添加/修改端口映射
```shell
# 提交一个运行中的容器为镜像
sudo docker commit CONTAINER_ID gitlab:1.0
sudo docker run ...
```