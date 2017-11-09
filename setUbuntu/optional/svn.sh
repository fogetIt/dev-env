#!/bin/bash
# @Date:   2017-04-05 15:18:26
# @Last Modified time: 2017-07-07 10:16:55
svn --version --quiet
if [ $? != 0 ]; then
    echo $USER_PASSWD | sudo -S \
        apt-fast -y install subversion
fi