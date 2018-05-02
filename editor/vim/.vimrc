set nocp                    " nocompatible vi
set fileformat=unix
if has('mouse')
    set mouse=a             " 在 buffer 的任何地方使用鼠标
endif
" =======
" window
" =======
set selection=exclusive
set selectmode=mouse,key
set scrolloff=3             " 光标与 buffer 顶部/底部距离
set noerrorbells            " 不发出滴滴声
set shortmess=atI           " 不显示援助乌干达儿童的提示
set splitbelow              " 屏幕分割布局
" =====
" file
" =====
set autoread                " 自动加载已修改的文件
set autowriteall            " 切换文件时，自动保存
au FocusLost * silent! wa   " 丢失焦点时自动保存
set confirm                 " 在处理未保存或只读文件，弹出确认
set nobackup                " 不产生备份文件（~xxx）
set noswapfile              " 不产生临时文件（xxx.swap）
" =======
" prompt
" =======
set nu!                     " 显示行号
" set nonu!
set cursorline              " 突出当前行
set cursorcolumn            " 突出当前列
set cmdheight=2             " 命令行高度
set showcmd                 " 在命令行显示正在输入的命令
set history=50              " 命令行历史记录条
" =====
" edit
" =====
set wrap                    " 自动换行
" set nowrap
set iskeyword+=_,$,@,%,#,-  " 不被换行分割的单词符号
set expandtab               " Tab -> space
" set noexpandtab
set tabstop=4               " Tab == 4 space
set shiftwidth=4            " 自动对齐空格数
set softtabstop=4           " 退格键一次删除 4 个空格
set smarttab                " 在行和段开始处使用制表符
set ai                      " autoindent 继承前一行缩进
set si                      " smartindent 智能缩进
" =======
" search
" =======
set ignorecase              " 搜索时忽略大小写
set incsearch               " 搜索时逐字高亮
" set noincsearch
set showmatch               " 高亮显示匹配的括号
set matchtime=5             " 括号高亮时间(单位:0.1s)

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\, stl:\,stlnc:\


if has("autocmd")
    autocmd InsertLeave * se nocul                " 用浅色高亮当前行
    autocmd InsertEnter * se cul                  " 用浅色高亮当前行
    augroup vimrcEx
    au BufRead,BufNewFile *.{md,mkd} set ft=mkd   " markdown配置
    augroup END
endif


set rtp+=~/softwares/vimrcs
call plug#begin('~/softwares/vimrcs/plugins')

" ------
" 文件树
" ------
Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <F6> :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ------
" 状态栏
" ------
Plug 'vim-airline/vim-airline'
" tabline
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#tabline#enabled = 1
noremap <s-x> :bn<CR>
" git branch
Plug 'tpope/vim-fugitive'
set statusline+=%{fugitive#statusline()}

" --------
" 窗口管理
" --------
Plug 'vim-scripts/winmanager'
let g:winManagerWidth=30
nmap wm :WMToggle<CR>
nmap <c-x> :FirstExplorerWindow<CR>
let g:NERDTree_title='[NERDTree]'
" 执行一个退出命令，关闭自动出现的窗口
function! NERDTree_Start()
    exe 'q'
    exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

" --------
" 主题插件
" --------
Plug 'tomasr/molokai'
Plug 'jpo/vim-railscasts-theme'
colorscheme railscasts    " 配色方案
set background=dark       " 背景色方案
" set background=light
call plug#end()
