# cat

<!-- TOC -->

- [1. show file with line number](#1-show-file-with-line-number)
- [2. show whitespace character](#2-show-whitespace-character)
- [3. create file](#3-create-file)
- [4. merge file](#4-merge-file)

<!-- /TOC -->

## 1. show file with line number

- `-n`, `--number`: number all output lines
- `-s`, `--squeeze-blank`: suppress repeated empty output lines

```bash
$ cat lazy_dog.txt
The quick brown fox



jumped over




the lazy dog.

# 使用-n参数
$ cat -n lazy_dog.txt
     1	The quick brown fox
     2	
     3	
     4	
     5	jumped over
     6	
     7	
     8	
     9	
    10	the lazy dog.

# 使用-ns参数
$ cat -ns lazy_dog.txt
     1	The quick brown fox
     2	
     3	jumped over
     4	
     5	the lazy dog.
```

## 2. show whitespace character

- `-A`: equivalent to `-vET`
- `-E`: display `$` at end of each line
- `-T`: display TAB characters as `^I`
- `-v`: use `^` and `M-` notation, except for LFD and TAB

```bash
$ cat -A lazy_dog.txt 
The quick brown fox $
^I$
$
$
jumped over $
$
$
$
$
the lazy dog.$
```

## 3. create file

Let’s say we wanted to create a file called `lazy_dog.txt`.

```bash
$ cat > lazy_dog.txt
The quick brown fox jumped over the lazy dog.
```

Type the command followed by the text we want to place in the file. Remember to type `ctrl-D` at the end.

Using the command line, we have implemented the world’s **dumbest word processor**!

## 4. merge file

```bash
cat movie.mpeg.0* > movie.mpeg
```

Because **wildcards**(`*`) always expand in sorted order, the arguments will be
arranged in the correct order.
