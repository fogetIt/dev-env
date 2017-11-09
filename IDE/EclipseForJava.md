#### 创建项目
文件----新建----Java项目----项目名称：***----完成

#### 创建类
文件----新建----类----类名称：***----完成

#### 编辑代码补全 
- Windows----Preferences----Java----Editor----Content Asist
- Auto activation triggers for Java
    + 将“.”改为“.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ”
- 高级的设置
    + Advanced和Favorite 

#### 菜单----运行
- 自动执行编译和运行命令，输出运行结果
- 项目bin目录，生成.class 文件
    + C、C++编译生成可执行文件，可直接运行
    + Java编译生成字节码文件，必须由JVM翻译成机器码才能运行

#### 配置jdk
- eclipse会自动关联环境变量中配置的jdk
- 手工进行配置
    + Window----Preferences----Java----Installed JREs----Add----Standard VM：jdk安装目录 

#### 配置tomcat
- Window----Preferences----Server----Runtime Environments----Add--Apache----Apache Tomcat v7.0----tomcat7目录
- 打开Servers视图：Window----Show View----Server
    + 右键单击----New----Server----Tomcat v7.0 Server

#### 启动提速
Window----Preferences----General----Startup and Shutdown----去掉不想要的插件  

#### 关闭（jsp、xml等）验证
默认验证过程很消耗内存，关闭方法：Window----Preferences----Validation----Disable All

#### 设置“新建”菜单项  
Customize Prespective...----Shortcuts

#### 默认文件编辑器  
eclipse默认会自动选择文件的编辑器，也可以在打开文件时右键单击文件--“Open With”中选择编辑器，但有时我们可能更希望让文件使用某种特定的编辑器，此时可以通过如下方法进行配置：  
“Window”--"Preferences"--“General”--“Editors”--"File Associations"，上方选择特定的文件名后缀类型，下面选择编辑器，可以通过Add进行添加，通过Default设置默认编辑器。

#### 注释风格定义  
Window----Preferences----Java----Code Style----Code Templates

```
/**
* Title: project_name
* Description: XXXX
* Copyright: Copyright (c) 2011
* Company:www.xxx.com
* Makedate:${date} ${time}
* @author ${user}
* @version %I%, %G%
* @since 1.0
*/  
```

Alt+Shift+j自动添加注释


**Java大小写敏感** 