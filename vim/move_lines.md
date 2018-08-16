# Vim: Moving Lines Ain't Hard

URL: https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard

## I Like the Way You Move

The second way, use the move command with `:m`. I like this method a lot, as it requires fewer keystrokes. It does require line numbers though. When using absolute line numbers, the destination will be below the line number you specify, so use `:m0` to move to the top of the file. Try using hybrid mode.

```txt
--- second line ---
--- third line ---
--- first line ---

# Move your cursor on the "first line" (the third line), use the *move* command and
# pass your desired line number as an argument. Hit enter.
#
# :3 --> <ENTER> --> :m0 --> <ENTER>
#
# or...
#
# :3m0 --> <ENTER>
```

## Lazy Moving

Now getting to the `map` command, I’ve found this pretty handy when I need to move a line or block of lines a couple of lines upward or downward.

```vim
" In your ~/.vimrc
"
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
```

Now you can move lines by holding `CTRL` and `j` (for up a line) or `k` (for down a line).

```txt
--- second line ---
--- third line ---
--- first line ---

# Move to the "first line", hold <CTRL> and move up twice.
#
# :3 --> <ENTER> --> <CTRL> + kk
```

Now let’s move a block of lines:

```txt
--- fourth line ---
--- fifth line ---
--- first line ---
--- second line ---
--- third line ---

# Move to the "first line".
# Select the "first line", "second line", and the "third line" with Visual mode.
# Hit CTRL and move upwards twice.
#
# :3 -- <ENTER> --> <SHIFT> + V --> jj --> <CTRL> + kk
```

修改为上下方向键的移动：

```vim
" Move line: Normal mode
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==

" Move line: Insert mode
inoremap <C-Down> <ESC>:m .+1<CR>==gi
inoremap <C-Up> <ESC>:m .-2<CR>==gi

" Move line: Visual mode
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv
```

