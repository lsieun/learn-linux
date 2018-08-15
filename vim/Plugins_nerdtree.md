# The NERDTree

Github: https://github.com/scrooloose/nerdtree

## Installation

```vim
Plugin 'scrooloose/nerdtree'+
```

查看帮助：
```
:help NERDTree.txt
:help NERDTree
```

## 2、Usage

### 2.1、打开NERDTree

语法如下：

```vim
:NERDTree <start-directory> 
```

Opens a fresh NERD tree. The root of the tree depends on the argument given. There are 3 cases: 

- If no argument is given, the current directory will be used. 
- If a directory is given, that will be used. 
- If a bookmark name is given, the corresponding directory will be used. 

### 2.2、查看帮助

使用`?`打开和关闭帮助


### 2.3、vim启动时打开NERDTree

How can I open a NERDTree automatically when vim starts up?

Stick this in your vimrc: `autocmd vimenter * NERDTree`

### 2.4、Switching between tabs in NERDTree

An additional option (and my personal choice)beyond the ones listed by Michael Madsen:

`gt` = next tab

`gT` = previous tab





