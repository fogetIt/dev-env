多系统装机
==============
1. 安装 windows
#. 分盘给 ubuntu(linux)
    - 根目录
    - 家目录（为防止系统崩溃后用户文件丢失，重装系统时可以不格式化此目录）
    - swapn
#. 下载启动盘制作工具，使用系统镜像制作启动盘
#. 进 bios 改启动项，选择 u 盘启动
#. 安装 ubuntu(linux)
    - 其它选项安装 -> 挂载目录(启动项与根目录的挂载盘保持一致) -> 重启
#. 设置启动项
    - win10 直接有启动选项
    - win7, win8 安装 easyBCD ，添加 ubuntu 启动项


系统崩溃处理
------------------
- 用启动盘进入 PE 或选择试用系统
- 进硬盘拷贝需要的文件
- 重装系统


启动盘制作工具
----------------
- Windows 单系统
    - Windows USB/DVD Download Tool（无 PE）
    - MediaCreationTool（无 PE）
    - WinPE（微 PE 、金狐 PE ）
- Linux 单系统
    - Universal USB Installer
- Windows&Linux 单系统
    - ultraISO(MBR)
- Windows&Linux 多系统，但每种系统不能有多个版本
    - WinSetupFromUSB
    - YUMI
    - XBoot
    - SARDU
- 多系统，多版本，UEFI&MBR
    - Easy2Boot
