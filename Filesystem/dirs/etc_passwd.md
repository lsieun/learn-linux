# /etc/passwd

`/etc/passwd` contains one line for each user account, with seven fields delimited by colons (“`:`”). These fields are:

- login name
- optional encrypted password
- numerical user ID
- numerical group ID
- user name or comment field
- user home directory
- optional user command interpreter

举例说明：

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
