" python插件
"Plugin 'klen/python-mode'
Plugin 'pydoc.vim'                  " python文档
Plugin 'rkulla/pydiction'           " Tab补全
"let g:pydiction_location = '$Vim/vimfiles/bundle/pydiction/complete-dict
"let g:pydiction_menu_height=20     " 设置弹出菜单的高度，默认是15
Plugin 'python.vim'                 " 识别python语法
set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python
Plugin 'PyCQA/pyflakes'             " python语法检查
Plugin 'python_fold'                " python自动折叠
"zo————打开光标位置的折叠代码
"zc————折叠光标位置的代码
"zr————将文件中所有折叠的代码打开
"zm————将文件中所有打开的代码折叠
"zR————作用和 zr 类似，但会打开子折叠（折叠中的折叠）
"zM————作用和 zm 类似，但会关闭子折叠
"zi————折叠与打开操作之间的切换命令
