#!/bin/bash
# @Date:   2017-05-09 20:51:14
# @Last Modified time: 2017-08-08 17:15:28

mysql --version
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        apt-get -y install mysql-server mysql-client
fi

: "mysql -u root -p
jetbrains-->CTRL+E-->Database-->下载驱动包-->+Data Source
或者mysql-workbench-community(官网)
"
