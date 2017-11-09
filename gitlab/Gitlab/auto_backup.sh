#!/bin/bash
# @Date:   2017-04-28 15:44:04
# @Last Modified time: 2017-05-08 18:18:29
psd="123zhang"
# 定时任务命令和脚本中必须写绝对路径
home="/home/zdd"


if [ ! $1 ]; then
    # 拷贝自身到家目录下
    cp -f $0 $home/auto_backup.sh
    # cp -f ./$(basename $0) $home/auto_backup.sh
    chmod 777 $home/auto_backup.sh

    # 每天23点执行备份脚本
    echo $psd | sudo -S service cron stop
    echo "0 23 * * * root $home/auto_backup.sh backup" | sudo tee -a /etc/crontab
    echo $psd | sudo -S service cron start
    # sudo service cron restart
elif [ $1 == "backup" ]; then
    # 备份路径————gitlab_rails['backup_path']
    backup_path="/tmp/gitlab_backups"
    : '
    sudo gitlab-rake gitlab:backup:create [SKIP=db,uploads]
    SKIP———————忽略要备份内容
    '
    echo $psd | sudo -S gitlab-rake gitlab:backup:create

    # 拷贝备份到家目录，并开放权限给远程备份的主机
    echo $psd | sudo -S rm -rf  $home/gitlab_backups
    echo $psd | sudo -S cp -rf $backup_path $home/
    echo $psd | sudo -S chmod -R 777 $home/gitlab_backups
fi
