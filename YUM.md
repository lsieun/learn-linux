# yum #

## 1、repos文件下载地址 ##

CentOS镜像使用帮助: http://mirrors.163.com/.help/centos.html

阿里云repo： http://mirrors.aliyun.com/repo/

## 2、使用说明 ##

1、首先备份/etc/yum.repos.d/CentOS-Base.repo

	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

2、下载对应版本repo文件, 放入/etc/yum.repos.d/(操作前请做好相应备份)

163下载：[CentOS7](http://mirrors.163.com/.help/CentOS7-Base-163.repo)、[CentOS6](http://mirrors.163.com/.help/CentOS6-Base-163.repo)、[CentOS5](http://mirrors.163.com/.help/CentOS5-Base-163.repo)

阿里云下载：[CentOS7](http://mirrors.aliyun.com/repo/Centos-7.repo)、[CentOS6](http://mirrors.aliyun.com/repo/Centos-6.repo)、[CentOS5](http://mirrors.aliyun.com/repo/Centos-5.repo)

3、运行以下命令生成缓存

	yum clean all
	yum makecache

4、安装常用软件

	[root@mini ~]# yum makecache
	[root@mini ~]# yum search sz
	[root@mini ~]# yum install lrzsz
	
	yum makecache
	yum install -y wget
	yum install -y lrzsz
	yum install -y openssh-clients
	yum install -y tree
	yum install -y telnet
	yum install -y vim

	yum install -y wget lrzsz openssh-clients tree telnet vim

5、做快照

如果是虚拟机，则`shutdown -h now`关机后，生成快照（ClearSystem）


> 至此结束。 