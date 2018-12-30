# How to Check CentOS or RHEL Version

URL: [4 Ways to Check CentOS or RHEL Version](https://www.tecmint.com/check-centos-version/)

## How to Check Linux Kernel Version in CentOS

Knowing the **kernel version** is just as important as knowing the **distro release version**. To check **Linux kernel version**, you can use the `uname` command.

```bash
$ uname -or
OR
$ uname -a  #print all system information
```

## How to Check CentOS or RHEL Release Version

**CentOS release version** numbers have **two** parts, **a major version** such as “6” or “7” and **a minor or update version**, such as or “6.x” or “7.x”, which correspond to the major version and update set of RHEL receptively, used to build a particular CentOS release.

### Using Hostnamectl Command

`hostnamectl` command is used to query and set Linux system hostname, and show other system related information, such as operating system release version as shown in the screenshot.

```bash
$ hostnamectl
```

Output:

```txt
   Static hostname: WebServer.lsieun.com
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: ee3226664a2c490d988f1133f25ef76e
           Boot ID: 173403e231cb4b43a5df56008559224c
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-862.el7.x86_64
      Architecture: x86-64
```

### Using Distro Release Files

You can view the contents of these files directly, using the `cat` command.

```bash
$ cat /etc/centos-release    [On CentOS]
$ cat /etc/redhat-release    [On RHEL]
$ cat /etc/system-release
$ cat /etc/os-release 		#contains more information
```

关于`/etc/system-release`的本质上是软链接，其实是这样的：

```bash
$ ll /etc/system-release # 在CentOS 7操作系统上
lrwxrwxrwx. 1 root root 14 Oct  9 12:44 /etc/system-release -> centos-release

$ ll /etc/system-release # 在Fedora 28操作系统上
lrwxrwxrwx. 1 root root 14 Dec 13 04:13 /etc/system-release -> fedora-release
```

