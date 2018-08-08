docker
=======
- 简化了安装、配置：复制 -> 运行
- 容器内没有后台服务的概念，应用都应该前台执行
    - Docker 不是虚拟机，不用 upstart/systemd 去启动后台服务

:默认版: docker.io
:最新版: `docker-ce <./install.sh>`_

- `阿里云镜像库 <https://dev.aliyun.com/search.html>`_

:宿主镜像: 专门为容器设计的 Linux 发行版(轻量、可移植)

    - Ubuntu
    - Alpine
    - CoreOS
    - Project Atomic
    - Ubuntu Snappy
    - RancherOS
    - VMware-Photon

:快照: 记录原始镜像的修改，只能本地运行
:镜像: 打包后的快照，可以发给别人
:查看 client 和 server 版本: docker version
:client: docker cli

    - 转发用户命令 (docker pull/run/ps) 给守护进程
    - 默认由 root 所有，其他用户需要用 sudo 访问

:server: docker daemon

    - daemon 绑定到一个 socket ，接受 client 的请求
    - 接收执行命令，返回命令执行结果，管理宿机上所有的容器
    - 每个 docker 实例占用一个进程，每个实例里安装一个服务
    - 通过 docker –d(--daemon=true; –d=true)启动守护进程

:Dockerfile:

    :RUN: 拉取镜像之后，启动容器之前运行，生成目标镜像（可以有多个）
    :CMD: 只能有一条 CMD 命令，如果指定了多条命令，只有最后一条会被执行
    :ARG: After docker 17.05.0-ce, ARG before FROM in Dockerfile is allowed.


docker-compose
================
.. code-block:: bash

    docker-compose -f xxx.yaml build
    # up 会根据需要自动进行 build
    docker-compose -f xxx.yaml up -d
    docker-compose -f xxx.yaml down
    docker-compose -f xxx.yaml rm -f
    # 交互式
    # stdin_open: true  # 对应 docker -i
    # tty: true         # 对应 docker -t


docker-machine
===============
.. code-block:: bash

    docker-machine ls

    # 查看支持的虚拟机驱动
    docker-machine create --driver
    # 使用驱动创建虚拟主机（本机/远程）并安装 docker
    docker-machine create --driver virtualbox default

    docker-machine env [xxx]           # 查看虚拟主机环境变量
    eval "$(docker-machine env [xxx])" # 本机 docker 客户端与虚拟主机通信
    docker-machine ssh [xxx]           # 进入虚拟主机

    docker-machine stop [xxx]
    docker-machine start [xxx]
    docker-machine restart [xxx]
    docker-machine config [xxx]
    docker-machine inspect [xxx]
    docker-machine ip [xxx]
    docker-machine kill [xxx]
    docker-machine provision [xxx]
    docker-machine regenerate-certs [xxx]
    docker-machine status [xxx]
    docker-machine upgrade [xxx]
    docker-machine url [xxx]


docker swarm
=============
.. code-block:: bash

    # init vboxnet0
    # 建立集群
    docker swarm init --advertise-addr xx.xx.xx.xx:2377
    # 把当前节点加入集群
    docker-machine ssh manager 'docker swarm join --token ...'
    # 从集群删除当前节点
    docker-machine ssh worker1 'docker swarm leave --force'

    # 节点操作
    docker node ls
    docker node demote xxx
    docker node rm xxx

    # 容器操作

    # 使用 docker-compose v3 deploy 部署
    # -c/--compose-file xxx.yaml
    # --orchestrator swarm/kubernetes/all
    # --with-registry-auth                  向 swarm 代理发送注册表（registry）认证详细信息（用于私有仓库）
    # --resolve-image always/changed/never  查询注册表以解决​​镜像摘要和支持的平台（默认 always）
    docker stack deploy -c xxx.yaml xx

    # 容器查看
    docker service ls
    # Preparing 一个容器如果没有外部通信但又是运行中的状态

    # 容器副本： --replicas n
    # 当其中某一个或几个节点宕机后， cluster 会根据自己的服务注册发现机制，以及之前的设定，在集群中剩余的空闲节点上，重新拉起容器副本
    # 整个副本迁移的过程无需人工干预，迁移后原本的集群的 load balance 依旧好使