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
- 将用户添加到 docker 组（安装时自动创建），避免输入 sudo
    + sudo usermod -aG docker zdd
    + 该操作需要重新登录才能生效

##### install docker
- 安装默认版本 docker
    ```shell
    # docker -v
    sudo apt -y install docker.io
    ```
- 安装最新版本 docker
    ```shell
    sudo apt-fast update
    # 确保APT能使用https方式工作，并且CA证书已安装了
    sudo apt-fast -y install curl apt-transport-https ca-certificates
    # 使用官网脚本/DaoCloud 脚本/阿里云脚本
    wget -qO- https://get.docker.com/ | sh
    curl -sSL https://get.daocloud.io/docker | sh
    curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh
    ```

##### 使用国内镜像加速
- [注册阿里云](http://www.cnblogs.com/atuotuo/p/6264800.html)
    ```shell
    sudo cp -f ./daemon.json /etc/docker/
    ```
- 重启守护进程
    ```shell
    sudo service docker restart
    ```


##### 搜索
```shell
# 搜索可用的镜像(宿主、程序)
sudo docker search <MIRROR_NAME>
: "参数
[--no-trunc]    完整显示描述信息
example
    docker search gitlab
    docker search linux
Linux宿主镜像----专门为容器设计的Linux发行版(轻量和可移植)
Ubuntu、Alpine Linux、CoreOS、Project Atomic、Ubuntu Snappy、RancherOS、VMware-Photon
"
```

##### 下载
```shell
docker pull <MIRROR_ADDR>  # 拉取镜像
docker images              # 查看本地下载的镜像
docker rmi <IMAGE_ID>      # 删除镜像
```

##### 构建
```shell
docker build -f .
: '
-f .                        Dockerfile在当前目录下
-f /path/to/a/Dockerfile    指定Dockerfile目录
-t="lab99/gitlab-ce-zh:v8.8"
'
```

##### 运行
```shell
# 初始化----生成<CONTAINER_ID>
docker run [...] <IMAGE_ID>
: "参数
-p[--publish] linux_port:port    端口映射
-v[--volume]                     映射目录到宿主机
--name ***                       指定容器名称
-i                               标准输入给容器
-t                               分配一个虚拟终端
--rm                             退出时删除容器
-d                               守护进程
--restart=always/no              自动重启
IMAGE ID                         放最后
"
```

##### 管理容器
```shell
# 查看当前正在运行的容器
docker ps
: "参数
-a     查看所有(包括停止状态的)容器
-l     查看最新创建的容器
-n=x   查看最后创建的x个容器
"

# 关闭docker容器
docker stop <NAMES>/<CONTAINER_ID>
# 强制关闭docker容器
docker kill <NAMES>/<CONTAINER_ID>

# 启动docker容器
docker start <NAMES>/<CONTAINER_ID>

# 删除docker容器
docker rm <NAMES>
```

##### 执行容器内的命令
```shell
docker exec [OPTIONS] <CONTAINER_ID> COMMAND [ARG...]
: "example
docker exec -it <CONTAINER_ID> /opt/gitlab/etc/gitlab.rb.template
"
```