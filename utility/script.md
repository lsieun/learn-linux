# Script - Record Terminal Session

<!-- TOC -->

- [1. Script Command Syntax](#1-script-command-syntax)
- [2. Script Command Usage](#2-script-command-usage)
- [3. Reference](#3-reference)

<!-- /TOC -->

Script is a command line tool in Linux that allows you to record anything that scrolls through your terminal.

Suppose you are compiling a program and all the error messages, scroll off your screen without giving you time to read.

The `script` command will come to your aid. Using `script` it is possible to collect all the error messages scrolling through your screen for later use.

## 1. Script Command Syntax

```bash
script <filename>
```

`filename` is the name of the file in which script saves the terminal messages.

Once the `script` command is executed, you can continue doing what you were doing like compiling or running a command and so on.

And everything that you see on the screen will be written to the file you supplied with the `script` command. Once you have finished your task, type `exit` to terminate the `script` command.

## 2. Script Command Usage

```bash
$ script my_log_file
Script started, file is my_log_file
$ ls -l
...
$ ps aux
...
$ cat testfile
...
$ exit
Script done, file is my_log_file
```

Explanation of the above steps

- (1) You first start the `script` command and pass a file name to it - `my_log_file`.
- (2) Now `script` will start logging everything that is written to your terminal, including the output.
- (3) Finally to terminate the `script`, type `exit`.
- (4) Later you can open the file to see the output: `cat my_log_file`.

## 3. Reference

- [Script - Record Terminal Session](http://www.aboutlinux.info/2005/11/script-command-to-record-everything.html)
