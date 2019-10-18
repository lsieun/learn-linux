# /etc

## /etc/passwd

File: `/etc/passwd`

```bash
$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
liusen:x:1000:1000:liusen,,,:/home/liusen:/bin/bash
sshd:x:119:65534::/run/sshd:/usr/sbin/nologin
mysql:x:120:125:MySQL Server,,,:/nonexistent:/bin/false
```

查看帮助：

```bash
man 5 passwd
```

Output:

```txt
/etc/passwd contains one line for each user account, with seven fields delimited by colons (“:”). These fields are:

·   login name

·   optional encrypted password

·   numerical user ID

·   numerical group ID

·   user name or comment field

·   user home directory

·   optional user command interpreter
```

## /etc/group

```bash
$ cat /etc/group
root:x:0:
bluetooth:x:114:liusen
liusen:x:1000:
```

```bash
man 5 group
```

```txt
The /etc/group file is a text file that defines the groups on the system.  There is one entry per line, with the following format:

              group_name:password:GID:user_list

The fields are as follows:

·   group_name  the name of the group.

·   password    the (encrypted) group password.  If this field is empty, no password is needed.

·   GID         the numeric group ID.

·   user_list   a list of the usernames that are members of this group, separated by commas.
```
