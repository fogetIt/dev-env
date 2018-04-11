### vim配置文件（Linux）
- 全局
    + centOS—————/etc/vimrc
    + Ubuntu—————/etc/vim/vimrc
    + Windows————$VIM/_vimrc
- 用户————~/.vimrc

##### 中文帮助
- http://prdownloads.sourceforge.net/vimcdoc/vimcdoc-1.7.0-setup.exe?download
- 安装在$VIM/vimfiles

##### vi模式
- 不能使用小键盘和方向键
- 在编辑模式下，移动光标会变成A B C D等字符并换行

##### vundle插件管理
- Plugin '用户名/插件名' 
    + github插件，默认用户名vim-scripts
- Plugin 'git地址'
    + 非github插件
- vundle命令
    + :BundleList————列举出.vimrc中配置的所有插件
    + :BundleInstall————安装插件（先添加Plugin）
    + :BundleInstall!————更新插件
    + :BundleSearch foo————查找foo插件
    + :BundleSearch! foo————刷新foo插件缓存
    + :BundleClean————清除插件（先注释掉Plugin）
    + :BundleClean!————清除插件