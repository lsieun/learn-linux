# Fedora28 Install MySQL5.7

URL：
- https://www.if-not-true-then-false.com/2010/install-mysql-on-fedora-centos-red-hat-rhel/

https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/

https://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/


https://www.if-not-true-then-false.com/2010/install-virtualbox-guest-additions-on-fedora-centos-red-hat-rhel/

[TOC]

## 1. Install MySQL

### 1.1 下载和安装MySQL 5.7的yum repo包

```bash
wget http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
sudo dnf localinstall mysql57-community-release-el6-7.noarch.rpm
```

验证安装是否成功：

```bash
sudo dnf repolist enabled | grep "mysql.*-community.*"
```

结果如下：

```txt
mysql-connectors-community  MySQL Connectors Community                        59
mysql-tools-community       MySQL Tools Community                             65
mysql57-community           MySQL 5.7 Community Server                       273
```

### 1.2 安装MySQL

命令如下：

```bash
sudo dnf install mysql-community-server
```

## 2. 启动MySQL

### 2.1 查看MySQL服务的运行状态

查看`mysqld`的状态，命令如下：

```bash
$ systemctl status mysqld

● mysqld.service - SYSV: MySQL database server.
   Loaded: loaded (/etc/rc.d/init.d/mysqld; generated)
   Active: inactive (dead)
     Docs: man:systemd-sysv-generator(8)



$ systemctl is-active mysqld

inactive
```

### 2.2 启动MySQL服务

启动`mysqld`，命令如下：

```bash
sudo systemctl start mysqld
```

### 2.3 验证MySQL服务启动是否成功

启动完成后，可再次查看`mysqld`的运行状态进行验证，命令如下：

```bash
$ systemctl status mysqld
$ systemctl is-active mysqld
```

另一种验证方法，可以查看MySQL的版本信息来进行验证，命令如下：

```bash
mysql --version
```

输出信息如下：

```txt
mysql  Ver 14.14 Distrib 5.7.23, for Linux (x86_64) using  EditLine wrapper
```

### 2.4 autostart MySQL on boot

```bash
systemctl enable mysqld.service
```

## 3. 修改MySQL的密码

查看MySQL生成的默认密码

```bash
grep 'temporary password' /var/log/mysqld.log
```

登录MySQL服务器

```bash
mysql -u root -p
```

修改root用户的密码并退出：
```mysql
mysql> alter user 'root'@'localhost' identified by 'xxxxx';
mysql> quit
```

例如：

```mysql
alter user 'root'@'localhost' identified by 'P@ssw0rd';
```

## 4. VALIDATE PASSWORD PLUGIN

### 4.1 问题

URL: https://blog.csdn.net/kuluzs/article/details/51924374

有时候，只是为了自己测试，不想密码设置得那么复杂，譬如只想设置root的密码为123456。但是会报错：

```sql
mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123');
ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
```

### 4.2 原因

原来MySQL5.6.6版本之后增加了密码强度验证插件validate_password，相关参数设置的较为严格。
使用了该插件会检查设置的密码是否符合当前设置的强度规则，若不满足则拒绝设置。影响的语句和函数有：create user,grant,set password,password(),old password。



查看一下MySQL密码相关的几个全局参数：

```sql
mysql> select @@validate_password_policy;
+----------------------------+
| @@validate_password_policy |
+----------------------------+
| MEDIUM                     |
+----------------------------+
1 row in set (0.00 sec)

mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+--------+
| Variable_name                        | Value  |
+--------------------------------------+--------+
| validate_password_check_user_name    | OFF    |
| validate_password_dictionary_file    |        |
| validate_password_length             | 8      |
| validate_password_mixed_case_count   | 1      |
| validate_password_number_count       | 1      |
| validate_password_policy             | MEDIUM |
| validate_password_special_char_count | 1      |
+--------------------------------------+--------+
7 rows in set (0.01 sec)

```

参数解释：

