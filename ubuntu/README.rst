sudo
----
    -S  read password from stdout


apt
----
    - `默认安装源 </etc/apt/sources.list>`_
    :个人软件包: P(ersonal )P(ackage )A(rchives)
    -y                       自动回车确认
    --allow-unauthenticated  允许未认证的包
    .. code-block:: bash

        sudo apt-cache search xxx           # 搜索包
        sudo apt-get update                 # 更新下载源
        sudo add-apt-repository -y ppa:xxx  # 添加个人软件包集

        sudo apt-get install xxx   # 安装
        sudo apt-get upgrade       # 更新已安装软件
        sudo apt-get dist-upgrade  # 更新系统版本

        sudo apt-get remove xxx    # 卸载
        sudo apt-get autoclean
        sudo apt-get autoremove    # 自动卸载依赖

dpkg
----
    - 手动安装 .deb 包，根据反馈，解决依赖
    .. code-block:: bash

        sudo dpkg -i xxx           # 安装
        sudo dpkg --configure -a   # 打断安装
        sudo dpkg -l | grep xxx    # 查询相关deb包信息
        sudo dpkg -P xxx           # 彻底卸载
        sudo dpkg --purge xxx


QQ
--
    - `参考 <http://blog.csdn.net/ysy950803/article/details/52958538>`_
    - `下载 <https://pan.baidu.com/s/1kV0u7Nh>`_ ，密码: 7vit
        - 有可能部分中文乱码，但是不影响聊天、使用
    - 卸载其它版的 ``QQ`` ，按顺序安装
    .. code-block:: bash

        sudo apt-get install wine
        sudo dpkg -i crossover-15_15.0.3-1_all.deb
        sudo dpkg -i crossover-15_15.0.3-1_all-free.deb
        sudo apt-get install libgsm1 libgstreamer0.10-0 libgstreamer-plugins-base0.10-0
        sudo dpkg -i deepin-crossover-helper_1.0deepin0_all.deb
        sudo dpkg -i apps.com.qq.im_8.1.17255deepin11_i386.deb
        : 'vim /usr/bin/killqq'
        ps aux | grep -v grep | grep wine |cut -c 9-15 | xargs kill
        ps aux | grep -v grep | grep QQ |cut -c 9-15 | xargs kill
        ps aux | grep -v grep | grep qq |cut -c 9-15 | xargs kill
        pkill  plugplay.exe
        pkill  explorer.exe
        pkill  services.exe


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



jetbrains
---------
    .. code-block:: bash

        nohup pycharm>~/jetbrains.log 2>&1 &


搜索无效的图标
------------
    .. code-block:: bash

        find ~/.local/ | xargs grep -ri "xxx"
        find ~/.local/ | xargs grep -ri "xxx" -l
        find ~/.local/ -name "xxx"


重启网卡
-------
    sudo ifconfig enp5s0 down
    sudo ifconfig enp5s0 up


其它
----
    :gedit:             GNOME 桌面环境下的文本编辑器
    :draw.io:           流程图编辑器
    :VMTools:           支持与实体机之间文件拖动
    :FastoRedis:        redis GUI
    :typora:            `markdown 编辑器 <https://www.typora.io/#linux>`_
    :electronic wechat: `微信 <https://github.com/geeeeeeeeek/electronic-wechat.git>`_
    :系统管理:

        :conky:            在桌面显示系统信息
        :docky:            系统启动器
        :unity-tweak-tool: 系统管理工具

    :下载:
        :wget: 单线程
        :axel: 多线程
        :uget: 多线程 + GUI （编辑-->设置-->插件-->aria2/curl）

    :zsh:
        :~/.zshrc: ``ZSH_THEME='random'``

        - ``编辑 -> 配置文件首选项``
    :mysql:    ``/etc/mysql/my.cnf``
    :apt-fast: ``/etc/apt-fast.conf``


.. code-block:: bash

    # UFW     Uncomplicated Firewall（简单的防火墙）————iptables的前端
    # Gufw    UFW的图形界面前端，Gufw自称是世界上最简单的防火墙

    sudo ufw version || apt-get install iptables
    sudo ufw status
    #
    # 关闭/开启防火墙
    # ufw disable
    # ufw enable
    #
    # 系统启动时自动开启。关闭所有外部对本机的访问，但本机访问外部正常
    # ufw default deny
    #
    # 关闭 ubuntu 防火墙的其余命令
    # iptables -P INPUT ACCEPT
    # iptables -P FORWARD ACCEPT
    # iptables -P OUTPUT ACCEPT
    # iptables -F
    #
    # 开放端口
    # sudo ufw allow 80/tcp
    #
    # iptables -I INPUT -p tcp --dport 80 -j ACCEPT
    # iptables-persistent————持久化端口信息
    # apt-get install iptables-persistent
    # service iptables-persistent save

    # 安装gufw
    # sudo apt-get install gufw
