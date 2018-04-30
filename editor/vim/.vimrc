set nocp                          " nocompatible vi
if has('mouse')
    set mouse=a                   " 在 buffer 的任何地方使用鼠标
endif
"========
" window
"========
set selection=exclusive
set selectmode=mouse,key
set scrolloff=3                   " 光标与 buffer 顶部/底部距离
set noerrorbells                  " 不发出滴滴声
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
set nu!                           " 显示行号
" set nonu!
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
set expandtab                     " Tab -> space
" set noexpandtab
set tabstop=4                     " Tab == 4 space
set shiftwidth=4                  " 自动对齐空格数
set softtabstop=4                 " 退格键一次删除4个空格
set smarttab                      " 在行和段开始处使用制表符
set ai                            " autoindent 继承前一行缩进
set si                            " smartindent 智能缩进
"========
" search
"========
set ignorecase                    " 搜索时忽略大小写
set incsearch                     " 搜索时逐字高亮
" set noincsearch
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
set statusline=%F%m%r%h%w\ \ \ \ %{strftime(\"%y\-%d\-%m\ %H:%M\")}\ \ \ \ %{&ff},%Y\ \ \ \ %l,%v(%p%%)

if has("autocmd")
    autocmd InsertLeave * se nocul                " 用浅色高亮当前行
    autocmd InsertEnter * se cul                  " 用浅色高亮当前行
    augroup vimrcEx
    au BufRead,BufNewFile *.{md,mkd} set ft=mkd   " markdown配置
    au BufRead,BufNewFile *.conf set ft=nginx     " nginx文件配置
    "复制${nginx}\contrib\vim\*到${Vim}\vimfiles下
    augroup END
endif