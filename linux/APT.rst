A(dvanced )P(ackaging )T(ool)
=============================
- Debian 包系统管理工具
- `默认安装源 </etc/apt/sources.list>`_
- :P(ersonal )P(ackage )A(rchives): 个人软件包

    -y                       自动回车确认
    --allow-unauthenticated  允许未认证的包


APT 的低级命令行工具
-----------------------------
:apt-get:
    .. code-block:: bash

        apt-get install xxx   #: 安装
        apt-get remove xxx    #: 卸载
        apt-get purge xxx	  #: 卸载并移除配置文件
        apt-get upgrade       #: 升级所有
        apt-get update        #: 更新下载源
        apt-get dist-upgrade  #: 更新系统版本
        apt-get autoremove    #: 自动卸载依赖
        apt-get autoclean
        add-apt-repository -y ppa:xxx  # 添加个人软件包集

:apt-cache:
    .. code-block:: bash

        apt-cache search xxx  # 搜索
        apt-cache show xxx	  # 显示细节


apt 命令行工具
-------------------
- apt-get/apt-cache/apt-config 中最常用命令集合（不完全向下兼容）
- apt 命令选项更少，更精减但足够，更易记也更易用
- 安装或删除程序时可以看到进度条
- 在更新存储库数据库时提示用户可升级的软件包个数

:扩展:
    ================  ===============================
    apt list	        列出包含条件的包（已安装/可升级等）
    apt edit-sources	编辑源列表
    ================  ===============================


apt-fast
----------
- 加速 apt-get, apt
- `配置文件 </etc/apt-fast.conf>`_