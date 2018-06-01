gitlab 汉化版
=============
- [github][github]
- [gitlab-ce-zh][gitlab-ce-zh]

[github]: https://github.com/twang2218/gitlab-ce-zh
[gitlab-ce-zh]: https://hub.docker.com/r/twang2218/gitlab-ce-zh/
```bash
docker pull registry.cn-hangzhou.aliyuncs.com/lab99/gitlab-ce-zh
# 关闭设置了 --restart=always 启动的容器
docker stop gitlab & docker update --restart=no gitlab
# 添加/修改端口映射
docker commit gitlab gitlab:1.0 # 提交一个运行中的容器为镜像
docker run ...

docker-compose -f "$(pwd)/gitlab.yml" down
docker-compose -f "$(pwd)/gitlab.yml" up -d

# 停止、删除容器，并清除数据
docker rm -fv gitlab
```

管理
-----------------
```bash
: <<'COMMIT'
docker exec -it gitlab ...
COMMIT
# 查看服务状态
gitlab-ctl status
# 检查应用
gitlab-rake gitlab:check
gitlab-rake gitlab:env:info
# 重新加载配置
# gitlab-rake cache:clear
gitlab-ctl reconfigure
# 启动/关闭/重启服务
gitlab-ctl start
gitlab-ctl stop
gitlab-ctl restart
# 开机启动
systemctl enable gitlab-runsvdir.service
systemctl disable gitlab-runsvdir.service
# 生成备份数据
gitlab:backup:create --trace
```

##### ssh 端口占用
- gitlab 程序运行在实体机上
    - 对端口的使用是基于 openssh-server ，不会一直占用着端口
- gitlab 程序运行在 docker 里
    - 对端口的使用是基于 docker 监听端口，会一直占用着端口，与实体机的 openssh-server 抢夺端口占用

##### useage
- 管理员权限
    - 账号
        - 默认是 root，首次访问要重设管理员密码
        - 新密码登录系统后，可以修改管理员帐号名
    - 右上角 --> 扳手图标
        - 设置
            - 可见性与访问控制 -> 管理员通知邮箱
            - 登录限制 -> 开启注册（关闭）
            - 登录限制 -> 注册时发送确认邮件（暂时关闭）
        - 用户管理
            - 用户 -> 编辑 -> 权限
                - 项目限制（默认设为0,禁止创建新项目）
                - 是否可以创建群组、管理、外部
        - 项目（查看全部项目、销毁项目等）
- 创建项目
    - 创建群组项目
        - 群组 -> 新群组 -> 可见等级 -> 创建群组 -> 新项目
        - 授权
            - project -> members -> 增加用户到项目 -> 编辑群组成员
            - 每个项目有访客、报告者、开发者、主程序员
    - 创建个人项目
        - 新项目 -> 创建项目
        - 授权
            - project -> members -> 增加用户到项目 -> 编辑群组成员（访客、报告者、开发者、主程序员）
- 分支管理
    - 项目 -> project -> settings -> 保护分支（只允许主程序员/允许开发者推送）
- [角色](http://gitlab.***.com/help/permissions/permissions)