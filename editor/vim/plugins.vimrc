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