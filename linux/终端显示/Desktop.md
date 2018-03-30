### linux桌面环境

|      桌面环境/窗口管理器     |  RAM   | CPU |       类型      |
|------------------------------|--------|-----|-----------------|
| KDE 4.6                      | 363 MB | 4%  | 桌面环境        |
| Unity                        | 271 MB | 14% | 桌面环境(shell) |
| GNOME 3                      | 193 MB | 10% | 桌面环境        |
| GNOME 2.x                    | 191 MB | 1%  | 桌面环境        |
| XFCE 4.8                     | 144 MB | 10% | 桌面环境        |
| LXDE                         | 85 MB  | 10% | 桌面环境        |
| IceWM                        | 85 MB  | 2%  | 窗口管理器      |
| Enlightenment (E17 Standard) | 72 MB  | 1%  | 窗口管理器      |
| Fluxbox                      | 69 MB  | 1%  | 窗口管理器      |
| OpenBox                      | 60 MB  | 1%  | 窗口管理器      |
| JWM                          | 58 MB  | 1%  | 窗口管理器      |

### VMTools————支持与实体机之间文件拖动
- 点击虚拟机安装tools
- 从虚拟光驱解压
- ./vmware-install.pl

### gedit————一个GNOME桌面环境下兼容UTF-8的文本编辑器
简单实用，拥有漂亮的界面，支持语法高亮，比 Vim 更易上手。

### 系统字体
- 安装字体管理工具
    + yum install -y fontconfig mkfontscale
- 安装vmTools，从windows复制c:\windows\fonts\Consolas
- 拷贝
    + cp *.TTF /usr/share/fonts/Consolas/
- 建立字体缓存
    + cd /usr/share/fonts/Consolas/
    + chmod 755 *.TTF
    + mkfontscale
    + mkfontdir
    + fc-cache -fv
    + reboot
- Terminal->Edit->Profile Preferences

### 默认启动模式
- 命令行模式――――analogous to runlevel 3
    + systemctl set-default multi-user.target
- 图形模式――――analogous to runlevel 5
    + systemctl set-default graphical.target