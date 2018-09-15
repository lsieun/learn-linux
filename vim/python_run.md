# Run Python Code in Vim

URL: https://stackoverflow.com/questions/18948491/running-python-code-in-vim

When I'm done editing a Python script, I just press `<F5>`. The script is saved and then executed in a blank screen.

```vim
nnoremap <F5> <Esc>:update<CR>:!clear;python %<CR>
```


