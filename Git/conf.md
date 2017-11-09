### 版本控制系统
- 跟踪文本文件的改动（.txt、网页、程序代码等等），显示每次的改动
- 二进制文件(`图片、视频、Microsoft Word`)
    + 只能把二进制文件每次改动串起来(比如图片从100KB改成了120KB)
    + 版本控制系统不知道到底改了什么，没法跟踪文件的变化

#### PATH
- ${git}\cmd;
- ${git}\bin;
- ${git}\libexec\git-core;

#### 配置工作环境
- 初始化git文件夹，生成./.git/
    + git init
- 读取工作环境变量
    + git config --list
- 配置工作环境变量
    + git config
        * 作用范围(下级覆盖上级)
            ```
            默认           对当前项目有效      ./.git/config
            [--global]    适用用户全局         ～/.gitconfig
            [--system]    适用系统中所有用户    /etc/gitconfig
            ```
        * 自报家门(`必须`，会随着提交更新内容一起被纳入历史记录)
            ```
            user.name "..."
            user.email "..."
            ```
        * 忽略文件权限(Linux/Win)
            ```
            core.filemode false
            ```
        * 配置别名
            ```
            alias.st status               git st==git status
            alias.unstage 'reset HEAD'    git unstage ...
            alias.last 'log -1'           git last显示最后一次提交信息
            修改配置文件～/.gitconfig
                [alias]
                ...
            ```
        * 设置编辑器
            ```
            core.editor vim.exe
            ```
        * 让Git显示颜色
            ```
            color.ui true
            ```

##### 自定义git lg
```shell
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```


设置premiary邮箱接收邮件
设置Backup邮箱修改密码