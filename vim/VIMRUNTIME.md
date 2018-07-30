# Understanding VIMRUNTIME

原文URL： http://vim.wikia.com/wiki/Understanding_VIMRUNTIME

`$VIMRUNTIME` identifes a directory where **Vim's support files** are located. Many of the files are not necessary for Vim to run, but are used to provide **extra functionality** such as syntax highlighting and filetype-based plugins. Its value can be displayed in Vim with the command `:echo $VIMRUNTIME`. It is set using the procedure at `:help $VIMRUNTIME`.

> 在Vim当中，使用`:echo $VIMRUNTIME`命令可以查看VIMRUNTIME的值；使用`:echo $VIM`命令可以查看VIM的值。







