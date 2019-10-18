# Linux永久修改系统时间 #

Linux修改时间的方式：

- 修改Linux时间：date -s 时间。这种方式只是临时修改系统时间，当系统重新启动的时候就会还原。
- 修改硬件的时间：hwclock --set --date '2017-08-16 17:17:00' 。这是 也就是永久性修改Linux的时间

命令如下：

	date 查看系统时间  
	hwclock --show 查看硬件的时间  
	hwclock --set --date '2017-08-16 17:17:00' 设置硬件时间为17年8月16日17点17分00秒  
	hwclock --hctosys 设置系统时间和硬件时间同步  
	clock -w 保存时钟  


date 查看日期

	[root@mini ~]# date
	Tue Oct 24 11:26:42 CST 2017

查看昨天的时间

	date -d yesterday

cal #查看当前日历

	[root@mini ~]# cal
	    October 2017    
	Su Mo Tu We Th Fr Sa
	 1  2  3  4  5  6  7
	 8  9 10 11 12 13 14
	15 16 17 18 19 20 21
	22 23 24 25 26 27 28
	29 30 31


时间格式化

	echo `date '+%Y%m%d-%H%M%S'`

在用户的家目录内有一个`.bashrc`文件：

	vi .bashrc

之前的时候，我添加了一条alias，可以方便的查看tomcat的日志信息

	# User specific aliases and functions
	alias seelog='tail -f /data/tomcat/allin_api/logs/catalina.out'

后来的日志每小时生成一个新的文件，所以原来的文件名（catalina.out）就不能直接用了，要变成catalina.2017122710.out，因此修改了一下这个命令：

	# User specific aliases and functions
	alias seelog="tail -f /data/tomcat/allin_api/logs/catalina.`date '+%Y%m%d%H'`.out"











