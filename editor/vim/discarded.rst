cscope
=======

:ctags: 跳转到函数定义的地方
:cscope:
    - 依赖于 ctags ，在 tags 文件基础上生成数据库文件
    - 跳转到函数定义的地方
    - 跳转到函数被引用的地方
:安装:

    .. code-block:: bash

        # 下载 -> 解压 -> 添加环境变量 -> 安装 ctags/cscope
        sudo apt-get install exuberant-ctags
        # 在当前工作目录生成 tags 索引文件
        ctags -R
        cscope -Rbkq


插件
---------    

:taglist.vim:     依赖 ctags ，列出当前文件所有宏、全局变量、函数名等
:tagbar:          依赖 ctags ，taglist 的替代品，函数能够按类区分、折叠显示
:cscope.vim:      依赖 cscope ，快速跳转
:cscope_maps.vim: cscope.vim 的快捷键
:genutils:        提供了一些通用的函数，供其它脚本使用
:lookupfile:      依赖 ctags、genutils ，查找文件、缓冲区中、目录
:minibufexpl.vim: 打开多个文件时，显示、切换标签栏