- `validate_password_dictionary_file`： 插件用于验证密码强度的字典文件路径。
- `validate_password_length`: 密码最小长度，参数默认为8。
- `validate_password_mixed_case_count`: 密码至少要包含的小写字母个数和大写字母个数。
- `validate_password_number_count`: 密码至少要包含的数字个数。
- `validate_password_policy`: 密码强度检查等级，0/LOW、1/MEDIUM、2/STRONG。
- `validate_password_special_char_count`: 密码至少要包含的特殊字符数。

```txt
VALIDATE PASSWORD PLUGIN can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. 

There are three levels of password validation policy:

LOW    Length >= 8
MEDIUM Length >= 8, numeric, mixed case, and special characters
STRONG Length >= 8, numeric, mixed case, special characters and dictionary file

0 = LOW, 1 = MEDIUM and 2 = STRONG
```

### 4.3 解决

```sql
mysql> set global validate_password_policy=0;
Query OK, 0 rows affected (0.00 sec)

mysql> set global validate_password_mixed_case_count=0;
Query OK, 0 rows affected (0.00 sec)

mysql> set global validate_password_number_count=3;
Query OK, 0 rows affected (0.00 sec)

mysql> set global validate_password_special_char_count=0;
Query OK, 0 rows affected (0.00 sec)

mysql> set global validate_password_length=3;
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+-------+
| Variable_name                        | Value |
+--------------------------------------+-------+
| validate_password_check_user_name    | OFF   |
| validate_password_dictionary_file    |       |
| validate_password_length             | 3     |
| validate_password_mixed_case_count   | 0     |
| validate_password_number_count       | 3     |
| validate_password_policy             | LOW   |
| validate_password_special_char_count | 0     |
+--------------------------------------+-------+
7 rows in set (0.00 sec)
```

## 5. Create Database, Create MySQL User and Enable Remote Connections to MySQL Database

This example uses following parameters:

```txt
DB_NAME = webdb
USER_NAME = webdb_user
REMOTE_IP = %
PASSWORD = 123456
PERMISSIONS = ALL
```

```mysql
## CREATE DATABASE ##
mysql> CREATE DATABASE webdb;

## CREATE USER ##
mysql> CREATE USER 'webdb_user'@'%' IDENTIFIED BY '123456';

## GRANT PERMISSIONS ##
mysql> GRANT ALL ON webdb.* TO 'webdb_user'@'%';

##  FLUSH PRIVILEGES, Tell the server to reload the grant tables  ##
mysql> FLUSH PRIVILEGES;

```

## 6. Open MySQL Port (3306) on Iptables Firewall (as root user again)

Add New Rule to Firewalld

```bash
firewall-cmd --permanent --zone=public --add-service=mysql

## OR ##

firewall-cmd --permanent --zone=public --add-port=3306/tcp
```

Restart `firewalld.service`

```
systemctl restart firewalld.service
```

## 7. Error: "mysqld.service - SYSV: MySQL database server"

URL: https://stackoverflow.com/questions/42317139/job-for-mysqld-service-failed-see-systemctl-status-mysqld-service


1, Check the log file `/var/log/mysqld.log`

```
2017-03-14T07:06:53.374603Z 0 [ERROR] /usr/sbin/mysqld: Can't create/write to file '/var/run/mysqld/mysqld.pid' (Errcode: 2 - No such file or directory)
2017-03-14T07:06:53.374614Z 0 [ERROR] Can't start server: can't create PID file: No such file or directory
```

The log says that there isn't a file or directory `/var/run/mysqld/mysqld.pid`

2, Create the directory `/var/run/mysqld`

```bash
mkdir -p /var/run/mysqld/
```

3, Start the mysqld again `service mysqld start`, but still fail, check the log again `/var/log/mysqld.log`

```txt
2017-03-14T07:14:22.967667Z 0 [ERROR] /usr/sbin/mysqld: Can't create/write to file '/var/run/mysqld/mysqld.pid' (Errcode: 13 - Permission denied)
2017-03-14T07:14:22.967678Z 0 [ERROR] Can't start server: can't create PID file: Permission denied
```

It saids permission denied.

4, Grant the permission to `mysql` 

```bash
sudo chown mysql.mysql /var/run/mysqld/
```

5, Restart the mysqld

```bash
$ sudo service mysqld restart
Restarting mysqld (via systemctl):                         [  OK  ]
```

