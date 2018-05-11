ubuntu16.04 unity 桌面美化
-----------------------------
.. code-block:: bash

    which docky || sudo apt-fast -y install docky  # 系统启动器
    which conky || sudo apt-fast -y install conky  # 显示系统信息
    sudo apt-fast -y install unity-tweak-tool      # 系统管理工具

    # 动态壁纸包
    sudo add-apt-repository ppa:fyrmir/livewallpaper-daily
    sudo apt-fast update
    sudo apt-fast install livewallpaper livewallpaper-config livewallpaper-indicator


ppa:webupd8team/atom
--------------------


spacevim
--------
.. code-block:: bash

    curl -sLf https://spacevim.org/install.sh | bash

ubuntu16.04 QQ
----------------
- `下载 <https://pan.baidu.com/s/1kV0u7Nh>`_ ，密码: 7vit
- 按顺序安装

    .. code-block:: bash

        sudo apt-get install wine
        sudo dpkg -i crossover-15_15.0.3-1_all.deb
        sudo dpkg -i crossover-15_15.0.3-1_all-free.deb
        sudo dpkg -i deepin-crossover-helper_1.0deepin0_all.deb
        sudo dpkg -i apps.com.qq.im_8.1.17255deepin11_i386.deb
        # vim /usr/bin/killqq
        ps aux | grep -v grep | grep wine |cut -c 9-15 | xargs kill
        ps aux | grep -v grep | grep QQ |cut -c 9-15 | xargs kill
        ps aux | grep -v grep | grep qq |cut -c 9-15 | xargs kill
        pkill  plugplay.exe
        pkill  explorer.exe
        pkill  services.exe


icons-themes
------------
.. code-block:: bash

    sudo add-apt-repository ppa:papirus/papirus
    sudo apt-fast update
    sudo apt-fast install papirus-icon-theme

    sudo apt-fast install -y gtk2-engines-pixbuf gnome-themes-standard

    sudo add-apt-repository ppa:numix/ppa
    sudo apt-fast update
    sudo apt-fast install numix-icon-theme


node
-----
.. code-block:: bash

    xz -kfd node*.tar.xz \
    && mkdir node;tar -xvf node*.tar -C node --strip-components 1 \
    && sudo ln -sf "./node/bin/node" /usr/bin/node \
    && sudo ln -sf "./node/bin/npm" /usr/bin/npm \
    && npm config set prefix /usr/local
    # npm config list
    # npm全局命令安装目录：${prefix}/bin/
