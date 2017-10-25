# ls命令、file命令和less命令 #

> 择善人而交, 择善书而读, 择善言而听, 择善行而从。

## 1.基本语法 ##

命令行的语法（基本格式）：

	#命令本身 -选项 参数
	#ls     -l       /usr/
	command -options arguments

其中，`options`又分为`short options`和`long options`

	short options: -a
	long  options: --all

> 对于一般的命令来说，通常都有成对的short options和long options，其中long options是完整的单词，而short options是该单词中的一个字母（往往是首字母）。对于short options，可以进行合并，例如`ls -a -l`可以合并写成`ls -al`。



## 2. ls命令 ##

ls command options:
	
	-a, --all 列出目录下的所有内容，包括隐藏文件和目录
	-d, --directory 查看目录本身的内容
	-F, --classify 文件或或者目录名字后加一个字符的分类标识（个人觉得，不太实用啊！！！）
	-h, --human readable 适合于人类的可读格式
	-l, (long) 长格式输出，注意没有--long
	-r, --reverse 反序（默认按字母升序排序，使用-r进行倒序输出）
	-t, --time 按修改时间排序（默认按修改时间倒序排序，可以和 -r 一起使用，从而按修改时间正序显示）


### 2.1 查看目录内容 ###

	#查看当前目录
	ls

	#查看指定目录
	ls /usr/local/

	#查看两个目录下的内容
	ls /usr /var

### 2.2 查看详细内容 ###

	#查看当前目录下的详细内容
	ls -l

	#查看指定目录下的详细内容
	ls -l /usr/   # 其中 -l 代表 long，即长格式

### 2.3 查看隐藏文件 ###

	ls -a
	ls --all

### 2.4 查看目录本身的信息 ###

之前的ls命令都是查看目录下的内容，使用`-d`选项（options）可以查看目录本身的信息

	ls -d /usr/              #short options
	ls --directory /usr/     #long  options
	ls -dl /usr/             #查看详细的目录信息


## 3. file命令 ##

	file <file_name>
	file <file_name1> <file_name2>

	# 示例
	file /dev/cdrom
	file /dev/cpu
	file /etc/passwd

### 4. less命令 ###

	less <file_name>   

	#按j一行一行往下走，按k是一行一行往上走，
	#按space是翻页，Ctrl+U是向上翻页，Ctrl+D是向下翻页
	#按gg到达顶端，按G到达文件底端
	#按q退出
	#按下/可以输出字符，再回车后进行搜索，按n查找下一个，按下N是向上查找
	less /etc/passwd

	#查看定时任务的文件
	less /etc/crontab

> 至此结束

> 人越是不了解自己，他对外面的世界就越是有好奇心。好奇心是一种逃避，它是我们对自己本质无知的最大逃避。——张方宇《单独中的洞见》

