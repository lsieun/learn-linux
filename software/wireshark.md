# centos7下安装wireshark #

https://blog.csdn.net/qq_30412139/article/details/79623046

centos属于Red Hat，使用yum进行软件依赖检查和处理，不同于ubantu系列的apt

安装软件需要root权限，因此在安装时输入命令

	sudo yum install wireshark

这条命令安装wireshark，但没有图形化工具，下面一条命令安装图形化界面
可以输入

	yum search wireshark
	
	yum install wireshark-gnome.x86_64

之后输入wireshark打开

但是安装之后一般直接打不开



wireshark就可以使用了

解决方案在https://forums.fedoraforum.org/showthread.php?236740-Wireshark-Install-issues&p=1307301#post1307301