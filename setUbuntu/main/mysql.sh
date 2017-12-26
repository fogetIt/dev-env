#!/bin/bash
# @Date:   2017-05-09 20:51:14
# @Last Modified time: 2017-12-26 16:06:37
echo $user_password | sudo -S echo -e "\033[1;;42m\n\033[0m"

mysql --version
if [ $? != 0 ]; then
    sudo apt-get -y install mysql-server mysql-client
fi

: "mysql -u root -p
jetbrains-->CTRL+E-->Database-->下载驱动包-->+Data Source
或者mysql-workbench-community(官网)
"
