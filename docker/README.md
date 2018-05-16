##### Docker系统(一个很小的虚拟机)
+ 快照
    * 记录原始镜像的修改，只能本地运行
+ 镜像
    * 打包后的快照，可以发给别人
+ 简化了安装、配置：复制----运行
- docker 服务端
    + 一个服务进程，管理着所有的容器
- docker 客户端
    + docker服务端的远程控制器，可以用来控制docker的服务端进程
    + 大部分情况下，docker 服务端和客户端运行在一台机器上

通过 nginx 启动 django 算一个服务

##### docker守护进程
- 每个docker实例占用一个进程，每个实例里安装一个服务
- docker 守护进程绑定到一个 Unix socket，默认由 root 所有
- docker 守护进程都是以 root 运行的，其他用户要访问 docker 都需要用 sudo


##### 执行容器内的命令
```bash
docker exec [OPTIONS] <CONTAINER_ID> COMMAND [ARG...]
: "example
docker exec -it <CONTAINER_ID> /opt/gitlab/etc/gitlab.rb.template
"
```


##### [阿里云镜像库](https://dev.aliyun.com/search.html)
