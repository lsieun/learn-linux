# Vundle

Github: https://github.com/VundleVim/Vundle.vim

## What is Vundle?

**Vundle**, which stands for **Vim Bundle**, is **a Vim plugin manager**. 

Vundle allows you to **install**, **update**, **search** and **clean up** Vim plugins very easily. It can also manage your runtime and help with tags.

> bundle表示“一批同类事物”



## Installing Vundle

安装Vundle需要两步：

第一步：安装[Git](../CentOS7_Git.md)。

第二步：安装Vundle

Next, create a directory where Vim plugins will be downloaded and installed. By default, this directory is located at `~/.vim/bundle`
```
$ mkdir -p ~/.vim/bundle
```

Now go ahead and install Vundle as follows. Note that Vundle itself is another Vim plugin. Thus we install Vundle under `~/.vim/bundle` we created earlier.
```
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Configuring Vundle

Next, we'll have to recreate our `~/.vimrc` file to tell vim to use our new package management system.

> 此处配置`~/.vimrc`的主要作用告诉vim要使用vundle了。

```
vim ~/.vimrc
```

Inside, we need a few things to start us off. First, we need to make sure that `vim` is **not attempting to retain compatibility** with `vi`, its predecessor. This is a `vundle` requirement. When vim attempts to be compatible, it disables most of the features that make it worth using over vi.

> vim不与vi进行兼容，目的是为了使用扩展的功能。

We also want to turn off the default "filetype" controls for now because the way that vim caches filetype rules at runtime interferes with the way that vundle alters the runtime environment. We will change this back later:

```
set nocompatible
filetype off
```

Next, we'll need to then adjust **vim's runtime path** to include **the `vundle` location** we cloned from GitHub. After that, we will call **the vundle initialization function**:

`~/.vimrc`最简配置：
```
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Add plugins here

call vundle#end()
filetype plugin indent on
```

其中，
- `rtp`是`runtime path`的缩写； 
- `vundle#begin()`：After calling this function the user can use the `:Plugin` command in the vimrc.
- `vundle#end()`: Finishes putting plugins on the rtp. 
- `Plugin 'VundleVim/Vundle.vim'` 这里就使用了`:Plugin`命令This should always be the first.

Notice how at the end, we re-establish the "filetype" functionality that we previously turned off. All plugins must be declared between the `call vundle#begin()` line and the `call vundle#end()` line.

Now, our `vundle` system is initialized and we can add in the plugins that we wish to manage.

To install from Github:
```
Plugin 'user/plugin'
```

To install from http://vim-scripts.org/vim/scripts.html:
```
Plugin 'plugin_name'
```

To install from another git repo:
```
Plugin 'git://git.another_repo.com/plugin'
```

To install from a local file:
```
Plugin 'file:///home/user/path/to/plugin'
```

## Use Vundle

### Install and Update Plugins with Vundle

Now, we just need to tell vundle to install all of the plugins that we added to the file. Start vim:
```
vim
```
Now, issue the `:PluginInstall` command:
```
:PluginInstall
```
This will open a new split window in vim and run through the installation of each of the new plugins. When it is complete, you can close the new buffer and window by typing:
```
:bdelete
```

The plugins that you added to your `~/.vimrc` file are now installed!

If you wish to update your plugins, you can use one of these two commands:
```
:PluginUpdate
```
Or
```
:PluginInstall!
```
The "`!`" at the end of the `:PluginInstall!` command basically tells vundle to reinstall all of the plugins (it checks if any action is needed), which will get the newest versions.

### Acquiring New Plugins

Searching and Installing Plugin using Vundle Plugin Manager:
```
:PluginSearch colorscheme
```

To install a plugin, just move the VIM cursor to the line and press `i`.

You can list all the installed VIM plugins with the following VIM command:

### Managing Installed Plugins

To see all of your installed plugins, type this:

```
:PluginList
```

第1种删除插件的方式：在`:PluginList`命令之后，选中插件`Shift+D`，同时记得修改`~/.vimrc`文件。

第2种删除插件的方式：
An easier way of doing this though is to remove it from the `~/.vimrc` file first. After you've removed it, you can call this command:
```
:PluginClean
```


## How does Vundle Work?

Traditionally, `vim` is configured on **a per-user basis** in **each user's home directory**, with fall-back **defaults configured by the system administrator** and finally **the software itself**. These **personal settings** are stored in a hidden file called `~/.vimrc`.

> vim的个人配置信息放在`~/.vimrc`文件中。

**Plugins and additional configuration files** that add functionality are conventionally added into a hidden directory at `~/.vim`. Inside, most plugins are organized into subdirectories based on the functionality that they provide. These could be things like `autoload`, `plugin`, `colors`, etc.

> 插件则放在`~/.vim`目录当中。

The `vundle` tool is actually built on a different plugin manager called `pathogen` and provides a superset of functionality. The `pathogen` manager simplifies plugin management by creating **a separate plugin directory** tree for **each individual plugin**.

> vundle是在pathogen的基础上构建的。

This means that rather than having **each plugin** throw **different files** into **different directories**, mixing them with other plugins, **each plugin** will instead recreate **the needed directory structure** inside of **a subdirectory** specific to **the plugin**.

> 此处的思路是：分而治之

These are kept in **a subdirectory** called `bundle`.

> 这种创建subdirectory的方式，称之为bundle。

This creates a deeper nesting system, but it allows us to easily manage our plugins as a unit. If we don't want to use one "plugin" anymore, we can just remove it.

> 坏处，是增加了文件夹的层级；优点，是将每个插件作为一个独立的单位进行管理。

This simplifies our management scheme greatly. This is basically what `pathogen` accomplishes.

> 以上只是pathogen完成的，那么vundle做了什么呢？

What `vundle` does is add **a management interface** inside of vim itself that let's you acquire more plugins, update plugins, etc. It adds the "management" portion on top of what some people would say is pathogen's organization improvements.

> vundle在vim的内部增加了管理界面（management interface）。







