Linux 宿主镜像
-------------------
专门为容器设计的 Linux 发行版(轻量、可移植):

.. code-block:: bash

    docker search linux

::

    Ubuntu、Alpine、CoreOS、Project Atomic、Ubuntu Snappy、RancherOS、VMware-Photon


命令
--------
.. code-block:: bash
    
    docker search <MIRROR_NAME>       #: 搜索可用镜像
    docker pull <MIRROR_ADDR>         #: 拉取镜像
    docker build <PATH>               #: 构建镜像（. 当前目录下）
    docker images                     #: 查看本地镜像
    docker rmi <IMAGE_ID>             #: 删除本地镜像
    docker run <IMAGE_ID>             #: 初始化运行容器（ IMAGE_ID 放最后，生成 CONTAINER ）
    docker ps                         #: 查看容器（当前运行）
    docker stop <CONTAINER_NAME/ID>   #: 关闭容器
    docker start <CONTAINER_NAME/ID>  #: 启动容器
    docker rm <CONTAINER_NAME/ID>     #: 删除容器
    docker kill <CONTAINER_NAME/ID>   #: 强制关闭容器


images
"""""""
-q  只显示镜像 ID


run
""""
-p <PORT:CONTAINER_PORT>  端口映射
--publish
-v <DIR:CONTAINER_DIR>    目录映射
--volume
-d                        守护进程
--detach
-i                        标准输入给容器
--interactive
-t                        分配一个虚拟终端
--tty
--name <CONTAINER_NAME>   指定容器名称
--rm                      退出时删除容器
--restart=always          自动重启
--restart=no              不自动重启



ps
"""
-a        查看所有容器（包括停止状态）
--all
-l        查看最新创建的容器
--latest
-n <NUM>  查看最后创建的 n 个容器
--last
-q        只显示容器 ID
--quiet


search
"""""""
--no-trunc  完整显示描述信息


build
""""""

-f <FILE_NAME>  指定文件名 （默认 Dockerfile ）
--file
-t <NAME:TAG>   指定镜像的名字及 tag
--tag
