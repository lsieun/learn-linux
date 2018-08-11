# `<leader>`

The `<Leader>` key is mapped to `\` by default. So if you have a map of `<Leader>t`, you can execute it by default with `\`+`t`. For more detail or re-assigning it using the `mapleader` variable, see
```vim
:help leader
```

To define a mapping which uses the "`mapleader`" variable, the special string "`<Leader>`" can be used.  It is replaced with the string value of "`mapleader`". If "`mapleader`" is not set or empty, a **backslash** is used instead.  

Example:

    :map <Leader>A  oanother line <Esc>

Works like:

    :map \A  oanother line <Esc>

But after:

    :let mapleader = ","

It works like:
    :map ,A  oanother line <Esc>

**Note** that the value of "`mapleader`" is used at the moment the mapping is defined.  Changing "`mapleader`" after that has no effect for already defined mappings.

Be aware that when you do press your `<leader>` key you have only **1000ms** (by default) to enter the command following it.

This is exacerbated because there is no visual feedback (by default) that you have pressed your `<leader>` key and vim is awaiting the command; and so there is also no visual way to know when this time out has happened.

If you add `set showcmd` to your vimrc then you will see your `<leader>` key appear in the bottom right hand corner of vim (to the left of the cursor location) and perhaps more importantly you will see it disappear when the time out happens.

The length of the timeout can also be set in your vimrc, see `:help timeoutlen` for more information.