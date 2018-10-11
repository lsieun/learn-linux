# Disk Space, Memory Use, and CPU Load: du, df, free, and w

URL: 

- https://learn.adafruit.com/an-illustrated-shell-command-primer/checking-file-space-usage-du-and-df

## Quick Start

How can I get processor/RAM/disk specs from the Linux command Line?

URL: https://serverfault.com/questions/112542/how-can-i-get-processor-ram-disk-specs-from-the-linux-command-line/112543

CPU

```bash
$ cat /proc/cpuinfo
```

Memory :

```bash
$ cat /proc/meminfo

$ free -h
```

HDD:

```bash
$ df -h
```

## du

It's often necessary to figure out how much space your files are using up, especially on smaller devices like the Raspberry Pi, where storage is frequently limited. This is where `du` (think **disk usage**, even though your "disk" is probably an SD card) comes in. By default, the output is pretty verbose and hard to read, so I usually use `-h` for human readable numbers with units and `-s` for a summary.

```bash
$ du -hs
```

You can also specify **a path**, and without the `-s` it will tell you the size of every file it looks at.

## df

Sometimes it's easier to come at the question by checking how much space is left on a drive.

`df` (**disk free**) provides a quick summary, broken out by device and where that device is attached to:

```bash
$ df -h
```


## free

A resource even more constrained than storage on the Raspberry Pi is `RAM`. free provides a useful quick summary of the state of the computer's memory:

```bash
$ free -h
```

## w

It can also be useful to know who's logged in, the system's uptime, and CPU load average for the last 1, 5, and 15 minutes. That's the grab bag of info supplied by `w`:

```bash
w
```






