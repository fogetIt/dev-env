#### .gitignore
- 忽略特殊文件
    + 必须把某些文件放到Git工作目录中，但又不能提交它们
    + 避免每次git status都会显示Untracked files ...
    + 忽略文件的原则
        * 操作系统自动生成的文件（缩略图等）
        * 编译生成的中间文件、可执行文件等（.class、.pyc等）
        * 带有敏感信息的配置文件（存有口令、数据库密码等）
- [GitHub忽略各种配置文件示例](https://github.com/github/gitignore)
- 把.gitignore也提交到Git
- 检验————git status>>>>>working directory clean

#### .gitignore格式规范

|符号           |含义    |
|:-------------|:------|
|`#`           |注释    |
|shell正则表达式|模式匹配|
|`/`结尾        |忽略目录|
|`!`           |取反    |


```
.idea

# 除test.a文件以外的.a或.o文件
*.[oa]
!test.a

# Windows
Thumbs.db

# Windows自动在有图片的目录下生成隐藏的缩略图文件
ehthumbs.db

# 自定义目录下生成的Desktop.ini文件
Desktop.ini

# Python build
*.py[cod]
dist
*.so
*.egg
*.egg-info
build
```

##### .gitignore无效
- 无效原因
    + 对应的目录或者文件已经被git跟踪，此时再加入.gitignore后就无效了
- 解决办法
    + 先执行 git rm -r --cached xxx
    + 再重新加入.gitignore文件