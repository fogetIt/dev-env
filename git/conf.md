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
```bash
# 初始化文件夹，生成./.git/
git init
# 读取工作环境变量
git config --list
: "配置用户
默认           对当前项目有效      ./.git/config
[--global]    适用用户全局         ～/.gitconfig
[--system]    适用系统中所有用户    /etc/gitconfig
"
git config --global user.name "..."
git config --global user.email "..."
# 忽略文件权限(Linux/Win)
git config --global core.filemode false
# 设置编辑器
git config --global core.editor vim.exe
# 让 Git 显示颜色
git config --global color.ui true
# 配置别名
# 修改配置文件～/.gitconfig [alias]...
git config --global alias.st status             # git st==git status
git config --global alias.unstage 'reset HEAD'  # git unstage ...
git config --global alias.last 'log -1'         # git last显示最后一次提交信息
```

##### 自定义
```bash
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

设置premiary邮箱接收邮件
设置Backup邮箱修改密码