# /etc/group

The `/etc/group` file is a text file that defines the groups on the system.  There is one entry per line, with the following format:

```txt
group_name:password:GID:user_list
```

The fields are as follows:

- `group_name`: the name of the group.
- `password`: the (encrypted) group password.  If this field is empty, no password is needed.
- `GID`: the numeric group ID.
- `user_list`: a list of the usernames that are members of this group, separated by commas.

举例说明：

```bash
$ cat /etc/group
root:x:0:
bluetooth:x:114:liusen
liusen:x:1000:
```

查看帮助：

```bash
man 5 group
```
