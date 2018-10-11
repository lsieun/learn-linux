# cowsay

NAME

cowsay/cowthink - configurable speaking/thinking cow (and a bit more)

SYNOPSIS

```bash
cowsay [-e eye_string] [-f cowfile] [-h] [-l] [-n] [-T tongue_string] [-W column] [-bdgpstwy]
```

DESCRIPTION

Cowsay generates an ASCII picture of a cow saying something provided by the user. If run with no arguments, it accepts standard input, word-wraps the message given at about 40 columns, and prints the cow saying the given message on standard output.

```bash
$ cowsay "Hello World"
```

Output:

```txt
 _____________
< Hello World >
 -------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```


To aid in the use of arbitrary messages with arbitrary whitespace, use the `-n` option. If it is specified, the given message will not be word-wrapped. This is possibly useful if you want to make the cow think or speak in figlet(6). If `-n` is specified, there must not be any command-line arguments left after all the switches have been processed.

The `-W` specifies roughly (where the message should be wrapped. The default is equivalent to `-W 40` i.e. wrap words at or before the 40th column.

> `-W`是指文字的列宽。

If any command-line arguments are left over after all switches have been processed, they become the cow's message. The program will not accept standard input for a message in this case.

```bash
$ cowsay `ls -l`
# 两个命令的效果是一样的
$ ls -l | cowsay
```

Output:

```txt
$ cowsay `ls ./`
 _______________________________________
/ 1.sh 2.sh abc.sh com cow.sh           \
\ CreateAJarFile.java images md test.sh /
 ---------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

There are several provided modes which change the appearance of the cow depending on its particular emotional/physical state. The `-b` option initiates Borg mode; `-d` causes the cow to appear dead; `-g` invokes greedy mode; `-p` causes a state of paranoia(妄想症；偏执狂) to come over the cow; `-s` makes the cow appear thoroughly stoned(石一般的); `-t` yields a tired cow; `-w` is somewhat the opposite of `-t`, and initiates wired mode; `-y` brings on the cow's youthful appearance.

```bash
$ cowsay -b "HelloWorld"
 ____________
< HelloWorld >
 ------------
        \   ^__^
         \  (==)\_______
            (__)\       )\/\
                ||----w |
                ||     ||


$ cowsay -d "HelloWorld"
 ____________
< HelloWorld >
 ------------
        \   ^__^
         \  (xx)\_______
            (__)\       )\/\
             U  ||----w |
                ||     ||

$ cowsay -g "HelloWorld"
 ____________
< HelloWorld >
 ------------
        \   ^__^
         \  ($$)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

$ cowsay -p "HelloWorld"
 ____________
< HelloWorld >
 ------------
        \   ^__^
         \  (@@)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

$ cowsay -s "HelloWorld"
 ____________
< HelloWorld >
 ------------
        \   ^__^
         \  (**)\_______
            (__)\       )\/\
             U  ||----w |
                ||     ||

$ cowsay -t "HelloWorld"
 ____________
< HelloWorld >
 ------------
        \   ^__^
         \  (--)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

$ cowsay -w "HelloWorld"
 ____________
< HelloWorld >
 ------------
        \   ^__^
         \  (OO)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

$ cowsay -y "HelloWorld"
 ____________
< HelloWorld >
 ------------
        \   ^__^
         \  (..)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```


The user may specify the `-e` option to select the appearance of the cow's eyes, in which case the first two characters of the argument string `eye_string` will be used. **The default eyes** are '`oo`'.

> eye

The tongue is similarly configurable through `-T` and `tongue_string`; it must be two characters and does not appear by default. However, it does appear in the 'dead' and 'stoned' modes. Any configuration done by `-e` and `-T` will be lost if one of the provided modes is used.

> tongue

The `-f` option specifies a particular cow picture file (`cowfile`) to use. If the cowfile spec contains '`/`' then it will be interpreted as a path relative to the current directory. Otherwise, cowsay will search the path specified in the `COWPATH` environment variable. To list all cowfiles on the current `COWPATH`, invoke cowsay with the `-l` switch.

> cowfile

```bash
$ cowsay -l
```

Output:

```
Cow files in /usr/share/cowsay:
beavis.zen blowfish bud-frogs bunny cheese cower default dragon
dragon-and-cow elephant elephant-in-snake eyes flaming-sheep ghostbusters
head-in hellokitty kiss kitty koala kosh luke-koala mech-and-cow meow milk
moofasa moose mutilated ren sheep skeleton small stegosaurus stimpy
supermilker surgery telebears three-eyes turkey turtle tux udder vader
vader-koala www
```

If the program is invoked as `cowthink` then the cow will think its message instead of saying it.

## 使用Vim测试cowfile

第一，创建新文件`cow.sh`：

```bash
vim cow.sh
```

添加内容如下:

```bash
#! /bin/bash
```

第二，输入以下vim命令：

```vim
:r !cowsay -l
```

此时文件内容如下:

```bash
#! /bin/bash
Cow files in /usr/share/cowsay: # 删除这一行
beavis.zen blowfish bud-frogs bunny cheese cower default dragon
dragon-and-cow elephant elephant-in-snake eyes flaming-sheep ghostbusters
head-in hellokitty kiss kitty koala kosh luke-koala mech-and-cow meow milk
moofasa moose mutilated ren sheep skeleton small stegosaurus stimpy
supermilker surgery telebears three-eyes turkey turtle tux udder vader
vader-koala www
```

第三，使用vim替换命令，将空格换成回车

```vim
:2,$s/ /^M/g
```

第四，使用vim替换命令，生成`cowsay -f tux "tux"`格式的内容

```vim
:2,$s/^\(.*\)$/cowsay -f \1 "\1"/g
```

第五，执行`cow.sh`文件，查看效果

```bash
$ sh cow.sh
```
