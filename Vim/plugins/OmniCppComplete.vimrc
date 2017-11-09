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
