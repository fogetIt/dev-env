##### ssh clone远程克隆

|步骤    |操作                                |
|:------|:----------------------------------|
|生成密钥|ssh-keygen -t rsa -C "...@..."     |
|       |公钥（路径、文件名可改）~\.ssh\id_rsa.pub|
|       |私钥（路径、文件名可改）~\.ssh\id_rsa    |
|使用密钥|git站点----settings----Addsshkey    |
|       |复制公钥的内容，粘贴到key内容框中       |
|       |Title框随意填写，只要不重复即可         |

git clone `<address>`

Git支持https、ssh协议，通过ssh支持的原生git协议速度最快。

当你从远程仓库克隆时，实际上Git自动把本地的master分支和远程的master分支对应起来了，并且，远程仓库的默认名称是origin。

#### 推送分支————把该分支上的所有本地提交推送到远程库（after add、commit）
- git push origin ×××
- 推送时，要指定本地分支，这样，Git就会把该分支推送到远程库对应的远程分支上。
- 推送失败，因为你的小伙伴的最新提交和你试图推送的提交有冲突，解决办法也很简单，Git已经提示我们，先用git pull把最新的提交从origin/dev抓下来，然后，在本地合并，解决冲突，再推送。

不带任何参数的git push，默认只推送当前分支，这叫做simple方式。此外，还有一种matching方式，会推送所有有对应的远程分支的本地分支。

如果要修改这个设置，可以采用git config命令。

- git config --global push.default matching
- git config --global push.default simple

还有一种情况，就是不管是否存在对应的远程分支，将本地的所有分支都推送到远程主机，这时需要使用–all选项。

git push --all origin


#### 远程仓库

|git remote                     |不带参数，列出远程分支                |
|:------------------------------|:---------------------------------|
|git remote -v(--verbose)       |列出远程分支详细信息：[shortname][url]|
|git remote show origin         |显示远程信息                        |
|gitremoterm`<主机名>`           |删除远程主机                        |
|git remote add origin [xxx.git]|本地仓库对应一个远程仓库              |
|                               |                                  |
|git branch -a                  |查看远程分支                        |
|git push origin --delete ...   |删除远程分支                        |


##### 从远程仓库抓取数据到本地
git fetch [remote-name]
此命令会到远程仓库中拉取所有你本地仓库中还没有的数据。运行完成后，你就可以在本地访问该远程仓库中的所有分支，将其中某个分支合并到本地，或者只是取出某个分支，一探究竟。
现在可以用字串 pb 指代对应的仓库地址了.比如说,要抓取所有 Paul 有的,但本地仓库没有的信息,可以运行git fetch pb
