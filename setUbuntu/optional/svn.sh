#!/bin/bash
# @Date:   2017-04-05 15:18:26
# @Last Modified time: 2017-12-26 16:06:22
svn --version --quiet
if [ $? != 0 ]; then
    echo $user_password | sudo -S \
        apt-fast -y install subversion
fi