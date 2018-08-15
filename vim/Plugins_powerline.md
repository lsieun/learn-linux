# powerline

Github: https://github.com/powerline/powerline

## Installation

```vim
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
```

## status-line and `laststatus`

**Status line** will **not appear by default** when there is **only a single window** displayed. Run `:h status-line` in Vim for more information.

```
:help status-line
```

A status line will be used to separate windows.  The `laststatus` option tells when **the last window**(最后一个窗口) also has a status line:

- `laststatus=0`: never a status line
- `laststatus=1`: status line if there is more than one window
- `laststatus=2`: always a status line

You can change the contents of the status line with the `statusline` option.

You may find the following vim settings useful when using the Powerline statusline:

```vim
set laststatus=2     " Always display the statusline in all windows
set showtabline=2    " Always display the tabline, even if there is only one tab
set noshowmode       " Hide the default mode text (e.g. -- INSERT -- below the statusline)
```

## Color support

The plugin uses lots of bright colors and needs 256-color support in Vim. One way to turn this on in Vim is by adding this line to your vimrc:

```vim
set t_Co=256
```

## Fancy symbols

By default it shows a simple colored statusline. By using Unicode symbols, it can present a more beautiful statusline. To turn this on, add this line to your vimrc:

```vim
let g:Powerline_symbols = "fancy"
```







