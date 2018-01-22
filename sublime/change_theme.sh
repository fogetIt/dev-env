#!/bin/bash
# @Date:   2017-04-18 17:29:08
# @Last Modified time: 2017-05-09 09:07:31
: '
${User}/Default.sublime-theme——————覆盖默认主题配置文件，文件图标使用${User}/icons/
${User}/themeName.sublime-theme————覆盖主题插件的配置文件，文件图标使用${themeName}/icons/
所以
通过修改Default.sublime-theme文件名和文件内容就可以使用对应的文件图标，并继承和修改其样式
'
cd ~/.config/sublime-text-3/Packages/User/

cp Default.sublime-theme ./Piatto\ Dark.sublime-theme
