# ps

查看帮助

```bash
man ps
```

`ps` - report a snapshot of the current processes.

- `-e`: Select all processes.
- `-f`: Do full-format listing.
- `-F`: Extra full format.
- `-l`: Long format.
- `-y`: Do not show flags; show rss in place of addr. This option can only be used with `-l`.

## Standard syntax and BSD syntax

To see every process on the system using **standard syntax**:

```bash
ps -e
ps -ef
ps -eF
ps -ely
```

To see every process on the system using **BSD syntax**:

```bash
ps ax
ps axu
```
