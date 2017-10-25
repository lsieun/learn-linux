
# 查看命令的命令 #

command的4种形式：

1. execute binary
2. buildin bash
3. shell function
4. alias


命令：

	type       说明怎样解决一个命令名
	which      显示会执行哪个可执行程序
	man        显示命令手册
	apropos    显示一系列适合的命令
	info       显示命令info
	whatis     显示一个命令的简洁描述
	alias      创建命令别名

## 1. type ##

command的4种形式：

1. execute binary
2. buildin bash
3. shell function
4. alias

可以使用type命令来进行区分

	#type command
	type type


## 2. which ##

查看可执行命令的存放位置

	#which command
	which file
	which dir

## 3. man ##

type/cd/alias是buildin命令；对于buildin命令，可以通过`help`命令来查看帮助文档：

	#help command
	help cd 

对于非buildin命令，可以使用`--help`选项来查看帮助文档：

	#command --help
	dir --help

`man`（manual手册）是可以查看相对比较完整的命令手册，可以通过`yum -y install man`来进行安装。使用方法如下：

	#man command
	man type   #type是buildin命令
	man dir    #dir是非buildin命令

## 4. apropos ##

如果完成某个特定任务，不知道用哪个命令，可以通过apropos来搜索关键字，apropos会搜索man手册的关键信息。

	#apropos <keyword>
	#等价于 man -k <keyword>

## 5. whatis ##

用来显示一个命令的简洁说明，因为有时候会觉得使用`man`命令显示了太多信息。

	whatis type
	whatis cp
	whatis apropos

## 6. info ##

	#info <keyword>
	#键盘快捷键
	#n: next node
	#p: previous node
	#q: quit
	#u: up
	#enter: jump to link


## 7. alias ##

	#多个命令可以一起拼写，用分号(;)分隔
	cd /usr; ls; cd 
	
	#也可以通过alias来建立别名
	#alias name='command string'
	alias mytest='cd /usr; ls; cd'

	#查看所有alias
	alias

	#删除别名
	#unalias name
	unalias mytest

