# find

[TOC]

查找：

- 文件名
- 文件类型
- 逻辑（或、非）：文件名、文件类型
- 时间：访问时间（文件内容）、修改时间（文件内容）、改变时间（元数据：文件名、文件大小、权限等）
- 用户和用户组
- 文件大小

## 1. 文件名查找

按**文件名**查找，默认查找当前目录，命令如下：

```bash
find -name "a*"           # 在当前目录查找
find /tmp -name "a*"      # 在/tmp目录查找
```
## 2. 文件类型查找

按**文件类型**查找，命令如下：

```bash
find /tmp -name "a*" -type f           # 查找以a开头的文件（注意：类型是文件）
find /tmp -name "a*" -type s           # 查找以a开头的套接字
```

## 3. 逻辑（或、非）查询

使用逻辑“或”、“非”

```
find /tmp -name "a*" -o -name "b*"     # 查找以a开头或b开头的文件或目录（逻辑“或”）
find /tmp -name "a*" ! -type f         # 查找以a开头的非文件（逻辑“非”）
```
## 4. 按时间查询

Hi, Hi, Hi!!!`find`命令可以根据三种访问时间来查找

| 命令选项   | 时间类型 | 时间单位   | 命令说明                                     |
| ---------- | -------- | ---------- | -------------------------------------------- |
| `-amin n`  | Access   | `n`分钟    | 查找系统中最后`n`分钟访问的文件              |
| `-atime n` | Access   | `n*24`小时 | 查找系统中最后`n*24`小时访问的文件           |
| `-mmin n`  | Modify   | `n`分钟    | 查找系统中最后`n`分钟被改变文件数据的文件    |
| `-mtime n` | Modify   | `n*24`小时 | 查找系统中最后`n*24`小时被改变文件数据的文件 |
| `-cmin n`  | Change   | `n`分钟    | 查找系统中最后`n`分钟被改变文件状态的文件    |
| `-ctime n` | Change   | `n*24`小时 | 查找系统中最后`n*24`小时被改变文件状态的文件 |



同时要注意：`+n`和`-n`的区别。例如

- 使用 `-amin +5`表示5分钟之前访问的文件
- 使用 `-amin -5` 表示5分钟以内访问的文件


## 5. 根据属主和属组查询

### 5.1 用户名和用户组查询

直接根据用户名和用户组进行查询：

```bash
find /home -user liusen    # 根据用户进行查询
find /home -group tomcat   # 根据属组进行查询
```

### 5.2 用户ID和用户组ID查询

查询用户ID：

```bash
$ id    # 查询当前用户ID
uid=1000(liusen) gid=1000(liusen) groups=1000(liusen),10(wheel),977(vboxusers)

$ id liusen    # 查询指定用户名的ID
uid=1000(liusen) gid=1000(liusen) groups=1000(liusen),10(wheel),977(vboxusers)

$ id root
uid=0(root) gid=0(root) groups=0(root)
```

根据用户ID和用户组ID查询：

```bash
find ./ -uid 1000
find ./ -gid 1000
```

## 6. 根据文件大小查询

```bash
find /home -empty         # 查找空文件或文件夹
find /home ! -empty       # 查找不空的文件或文件夹 

find /home -size -512k    # 查找小于512k的文件
find /home -size +512k    # 查找大于512k的文件夹
```

关于`-size`选项：

```
-size n[cwbkMG]
        File uses n units of space, rounding up.  The following suffixes can be used:

        `b'    for 512-byte blocks (this is the default if no suffix is used)

        `c'    for bytes

        `w'    for two-byte words

        `k'    for Kilobytes (units of 1024 bytes)

        `M'    for Megabytes (units of 1048576 bytes)

        `G'    for Gigabytes (units of 1073741824 bytes)
```

More Example: 拿着`find`命令到处敲敲打打

```bash
find /home -size -25k ! -empty
find /home -size -25k ! -empty -type f
```