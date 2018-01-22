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