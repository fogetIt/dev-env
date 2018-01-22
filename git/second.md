git config --list(-l)	查看用户（在特定当前项目目录，看到的是当前，其它目录是全局）  

#### 1. 取消git的全局设置  
- git config --global --unset user.name  
- git config --global --unset user.email  

#### 2. 针对每个项目，单独设置用户名和邮箱
- git init  
- git config user.name "your_name"  
- git config user.email "your_email"  

#### 3. SSH配置
ssh-keygen -C "your_email" -t rsa  
在第二个账户存储密钥时：  
Enter file in which to save the key(/c/Users/D/.ssh/id_rsa):/c/Users/D/.ssh/id_rsa_person  
第一次远程克隆时会生成host（名为known_hosts的文件）  
用第二个账户时known_hosts会添加ssh-rsa  

#### 4. 访问账户对应的网址，添加ssh key（titie自定义，内容为对应的rsa公钥）

#### 5. 配置config
