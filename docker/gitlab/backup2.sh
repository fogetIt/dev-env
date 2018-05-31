#!/bin/bash
# @Date:   2017-05-05 12:52:00
# @Last Modified time: 2017-05-08 18:19:15
echo "" | sudo -S echo "start"
REMOTE_USER=""
REMOTE_HOST=""
REMOTE_PATH=""
REMOTE_PASSWORD=""

if [[ ! ${1} ]]; then
    # 编写定时任务
    cat /etc/crontab | grep "0 23 \* \* \* root $(pwd)/backup.sh run" || \
        echo "0 23 * * * root $(pwd)/backup.sh run" | sudo tee -a /etc/crontab
    sudo service cron restart
elif [ ${1} == "backup" ]; then
    sudo rm -rf "${HOME}/gitlabackups"
    expect -c "
    spawn scp -r "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}" ${HOME}/
    expect \"password:\"
    send \"${REMOTE_PASSWORD}\r\"
    expect eof
    "
fi