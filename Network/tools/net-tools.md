# net-tools

- ifconfig
- netstat
- route

arp, ifconfig, netstat,
 rarp, nameif and route

## Debian

Debian下，需要和`sudo`一起使用

## netstat

```bash
$ netstat -nltp
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -
tcp        0      0 0.0.0.0:23              0.0.0.0:*               LISTEN      -
tcp6       0      0 :::22                   :::*                    LISTEN      -
```

- `-l`, `--listening`: Show only listening sockets.  (These are omitted by default.)
- `-p`, `--program`: Show the PID and name of the program to which each socket belongs.
- `--numeric`, `-n`: Show numerical addresses instead of trying to determine symbolic host, port or user names.
- `--tcp`, `-t`
