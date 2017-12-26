set nocp                          " 不兼容vi模式(nocompatible)
if has('mouse')
    set mouse=a                   " 在buffer的任何地方使用鼠标
endif
"========
" window
"========
set selection=exclusive
set selectmode=mouse,key
set scrolloff=3                   " 光标与buffer顶部/底部距离
set noerrorbells                  " 不让vim发出滴滴声
set laststatus=2                  " 0，不显示；1，窗口数>1显示；2，显示
set shortmess=atI                 " 不显示援助乌干达儿童的提示
set splitbelow                    " 屏幕分割布局
"======
" file
"======
set autoread                      " 自动加载已修改的文件
set autowriteall                  " 切换文件时，自动保存
au FocusLost * silent! wa         " 丢失焦点时自动保存
set confirm                       " 在处理未保存或只读文件，弹出确认
set nobackup                      " 不产生~备份文件
set noswapfile                    " 不产生.swp临时文件
"========
" prompt
"========
set nu!                           " 显示行号/nonu
set cursorline                    " 突出当前行
set cursorcolumn                  " 突出当前列
set ruler                         " 标尺(显示光标位置的行号和列号)
set cmdheight=2                   " 命令行高度
set showcmd                       " 在命令行显示正在输入的命令
set history=50                    " 命令行历史记录条
"======
" edit
"======
set wrap                          " 自动换行/nowrap
set iskeyword+=_,$,@,%,#,-        " 不被换行分割的单词符号
set expandtab                     " Tab键自动转换空格/noexpandtab
set tabstop=4                     " Tab键缩进空格数
set shiftwidth=4                  " 自动对齐空格数
set softtabstop=4                 " 退格键一次删除4个空格
set smarttab                      " 在行和段开始处使用制表符
set ai                            " 自动缩进————继承前一行（autoindent）
set si                            " 智能缩进（smartindent）
"========
" search
"========
set ignorecase                    " 搜索时忽略大小写
set incsearch                     " 搜索时逐字高亮/noincsearch
set showmatch                     " 高亮显示匹配的括号
set matchtime=5                   " 括号高亮时间(单位:0.1s)

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\, stl:\,stlnc:\

" 右下角显示光标的行列信息
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\　%p%%%)

" 当前窗口/非当前窗口状态行(highlight)
hi StatusLine guifg=SlateBlue guibg=Yellow
hi StatusLineNC guifg=Gray guibg=White

" 状态行显示内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"=========
" 安装插件
"=========
filetype off

if has("win32")
    autocmd! bufwritepost _vimrc source $VIM\_vimrc
    set rtp+=$VIM/vimfiles/bundle/vundle
else
    autocmd! bufwritepost .vimrc source ~/.vim  " 修改配置文件后，无需重启
    set rtp+=~/USER_SOFTWARES/plugins/Vundle         " Vundle的路径
endif
call vundle#rc()       " 插件安装路径（全局）
" call vundle#begin()  " 插件安装路径

"----------------------------
" 使用Vundle来管理（更新）Vundle
"----------------------------
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

" call vundle#end()
filetype plugin indent on

if has("autocmd")
    autocmd InsertLeave * se nocul                " 用浅色高亮当前行
    autocmd InsertEnter * se cul                  " 用浅色高亮当前行
    augroup vimrcEx
    au BufRead,BufNewFile *.{md,mkd} set ft=mkd   " markdown配置
    au BufRead,BufNewFile *.conf set ft=nginx     " nginx文件配置
    "复制${nginx}\contrib\vim\*到${Vim}\vimfiles下
    augroup END
endif