# autocmd

## Using File templates

### 1、初始vimrc的内容

`~/.vimrc`

```
if has('win32') || has ('win64')
    let $VIMHOME = $VIM . "/vimfiles"
else
    let $VIMHOME = $HOME . "/.vim"
endif
```

## 2、Using template files

We create a directory in our `VIMHOME` called `templates/` and place a file with the HTML code in the directory. We save the file as `html.tpl`.

```html
<html>
    <head>
        <title></title>
        <meta name="generator" content="Vim" />
        <meta name="author" content="liusen" />
    </head>
    <body>
        <p>Content goes here...</p>
    </body>
</html>
```

在`~/.vimrc`中添加如下内容：
```
autocmd BufNewFile *.html 0r $VIMHOME/templates/html.tpl
```

命令解读：
- `autocmd`： 定义为“事件”定义执行的“命令 ”
- `BufNewFile`： 此处为“事件”，即创建新文件的时候
- `*.html`： 此处为“文件类型”
- `0r`： 此处`0`表示为“文件最顶部”，而`r`表示read，即“读取"命令
- `$VIMHOME/templates/html.tpl`： 此处为“要读取的文件”

All this is very nice, but after adding a bunch of templates, you might get tired of adding lines to your vimrc file. So, let's make our first line a bit more intelligent: 
```
:autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
```

代码解读：
- `silent!`： Execute {command} silently. 当加上`!`时，表示即使有错误，也不进行提示。

What this single line does is that whenever you open a file, it looks for a template that matches the extension of the file. For example, when creating the `index.html` file, it looks in `$VIMHOME/templates/` for a file named `html.tpl`.

If there is no template for the file type, then it simply creates an empty file as usual. 

第2版：

Let's take these templates even further by adding support for **placeholders** (for places where you want to add text to the file, fast). A placeholder could look very different  depending on what you like, but I propose something like `<+KEYWORD+>`.

`~/.vim/templates/html.tpl`

```html
<html>
    <head>
        <title><+TITLE+></title>
        <meta name="generator" content="<+GENERATOR+>" />
        <meta name="author" content="<+AUTHOR+>" />
    </head>
    <body>
        <p><+CONTENT+></p>
    </body>
</html>
```

Now, we have the placeholders in place and only need a way to jump between them. So, let's add a command to our `vimrc` that will make it easy to make this jump. We want to use `Ctrl+j` as the jump key binding because it can easily be used in the insert mode and `j` (for jump) makes it easy to remember. The command could look like this:

```vim
nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <c-j> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>
```
