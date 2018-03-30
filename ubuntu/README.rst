mongodb
-------
    :配置文件: /etc/mongodb.conf

        .. code-block:: ini

            bind_ip = 0.0.0.0  # 允许外部访问
    :命令:
        .. code-block:: bash

            mongo                       #: 交互式
            sudo service mongodb stop   #: 重启
            sudo service mongodb start


shells
------
    :配置文件: /etc/shells
    :切换:
        .. code-block:: bash

            chsh -s $(which bash)
            chsh -s $(which sh)


系统管理
-------
    :conky:            在桌面显示系统信息
    :docky:            系统启动器
    :unity-tweak-tool: 系统管理工具


配置
----
    :zsh:      :~/.zshrc: ``ZSH_THEME='random'``
    :mysql:    :/etc/mysql/my.cnf:
    :apt-fast: :/etc/apt-fast.conf:


下载
----
    :wget: 单线程
    :axel: 多线程
    :uget: 多线程 + GUI

        - 编辑-->设置-->插件-->aria2/curl


jetbrains
---------
    .. code-block:: bash

        nohup pycharm>~/jetbrains.log 2>&1 &

其它
---
    - FastoRedis
