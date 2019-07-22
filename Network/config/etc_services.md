# /etc/services

From time to time you may need to know what service is running on a particular port. The `/etc/services` file contains that information and more.

```bash
more /etc/services
```

- 21: ftp
- 23: telnet
- 42: nameserver

By convention, ports numbered `0` to `1023` are considered the "well-known ports". Ports numbered `1024` to `49151` are the "Registered Ports". The Private and Dynamic ports go from `49152` to `65535`. If you are developing an application or are otherwise dealing with ports be sure to follow this port use convention.
