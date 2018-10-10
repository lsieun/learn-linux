# linux怎么查看当前用户属于哪个用户组?

方法一、groups命令法

groups命令可以查看某个用户所属的用户组，只执行groups命令，可以查看系统当前登录用户的用户组。

```bash
$ groups
```

Output:

```txt
liusen wheel wireshark vboxusers
```

方法二、查看`/etc/group`法

`/etc/group`是用户组配置文件，可以查看此文件通过grep命令查询某个用户所在的用户组。

```bash
$ cat /etc/group | grep liusen
```

Output:

```txt
wheel:x:10:liusen
liusen:x:1000:
vboxusers:x:977:liusen
wireshark:x:974:liusen
```

方法三、id命令法

id命令也可以查看某个用户所属的用户组，只执行id命令，可以查看当前登录用户所在的用户组。

```bash
$ id
uid=1000(liusen) gid=1000(liusen) groups=1000(liusen),10(wheel),974(wireshark),977(vboxusers)
```

要查询特定的用户所属用户组，可以在后面接用户。

```bash
$ id liusen
uid=1000(liusen) gid=1000(liusen) groups=1000(liusen),10(wheel),977(vboxusers),974(wireshark)

$ id root
uid=0(root) gid=0(root) groups=0(root)
```


查看一个用户属于多少个组 OK  
查看一个组里有多少个用户




