# wc

```bash
$ wc -l mylog.txt
2500 mylog.txt

$ split mylog.txt --verbose
creating file 'xaa'
creating file 'xab'
creating file 'xac'

## 查看多个文件的行号，使用*
$ wc -l xa*
 1000 xaa
 1000 xab
  500 xac
 2500 total

## 查看多个文件的行号，使用[]
$ wc -l xa[ab]
 1000 xaa
 1000 xab
 2000 total
```
