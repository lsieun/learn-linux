# Path name expansion

<!-- TOC -->

- [1. Curly braces](#1-curly-braces)
  - [1.1. Example (`{abc,xyz}`)](#11-example-abcxyz)
  - [1.2. Example (`{from..to}`)](#12-example-fromto)
- [2. Wildcards](#2-wildcards)
  - [2.1. Example (`*`)](#21-example)
  - [2.2. Example (`?`)](#22-example)
  - [2.3. Example (`[]`)](#23-example)

<!-- /TOC -->

## 1. Curly braces

- A curly braces (`{..}`) expands to create pattern and syntax is:

```txt
{ pattern1, pattern2, patternN }
text{ pattern1, pattern2, patternN }
text1{ pattern1, pattern2, patternN }text2
command something/{ pattern1, pattern2, patternN }
```

- It will save command typing time.
- Arbitrary strings may be generated.

### 1.1. Example (`{abc,xyz}`)

```bash
$ echo I like {tom,jerry}
I like tom jerry

$ echo file{1,2,3}.txt
file1.txt file2.txt file3.txt

$ mkdir -p mydir/{dir-a,dir-b}/{dir-x,dir-y}
$ tree mydir/
mydir/
├── dir-a
│   ├── dir-x
│   └── dir-y
└── dir-b
    ├── dir-x
    └── dir-y

6 directories, 0 files
```

The filenames generated do not need to exist. You can also run a command for every pattern inside the braces. Usually, you can type the following to list three files:

```bash
ls -l /etc/resolv.conf /etc/hosts /etc/passwd
```

But, with curly braces:

```bash
ls -l /etc/{resolv.conf,hosts,passwd}
```

### 1.2. Example (`{from..to}`)

字母增加：

```bash
$ echo file_{a..c}.txt # 小写字母
file_a.txt file_b.txt file_c.txt

$ echo file_{A..C}.txt # 大写字母
file_A.txt file_B.txt file_C.txt
```

数字增加：

```bash
$ echo file_{1..3}.txt
file_1.txt file_2.txt file_3.txt

$ echo file_{11..13}.txt # 不一定要从1开始
file_11.txt file_12.txt file_13.txt

$ echo file_{001..003}.txt # 显示三位数
file_001.txt file_002.txt file_003.txt
```

实践：

```bash
mkdir -p playground/dir-{001..100}
touch playground/dir-{001..100}/file-{A..Z}
```

## 2. Wildcards

Bash supports the following three simple wildcards:

- `*` - Matches any string, including the null string
- `?` - Matches any single (one) character.
- `[...]` - Matches any one of the enclosed characters.

### 2.1. Example (`*`)

```bash
$ ls /bin/*zip
/bin/gunzip  /bin/gzip
```

You can combine **wildcards** with **curly braces**:

```bash
ls *.{c,h}
```

### 2.2. Example (`?`)

To list all png file:

```bash
touch image{1..7}.png
ls image?.png
```

### 2.3. Example (`[]`)

To list all file configuration file start with either letter `a` or `b`, enter:

```bash
$ ls /etc/[ab]*.conf
/etc/adduser.conf  /etc/apg.conf  /etc/appstream.conf
```

```bash
$ ls /usr/sbin/[[:upper:]]*
/usr/sbin/ModemManager  /usr/sbin/NetworkManager
```
