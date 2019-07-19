# Memory

The `free` command displays information on memory.

```bash
$ free
              total        used        free      shared  buff/cache   available
Mem:       16325376     3764188      715608     2807488    11845580     9411412
Swap:      16665596           0    16665596
```

The `free` command supports the `-m` and `-g` options, and displays its data either in **mebibytes** or in **gibibytes**, respectively.

```bash
## 单位：mebibyte
$ free -m
              total        used        free      shared  buff/cache   available
Mem:          15942        3694         674        2730       11572        9183
Swap:         16274           0       16274
```

```bash
## 单位：gibibyte
$ free -g
              total        used        free      shared  buff/cache   available
Mem:             15           3           0           2          11           8
Swap:            15           0          15
```
