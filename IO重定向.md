# IO Redirection #

命令的一般输入来自于键盘，输出一般是在屏幕上；通过重定向，可以使输入来自文件，输出也到文件。

## 1. stdin / stdout / stderr ##

输入和输出

	stdin  = standard input device
	stdout = standard out device
	stderr = standard error device


## 2. redirect standard output ##

标准输出的重定向

	#command > file_name
	# >  覆盖写入
	# >> 追加写入
	[root@mini ~]# ls -l . > ls-output.txt

> 注意：标准输出的重定向，并不能输出错误信息

## 3. redirect standard error ##

错误输出的重定向，需要借助于“shell文件的描述符”。

shell文件的描述符：

	0 代表stdin
	1 代表stdout
	2 代表stderr

示例：

	ls /usr/local/non-existfolder 2> ls-output.txt

注意： `2> ls-output.txt`中的`2`和`>`蹭似乎不能有空格，否则输出成功不了。

## 4. redirect stdout and stderror ##

	#我用下面的方法没有测试成功
	ls -l ./ /usr/local/non-existfolder
	ls -l ./ /usr/local/non-existfolder > ls-ouput.txt 2>&1

	#这种方法也不行啊！！！
	ls -l ./ /usr/local/non-existfolder &> ls-ouput.txt

> 如果信息是输出到`/dev/null`，信息就会都被忽略掉


## 5. redirect stdin ##

命令：

1. cat      连接文件
2. sort     排序文本行
3. uniq     报道或省略重复行
4. grep     打印匹配行
5. wc       打印文件中换行符、字和字节数
6. head     输出文件第一部分
7. tail     输出文件最后一部分
8. tee      从标准输入读取数据，并同时写到标准输出和文件





