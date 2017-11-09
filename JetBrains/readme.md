### JetBrains，总部位于捷克首都布拉格，开发人员以严谨著称的东欧程序员为主
- 强大的智能提示补全功能；
- 完善的插件系统，如Git、Markdown、Gradle等，直接搜索下载；
- 自带Git、SVN等流行的版本控制系统，右键Compare与其他版本对比；

##### 版本
- 社区版，Community，没有tomcat配置功能(idea)；
- 付费版，Ultimate\Professional；

###### 注册
- [获取注册码](http://idea.lanyus.com/)
- 或者填入license server
    ```
    http://intellij.mandroid.cn/
    http://idea.imsxm.com/
    http://idea.iteblog.com/key.php
    ```
- 或者
    + 调整时间到2038年
    + 申请30天试用
    + 退出pycharm
    + 时间调整回来

##### [配色](http://color-themes.com/?view=index)
File--->Import Settings...--->重启
```
Tangid.jar,
Visual Studio 2013.jar,
garden.jar,
Monokai Sublime Text 3.jar
```
##### 汉化
下载汉化包，替换${IntelliJ IDEA}\lib\resources_cn.jar

##### 清理缓存
File--->Invalidate caches

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

编辑器右键，local history, show history： 显示本地修改记录

##### plugins

|插件              |功能|
|:----------------|:--|
|TranslationPlugin|翻译|

##### File--->Settings
- 文件类型
    + Editor--->File Types
- Git
    + Version Control--->Git--->SSH executable--->choose Native
- Install plugin from disk
    + Plugins--->Install plugin from disk...--->重启

##### indent
Settings--->Code Style--->语言类型--->Tabs and Indents