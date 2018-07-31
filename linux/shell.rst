括号
------
- 新开一个子进程执行 shell
- 子进程内对变量进行的修改，不会被同步到其它进程
- ``(date;sleep 5);(date;sleep 10);date``


source
-------
- 将配置信息加载到 session 的环境变量中
- 可以使用符号 "." 取代 "source" 关键字