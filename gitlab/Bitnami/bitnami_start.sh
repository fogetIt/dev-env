#!/bin/bash
# @Date:   2017-04-26 09:09:42
# @Last Modified time: 2017-04-26 09:11:44
#
# su root

cd /opt/gitlab-8.14.0-0

# 服务端 启动Gitlab
./ctlscript.sh start

# 查看GUI管理控制台
./manager-linux-x64.run