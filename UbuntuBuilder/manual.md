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
##### GIMP（ubuntu应用程序自带，类photoshop）
##### 搜狗输入法

: '
echo $DESKTOP_SESSION
ubuntu --> UNITY
kubuntu --> KDE
'
