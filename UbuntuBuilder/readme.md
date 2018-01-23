##### 装win、ubuntu双系统：
- 安装win7、win8、win10，分2~3个盘给ubuntu（/、swapn、/home）
- 使用ultraISO、ubuntu镜像制作启动盘
- 进bios改启动项，选择u盘启动
- 安装ubuntu，选择其它选项安装，ubuntu启动项与/目录的挂载盘一致，完成后重启
- win10直接有启动选项，win7、win8安装easyBCD，添加ubuntu启动项
- ubuntu崩溃处理：
    + 用启动盘进入安装系统，选择试用，进硬盘拷贝需要的文件到其它盘
    + 重装系统

---
##### sudo
- -S
    + 使sudo从标准输入中读取密码

##### $
- $!
    + Shell最后运行的后台Process的PID
- $?
    + 上一条命令返回码
        * 0，成功
    + 函数的返回值
- $#
    + 传递给函数的参数个数
- $*
    + 所有传递给函数的参数
    + 可以接收带空格的参数
- ${@:1}
    + 接收带空格的参数
- $@
    + 与$*相同，但是略有区别
- $n
    + 传递参数给函数
    + 当n>=10时，需要使用${n}来获取参数

##### wget
- -O ***
    + 以指定的文件名保存

##### if [ expression ]
```shell
: "表达式中每个变量、符号之间必须有空格"
if [ -d ... ]; ...fi      # 判断目录是否存在(相对路径不能加"")
if [ -f ... ]; ...fi      # 判断文件是否存在(相对路径不能加"")
if [ a -gt b ]; ...fi     # 比较整数(变量名必须加引号)
if [ a > b ]; ...fi       # 比较非整数(变量名必须加引号)
if [ "$1" ... ]; ...fi    # $变量必须加引号(否则传入参数为空时，报错)
elif [ $1 ... ]; ...fi    # $变量不必加引号
if [[ expression ]]; then # 支持&&,||,<,>,!=，$!不用加引号
    ...
fi
```

##### apt-get
- 从网上下载包，并安装到本地
- 官方url：/etc/apt/sources.list

|参数                     |作用                       |
|:----------------------|:------------------------|
|ppa                    |Personal Package Archives|
|                       |个人软件包集                   |
|update                 |更新软件(下载源)列表              |
|upgrade                |更新已安装软件                  |
|dist-upgrade           |更新系统版本                   |
|-y                     |自动回车确认                   |
|--allow-unauthenticated|存在未认证的软件包，同时使用-y选项，必须    |

##### 卸载/安装
```shell
# apt-get程序
sudo apt-cache search pyqt # 搜索ubuntu库
sudo apt-get remove ***    # 卸载
sudo apt-get autoclean
sudo apt-get autoremove
: "deb程序"
sudo dpkg --configure -a   # 打断安装
sudo dpkg -l | grep ***    # 查询deb包的详细信息
sudo dpkg -P ***           # 彻底卸载
sudo dpkg --purge ***
```

##### 文件操作

|命令/符号|含义      |
|:----|:-------|
|>    |从标准输入覆盖写|
|>>   |从标准输入追加写|
|tee  |从标准输入读入 |
|     |-a追加模式  |


http://blog.csdn.net/taiyang1987912/article/details/39551385

##### 环境变量
set 显示当前shell的变量，包括当前用户的变量
env 显示当前用户的变量
export 显示当前导出成用户变量的shell变量
export 用户注销时值将丢失


##### 命令间隔符
```shell
set -e
: "如果任何语句的执行结果不是true则应该退出"
: "某些命令执行失败，脚本会退出，$?判断也会失效"
command1 & command2 & ...   # 命令同时执行
command1; command2; ...     # 不管前面的命令是否执行成功，后面的命令都会执行
command1 && command2 && ... # 只有前面的命令执行成功，后面的命令才会执行
command1 || command2 || ... # 只有前面的命令返回假($? == 1)，后边的命令才会执行
```

##### 搜索无效的图标
find ~/.local/ |xargs grep -ri "图标名"
find ~/.local/ |xargs grep -ri "图标名" -l
find ~/.local/ -name "图标名"


##### [youdao-dict](http://codown.youdao.com/cidian/linux/youdao-dict_1.0.2~ubuntu_amd64.deb)
- 依赖wine
- 不能安装最新版

##### [ubuntu QQ](http://blog.csdn.net/ysy950803/article/details/52958538)
- 安装前先卸载其它版的qq（如果以前安装过的话）

```shell
# 列出已经安装的qq相关包
sudo dpkg -l | grep qq
# 删除deb安装的包
# 把能删的删掉，有依赖关系删不掉的不删
sudo dpkg -P ***
```
- 安装wine

```shell
sudo apt-get install wine
```
- [下载链接](https://pan.baidu.com/s/1kV0u7Nh)，密码: 7vit
    + 安装顺序
        1. crossover-15_15.0.3-1_all.deb
        2. crossover-15_15.0.3-1_all-free.deb
        3. deepin-crossover-helper_1.0deepin0_all.deb
        4. apps.com.qq.im_8.1.17255deepin11_i386.deb
- 安装后的QQ（有可能）部分中文乱码，但是不影响聊天、使用

```shell
#!/bin/bash
: 'vim /usr/bin/killqq'
ps aux | grep -v grep | grep wine |cut -c 9-15 | xargs kill
ps aux | grep -v grep | grep QQ |cut -c 9-15 | xargs kill
ps aux | grep -v grep | grep qq |cut -c 9-15 | xargs kill
pkill  plugplay.exe  
pkill  explorer.exe  
pkill  services.exe  
```

##### [electronic打包的微信](http://github.com/geeeeeeeeek/electronic-wechat)
##### GIMP
- ubuntu应用程序自带，类photoshop

##### 搜狗输入法

: '
echo $DESKTOP_SESSION
ubuntu --> UNITY
kubuntu --> KDE
'