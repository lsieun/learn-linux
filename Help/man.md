# man

查找`-s`选项

```txt
/^[ ]+-s
```

- `^`: 表示从开头开始
- `[ ]+`: 有多个空格
- `-s`: 要查找的选项是`-s`

查找一个完整单词`status`

```txt
/\bstatus\b
```

- `-b`: Word Boundary
- `status`: 要查找的单词
- `-b`: Word Boundary

