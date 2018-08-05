# vimrc

```
if has('win32') || has ('win64')
    let $VIMHOME = $VIM . "/vimfiles"
else
    let $VIMHOME = $HOME . "/.vim"
endif

" abbreviations
silent! source $VIMHOME/abbreviations.vim

set nocompatible
syntax enable
filetype plugin on

set number
" set list     " 显示结束符

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set foldenable
set foldcolumn=5

colorscheme github

" Disable stupid backup and swap file
" they trigger too many events for file system watchers
set nobackup
set nowritebackup
set noswapfile
set noundofile


" Template 参考autocmd.md
" autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
```

## Vim "swap", "backup" and "undo" files

These files can be put in a fixed directory to keep things more organized.

First of all, create these three folders:
```
mkdir ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
```

Now, put these lines in your vimrc file.
```
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
```
the "`//`" at the end of each directory means that file names will be built from the complete path to the file with all path separators substituted to percent "`%`" sign. This will ensure file name uniqueness in the preserve directory.

Alternatively you can turn them off, putting this in your vimrc file:
```
set nobackup
set noswapfile
```
