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
"-------------
" 多文件自动分屏
"-------------
Plugin 'minibufexpl.vim'
let g:miniBufExplMapWindowNavVim=1          " 鼠标双击，切换文件
let g:miniBufExplMapWindowNavArrow =1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
map <C-Tab> :MBEbn<cr>                      " ctrl+Tab————打开前一个buffer
map <C-S-Tab> :MBEbp<cr>                    " ctrl+shift+Tab————打开后一个buffer
" ctrl+箭头键————切换到上下左右窗口中
" ctrl+h,j,k,l————切换到上下左右的窗口中