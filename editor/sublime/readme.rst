package control
===============
    - 安装
        - Ctrl+Shift+P
            - `Install Package Control`
    - 使用
        - Ctrl+Shift+P(Tools-->Command Palette)
            - `install package`
            - `remove package`


Ctrl+`/View-->Show Console
---------------------------


配置文件
-------
    :替换: ``${sublime}\Data\Packages\User\*``
    :替换: ``${sublime}\Data\Packages\Theme - Default\*``
    :修改:

        - 找到配置文件所在的压缩包，用winrar工具编辑，或者复制出来编辑再替换
        - PackageResourceViewer:Open Resouce-->回车输入文件名或压缩包名-->找到文件，编辑或替换
        - Preference-->Browse Packages-->找到配置文件，编辑或替换
            - Ctrl+Shift+P-->PackageResourceViewer: Open Resource
            - 回车，打开包列表
            - Theme-Default-->Default.sublime-theme
            - 搜索 "font.size": 14

**激活码**
::
    —– BEGIN LICENSE —–
    TwitterInc
    200 User License
    EA7E-890007
    1D77F72E 390CDD93 4DCBA022 FAF60790
    61AA12C0 A37081C5 D0316412 4584D136
    94D7F7D4 95BC8C1C 527DA828 560BB037
    D1EDDD8C AE7B379F 50C9D69D B35179EF
    2FE898C4 8E4277A8 555CE714 E1FB0E43
    D5D52613 C3D12E98 BC49967F 7652EED2
    9D2D2E61 67610860 6D338B72 5CF95C69
    E36B85CC 84991F19 7575D828 470A92AB
    —— END LICENSE ——


插件
----
    - 不要装太多功能重复的，留意插件、快捷键冲突
        1. ctrl+shift+p-->list package
        #. 选择一个会自动打开其所在的目录
        #. 查看 readme.md

    ==========================  ========
    FixMyJS, jsfmt
    Minifier, YUI Compressor
    CSS Unminifier
    Anaconda
    MarkdownHighlighting
    Markdown Preview
    AutoFileName                  补全：src/href
    Autoprefixer                  浏览器前缀：Ctrl+Alt+X
    SublimeTmpl                   新建文件：Ctrl+Alt+H/C/J
    AdvancedNewFile               新建文件：Ctrl+Alt+N
    ConvertChineseCharacters      转换中文字符
    Tradsim                       转换中文繁简字
    GitGutter,Modific             左侧显示修改信息图标
    Local History                 历史记录
    Colorcoder                    高亮所有变量
    SublimeCodeIntel              多语言补全
    All Autocomplete              搜索打开的标签页进行补全
    ==========================  ========


`在线编辑主题（只支持Chrome） <http://tmtheme-editor.herokuapp.com/>`_


自定义文件语法高亮
----------------
    :本次生效: 打开特定类型的文件，点击右下角，指定语法类型
    :永久生效: 修改配置文件

        - 打开`想要使用的`高亮类型的文件
        - 首选项-->设置-->特定语法
        - Sublime Text会自动生成文件语法的配置文件（*.sublime-settings）
        - 将`想要添加高亮`的文件类型添加到"extensions": [...]
        - 如果还不行
            - View-->Syntax-->Open all with current extension as ...

从指定 ``github`` 仓库安装插件
------------------------
    - Crtl + Shift + p
        - add repository
        - https://github.com/forgetIt/MarkdownTableFormatter
        - MarkdownTableFormatter
