#!/bin/bash
# @Date:   2017-05-05 12:52:00
# @Last Modified time: 2017-05-08 18:19:15
psd="123zhang"
home="/home/zdd"
remote_usr=""
remote_psd=""
remote_home=""
remote_address=""

if [ ! $1 ]; then
    # 拷贝自身到家目录下
    cp -f $0 $home/remote_backup.sh
    chmod 777 $home/remote_backup.sh

    # 每天11点执行备份脚本
    echo $psd | sudo -S service cron stop
    echo "0 11 * * * root $home/remote_backup.sh backup" | sudo tee -a /etc/crontab
    echo $psd | sudo -S service cron start
elif [ $1 == "backup" ]; then
    echo $psd | sudo -S rm -rf $home/gitlab_backups

    expect -c "
    spawn scp -r $remote_usr@$remote_address:$remote_home/gitlab_backups/ $home/
    expect \"password:\"
    send \"${remote_psd}\r\"
    expect eof
    "
fi