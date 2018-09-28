# less命令

```bash
less <file_name>   
```

- 按`j`一行一行往下走，按`k`是一行一行往上走，
- 按`space`是翻页，`Ctrl+U`是向上翻页，`Ctrl+D`是向下翻页
- 按`gg`到达顶端，按`G`到达文件底端
- 按`q`退出
- 按下`/`可以输入字符，再`Enter`后进行搜索，按`n`查找下一个，按下`N`是向上查找


```bash
less /etc/passwd

#查看定时任务的文件
less /etc/crontab
```