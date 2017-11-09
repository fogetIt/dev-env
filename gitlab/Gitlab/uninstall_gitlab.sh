#!/bin/bash
# @Date:   2017-04-26 17:11:17
# @Last Modified time: 2017-04-26 22:23:18
psd="123zhang"

# Stop gitlab and remove its supervision process
echo $psd | sudo -S gitlab-ctl uninstall
# uninstall
echo $psd | sudo -S dpkg -r gitlab-ce
echo $psd | sudo -S apt-get remove gitlab
echo $psd | sudo -S apt-get remove gitlab-ce
echo $psd | sudo -S apt-get purge gitlab
echo $psd | sudo -S apt-get purge --auto-remove gitlab
echo $psd | sudo -S apt-get remove --auto-remove gitlab
echo "Y" | sudo apt autoremove gitlab-ce

echo $psd | sudo -S rm -rf /etc/gitlab
echo $psd | sudo -S rm -rf /opt/gitlab
echo $psd | sudo -S rm -rf /etc/apt/sources.list.d/gitlab*

# restart machine