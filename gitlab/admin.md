### root
- 默认的管理员账号是 root
- 首次访问 GitLab 要重新设置管理员的密码，设置成功后会返回登录界面
- 设置的新密码登录系统后，可以修改管理员帐号名

### 管理员权限
- 右上角---->扳手图标
    + 设置
        * 可见性与访问控制---->管理员通知邮箱
        * 登录限制---->开启注册（关闭）
        * 登录限制---->注册时发送确认邮件（暂时关闭）
    + 用户管理
        * 用户---->编辑---->权限
            - 项目限制（默认设为0,禁止创建新项目）
            - 是否可以创建群组、管理、外部
    + 项目（查看全部项目、销毁项目等）

### 创建项目
- 创建群组项目
    + 群组---->新群组---->可见等级---->创建群组---->新项目
    + 授权
        * project---->members---->增加用户到项目---->编辑群组成员
        * 每个项目有访客、报告者、开发者、主程序员
- 创建个人项目
    + 新项目---->创建项目
    + 授权
        * project---->members---->增加用户到项目---->编辑群组成员
        * 每个项目有访客、报告者、开发者、主程序员

### 分支管理
- 项目---->project---->settings---->保护分支
- 被保护分支默认只允许主程序员推送（可以选择允许开发者）

### 角色
http://gitlab.***.com/help/permissions/permissions

### gitlab服务器管理

|含义       |命令                                           |
|:---------|:---------------------------------------------|
|查看服务状态|sudo gitlab-ctl status                        |
|启动服务   |sudo gitlab-ctl start                         |
|关闭服务   |sudo gitlab-ctl stop                          |
|重启服务   |sudo gitlab-ctl restart                       |
|重新加载配置|sudo gitlab-ctl reconfigure                   |
|开机启动   |sudo systemctl enable gitlab-runsvdir.service |
|禁止开机启动|sudo systemctl disable gitlab-runsvdir.service|