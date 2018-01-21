|命令                      |含义                                        |
|:------------------------|:------------------------------------------|
|git checkout -b dev      |                                           |
|相当于                    |                                           |
|git branch dev           |创建dev分支                                 |
|git checkout dev         |切换到dev分支                               |
|                         |                                           |
|git branch               |列出所有分支，当前分支前面会标一个*号            |
|git branch -d dev        |删除dev分支                                 |
|                         |                                           |
|git merge xxx            |合并（指定分支）到当前分支上                     |
|                         |默认用Fastforward模式(删除分支后，会丢掉分支信息)|
|                         |--no-ff参数，表示禁用Fastforward              |
|git rebase xxx           |拉取xxx分支的最新信息，解决冲天，合成新的xxx分支   |
|                         |                                           |
|git stash                |把当前工作现场“储藏”起来，先干别的事             |
|git stash list           |查看Git把stash内容存在某个地方                |
|git stash apply stash@{0}|恢复之前工作，但是恢复后，stash内容并不删除       |
|git stash drop stash@{0} |删除stash内容（恢复后）                        |
|git stash pop            |恢复的同时把stash内容也删了                   |

```shell
git merge --no-ff -m "merge with no-ff" dev
```

##### 分支管理策略
- master————稳定、生产
- dev————不稳定，开发到某个时候，再把dev分支合并到master上
- 每个bug都可以通过一个新的临时分支来修复，修复后，合并分支，然后将临时分支删除

##### 标签————版本库的一个快照
- 发布一个版本————在版本库中打一个标签，就唯一确定了打标签时刻的版本
- Git标签虽然是版本库的快照，但其实它就是指向某个commit的指针
- 分支可以移动，标签不能移动，所以，创建和删除标签都是瞬间完成的

|命令                        |含义         |
|:--------------------------|:-----------|
|git tag                    |查看所有标签  |
|git tag `<tagname>`        |添加标签     |
|git show                   |查看标签信息  |
|git tag -d `<tagname>`     |删除标签     |
|git push origin `<tagname>`|推送标签到远程|


|删除远程标签 |                               |
|:----------|:------------------------------|
|1.从本地删除|git tag -d v0.9                |
|2.从远程删除|git push origin :refs/tags/v0.9|