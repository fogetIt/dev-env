### Android Studio
- Google专门为Android打造;
- 基于IntelliJ IDEA，类似 Eclipse ADT;
- Google官方将逐步放弃对Eclipse ADT的支持;

##### 提供了集成的 Android 开发工具用于开发和调试
- SDK————配置基本开发环境；
- AVD————运行调试App；

##### 对比Eclipe with ADT
- android studio是单工程的开发模式；
- android studio中的application相当于eclipse里的workspace概念；
- android studio中的module相当于eclipse里的project概念；
- 在速度上不管哪一个方面都比Eclipse快；
- UI编辑器自带了多设备的实时预览；
- 多语言适配点击地球直接输入，再也不用比较哪个string没有翻译了；
- 整合Gradle构建工具————集合了Ant和Maven的优点，不管是配置、编译、打包都非常牛逼：
    + 其一是简洁，基于Groovy的紧凑脚本，表述意图也十分不清晰；
    + 其二是灵活，各种在Maven中难以下手的事情，在Gradle就是小菜一碟，比如修改现有的构建生命周期，几行配置就完成了，同样的事情，在Maven中你必须编写一个插件，那对于一个刚入门的用户来说，没个一两天几乎是不可能完成的任务；

##### [下载安装](www.android.com)或者[中文社区](http://www.android-studio.org/)
AS安装包分为含SDK版本和不含SDK版本下载。【注意先正确安装配置了JDK】

首次运行AS可能一直停在Fetching Android SDK component information。因为无法首次运行更新SDK（需翻墙）。
解决办法————关闭安装向导（或者在任务管理器中杀进程），然后打开AS安装目录下的bin目录里面的idea.properties文件，添加一条禁用开始运行向导的配置项————disable.android.first.run=true

如果没有安装Android SDK，点击Start a new Android Studio project是没有反应的，并且在Configure下面的SDK Manager是灰色的。

### 下载SDK
Configure-Settings，在查找框里面输入proxy--->HTTP Proxy设置代理服务器
Android SDK--->选中Force http://...，然后退出将上面在idea.properties配置文件中添加的那条配置项注释掉重新打开Android Studio等刚开始的向导把Android SDK下载安装完成就可以了。

重新指定SDK路径；Configure--->Project Defaults--->Project Structure，在此填入你已有的SDK路径。


- 新建工程，输入工程名（android app命名）和主包名和存储路径，点击next。
- 选择你app运行的平台，App要适配的设备是Wear还是Mobile还是TV，点击next。
在你新建App选择最低适配版本时，强大的AS会给你一些有用的统计提示，点击Help me choose后弹出更加形象的分布图表描述。
- 选择新建一个什么类型的activity，一般选择blank activity（形象友好的GUI模板），点击next。
- 为你选择的activity命名，命名完之后选择finish。
- 稍等之后便进入了编辑页面，系统默认为你的启动页面添加了一个textview控件，并显示“helloworld”。
- Tools--->Android--->SDK Manager--->Android SDK--->SDK Platforms，新的虚拟机。（可选）
- 创建好了X86的AVD后，需要再去安装对应的Intel Hardware Accelerated Execution Manager（intel Haxm，CPU虚拟化支持）。
Tools--->Android--->SDK Manager--->Android SDK--->Launch Standalone SDK Manager--->Intel x86 Emulator...
HAXM 下载的目录是 android-sdk\extras\intel\Hardware_Accelerated_Execution_Manager , 运行 IntelHaxm.exe 进行安装， 根据屏幕提示，一步一步安装即可。
新建或者编辑 Android 模拟器， 将模拟器 CPU/ABI 设置为 Intel Atom X86。
- 点击菜单栏的三江形按钮，模拟器运行app，并显示相应界面。


（三）
1）第一次安装工程初始化时由于需要联网下载gradle会比较慢，不过有时候不是第一也会慢，工程依赖的gradle版本不匹配时也会自动重新下载；

2）导入jar包—–选择File->Projcet Structure，在弹出的窗口中左侧找到Libraries并选中，然后点击“+”，并选择Java就能导入Jar包了。或者直接拷贝jar文件到项目的libs文件夹下，然后运行：Sync Project with Gradle Files。然后clean project重新编译。
3）中文乱码—–在窗口中，找到IDE Settings->Appearance，在右侧勾选上“Override default fonts by”，然后在第一个下拉框中选择字体为“simsun”，然后apply，重启IDE，就好了。
4）设置快捷键—–在settings窗口中，找到IDE Settings->keymap，右侧打开的就是快捷键了。右键单击要修改的快捷键，会弹出一个菜单，选择“Add keyboard shortcut”就可以修改快捷键了。删除的话，在弹出的菜单中选择remove XXX即可。特别说明，在AS的快捷键设置里可以直接设置使用Eclipse快捷键还是别的IDE快捷键。如果你热衷Eclipse那么也可设置成Eclipse的快捷键。
5）删除项目—–AS对工程删除做了保护机制，默认你在项目右键发现没有删除选项。你会发现你的module上面会有一个小手机，这是保护机制。删除的第一步就是去掉保护机制，也就是让手机不见，具体做法就是鼠标放在工程上右键->open module setting，或者F4进入如图界面，选中你要删除的module，然后点击减号，这样就取消了保护机制，然后回到项目工程右键就可发现删除选项。注意：删除会将源文件删除。
6）选择“Import Project（导入项目）”。Android Studio能够将Eclipse项目转换为Android Studio项目，并在项目中为用户提供必要的配置文件。

（四）建工程项目后AS的Product目录结构如下所示：
    .idea：//AS生成的工程配置文件，类似Eclipse的project.properties。
    app：//AS创建工程中的一个Module。
    gradle：//构建工具系统的jar和wrapper等，jar告诉了AS如何与系统安装的gradle构建联系。
    External Libraries：//不是一个文件夹，只是依赖lib文件，如SDK等。

新建工程项目后AS的Module目录结构如下所示：
    build：//构建目录，相当于Eclipse中默认Java工程的bin目录，鼠标放在上面右键Show in Exploer即可打开文件夹，
        编译生成的apk也在这个目录的outs子目录，不过在AS的工程里是默认不显示out目录的，就算有编译结果也
        不显示，右键打开通过文件夹直接可以看。
    libs：//依赖包，包含jar包和jni等包。
    src：//源码，相当于eclipse的工程。
    main：//主文件夹 
        java：//Java代码，包含工程和新建是默认产生的Test工程源码。 
        res：//资源文件，类似Eclipse。
            layout：//App布局及界面元素配置，雷同Eclipse。
            menu：//App菜单配置，雷同Eclipse。 
            values：//雷同Eclipse。
                dimens.xml：//定义css的配置文件。 
                strings.xml：//定义字符串的配置文件。 
                styles.xml：//定义style的配置文件。
                ......：//arrays等其他文件。
            ......：//assets等目录
        AndroidManifest.xml：//App基本信息（Android管理文件） 
        ic_launcher-web.png：//App图标 
    build.gradle：//Module的Gradle构建脚本

所谓Android虚拟设备——或者简称AVD——是一套模拟器配置方案，它允许设定出与实际情况相符的Android设备型号。这就让开发者在多种多样的设备平台上运行并测试应用程序变得更为轻松。在Android虚拟设备功能的支持下，可以为Android模拟器指定需要模拟的硬件与软件组合。
创建Android虚拟设备的首选方式是通过AVD Manager。Android Studio--->Tools--->Android--->AVD Manager。