解除安全登陆控件阻止
------------------
    1. 登陆一个网站，这个网站的密码输入框是个安全控件，现在无法输入内容。插件被自动阻止了。
    2. 临时解除阻止的方法，在密码框上右键单击，选择运行此插件。
    3. 这只是临时解除了阻止，如果刷新还会有控件阻止的，唯一解决的办法是，让 Google Chrome 谷歌浏览器不再阻止这个插件运行。看一下地址栏的最右边，有个红色叉，这个就是浏览器阻止的安全登陆控件。
    4. 点击这个叉，选择始终允许使用 XXX 网址上的插件。
    5. 不管你怎么刷新和关闭重新打开，这个插件都能自动运行了。

解除数字证书插件验证登陆阻止
-------------------------
    1. 登陆某个需要验证数字证书的网站管理后台的数字证书验证提示，其实数字证书没有缺失，是被浏览器给阻止了。
    2. 点击地址栏叉按钮。
    4. 选择始终允许使用 XXX 网址上的插件。
    5. 验证成功。

手动设置不阻止插件的方法
---------------------
    1. 点击设置按钮，选择设置。
    2. 选择显示高级设置。
    3. 选择内容设置。
    4. 点击管理例外情况...
    5. 按照提示规则输入不用阻止插件的网址，点击完成，以后登录这些设置的网址就能自动运行插件了。


工具 -> 扩展程序
---------------
    - `扩展程序 <chrome://extensions/>`_
    - `应用商店 <chrome://apps/>`_
    ===============================  ======
    plugins                            todo
    ===============================  ======
    谷歌访问助手                         google
    SetupVPN                           翻墙
    Stylish                            为任意网站定制主题

    Spring Summer Fall Winter          主题插件
    Infinity                           新标签页、背景、主题、管理

    octotree                           github 目录呈现
    Awesome AutoComplete For GitHub    github 快捷搜索
    Isometric Contributions            立体显示 github commit

    ImTranslator

    Postman
    Postman Interceptor
    Request Maker
    ReRes                              支持单个url或目录映射
                                       勾选：允许访问文件网址
    Web Maker                          前端编辑器
    ColorZilla                         取色器
    Markdown Editor
    Quick QRCode                       快速生成二维码
    OneTab                             一键回收、还原所有的 tab
    grammarly                          英语语法
    Pixlr Editor                       图像编辑
    Charset                            设置/查看编码
    Get CRX                            提取crx文件
    ===============================  ======


进程管理
--------
    Shift+Esc

- 打开文件夹
    ```
    file:///home/zdd/github/
    ```
- 修改页面
    + console----document.body.contentEditable=true
- 编辑文件
    + data:text/html,<html contenteditable>
- 地址栏计算器
- 断网小恐龙
- F12--->右键刷新--->选择加载方式、清空缓存
- 手动安装插件：进入扩展程序，拖拽 cxr 文件

http://www.tuicool.com/articles/ER32Y3

sudo apt install rar

##### flash
chrome://flags/#run-all-flash-in-allow-mode


流程图
draw.io Desktop