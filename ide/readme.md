### JetBrains，总部位于捷克首都布拉格，开发人员以严谨著称的东欧程序员为主
- 强大的智能提示补全功能；
- 完善的插件系统，如Git、Markdown、Gradle等，直接搜索下载；
- 自带Git、SVN等流行的版本控制系统，右键Compare与其他版本对比；

##### 版本
- 社区版，Community
- 付费版，Ultimate\Professional

###### 注册
- [获取](./activation.md)注册码，[或者](http://idea.lanyus.com/)
- 或者填入license server
    ```
    http://idea.codebeta.cn
    http://idea.imsxm.com/
    ```
- 或者
    + 调整系统时间
    + 申请`30`天试用
    + 退出`pycharm`
    + 时间调整回来

##### [配色](http://color-themes.com/?view=index)
File/Import Settings.../重启

##### 字体
```
Ubuntu Mono
Noto Sans CJK JP DemiLight
Monospaced
```

##### 下载汉化包，替换${IntelliJ IDEA}\lib\resources_cn.jar
##### 清理缓存: File/Invalidate caches
##### 远程
- sftp连接
    + Tools--->Deployment--->Configuration--->SFTP--->...--->Test SFTP Connection...
- 临时关联
    + Tools--->Deployment--->browse remote host
    + 打开文件，pycharm会在本地先生成一份，编辑完需要更新上去
    + 文件的上方会有横条提示，提供对比文件、撤销更改、更新文件3个功能
- 本地关联
    + Tools--->Deployment--->Configuration--->SFTP
    + 配置Mappings参数设置，进行本地项目路径和远程服务器项目路径的关联
    + upload/download/sync
- 设置远程解析器
    + File--->Settings--->Project:--->Project Interpreter
- 远程调试
    + Run--->Edit Configurations--->添加Django server

|快捷键            |含义        |
|:----------------|:----------|
|绿色甲虫图标       |开启断点调试 |
|CTRL+F8/行号后单击|设置/取消断点|
|F8/点击StepOver   |下一步      |
|CTRL+F5          |重启服务器  |
|CTRL+SHIFT+F8    |查看所有断点 |
|红色圆点加斜杠     |关闭断点调试 |
|`CTRL+E`         |窗口面板    |
|shift shift      |快速查找    |


##### File/Settings/Editor/`File Types`
##### File/Settings/Plugins/`Install plugin from disk...`/重启
##### Settings/Code Style/.../`Tabs and Indents`
##### 编辑器右键/`Local History`/Show History
##### PyCharm virtualenv: File/Settings/Project/Project Interpreter
##### Version Control/`Git`/SSH executable/`Native`
##### [Android Studio](./AS.md)
##### [Intellij IDEA](./IDEA.md)
##### [WebStorm](./WS.md)
##### [快捷键](./DefaultCustom.xml)
