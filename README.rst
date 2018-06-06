sudo
----
-S  read password from stdout

dpkg
----
.. code-block:: bash

    sudo dpkg -i xxx           # 安装 .deb 包
    sudo dpkg --configure -a   # 打断安装
    sudo dpkg -l | grep xxx    # 查询相关包信息
    sudo dpkg -P xxx           # 彻底卸载
    sudo dpkg --purge xxx

mongodb
-------

:配置文件: /etc/mongodb.conf

    .. code-block:: ini

        # 允许外部访问
        bind_ip = 0.0.0.0
:命令:
    .. code-block:: bash

        sudo service mongodb stop
        sudo service mongodb start
        sudo service mongodb restart
        mongo #: 交互式


搜索无效的图标
------------
.. code-block:: bash

    find ~/.local/ | xargs grep -ri "xxx"
    find ~/.local/ | xargs grep -ri "xxx" -l
    find ~/.local/ -name "xxx"


重启网卡
-------------
.. code-block:: bash

    sudo ifconfig enp5s0 down
    sudo ifconfig enp5s0 up


其它
----

:gedit:      文本编辑器
:VLC:        多媒体播放器
:draw.io:    流程图编辑器
:VMTools:    虚拟机与实体机之间文件拖动
:FastoRedis: redis GUI
:wechat:     `electronic wechat <https://github.com/geeeeeeeeek/electronic-wechat.git>`_
:桌面:

    :xubuntu-desktop:
    :kubuntu-desktop:

:下载:

    :wget: 单线程
    :axel: 多线程
    :uget: 多线程 + GUI （编辑-->设置-->插件-->aria2/curl）

:zsh:

    :~/.zshrc:

        .. code-block:: bash

            # ZSH_THEME='random'
            ZSH_THEME='af-magic'
            ZSH_THEME='powerline'

    - ``编辑 -> 配置文件首选项``

:mysql:    ``/etc/mysql/my.cnf``
:apt-fast: ``/etc/apt-fast.conf``


python tools
-------------
.. code-block:: bash

    # --system-site-packages 继承系统包目录
    # --no-site-packages     不继承系统包目录
    virtualenv xxx/xxx --no-site-packages -p $(which python3)

    # ipython broswer tool
    sudo apt install -y ipython-notebook
    sudo apt install -y ipython3-notebook


interfaces
-----------
::

    # /etc/network/interfaces
    # interfaces(5) file used by ifup(8) and ifdown(8)
    auto lo
    iface lo inet loopback

    # set static IP
    auto enp5s0
    iface enp5s0 inet static
    address 10.168.120.121
    gateway 10.168.120.254 # must 254
    netmask 255.255.255.0

    # set second static IP(virtual IP)
    auto enp5s0:1
    iface enp5s0:1 inet static
    address 10.168.120.122
    gateway 10.168.120.254 # must 254
    netmask 255.255.255.0

    broadcast 10.168.120.255
    dns-nameservers 202.106.0.20 8.8.8.8 219.141.140.10 219.141.136.10
