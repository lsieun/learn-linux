# source.md

URL:

- 

## 1. `source` is builtin bash

```bash
$ type source

source is a shell builtin
```

语法：

```bash
source filename [arguments]
```

Execute commands from a file in the current shell.


The dot command '`.`' is the equivalent of the C Shell (and Bash) `source` command. 


## 2. linux里`source`、`sh`、`bash`、`./`有什么区别

URL: https://www.cnblogs.com/pcat/p/5467188.html

- `source test.sh`: 在**当前shell**内去读取、执行`test.sh`，而`test.sh`**不需要**有"执行权限"，可以简写为`. test.sh`
- `sh test.sh` or `bash test.sh`: 打开一个**subshell**去读取、执行`test.sh`，而`test.sh`**不需要**有"执行权限"
- `./test.sh`: 打开一个**subshell**去读取、执行`test.sh`，但`test.sh`**需要**有"执行权限"，可以用`chmod +x`添加执行权限

## 3. fork、source、exec

- 使用`fork`方式运行script时， 就是让shell(parent process)产生一个child process去执行该script，当child process结束后，会返回parent process，但parent process的环境是不会因child process的改变而改变的。
- 使用`source`方式运行script时， 就是让script在当前process内执行， 而不是产生一个child process来执行。由于所有执行结果均于当前process内完成，若script的环境有所改变， 当然也会改变当前process环境了。
- 使用`exec`方式运行script时， 它和source一样，也是让script在当前process内执行，但是process内的原代码剩下部分将被终止。同样，process内的环境随script改变而改变。

通常如果我们执行时，都是默认为fork的。

下面的例子挺有趣的：

1.sh

```bash
#!/bin/bash
A=B
echo "PID for 1.sh before exec/source/fork:$$"
export A
echo "1.sh: \$A is $A"
case $1 in
    exec)
        echo "using exec..."
        exec ./2.sh ;;
    source)
        echo "using source..."
        . ./2.sh ;;
    *)
        echo "using fork by default..."
        ./2.sh ;;
esac
echo "PID for 1.sh after exec/source/fork:$$"
echo "1.sh: \$A is $A"
```

2.sh

```bash
#!/bin/bash
echo "PID for 2.sh: $$"
echo "2.sh get \$A=$A from 1.sh"
A=C
export A
echo "2.sh: \$A is $A"
```

Run:

```bash
chmod u+x 1.sh
chmod u+x 2.sh
./1.sh fork
./1.sh source
./1.sh exec
```

Output:

```bash
$ ./1.sh fork

PID for 1.sh before exec/source/fork:5416  ## 注意：两个PID是不一样的
1.sh: $A is B
using fork by default...
PID for 2.sh: 5423
2.sh get $A=B from 1.sh
2.sh: $A is C
PID for 1.sh after exec/source/fork:5416
1.sh: $A is B


$ ./1.sh source

PID for 1.sh before exec/source/fork:5437  ## 注意：PID是一样的
1.sh: $A is B
using source...
PID for 2.sh: 5437
2.sh get $A=B from 1.sh
2.sh: $A is C
PID for 1.sh after exec/source/fork:5437
1.sh: $A is C


$ ./1.sh exec

PID for 1.sh before exec/source/fork:5477  ## 注意：PID是一样的
1.sh: $A is B
using exec...
PID for 2.sh: 5477
2.sh get $A=B from 1.sh
2.sh: $A is C  ## 注意：1.sh后面的代码没有执行
```