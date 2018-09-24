# ls命令

[TOC]

ls command options:

```
-a, --all 列出目录下的所有内容，包括隐藏文件和目录
-d, --directory 查看目录本身的内容
-F, --classify 文件或或者目录名字后加一个字符的分类标识（个人觉得，不太实用啊！！！）
-h, --human readable 适合于人类的可读格式
-l, (long) 长格式输出，注意没有--long
-r, --reverse 反序（默认按字母升序排序，使用-r进行倒序输出）
-t, --time 按修改时间排序（默认按修改时间倒序排序，可以和 -r 一起使用，从而按修改时间正序显示）
```

## 1. 查看目录内容

```bash
#查看当前目录
ls

#查看指定目录
ls /usr/local/

#查看两个目录下的内容
ls /usr /var
```

## 2. 查看详细内容

```bash
#查看当前目录下的详细内容
ls -l

#查看指定目录下的详细内容
ls -l /usr/   # 其中 -l 代表 long，即长格式
```

## 3. 查看隐藏文件

```bash
ls -a
ls --all
```

## 4. 查看目录本身的信息

之前的ls命令都是查看目录下的内容，使用`-d`选项（options）可以查看目录本身的信息

```bash
ls -d /usr/              #short options
ls --directory /usr/     #long  options
ls -dl /usr/             #查看详细的目录信息
```
