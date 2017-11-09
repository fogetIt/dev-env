### 清除缓存
- 快捷键：Ctrl+Shift+Delete；
- 菜单-->选项-->安全，去掉“常规”的三个勾选；

### 优化提速
- 地址栏输入about:support，打开配置文件夹，删掉places.sqlite，urlclassifier3.sqlite。
- 地址栏输入about:config
    + network.http.pipelining
        * 右键，切换 -> true；
    + network.http.proxy.pipelining
        * 右键，切换 -> true；
    + network.http.pipelining.maxrequests
        * 右键，修改 -> 8————每次发送8个请求；
    + network.dns.disableIPv6
        * 右键，切换 -> true————禁用ipv6解析；
    + browser.tabs.loadDivertedInBackground
        * 右键，切换 -> true————新打开的标签页在后台；
    + browser.sessionhistory.max_total_viewers
        * 右键，修改 ->5或更小————页面快进/快退功能中保存的页面总数，默认是-1（无限）；
    + 右击鼠标 -> 新建 -> 布尔（boolean）项，输入：
        * config.trim_on_minimize并设为true————最小化时自动释放内存；
    + 右击鼠标 -> 新建 -> 整数，输入：
        * nglayout.initialpaint.delay并设为0————当浏览器收到网站回复的信息后能够快速的反应；

```
32MB 0
64MB 1
128MB 2
256MB 3
512MB 4
1GB 8
```

**完全关闭FireFox后退出，再重新打开FireFox！**

firefox developer 查看 response header：
右键-->“查看元素”-->“网络”-->“重新载入”-->点击之后在右边即可查看响应头。


##### Firebug
firefox下的一个扩展插件，能够调试所有网站语言，如Html、Css、dom等的查看与调试，网站整体分析等等。是一整套完整而强大的开源 WEB开发工具。

FireBug最吸引人的就是javascript调试功能，使用起来非常方便，而且在各种浏览器下都能使用（IE、Firefox、Opera、Safari）。

Firebug也是一个除错工具。用户可以利用它除错、编辑、甚至删改任何网站的CSS、HTML、DOM以及JavaScript代码。

|Firebug按钮|作用       |
|:---------|:---------|
|CSS       |Css查看器  |
|Net       |网络状况监视|
|Script    |脚本调试器 |
|Console   |控制台     |
|HTML      |Html查看器 |
|Dom       |Dom查看器  |

1. CSS调试
不仅自下向上列出每一个CSS样式表的从属继承关系，还列出了每一个样式在哪个样式文件中定义。你可以在这个查看器中直接添加、修改、删除一些CSS样式表属性，并在当前页面中直接看到修改后的结果。  
提示：如果你正在学习CSS样式表的应用，但是总记不住常用的样式表有哪些值，可以尝试在CSS调试器中选中一个样式表属性，然后用上下方向键来改变它的值，它会把可能的值一个个遍历给你看。  
我们可以利用Firebug来查看页面中某一区块的CSS样式表，如果进一步展开右侧Layout tab的话，它会以标
尺的形式将当前区块占用的面积清楚地标识出来，精确到象素，更让人惊讶的是，你能够在这个可视化的界面中直接修改各象素的值，页面上区块的位置就会随改动而变化。在页面中某些元素出现错位或者面积超出预料值时，该功能能够提供有效的帮助，你可以籍此分析offset、margin、padding、size之间的关系，从而找出解决问题的办法。

2. 网络监视器
网络状况监视器能帮你解决`网页速度奇慢`的问题。它能将页面中的CSS、javascript以及网页中引用的图片载入所消耗的时间以矩状图呈现出来，让你能一把揪出拖慢了你的网页的元凶，进而对网页进行调优。  
网络监视器还有一些其它细节功能，比如预览图片，查看每一个外部文件甚至是xmlHttpRequests请求的http头等等。

3. JS调试器
这是一个很不错的javascript脚本调试器，占用空间不大，但是单步调试、设置断点、变量查看窗口一个不
少。  
如果你有一个网站已经建成，然而它的javascript有性能上的问题或者不是太完美，可以通过面板上的Profile来统计每段脚本运行的时间，查看到底是哪些语句执行时间过长，一步步的来排除问题。  

4. Console 控制台
控制台能够显示当前页面中的javascript错误以及警告，并提示出错的文件和行号，方便调试，这些错误提示比起浏览器本身提供的错误提示更加详细且具有参考价值。而且在调试Ajax应用的时候也是特别有用，你能够在控制台里看到每一个XMLHttpRequests请求post出去的参数、URL，http头以及回馈的内容，原本似乎在幕后黑匣子里运作的程序被清清楚楚地展示在你面前。  
像C shell或Python shell一样，你还能在控制台中查看变量内容，直接运行javascript语句，就算是大段的javascript程序也能够正确运行并拿到运行期的信息。  
控制台还有个重要的作用就是查看脚本的log，从前你也许习惯了使用alert来打印变量，但是Firebug给我们带来了一个新朋友 —— console.log, 最简单的打印日志的语法是这样的：  
console.log("hello world")如果你有一堆参数需要组合在一起输出，可以写成这样：
console.log(2,4,6,8,"foo",bar). Firebug的日志输出有多种可选的格式以及语法，甚至可以定制彩色输出，比起单调的alert，显然更加方便，限于篇幅，这里不做详细说明，但是有助于提高debug效率的读者。

5. 修改HTML
相比于Firefox自带的HTML查看器，Firebug的HTML代码查看器，功能强大了许多。 
首先你看到的是已经经过格式化的HTML代码，它有清晰的层次，你能够方便地分辨出每一个标签之间的从属并行关系，标签的折叠功能能够帮助你集中精力分析代码。源代码上方还标记出了DOM的层次，它清楚地列出了一个html元素的parent、child以及root元素，配合Firebug自带的CSS查看器使用，会给div+css页面分析编写带来很大的好处。你还可以在HTML查看器中直接修改HTML源代码，并在浏览器中第一时间看到修改后的效果，光凭这一点就会让许多页面设计师死心塌地地成为Firebug的粉丝了。
有时候页面中的javascript会根据用户的动作如鼠标的onmouseover来动态改变一些HTML元素的样式表或背景色，HTML查看器会将页面上改变的内容也抓下来，并以黄色高亮标记，让网页的暗箱操作彻底成为历史。
利用Inspect检查功能，我们还可以用鼠标在页面中直接选择一些区块，查看相应的HTML源代码和CSS样式表，真正的做到所见即所得，如果你使用了外部编辑器修改了当前网页，可以点击Firebug的reload图片重新载入网页，它会继续跟踪你之前用Inspect选中的区块，方便调试。

6. DOM查看器
DOM(Document Object Model)里头包含了大量的Object以及函数、事件，在从前，你要想从中查到需要的内容，绝非易事，这好比你去了一个巨大的图书馆，想要找到几本名字不太确切的小书，众多的选择会让你无所适从。而使用Firebug的DOM查看器却能方便地浏览DOM的内部结构，帮助你快速定位DOM对象。双击一个DOM对象，就能够编辑它的变量或值，编辑的同时，你可能会发现它还有自动完成功能，当你输入document.get之后，按下tab键就能补齐为document.getElementById，非常方便。如果你认为补齐得不够理想，按下shift+tab又会恢复原状。