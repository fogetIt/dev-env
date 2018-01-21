#### 下载sublime
- 版本
    + 普通版(Normal)————.exe
    + 便携版(Portable)————.zip

#### package control
- 安装
    + Ctrl+Shift+P
        * `Install Package Control`
- 使用
    + Ctrl+Shift+P(Tools----Command Palette)
        * `install package`
        * `remove package`


- Ctrl+`(View----Show Console)


#### 配置文件
- 替换${sublime}\Data\Packages\User\*
- 替换${sublime}\Data\Packages\Theme - Default\*

##### 包资源管理——修改配置文件
1. 找到配置文件所在的压缩包，用winrar工具编辑，或者复制出来编辑再替换。
2. PackageResourceViewer:Open Resouce-->回车输入文件名或压缩包名-->找到文件，编辑或替换。
3. Preference-->Browse Packages-->找到配置文件，编辑或替换。
    + 打开命令面板，输入PackageResourceViewer: Open Resource （回车，打开包列表）
    + Theme-Default（主题名）-->Default.sublime-theme 搜索"font.size": 14。

##### 激活码
```
—– BEGIN LICENSE —–
Michael Barnes
Single User License
EA7E-821385
8A353C41 872A0D5C DF9B2950 AFF6F667
C458EA6D 8EA3C286 98D1D650 131A97AB
AA919AEC EF20E143 B361B1E7 4C8B7F04
B085E65E 2F5F5360 8489D422 FB8FC1AA
93F6323C FD7F7544 3F39C318 D95E6480
FCCC7561 8A4A1741 68FA4223 ADCEDE07
200C25BE DBBC4855 C4CFB774 C5EC138C
0FEC1CEF D9DCECEC D3A5DAD1 01316C36
—— END LICENSE ——
```

##### 插件
*插件不要装太多功能重复的，留意插件、快捷键冲突。*

1. ctrl+shift+p；
2. 然后list package；
3. 选择一个会自动打开其所在的目录；
4. 查看readme.md上面的插件使用方法；

|插件                     |作用                        |
|:-----------------------|:--------------------------|
|FixMyJS, Jsfmt          |JS/JSON代码风格格式化        |
|ConvertChineseCharacters|转换中文字符(unicode)        |
|SCSS                    |scss的语法高亮、CSS片段       |
|HTMLAttributes          |html属性补全提示             |
|html5                   |提供html5相关的标签片段       |
|Emmet Css Snippets      |CSS自动补全提示              |
|JS Minifer              |js压缩，快捷键：ctrl+alt+M    |
|yui compressor          |yui的压缩工具，可以压缩CSS、JS  |
|                        |快捷键：CTRL+B(需要安装配置jdk)|
|Xdebug Client           |调试php                     |
|Tradsim                 |中文繁字体和简体字转换        |
|Hex-to-HSL-Color        |Hex颜色模式转HSL颜色模式      |

[在线编辑主题（只支持Chrome）](http://tmtheme-editor.herokuapp.com/)


##### 自定义文件语法高亮
- 本次生效————打开特定类型的文件，点击右下角，指定语法类型
- 永久生效————修改配置文件
    + 打开`想要使用的`高亮类型的文件
    + 首选项----设置-特定语法
    + Sublime Text会自动生成文件语法的配置文件（*.sublime-settings）
    + 将`想要添加高亮`的文件类型添加到"extensions": [...]
    + 如果还不行
        * View----Syntax----Open all with current extension as ...

##### 从指定github仓库安装插件
- Crtl + Shift + p
    + add repository
    + https://github.com/FengZhiMo/MarkdownTableFormatter
- Crtl + Shift + p
    + MarkdownTableFormatter