" 下载ctags----解压----添加path环境变量----在需要浏览源码的目录下:ctags -R
" 用Vim打开文件，Ctrl+]跳到变量或函数定义的源文件中，Ctrl+t返回
set tags=tags
"set tags=/home/chen_guannan/apq8084/tags"
"set tags+=/usr/include/c++/tags"
"set tags+=/usr/include/tags"

" 下载cscope----解压----添加path环境变量----在需要浏览源码的目录下:cscope -Rbkq
" R————递归所有子目录里的文件，建立索引
" b————仅建立符号数据库，不启动自带的用户界面
" q————生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
" k————在生成索引文件时，不搜索/usr/include目录
" F9————在当前工作目录生成tags
nmap <F9> :call RunShell("Generate tags","ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .)<CR>
" F10————在当前工作目录生成cscope.out并添加
nmap <F10> :call RunShell("Generate cscope", "cscope -Rbkq")<CR>:cs add cscope.out<CR>

function! RunShell(Msg, Shell)
    echo a:Msg . '...'
    call system(a:Shell)
    echon 'done'
endfunction


" 列出当前文件所有宏、全局变量、函数名等(依赖ctags)
Plugin 'taglist.vim'
nmap  <F8> :TlistToggle<CR>        " 显示/消失(F8/:Tlist)
" let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1          " 只显示当前文件的tag
let Tlist_Exit_OnlyWindow=1        " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1       " 在右侧显示taglist窗口
let Tlist_WinWidth=40              " 设置taglist宽度
let Tlist_Enable_Fold_Colume=0     " 不要显示折叠树


Plugin 'genutils'
" 提供了一些通用的函数，供其它脚本使用
Plugin 'lookupfile'
" 文件查找(依赖ctags和genutils）
" 默认使用ctags产生的tag来查找，效率很低
" lookupfile.sh放置在要操作的工作目录中即可
" Ctrl+n/Ctrl+p----向上/下，Enter进入
"let g:LookupFile_TagExpr='自己的filenametags路径'
let g:LookupFile_MinPatLength = 2               "输入2个字符开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
let g:LookupFile_SortMethod = ""                "关闭对搜索结果的字母排序

"按下F11自动生成filenametags文件
nmap <F11> :call RunShell("Generate filename tags", "source /home/chen_guannan/apq8084/lookupfile.sh")<cr>


" 依赖cscope，比ctags更高级
Plugin 'cscope.vim'
"set cscopequickfix=s-,c-,d-,i-,t-,e         "让查找结果显示在quickfix窗口而不是主窗口
" 定义cscope快捷键
Plugin 'simplyzhao/cscope_maps.vim'
if has("cscope")
    set csprg=/usr/bin/cscope      "指定用来执行 cscope 的命令
    set csto=1                     "先搜索tags标签文件，再搜索cscope数据库
    set cst                        "使用|:cstag|(:cs find g)，而不是缺省的:tag
    set nocsverb                   "不显示添加数据库是否成功
    if filereadable("cscope.out")
        cs add cscope.out          "添加cscope数据库
    endif
    set csverb                     "显示添加成功与否
    endif
"nmap <leader>sa :cs add cscope.out<CR>
"输入sg查找函数，宏定义
"nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
"输入sc查找调用本函数的函数
"nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
"输入st查找指定的字符串
"nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
"输入se相当于egrep功能
"nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
"查找并打开文件
"nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"查找包含本文件的文件
"nmap <leader>si :cs find i <C-R>=expand("<cfile>")<CR><CR>
"查找本函数调用的函数
"nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
"所选代码块对齐方式：从光标处V，G，然后＝
