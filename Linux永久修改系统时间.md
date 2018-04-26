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












