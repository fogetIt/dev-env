docker
=======
- 简化了安装、配置：复制 -> 运行
- 容器内没有后台服务的概念，应用都应该前台执行
    - Docker 不是虚拟机，不用 upstart/systemd 去启动后台服务

:快照: 记录原始镜像的修改，只能本地运行
:镜像: 打包后的快照，可以发给别人
:client: 控制器，转发用户命令（docker pull, docker run）给守护进程
:demaon: 守护进程，接收执行命令，返回命令执行结果，管理宿机上所有的容器

docker 守护进程
-----------------
- 每个 docker 实例占用一个进程，每个实例里安装一个服务
    - 通过 nginx 启动 django 算一个服务
- docker 守护进程绑定到一个 Unix socket，默认由 root 所有
    - 其他用户要访问 docker 都需要用 sudo


`阿里云镜像库 <https://dev.aliyun.com/search.html>`_


Linux 宿主镜像
-------------------
- 专门为容器设计的 Linux 发行版(轻量、可移植):

.. code-block:: bash

    docker search linux
    #: Ubuntu
    #: Alpine
    #: CoreOS
    #: Project Atomic
    #: Ubuntu Snappy
    #: RancherOS
    #: VMware-Photon


docker-machine
===============