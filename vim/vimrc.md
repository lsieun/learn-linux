# vimrc

```
if has('win32') || has ('win64')
    let $VIMHOME = $VIM . "/vimfiles"
else
    let $VIMHOME = $HOME . "/.vim"
endif

" abbreviations
" source $VIM/abbreviations.vim

set number
set shiftwidth=4
set tabstop=4
set expandtab

set foldenable
set foldcolumn=5

colorscheme github


" Template 参考autocmd.md
autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
```


