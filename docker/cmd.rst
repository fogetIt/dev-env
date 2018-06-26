命令
--------
::

    docker search [OPTIONS] TERM             #: 搜索可用镜像
    docker pull [OPTIONS] NAME[:TAG|@DIGEST] #: 拉取镜像
    docker build [OPTIONS] PATH | URL | -    #: 构建镜像
                                             # . 代表当前目录下

    # IMAGE == IMAGE ID
    docker images [OPTIONS] [REPOSITORY[:TAG]]    #: 查看镜像
    docker rmi [OPTIONS] IMAGE [IMAGE...]         #: 删除本地镜像
    docker run [OPTIONS] IMAGE [COMMAND] [ARG...] #: 初始化运行容器，生成 CONTAINER

    # CONTAINER == CONTAINER NAME/ID
    docker ps [OPTIONS]       #: 查看容器（正在运行）
    docker start [OPTIONS] CONTAINER [CONTAINER...]   #: 启动容器
    docker stop [OPTIONS] CONTAINER [CONTAINER...]    #: 关闭容器
    docker kill [OPTIONS] CONTAINER [CONTAINER...]    #: 强制关闭容器
    docker restart [OPTIONS] CONTAINER [CONTAINER...] #: 重启容器
    docker rm [OPTIONS] CONTAINER [CONTAINER...]      #: 删除容器
    docker logs [OPTIONS] CONTAINER                   #: 查看容器日志
    docker exec [OPTIONS] CONTAINER COMMAND [ARG...]  #: 执行容器内的命令


images
"""""""
-q  只显示镜像 ID


run
""""
-p    端口映射（--publish OUT_PORT:PORT）
-v    目录映射（--volume OUT_DIR:DIR）
-d    后台运行，并守护进程（--detach）
-i    标准输入给容器（--interactive）
-t    分配一个虚拟终端（--tty）
-u    指定运行容器的用户（--user USER）
--rm  退出时删除容器
--name NAME       指定容器名称
--restart=always  自动重启（always/no）



ps
"""
-a  查看所有容器，包括停止状态（--all）
-l  查看最新创建的容器（--latest）
-n  查看最后创建的 n 个容器（--last NUM）
-q  只显示容器 ID（--quiet）


search
"""""""
--no-trunc  完整显示描述信息


build
""""""
-f  指定文件名，默认 Dockerfile （--file FILE_NAME）
-t  指定镜像的名字及 tag （--tag NAME:TAG）



删除
=======
.. code-block:: bash

    # 清除所有容器
    docker stop $(docker ps -q)
    docker rm $(docker ps -aq)
    # 清除所有镜像
    docker rmi $(docker images -q)
