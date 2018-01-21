##### 创建版本库
- 进入目录----git init
	+ 生成.git/————用来跟踪管理Git版本库
		* stage（或者index）————暂存区
	+ 自动创建master分支，以及指向master的一个指针HEAD
- git add filename/--all———————把文件修改添加到暂存区
- git commit -m "..."————把暂存区的所有内容提交到当前分支 

**需要提交的文件修改通通放到暂存区，然后，一次性提交暂存区的所有修改**  

##### git status
- 修改但没有add
	+ ...Changes not staged for commit:...
- add但没有commit
	+ ...Changes to be committed: ...  
- commit之后/修改之前
	+ nothing to commit 

##### 查看difference
git diff `<file>`

##### 删除文件  
1. 删除文件
	+ git rm <file>
2. 添加/更新git文件跟踪
	+ git add filename/--all 
3. 提交
	+ git commit

##### 恢复误删
git checkout --`<file>`


##### log

|git log                 |查看提交历史（近---->远）|
|:-----------------------|:--------------------|
|git log --pretty=oneline|一行显示              |
|git reflog              |查看命令历史           |
|git log --graph         |查看分支合并情况       |

git log --graph --pretty=oneline --abbrev-commit


##### reset

|git reset                 |回退                  |
|:-------------------------|:--------------------|
|git reset --hard HEAD^    |回退到上一个           |
|git reset --hard commit_id|gitlog可查到commit_id |


- git checkout -- file	工作区的修改全部撤销，让这个文件回到最近一次git commit或git add时的状态。
- git reset HEAD file	可以把暂存区的修改撤销掉（unstage），重新放回工作区。