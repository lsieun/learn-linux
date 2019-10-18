# hexdump

## 用途说明

hexdump命令一般用来查看”二进制“文件的十六进制编码，但实际上它的用途不止如此，手册页上的说法是“ascii, decimal, hexadecimal, octal dump“，这也就是本文标题为什么要将”十六“给引起来的原因，而且它能查看任何文件，而不只限于二进制文件了。另外还有xxd和od也可以做类似的事情，但是我从未用过。在程序输出二进制格式的文件时，常用hexdump来检查输出是否正确。当然也可以使用Windows上的UltraEdit32之类的工具查看文件的十六进制编码，但Linux上有现成的工具，何不拿来用呢。

## 常用参数

如果要看到较理想的结果，使用`-C`参数，显示结果分为三列（文件偏移量、字节的十六进制、ASCII字符）。

格式：

```bash
hexdump -C binfile
```

一般文件都不是太小，最好用less来配合一下。

格式：

```bash
hexdump -C binfile | less
```
