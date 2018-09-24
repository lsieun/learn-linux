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





## 3. file命令 ##



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

