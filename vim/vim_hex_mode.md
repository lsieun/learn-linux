# 如何在vim 中看到16进制的显示

view hex mode in vim
```vim
:%!xxd
```

return to normal mode from hex mode
```vim
:%!xxd -r
```

如果想了解关于xxd程序的更多用法，可在shell命令行下输入`man xxd`.
