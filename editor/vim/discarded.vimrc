hi StatusLine guifg=SlateBlue guibg=Yellow  " 当前窗口状态行
hi StatusLineNC guifg=Gray guibg=White      " 非当前窗口状态行
" 状态行显示内容
set statusline=%F%m%r%h%w\ \ \ \ %{strftime(\"%y\-%d\-%m\ %H:%M\")}\ \ \ \ %{&ff},%Y\ \ \ \ %l,%v(%p%%)


"=========
" 安装插件
"=========
filetype off

if has("win32")
    autocmd! bufwritepost _vimrc source $VIM\_vimrc
    set rtp+=$VIM/vimfiles/bundle/vundle
else
    autocmd! bufwritepost .vimrc source ~/.vim  " 修改配置文件后，无需重启
    set rtp+=~/softwares/plugins/Vundle         " Vundle的路径
endif



call vundle#rc()       " 插件安装路径（全局）
" call vundle#begin()  " 插件安装路径

Plugin 'gmarik/Vundle.vim'

"-----------------------
" 在工程中快速查找(支持正则)
"-----------------------
Plugin 'grep.vim'
nnoremap <silent> <F3> :Grep<CR>
" 光标定位到要查找的内容上，F3

"-------------
" 浏览文件和目录
"-------------
Plugin 'scrooloose/nerdtree'
let g:NERDTree_title='NERDTree'
let g:NERDTreeWinPos='left'
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=0   " 打开文件时不关闭树
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '★'
let g:NERDTreeDirArrowCollapsible = '☆'
function! NERDTree_Start()   " 执行一个退出命令，关闭自动出现的窗口
    exe 'q'
    exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
map <F6> :NERDTreeToggle<CR>
map <F7> :NERDTreeMirror<CR>
" o————打开关闭文件或者目录
" t————在标签页中打开
" T————在后台标签页中打开
" !————执行此文件
" p————到上层目录
" P————到根目录
" K————到第一个节点
" J————到最后一个节点
" u————打开上层目录
" m————显示文件系统菜单（添加、删除、移动操作）
" ?————帮助
" q————关闭
"---------
" 多窗口管理
"---------
Plugin 'winmanager'
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='NERDTree|FileExplorer'
let g:winManagerWidth=30
nmap wm :WMToggle<CR>
" wm，出现窗口
"--------
" 主题插件
"--------
Plugin 'tomasr/molokai'
Plugin 'jpo/vim-railscasts-theme'
colorscheme railscasts    " 配色方案（colo）
set background=dark       " 背景色方案：light/dark
"-------------
" 状态栏增强展示
"-------------
Plugin 'Lokaltog/vim-powerline'
let g:Powline_symbols='fancy'
"----------------
" 状态栏显示Git分支
"----------------
Plugin 'tpope/vim-fugitive'
set statusline+=%{fugitive#statusline()}

call vundle#end()
filetype plugin indent on


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
syntax enable
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
