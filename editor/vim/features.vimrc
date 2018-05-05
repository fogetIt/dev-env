"-----------------------
" 在工程中快速查找(支持正则)
"-----------------------
Plugin 'grep.vim'
nnoremap <silent> <F3> :Grep<CR>
" 光标定位到要查找的内容上，F3


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
" ctrl+F2  在光标处添加书签
" F2       正向切换书签
" shift+F  反向切换书签
" 根据背景色风格，设置书签的颜色
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
let g:SuperTabDefaultCompletionType="<C-A><C-U>"


function! RunShell(Msg, Shell)
    echo a:Msg . '...'
    call system(a:Shell)
    echon 'done'
endfunction


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

" ========================================================================

if has("gui_running")
    "set go="                     " 不要图形按钮
    set guioptions-=T             " 要不要工具栏
    set guioptions=m              " 要不要菜单栏
    set guioptions-=l             " 要不要左侧滚动条
    set guioptions+=r             " 要不要右侧滚动条
    "set guioptions-=b            " 隐藏底部滚动条
    "set showtabline=0            " 隐藏 Tab 栏
    set clipboard+=unnamed        " 共享剪贴板
    set t_Co=256                  " 开启 256 颜色支持
    if has("win32")
        colorscheme torte         " torte 配色方案
        set guifont=Consolas:h13  " 字体和大小
        set lines=25 columns=108  " 窗口大小
        winpos 350 235            " 窗口位置
    endif
endif



source $VIMRUNTIME/ftplugin/man.vim               "man.vim————vim内置插件
nmap m:Man <cword>><cr>                           "查看光标下函数
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
