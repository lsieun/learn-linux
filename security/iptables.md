# 防火墙 #

查看防火墙的运行状态

	service iptables status

关闭防火墙

	service iptables stop

关闭防火墙的开机自动运行

	#关闭防火墙开机启动
	chkconfig iptables off

	#验证防火墙开机启动的状态
	chkconfig --list | grep iptables

关闭防火墙

	vi /etc/sysconfig/iptables

添加如下内容：

	-A INPUT -m state --state NEW -m tcp -p tcp --dport 22122 -j ACCEPT

重启防火墙

	service iptables restart



