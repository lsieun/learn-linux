# abbreviations

## Using abbreviations

The philosophy of Vim says that if you write a thing once, it is okay. However, if you're writing it twice or more times, then you should find a better way to do it. 

> Vim的哲学是：假如有一件事情，你需要做一次，那就那样做吧；假如有一件事情，你需要做多次，你就应该找到一个更好的方法去做它。

One of the methods for getting around writing the same sentences over and over again is by using `abbreviations`.

> 实现Vim哲学的其中一种方式是使用`abbreviations`


In Vim, abbreviations are created with one of the following commands depending on which mode they should be available in:
- `:abbreviate`: Abbreviations for **all modes**
- `:iabbrev`: Abbreviations for the **insert mode**
- `:cabbrev`: Abbreviations for the **command line** only

All of the commands take **two arguments**—**the abbreviation** and **the full text** it should expand to. 

示例：
```vim
:iabbrev myAddr 32 Lincoln Road, Birmingham B27 6PA, United Kingdom
```

Vim is intelligent about detecting whether you are writing an abbreviation or it is just part of another word. This is why myAddr only expanded to the full address when I pressed the `Space` key after the word. If the character right after my abbreviation was **a normal alphabetic letter**, then Vim would know that I wasn't trying to use my abbreviation and it would not expand the word.

> Vim对于abbreviation的处理也很“智能”

A good place to keep your **abbreviations** so that you don't have to execute all the commands by hand is in a file in your `VIMHOME`. Simply place a file there—let's call it `abbreviations.vim` and write all your abbreviations in it. Then, in your `vimrc` file, just make sure that the file is read, which is done with the `source` command:
```
:source $VIM/abbreviations.vim
```
Every time you realize that you will need a new abbreviation, you first execute it and then you add it to your `abbreviations.vim`.

```
# Correct typical keypress errors
:iabbr teh the

# Simple templates for programming
:iabbr forx for(x=0;x<100;x++){<cr><cr>}

# Easy commands in the command line:
:cabbr csn colorscheme night
```

Getting used to adding your **abbreviations** to a file every time you find a new one might seem weird and inconvenient at first. At the end of the day, however, you will realize that it has saved you a lot of typing and that it will keep doing so. The only thing you have to do is add your abbreviations and reload the abbreviations file once in a while. 

> 所谓“细大不捐”，小的大的都不抛弃，所有东西兼收并蓄。

Sometimes, it can be annoying that abbreviations automatically change when you actually wanted to write something else. Let's say that you have an abbreviation for your address called "addr", but you actually want to write the word "addressed". In that case, your abbreviation would kick in and you would not be able to write the word easily. 

> 凡事有例外

A solution for this is to change **your abbreviation** to use **a function** that asks you whether or not to use the abbreviation before it actually inserts the word. 

An example of such a function could be the following:
```
function! s:AbbrAsk(abbr,expansion)
    let answer = confirm("Use the abbreviation '" . a:abbr . "'?", "&Yes\n&No", 1)
    if answer == 1
        return a:expansion
    else
        return a:abbr
    endif
endfunction
```

The function is called `AbbrAsk` and takes **two arguments**. **The first argument** is **the abbreviation** and **the second argument** is **the expanded abbreviation**. For our address example, this function would be used as follows: 
```
iabbrev <expr> addr <SID>AbbrAsk('addr', "your full address here")
```
So, now when you write the letters `addr`, you will be asked whether you would like 
to use the abbreviation or not. 


## Abbreviations as templates

Having `<buffer>` in front of **an abbreviation** limits its availability to **the current buffer**.

```
:iabbrev <buffer> for( for (x=0;x<var;x++){<cr><cr>}
```

```
iabbrev for( for(!cursor!;<+++>;<+++>){<cr><+++><cr>}<Esc>:call search('!cursor!','b')<cr>cf!
```






