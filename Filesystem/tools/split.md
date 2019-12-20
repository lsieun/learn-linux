# split

<!-- TOC -->

- [1. Intro](#1-intro)
- [2. Split Method](#2-split-method)
  - [2.1. Split files with customize line numbers (`-l`)](#21-split-files-with-customize-line-numbers--l)
  - [2.2. Split files with file size using option (`-b`)](#22-split-files-with-file-size-using-option--b)
  - [2.3. Split files with file num using option (`-n`)](#23-split-files-with-file-num-using-option--n)
- [3. Split File Name](#3-split-file-name)
  - [3.1. File Name Prefixe](#31-file-name-prefixe)
  - [3.2. File Name Suffix](#32-file-name-suffix)
- [4. Example](#4-example)
  - [4.1. Example: 1) Split File into Pieces](#41-example-1-split-file-into-pieces)
  - [4.2. Example: 2) Split Command with verbose option](#42-example-2-split-command-with-verbose-option)
  - [4.3. Example: 3) Split files with customize line numbers (`-l`)](#43-example-3-split-files-with-customize-line-numbers--l)
  - [4.4. Example: 4) Split files with file size using option `-b`](#44-example-4-split-files-with-file-size-using-option--b)
  - [4.5. Example: 5) Create Split files with numeric suffix instead of alphabetic (`-d`)](#45-example-5-create-split-files-with-numeric-suffix-instead-of-alphabetic--d)
  - [4.6. Example: 6) Split file with Customize Suffix](#46-example-6-split-file-with-customize-suffix)
  - [4.7. Example: 7) Generate n chunks output files with split command (`-n`)](#47-example-7-generate-n-chunks-output-files-with-split-command--n)
  - [4.8. Example: 8) Prevent Zero Size Split output files with option (-e)](#48-example-8-prevent-zero-size-split-output-files-with-option--e)
  - [4.9. Example:9) Create Split output files of customize suffix length (-a option)](#49-example9-create-split-output-files-of-customize-suffix-length--a-option)
  - [4.10. Example: 10) Split ISO file and merge it into a single file](#410-example-10-split-iso-file-and-merge-it-into-a-single-file)
  - [4.11. Example: 11) Verify the Integrity of Merge file using md5sum utility](#411-example-11-verify-the-integrity-of-merge-file-using-md5sum-utility)

<!-- /TOC -->

## 1. Intro

As the name suggests ‘split‘ command is used to split or break a file into the pieces in Linux and UNIX systems.

Syntax for `split` command:

```bash
split [options] [file_name] [prefix]
```

思路整理：

- split
  - 分割方式 method
    - 文件行数 line number(`-l`)
    - 文件大小 file size(`-b`)
    - 指定数量 file number(`-n`)
  - 文件名
    - 文件名前缀 prefix (`[prefix]`参数)
    - 文件名后缀和后缀长度 suffix and length(`-a`)
      - 字母
      - 数字 digit(`-d`)

## 2. Split Method

### 2.1. Split files with customize line numbers (`-l`)

默认是以1000行分隔。

### 2.2. Split files with file size using option (`-b`)

Using Split command we can split a file with file size. Use the following syntax to split files with size in bytes, KB , MB and GB

```bash
split  -b {bytes}  {file_name}
split  -b nK       {file_name}    # n is the numeric value
split  -b nM       {file_name}    # n is the numeric value
split  -b nG       {file_name}    # n is the numeric value
```

### 2.3. Split files with file num using option (`-n`)

Use ‘`-n`’ option with split command limit the number of split output files.

```bash
split -n 5 filename
```

## 3. Split File Name

### 3.1. File Name Prefixe

默认值是`x`。

### 3.2. File Name Suffix

- suffix length（默认是2）
- suffix value
  - 字母（默认）
  - 数字

## 4. Example

### 4.1. Example: 1) Split File into Pieces

Whenever we split a large file with `split` command then split output file’s **default size** is **1000 lines** and its default prefix would be ‘`x`’.

知识点：

- （1） 默认的分割方式是“行数”，其值是1000行。
- （2） 生成的默认文件名前缀是`x`

```bash
#!/bin/bash

log_file="mylog.txt"
log_size=2500

for ((i=1;i<=log_size;i++))
do
    echo "log ${i}" >> ${log_file}
done
```

```bash
$ ll -h
total 28K
-rw-r--r-- 1 liusen liusen 21K Oct 24 14:44 mylog.txt
-rw-r--r-- 1 liusen liusen 120 Oct 24 14:44 produce_log.sh

$ split mylog.txt
$ ll
total 56
-rw-r--r-- 1 liusen liusen 21393 Oct 24 14:44 mylog.txt
-rw-r--r-- 1 liusen liusen   120 Oct 24 14:44 produce_log.sh
-rw-r--r-- 1 liusen liusen  7893 Oct 24 14:46 xaa
-rw-r--r-- 1 liusen liusen  9000 Oct 24 14:46 xab
-rw-r--r-- 1 liusen liusen  4500 Oct 24 14:46 xac
```

### 4.2. Example: 2) Split Command with verbose option

We can run split command in **verbose mode** with option ‘`-verbose`‘.

```bash
$ split mylog.txt --verbose
creating file 'xaa'
creating file 'xab'
creating file 'xac'
```

### 4.3. Example: 3) Split files with customize line numbers (`-l`)

Let’s suppose we want to split a file with customize line numbers, let say I want max 200 lines per file.

```bash
$ split -l 200 mylog.txt --verbose
creating file 'xaa'
creating file 'xab'
creating file 'xac'
creating file 'xad'
creating file 'xae'
creating file 'xaf'
creating file 'xag'
creating file 'xah'
creating file 'xai'
creating file 'xaj'
creating file 'xak'
creating file 'xal'
creating file 'xam'

$ wc -l x*
  200 xaa
  200 xab
  200 xac
  200 xad
  200 xae
  200 xaf
  200 xag
  200 xah
  200 xai
  200 xaj
  200 xak
  200 xal
  100 xam
 2500 total
```

### 4.4. Example: 4) Split files with file size using option  `-b`

Split file based on bytes:

```bash
split -b 2000000 tuxlap.txt
```

Split file based on KB:

```bash
split -b 50K tuxlap.txt
```

Split file based on MB:

```bash
split -b 50M tuxlap.txt
```

Split file based on GB:

```bash
split -b 1G tuxlap.txt
```

### 4.5. Example: 5) Create Split files with numeric suffix instead of alphabetic (`-d`)

In the above examples we have seen that `split` command output files are created with alphabetic suffix like `xaa, xab….. xan`, Use ‘`-d`’ option with `split` command to create split output files with numeric suffix like `x00, x01, … x0n`

```bash
$ split -d mylog.txt --verbose
creating file 'x00'
creating file 'x01'
creating file 'x02'
```

### 4.6. Example: 6) Split file with Customize Suffix

With `split` command we can create split output files with customize suffix. Let’s assume we want to create split output files with customize suffix

Syntax:

```bash
split {file_name} {prefix_name}
```

```bash
$ split mylog.txt split_file_ --verbose
creating file 'split_file_aa'
creating file 'split_file_ab'
creating file 'split_file_ac'

$ split mylog.txt split_file_ -d --verbose
creating file 'split_file_00'
creating file 'split_file_01'
creating file 'split_file_02'
```

### 4.7. Example: 7) Generate n chunks output files with split command (`-n`)

Let’s suppose we want to split an iso file into 4 chunk output files. Use ‘`-n`’ option with split command limit the number of split output files.

```bash
$ split -d -n 5 linux-lite.iso split_iso_ --verbose
creating file 'split_iso_00'
creating file 'split_iso_01'
creating file 'split_iso_02'
creating file 'split_iso_03'
creating file 'split_iso_04'
```

### 4.8. Example: 8) Prevent Zero Size Split output files with option (-e)

There can be some scenarios where we split a small file into a large number of chunk files and zero size split output files can be created in such cases, so to avoid **zero size split output file**, use the option ‘`-e`’

```bash
# 这个文件只有7个byte
$ ls -l myfile
-rw-r--r-- 1 liusen liusen 7 Oct 24 15:26 myfile

# 分隔成10个文件
$ split -n 10 myfile

# 会发现会生成大小为0的文件
$ ls -l x*
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:29 xaa
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:29 xab
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:29 xac
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:29 xad
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:29 xae
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:29 xaf
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:29 xag
-rw-r--r-- 1 liusen liusen 0 Oct 24 15:29 xah
-rw-r--r-- 1 liusen liusen 0 Oct 24 15:29 xai
-rw-r--r-- 1 liusen liusen 0 Oct 24 15:29 xaj

# 删除文件
$ rm x*

# 使用-e参数
$ split -n 10 -e myfile

# 避免了生成大小为0的空文件
$ ls -l x*
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:30 xaa
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:30 xab
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:30 xac
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:30 xad
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:30 xae
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:30 xaf
-rw-r--r-- 1 liusen liusen 1 Oct 24 15:30 xag
```

### 4.9. Example:9) Create Split output files of customize suffix length (-a option)

Let’s suppose we want to split an iso file and where size of each split output file is 500MB and suffix length is to be `3`.  Use the following split command:

注意：这里后缀，以前长度是2个，现在长度变成了3个。

```bash
$ split -b 500M -a 3 linux-lite.iso --verbose
creating file 'xaaa'
creating file 'xaab'
creating file 'xaac'

$ split -b 500M -a 3 -d linux-lite.iso split_iso_ --verbose
creating file 'split_iso_000'
creating file 'split_iso_001'
creating file 'split_iso_002'
```

### 4.10. Example: 10) Split ISO file and merge it into a single file

```bash
$ split -b 500M -d linux-lite.iso split_iso_ --verbose
creating file 'split_iso_00'
creating file 'split_iso_01'
creating file 'split_iso_02'

$ ls -lh split_iso_*
-rw-r--r-- 1 liusen liusen 500M Oct 24 15:41 split_iso_00
-rw-r--r-- 1 liusen liusen 500M Oct 24 15:41 split_iso_01
-rw-r--r-- 1 liusen liusen 348M Oct 24 15:41 split_iso_02
```

merge these files into a single using `cat` command

```bash
# 合并成一个文件
$ cat split_iso_* > newFile.iso

$ ls -lh newFile.iso
-rw-r--r-- 1 liusen liusen 1.4G Oct 24 15:43 newFile.iso
```

### 4.11. Example: 11) Verify the Integrity of Merge file using md5sum utility

As per Example 10, once the `split` output files are merged into a single file, then we can check the integrity of actual & merge file with `md5sum` utility. Example is shown below:

```bash
# 原ISO文件的MD5值
$ md5sum linux-lite.iso
feccbfb1629396562fffe35b7664a458  linux-lite.iso

# 新ISO文件的MD5值
$ md5sum newFile.iso
feccbfb1629396562fffe35b7664a458  newFile.iso
```
