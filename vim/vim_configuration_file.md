# Vim Configuration File

## Session

All configuration options that you define **inside `Vim`** are valid only for **that particular Vim session**.

For example, if you do `:set number` to display line numbers inside Vim, this will apply only in that particular Vim session. If you exit and start the Vim editor, the line number display will not be present anymore.

## Local Vimrc

If you want to make your configuration settings permanent for future Vim sessions, you should add it to the `~/.vimrc` file as shown below.

```
$ vim ~/.vimrc 
 
set number 
set list
```

Location of **local vimrc file**: 

| OS | Location |
|:--:|----------|
| UNIX/Linux | $HOME/.vimrc <br/> Example: /home/liusen/.vimrc <br/> **Note**: On Unix there is a `.` (period) before vimrc |
| Windows | $HOME/_vimrc <br/> Example: C:\Users\liusen\_vimrc <br/>**Note**: On Windows there a `_` (underscore) before vimrc |


## Global Vimrc

Global Vimrc is for sysadmins to add **system-wide Vim configuration options** that will be effective for all users of that system. Typically you should be modifying only **the local vimrc file**. 
 
Location of **global vimrc file**: 

| OS | Location |
|:--:|----------|
| UNIX/Linux | $VIM/.vimrc <br/> Example: /usr/share/.vimrc |
| Windows | $VIM/_vimrc <br/> Example: C:\Program Files\Vim\_vimrc |





