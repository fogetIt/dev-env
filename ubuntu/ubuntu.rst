sudo
----
    -S  read password from stdout


apt
----
    - `默认源 </etc/apt/sources.list>`_
    - P(ersonal )P(ackage )A(rchives)
    .. code-block:: bash

        sudo apt-cache search xxx           # 搜索 ubuntu 库
        sudo apt-get update                 # 更新下载源
        sudo add-apt-repository -y ppa:xxx  # 添加个人软件包集

        sudo apt-get install xxx   # 安装
        sudo apt-get upgrade       # 更新已安装软件
        sudo apt-get dist-upgrade  # 更新系统版本

        sudo apt-get remove xxx    # 卸载
        sudo apt-get autoclean
        sudo apt-get autoremove    # 自动卸载依赖
        # -y                       自动回车确认
        # --allow-unauthenticated  允许未认证的软件包，使用-y选项安装ppa时，必须加上

dpkg
----
    .. code-block:: bash

        sudo dpkg -i xxx           # 安装
        sudo dpkg --configure -a   # 打断安装
        sudo dpkg -l | grep xxx    # 查询相关deb包信息
        sudo dpkg -P xxx           # 彻底卸载
        sudo dpkg --purge xxx


搜索无效的图标
------------
    .. code-block:: bash

        find ~/.local/ | xargs grep -ri "xxx"
        find ~/.local/ | xargs grep -ri "xxx" -l
        find ~/.local/ -name "xxx"
