# file

<!-- TOC -->

- [1. Linux文件类型](#1-Linux%E6%96%87%E4%BB%B6%E7%B1%BB%E5%9E%8B)
- [2. Linux文件时间](#2-Linux%E6%96%87%E4%BB%B6%E6%97%B6%E9%97%B4)
- [3. file命令](#3-file%E5%91%BD%E4%BB%A4)

<!-- /TOC -->

## 1. Linux文件类型

Linux文件类型:

- 1.普通文件    标识 `-`
- 2.目录文件    标识 `d`
- 3.套接字文件  socket 让两个进程进行通信，使用软件模拟的设备   标识 `s`
- 4.命名管道 pipe  标识 `p`
- 5.链接文件
    - 软链接 标识 `l`
    - 硬链接 标识 `-`
- 6.特殊文件，用于作为硬件设备访问的文件
    - 块设备，例如硬盘  读取是随机的  按块读取   标识 `b`
    - 字符设备 有前后顺序    标识 `c`

| 文件类型     | 标识                 | 说明                                                         |
| ------------ | -------------------- | ------------------------------------------------------------ |
| 普通文件     | `-`                  |                                                              |
| 目录文件     | `d`                  |                                                              |
| 套接字文件   | `s`                  | socket 让两个进程进行通信，使用软件模拟的设备                |
| 命名管道pipe | `p`                  |                                                              |
| 链接文件     | 软链接`l`<br/>硬链接`-`   | 硬链接的标识 与 普通文件的标识是一样的。 |
| 特殊文件     | 块设备`b`<br/>字符设备`c` | 用于作为硬件设备访问的文件。<br/>块设备，例如硬盘  读取是随机的  按块读取。<br/>字符设备 有前后顺序。 |

```bash
$ ls -l /run

-rw-r--r--  1 root    root       5 Sep 18 08:33 sshd.pid           # 普通文件
drwxr-xr-x  2 root    root      80 Sep 18 08:38 console            # 目录文件
srw-rw-rw-  1 root    root       0 Sep 18 08:33 secrets.socket     # 套接字文件
prw-------  1 root    root       0 Sep 18 08:33 dmeventd-client    # 命名管道pipe
prw-------  1 root    root       0 Sep 18 08:33 dmeventd-server
```

```bash
$ ls -l /dev

lrwxrwxrwx   1 root   root              13 Sep 18 16:33 fd -> /proc/self/fd    # 软链接
lrwxrwxrwx   1 root   root              15 Sep 18 16:33 stderr -> /proc/self/fd/2
lrwxrwxrwx   1 root   root              15 Sep 18 16:33 stdin -> /proc/self/fd/0
lrwxrwxrwx   1 root   root              15 Sep 18 16:33 stdout -> /proc/self/fd/1
brw-rw----   1 root   disk      253,     0 Sep 18 08:33 dm-0    # 块设备
brw-rw----   1 root   disk      253,     1 Sep 18 08:33 dm-1
brw-rw----   1 root   disk      253,     2 Sep 18 08:33 dm-2
crw-rw-rw-   1 root   tty         5,     0 Sep 23 16:55 tty     # 字符设备
```

## 2. Linux文件时间

每个文件都有3个时间：

- （1）最近一次访问时间   Access
- （2）最近一次内容修改时间   Modify
- （3）最近一次元数据改变时间  元数据：文件名、大小、权限 Change



| 时间类型 | 含义                   | 备注                                                         |
| -------- | ---------------------- | ------------------------------------------------------------ |
| Access   | 最近一次访问时间       |                                                              |
| Modify   | 最近一次内容修改时间   |                                                              |
| Change   | 最近一次元数据改变时间 | 元数据：文件名、大小、权限<br/>每一次内容的改变，必然导致元数据的改变 |


查看文件三个时间的命令是`stat`，示例如下：

```bash
$ stat diary.txt

  File: diary.txt
  Size: 8         	Blocks: 8          IO Block: 4096   regular file
Device: fd02h/64770d	Inode: 5639344     Links: 1
Access: (0664/-rw-rw-r--)  Uid: ( 1000/  liusen)   Gid: ( 1000/  liusen)
Access: 2018-09-18 20:39:06.274387227 +0800
Modify: 2018-08-31 09:27:03.391232701 +0800
Change: 2018-08-31 09:27:03.403230596 +0800
```

如果使用`touch <filename>`命令会将三个时间（Access/Modify/Change）更新为当前时间。

```bash
touch -a test.txt    # 只更新文件的“访问时间”
touch -m test.txt    # 只更新文件的“修改时间”
touch -m -t 201612301212.12 introduction.txt    # 将文件的“修改时间”改成某个时间点
```

使用`touch`命令的五个细节：

- （1）`-a`选项，修改Access时间，会同时更新Change时间
- （2）`-m`选项，修改Modify时间，会同时更新Change时间
- （3）`touch`命令没有直接修改Change时间的选项
- （4）`touch <filename>`不加任何选项会同时更新三个时间。如果文件不存在，会创建文件。
- （5）`touch -c <filename>`，如果文件不存在，则不会创建新文件。

```txt
NAME
       touch - change file timestamps

SYNOPSIS
       touch [OPTION]... FILE...

DESCRIPTION
       Update the access and modification times of each FILE to the current time.

       A FILE argument that does not exist is created empty, unless -c or -h is supplied.

       -a     change only the access time

       -c, --no-create
              do not create any files

       -m     change only the modification time

       -t STAMP
              use [[CC]YY]MMDDhhmm[.ss] instead of current time

```

## 3. file命令

`file`命令可以查看文件的类型（文本、二进制等），它并不是`bash`的内置命令。

```bash
$ type file

file is /usr/bin/file
```

`file`命令的语法和示例：

```bash
file <file_name>
file <file_name1> <file_name2>

# 示例
file /dev/cdrom
file /dev/cpu        # direcotry
file /etc/passwd     # text
```

More Example：拿着`file`命令到处敲敲打打

```bash
$ file workdir/     # directory
workdir/: directory

$ file log.txt      # text
log.txt: ASCII text

$ file foo.c        # c
foo.c: C source, ASCII text

$ file foo          # binary
foo: ELF 64-bit LSB executable, x86-64, version 1 (SYSV)...

$ file test.py      # python
test.py: Python script, ASCII text executable

$ file pom.xml      # xml
pom.xml: XML 1.0 document, UTF-8 Unicode text

$ file README.md    # markdown
README.md: UTF-8 Unicode text
```

> 人越是不了解自己，他对外面的世界就越是有好奇心。好奇心是一种逃避，它是我们对自己本质无知的最大逃避。——张方宇《单独中的洞见》
