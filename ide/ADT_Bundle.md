在eclipse上做android开发时用到SDK+ADT来，AVD来。  

##### ADT Bundle
- 已经集成好的IDE，Eclipse+ADT+SDK
    + 基本开发环境
        * Android SDK(Software Develop Kit)，提供不同版本的api
        * ADT————android develop toolkit（安卓开发工具链）
            - 一个eclipse插件，关联eclipse、Android SDK
    + 运行调试App
        * AVD————android virtual device（安卓模拟器/虚拟机）
- 需要下载安装JDK

##### 手动集成Eclipse
- 安装ADT
    + Help菜单----Install New Software… ?----Add…
    + Location：http://dl-ssl.google.com/android/eclipse/，Name：ADT----OK
    + 在弹出的对话框选择要安装的工具，下一步
- 重启Eclipse，关联Android SDK
    + 根据目录的位置智能地和同目录下Android SDK进行关联
    + 如果还没有通过sdk manager工具安装任何Android SDK，会提醒立刻安装
    + 手动关联SDK
        * Window----Preferences----设置Android SDK路径----OK
- 新建一个项目
    + File----New----Project...（出现建立Android项目的选项）


##### 进入Android Virtual Device Manage对话框：通过图标或者菜单window→Android Virtual Device Manager进入安卓虚拟机管理对话框。  
用eclipse编写安卓程序时只要在菜单中执行Run As →1 Android Application，这个程序就会自动下载安装到我们刚才建好的安卓系统中并自动运行。

##### 删除安卓模拟器
不想用这个模拟器的时候，可以按第一步进到Android Virtual Device Manage对话框，选择模拟器后按Delete按钮删除。