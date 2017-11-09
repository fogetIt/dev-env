# -*- coding: utf-8 -*-
# @Date:   2016-10-08 09:17:52
# @Last Modified time: 2017-06-07 17:45:56
# "默認情況下cscope只認識.c文件，為了保證python使用，需要自己生成files文件來告訴cscope。
__revision__ = '0.1'
__author__ = 'zdd'

PATH = r'C:\Users\zdd\Desktop\register'
FILE_TYPE_LIST = ['py']

if __name__ == '__main__':
    import os
    f = open('cscope.files', 'w')
    for root, dirs, files in os.walk(PATH):
        for file in files:
            for file_type in FILE_TYPE_LIST:
                if file.split('.')[-1] == file_type:
                    f.write('%s\n' % os.path.join(root, file))
    f.close()
    cmd = 'cscope -bk'
    os.system(cmd)
# 使用時需要將這個文件放到項目目錄下，然後更改PATH路徑，程序會自動生成cscope.files文件和cscope.out文件，其中cscope.out就是要使用的索引了。
