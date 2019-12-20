# ulimit

https://terry.im/wiki/terry/attachments/2752518/2916384.html

```bash
ulimit [-HSabcdefiklmnpqrstuvxPT [limit]]
```
Provides control over the resources available to the shell and to processes started by it, on systems that allow such control.  

The `-H` and `-S` options specify that the **hard** or **soft** limit is set for the given resource.  A **hard** limit can not be increased by a non-root user once it is set; a **soft** limit may be increased up to the value of the hard limit.

```bash
-a     All current limits are reported
-n     The maximum number of open file descriptors (most systems do not allow this value to be set)
```

## the number of open file descriptors in use by root exceed ulimit -n?

https://serverfault.com/questions/396872/why-or-how-does-the-number-of-open-file-descriptors-in-use-by-root-exceed-ulim

"`ulimits -Sn`" for "open files"

the ulimit for "open files" is indeed applied per process. To see what the process's current limits are:

```bash
cat /proc/__process_id__/limits
```

To determine how many files a process has open, you need to use the following command:

```bash
lsof -P -M -l -n -d '^cwd,^err,^ltx,^mem,^mmap,^pd,^rtd,^txt' -p __process_id__ -a | awk '{if (NR>1) print}' | wc -l
```
