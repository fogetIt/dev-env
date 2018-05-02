vim
====
=========  ==========
vim          super vi
vim-tiny     only Terminal, light but speed
vim-gtk      vim with gtk GUI
vim-gnome    vim with gnome GUI
=========  ==========


配置文件
----------------

:全局:
    :centOS:  /etc/vimrc
    :Ubuntu:  /etc/vim/vimrc
    :Windows: $VIM/_vimrc
:用户: ~/.vimrc


中文帮助
-------------
- http://prdownloads.sourceforge.net/vimcdoc/vimcdoc-1.7.0-setup.exe?download
- 安装在 $VIM/vimfiles


vi
----
- 不能使用小键盘和方向键
- 在编辑模式下，移动光标会变成A B C D等字符并换行


插件管理
-----------

:Vundle.vim:

    :vimrc:

        .. code-block:: vimrc

            set nocompatible
            filetype off
            set rtp+=xxx/xxx
            call vundle#begin('xxx/xxx')
            Plugin 'xxx'      " github/vim-scripts
            Plugin 'xxx/xxx'  " github
            Plugin 'xxx.git'
            call vundle#end()
            filetype plugin indent on

    :cmd:
        :BundleList:        列出插件
        :BundleInstall:     安装插件
        :BundleUpdate:      更新插件（:BundleInstall!）
        :BundleSearch xxx:  查找插件
        :BundleSearch! xxx: 刷新插件缓存
        :BundleClean:       清除插件
        :BundleClean!:      清除插件
:neobundle.vim: 基于 ``vundle`` 的不稳定开发版，异步、支持 ``svn`` ，已停更
:dein.vim:      与 ``neobundle`` 是同一个作者，持续更新中
:vim-plug:      异步安装插件，按需延时加载
