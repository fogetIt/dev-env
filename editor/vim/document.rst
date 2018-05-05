vim
====
=========  ==========
vi           不能使用小键盘和方向键
 -           在编辑模式下，移动光标会变成不确定字符
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



插件
-------

:dein.vim: 与 neobundle 是同一个作者，持续更新中
:vim-plug: 异步安装插件，按需延时加载
:vim-airline:
    - statusline
    - tabline
        - 可以取代 minibufexpl, powerline

:ctrlp.vim:
    - 实现了 sublime Ctrl+P 的功能
    - 纯 vimscript 实现，没有外部依赖
        - 可以取代 lookupfile