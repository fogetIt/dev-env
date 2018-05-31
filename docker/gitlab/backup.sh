#!/bin/bash
# @Date:   2017-04-28 15:44:04
# @Last Modified time: 2017-11-20 14:31:24
echo "" | sudo -S echo "start"

: <<'COMMIT'
# 定时任务命令和脚本中必须写绝对路径
sudo service cron stop
sudo service cron start

sudo gitlab-rake gitlab:backup:create [SKIP=db,uploads]
SKIP  忽略要备份内容
COMMIT

if [[ ! ${1} ]]; then
    # 编写定时任务
    cat /etc/crontab | grep "0 23 \* \* \* root $(pwd)/backup.sh run" || \
        echo "0 23 * * * root $(pwd)/backup.sh run" | sudo tee -a /etc/crontab
    sudo service cron restart
elif [[ ${1} == "run" ]]; then
    # 每天 23 点执行定时任务，备份脚本
    sudo gitlab-rake gitlab:backup:create
    # 开放权限给远程备份的主机
    sudo chmod -R 777 "${HOME}/gitlabackups"
fi
