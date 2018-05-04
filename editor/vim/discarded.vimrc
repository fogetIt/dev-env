hi StatusLine guifg=SlateBlue guibg=Yellow  " 当前窗口状态行
hi StatusLineNC guifg=Gray guibg=White      " 非当前窗口状态行
" 状态行显示内容
set statusline=%F%m%r%h%w\ \ \ \ %{strftime(\"%y\-%d\-%m\ %H:%M\")}\ \ \ \ %{&ff},%Y\ \ \ \ %l,%v(%p%%)
set laststatus=2
" 0，不显示
" 1，窗口数大于1显示
" 2，总是显示
set ruler                   " 标尺（光标位置）
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

autocmd! bufwritepost .vimrc source ~/.vim  " 修改配置文件后，无需重启

" ====
" 插件
" ====
"-----------------------
" 在工程中快速查找(支持正则)
"-----------------------
Plugin 'grep.vim'
nnoremap <silent> <F3> :Grep<CR>
" 光标定位到要查找的内容上，F3


" -------------
" 多文件自动分屏
" -------------
Plugin 'minibufexpl.vim'
let g:miniBufExplMapWindowNavVim=1          " 鼠标双击，切换文件
let g:miniBufExplMapWindowNavArrow =1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
" MBEbn  打开前一个buffer
" MBEbp  打开后一个buffer
" ctrl+箭头键    切换到上下左右窗口中
" ctrl+h,j,k,l  切换到上下左右的窗口中
" -------
" python
" -------
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
"----------
" 高亮的书签
"----------
Plugin 'Visual-Mark'
" ctrl+F2————在光标处添加书签
" F2————在书签之间正向切换
" shift+F————反向切换
" 根据背景色风格，修改guibg的值，来设置书签的颜色
if &bg == "dark"
    highlight SignColor ctermfg=white ctermbg=blue guifg=wheat guibg=peru
else
    highlight SignColor ctermbg=white ctermfg=blue guibg=grey guifg=RoyalBlue3
endif
"----------
" 自动补全
"----------
Plugin 'AutoComplPop'        " 普通文件
let g:AutoComplPop_Behavior = {'c': [{'command' : "\\",'pattern' : ".",'repeat' : 0}]}
Plugin 'othree/html5.vim'    " html\css\javascript
Plugin 'css.vim'
Plugin 'javascript.vim'
Plugin 'Emmet.vim'
"-----------
" 自动补全
" 代码块可定制(~/.vim/snippets/*.snippets)
"-----------
Plugin 'snipMate'
"----------
" 增强Tab键
"----------
Plugin 'SuperTab'
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabDefaultCompletionType=2
let g:SuperTabDefaultCompletionType = "<C-A><C-U>"
" ------
" ctags
" ------
" 下载----解压----添加path环境变量----在需要浏览源码的目录下:ctags -R
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

" 调用ctags，补全C/C++
Plugin 'OmniCppComplete'
"set tags+=D:/ctags/tags/cpp
"set tags+=D:/ctags/tags/hge
"set tags+=D:/ctags/tags/curl
let OmniCpp_ShowScopeInAbbr=0
"0:缺省，补全提示菜单中匹配项所在域信息显示在缩略信息最后一列
"1:显示，并移除最后一列
let OmniCpp_GlobalScopeSearch= 1
"全局查找————0:禁止；1:允许(缺省)
let OmniCpp_NamespaceSearch=2
"命名空间查找————0:禁止；1:当前文件缓冲区；2:当前文件缓冲区和包含文件的命名空间
let OmniCpp_DisplayMode=1
"类成员显示控制(是否显示全部public、private、protected成员)
"0:自动；1:显示所有
let OmniCpp_ShowAccess=1
"是否显示访问控制信息('+', '-', '#')
"0/1，缺省为1(显示)
let OmniCpp_LocalSearchDecl=0
"0/1(Vim标准查找/本地(local)查找函数)
"Vim标准查找变量定义的函数需要函数括号位于文本的第一列，而本地查找函数不需要
let OmniCpp_ShowPrototypeInAbbr=1
"补全提示缩略信息中是否显示函数原型
"0:不显示(缺省)；1:显示
let OmniCpp_MayCompleteDot=1
"在'.'号后是否自动给出提示信息。0/1，缺省为1
let OmniCpp_MayCompleteArrow=1
"在'->'后是否自动给出提示信息。0/1，缺省为1
"let OmniCpp_MayCompleteScope=1"
"在域标识符'::'后是否自动给出提示信息。0/1, 缺省为0
"let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
"默认命名空间列表，项目间使用','隔开
let OmniCpp_SelectFirstItem=2
"自动选择第一个匹配项，仅当'completeopt'不为'longest'时有效
"0:不选择(缺省)；1:选择并插入到光标位置；2:选择但不插入光标位置
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"自动关闭补全窗口
highlight Pmenu guibg=darkgrey  guifg=black
"所有项的配色
highlight PmenuSel guibg=lightgrey guifg=black
"选中项的配色


if has("gui_running")
    "set go="                     " 不要图形按钮
    set guioptions-=T             " 要不要工具栏
    set guioptions=m              " 要不要菜单栏
    set guioptions-=l             " 要不要左侧滚动条
    set guioptions+=r             " 要不要右侧滚动条
    "set guioptions-=b            " 隐藏底部滚动条
    "set showtabline=0            " 隐藏Tab栏
    set clipboard+=unnamed        " 共享剪贴板
    set t_Co=256                  " 开启256颜色支持
    if has("win32")
        colorscheme torte         "torte配色方案
        set guifont=Consolas:h13  "字体和大小
        set lines=25 columns=108  "窗口大小
        winpos 350 235            "窗口位置
    endif
endif
"-----------------
" 最近访问的文件列表
"-----------------
Plugin 'mru.vim'
nmap m :MRU<CR>                             " :m==:MRU
"let MRU_File=$VIM.'\Data\mru_files.txt'"   " 记录历史文件的位置
let MRU_Exclude_Files='^/test/.*|^/.pyc'    " 设置默认不包含哪些文件，默认空
"let MRU_Include_Files='.c$|.h$'"           " 设置默认只包含哪些文件，默认空
let MRU_Max_Entries=50                      " 记录的条数，默认100
let MRU_Max_Submenu_Entries=15
" MRU窗口默认子菜单显示多少条记录，默认10
let MRU_Window_Height=10                    " MRU窗口的高度，默认8
let MRU_Use_Current_Window=1
" 在本窗口打开最近文件列表，而不是新的窗口
let MRU_Auto_Close=1                        " 选择文件后，关闭MRU窗口(0/1)

" ========================================================================


source $VIMRUNTIME/ftplugin/man.vim               "man.vim————vim内置插件
nmap m:Man <cword>><cr>
                                                  "查看光标下函数
filetype plugin indent on

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
" 自动补齐
:inoremap ( () <ESC>
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>} <ESC> o
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC> i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " "" <ESC>i
:inoremap ' '' <ESC>i
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction
" 补全html标签
autocmd BufNewFile *  setlocal filetype=html
inoremap > <ESC>:call InsertHtmlTag()<CR>a<CR><CR><ESC>ka
function! InsertHtmlTag()
    let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
    normal! a>
    let save_cursor = getpos('.')
    let result = matchstr(getline(save_cursor[1]), pat)
    "if (search(pat, 'b', save_cursor[1]) && searchpair('<','','>','bn',0,  getline('.')) > 0)
    if (search(pat, 'b', save_cursor[1]))
        normal! lyiwf>
        normal! a</
        normal! p
        normal! a>
    endif
    :call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
endfunction

filetype indent on                        "针对不同的文件采用不同的缩进方式
"==========
" filetype
"==========
filetype plugin on                " 载入文件类型插件
filetype on                       " 检测文件类型

syntax on                         " 语法高亮
" 高亮字符
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white

"match OverLength '\%101v.*'               "不受100列限制
set viminfo+=!                            "保存全局变量
set formatoptions=tcrqn                   "自动格式化
set backspace=2                           "使回格
set whichwrap+=<,>,h,l                    "允许backspace 和光标键跨越行边界
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:
                                          "输入:set list命令显示

set foldenable                           "允许折叠
set foldmethod=manual                    "手动折叠（syntax/manual）
"set foldmethod=indenti
set foldlevel=100                        "折叠级别：启动时不要自动折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                                        "空格键折叠
set autochdir
set completeopt=menu,longest,menuone

" 设定默认解码
if has("multi_byte")
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1   "依次尝试自动判断编码
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
        set ambiwidth=double
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte
endif

nmap <C-F5> :w!<CR>:!python %<CR>          "python编译（lookupfile快捷键是F5）
"cd C:\Users\D\Desktop\demo"
au InsertLeave *.py write                 "退出插入模式（Esc）时自动保存py文件


map <F4> :call CompileRunGcc()<CR>        "C的编译和运行
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
"exec '!%<'"
exec "!./%<"
endfunc
set cindent                               "C/C++自动对齐
