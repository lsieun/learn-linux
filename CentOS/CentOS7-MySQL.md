# CentOS 7.5 安装MySQL 5.7

URL:

- [How To Install MySQL on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-centos-7)

## 查看Linux版本信息

```bash
$ cat /etc/system-release
CentOS Linux release 7.5.1804 (Core)
```

## 安装MySQL

```bash
# 切换到指定目录
$ cd ~/Downloads

# 下载repo包
$ wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

# 安装repo包
$ sudo rpm -ivh mysql57-community-release-el7-9.noarch.rpm

# 安装MySQL
$ sudo yum install mysql-server
```

## 启动MySQL

查看`mysqld`的状态，命令如下：

```bash
systemctl status mysqld
```

启动`mysqld`，命令如下：

```bash
sudo systemctl start mysqld
```

启动完成后，可再次查看`mysqld`的运行状态进行验证，命令如下：

```bash
systemctl status mysqld
```

另一种验证方法，可以查看MySQL的版本信息来进行验证，命令如下：

```bash
mysql --version
```

输出信息如下：

```txt
mysql  Ver 14.14 Distrib 5.7.24, for Linux (x86_64) using  EditLine wrapper
```

During the installation process, a temporary password is generated for the MySQL root user. Locate it in the `mysqld.log` with this command:

```bash
sudo grep 'temporary password' /var/log/mysqld.log
```

Output:

```txt
2019-01-01T08:55:08.849647Z 1 [Note] A temporary password is generated for root@localhost: zfRXrDf*l9)h
```

## 修改root密码

登录MySQL：

```bash
$ mysql -u root -p
```

修改密码：

```mysql
mysql> alter user 'root'@'localhost' identified by 'P@ssw0rd';
mysql> quit
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

mysql> set global validate_password_number_count=0;
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
| validate_password_number_count       | 0     |
| validate_password_policy             | LOW   |
| validate_password_special_char_count | 0     |
+--------------------------------------+-------+
7 rows in set (0.00 sec)
```

## 配置MySQL的字符集编码

在Linux上，需要编辑MySQL的配置文件，把数据库默认的编码全部改为`UTF-8`。MySQL的配置文件默认存放在`/etc/my.cnf`或者`/etc/mysql/my.cnf`：

```
[client]
default-character-set = utf8

[mysqld]
default-storage-engine = INNODB
character-set-server = utf8
collation-server = utf8_general_ci
```

>注：如果MySQL的版本≥5.5.3，可以把编码设置为`utf8mb4`。`utf8mb4`和`utf8`完全兼容，但它（`utf8mb4`）支持最新的Unicode标准，可以显示emoji字符。

```txt
[client]
default-character-set = utf8mb4

[mysqld]
default-storage-engine = INNODB
character-set-server = utf8mb4
collation-server = utf8mb4_general_ci
```

重启MySQL后，可以通过MySQL的客户端命令行检查编码：

```
$ sudo systemctl restart mysqld
$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor...
...

mysql> show variables like '%char%';
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8mb4                    |
| character_set_connection | utf8mb4                    |
| character_set_database   | utf8mb4                    |
| character_set_filesystem | binary                     |
| character_set_results    | utf8mb4                    |
| character_set_server     | utf8mb4                    |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
8 rows in set (0.01 sec)
```

看到`utf8`字样就表示编码设置正确。

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
sudo firewall-cmd --permanent --zone=public --add-service=mysql

## OR ##

sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
```

Restart `firewalld.service`

```bash
sudo systemctl restart firewalld.service
```

## 7. Error: "mysqld.service - SYSV: MySQL database server"

URL: https://stackoverflow.com/questions/42317139/job-for-mysqld-service-failed-see-systemctl-status-mysqld-service


1, Check the log file `/var/log/mysqld.log`

```txt
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
