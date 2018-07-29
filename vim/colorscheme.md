# How to install a Vim color scheme #

```
colorscheme     # 查看当前使用color scheme
```

## Install a new Vim Color Scheme

Download a new Vim color scheme – “[distinguished](https://github.com/Lokaltog/vim-distinguished)“. Extracts and move the downloaded `*.vim` file to this folder `~/.vim/colors/`.
```bash
mv ~/Downloads/vim-distinguished-develop/colors/*.vim ~/.vim/colors/k
```

Edit the `vim ~/.vimrc` file, enable the `syntax` highlight and set the `colorscheme to “distinguished”.
```vim
syntax on
colorscheme distinguished
```

Done, when you start `Vim` editor next time, by default, syntax highlight is enabled and the “distinguished” color scheme will be used.

vim-colorschemes: https://github.com/flazz/vim-colorschemes
