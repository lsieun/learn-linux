# 安装MySQL5.7 #

## 1、查看Linux版本信息 ##

	more /etc/issue

![](images/more_etc_issue.png)

## 2、安装MySQL ##

	[root@MyCentos ~]# wget http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm

![](images/wget_mysql57.png)

	[root@MyCentos ~]# yum localinstall mysql57-community-release-el6-7.noarch.rpm

![](images/yum_localinstall_mysql57.png)

	[root@MyCentos ~]# yum repolist enabled | grep "mysql.*-community.*"

![](images/yum_repo_enable_mysql.png)

	[root@MyCentos ~]# yum install mysql-community-server

![](images/yum_install_mysql_community_server.png)

## 3、启动MySQL服务 ##

1、启动MySQL服务（如果没有启动成功，多试几次）。

	[root@MyCentos ~]# service mysqld start
	[root@MyCentos ~]# service mysqld status

![](images/service_mysql_start.png)

2、查看MySQL的版本

	[root@MyCentos ~]# mysql --version

![](images/mysql_version.png)

## 4、用root用户登录MySQL ##

1、查看MySQL的默认密码：

	[root@MyCentos ~]# grep 'temporary password' /var/log/mysqld.log

![](images/grep_mysql_password.png)

使用默认密码登录MySQL

![](images/mysql_u_p_origin_password.png)

2、修改MySQL中root用户的密码

	mysql> alter user 'root'@'localhost' identified by 'xxxx';

![](images/mysql_alter_root_password.png)

3、退出MySQL

	mysql> quit

![](images/mysql_quit.png)

4、重新使用root用户新的密码登录MySQL

![](images/mysql_root_new_password.png)

## 5、授权root用户可以远程访问 ##

1、查看MySQL服务监听的端口(3306)：

	[root@MyCentos ~]# netstat -nltp
	或者
	[root@MyCentos ~]# netstat -nltp | grep mysql

![](images/netstat_nltp_grep_mysql.png)

2、从另外一台电脑上使用`telnet`命令查看Linux的服务器的3306端口是否打开

	telnet 192.168.80.14 3306

![](images/telnet_mysql_3306.png)

3、开启Linux服务器的3306端口

修改/etc/sysconfig/iptables文件

	[root@MyCentos ~]# vi /etc/sysconfig/iptables

添加如下内容

	-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT

![](images/vi_iptables_3306.png)

重启防火墙

	service iptables restart

![](images/service_iptables_restart_3306.png)

4、授权root用户可以远程访问

在另一台电脑上登录MySQL，得到如下提示：

![](images/not_allowed_to_connect_mysql.png)

在MySQL上进行查询操作：

	mysql> SELECT User, Host FROM mysql.user;

![](images/select_user_from_mysql.png)

在Linux服务器上进行如下操作：

	mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;

![](images/grant_all_privileges_to_root.png)

这样，在另一台电脑上，就可以远程访问了。

> 至此结束。
