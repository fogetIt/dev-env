docker
=======
- 简化了安装、配置：复制 -> 运行
- 容器内没有后台服务的概念，应用都应该前台执行
    - Docker 不是虚拟机，不用 upstart/systemd 去启动后台服务

:默认版本: sudo apt-fast -y install docker.io
:最新版本: `参考 <./install.sh>`_
:宿主镜像: 专门为容器设计的 Linux 发行版(轻量、可移植)

    .. code-block:: bash

        docker search linux
        #: Ubuntu
        #: Alpine
        #: CoreOS
        #: Project Atomic
        #: Ubuntu Snappy
        #: RancherOS
        #: VMware-Photon
:快照: 记录原始镜像的修改，只能本地运行
:镜像: 打包后的快照，可以发给别人
:client: 控制器，转发用户命令（docker pull, docker run）给守护进程
:demaon: 守护进程，接收执行命令，返回命令执行结果，管理宿机上所有的容器
:守护进程:
    - 每个 docker 实例占用一个进程，每个实例里安装一个服务
        - 通过 nginx 启动 django 算一个服务
    - docker 守护进程绑定到一个 Unix socket，默认由 root 所有
        - 其他用户要访问 docker 都需要用 sudo

- `阿里云镜像库 <https://dev.aliyun.com/search.html>`_

:Dockerfile:
    :RUN: 拉取镜像之后，启动容器之前运行，生成目标镜像（可以有多个）
    :CMD: 只能有一条 CMD 命令，如果指定了多条命令，只有最后一条会被执行


docker-composer
================
.. code-block:: bash

    # python pip error
    sudo rm -rf /usr/lib/python2.7/dist-packages/OpenSSL
    sudo rm -rf /usr/lib/python2.7/dist-packages/pyOpenSSL-0.15.1.egg-info
    sudo pip install pyopenssl


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
