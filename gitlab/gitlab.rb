#!/usr/bin/ruby
# @Date:   2017-05-03 09:15:57
# @Last Modified time: 2017-05-19 09:20:45
#
# sudo -e /etc/gitlab/gitlab.rb
# *************************************************************
# ......
#
# 配置域名
external_url 'http://gitlab.***.com'

# 配置邮件服务器
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.163.com"
gitlab_rails['smtp_port'] = 25
gitlab_rails['smtp_user_name'] = "xxx@163.com"
gitlab_rails['smtp_password'] = "xxx"
gitlab_rails['smtp_domain'] = "163.com"
gitlab_rails['smtp_authentication'] = :login
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['gitlab_email_from'] = "xxx@163.com"
user["git_user_email"] = "xxx@163.com"

# 开启备份（配合定时任务）
gitlab_rails['backup_path'] = "/var/opt/gitlab/backups"
# 备份保存时间，默认604800（1 week）
# 86400(1 day)、259200（3 day）
gitlab_rails['backup_keep_time'] = 259200
gitlab_rails['backup_archive_permissions'] = 0644
#
# ......
# *************************************************************
# sudo gitlab-ctl reconfigure