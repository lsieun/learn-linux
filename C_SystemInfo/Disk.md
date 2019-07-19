# Disk

The `df` (disk free) command reports on the available disk space on each of the disks mounted in the filesystem.

```bash
$ df
Filesystem     1K-blocks      Used Available Use% Mounted on
udev             8150216         0   8150216   0% /dev
tmpfs            1632540      9708   1622832   1% /run
/dev/nvme0n1p2 474287168 257634672 192490296  58% /
tmpfs            8162688    155836   8006852   2% /dev/shm
tmpfs               5120         4      5116   1% /run/lock
tmpfs            8162688         0   8162688   0% /sys/fs/cgroup
/dev/nvme0n1p1    523248       132    523116   1% /boot/efi
tmpfs            1632536        16   1632520   1% /run/user/117
tmpfs            1632536        40   1632496   1% /run/user/1000
```

Its `-h` option (for human readable) converts the sizes into a more legible unit (usually mebibytes or gibibytes).

```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            7.8G     0  7.8G   0% /dev
tmpfs           1.6G  9.5M  1.6G   1% /run
/dev/nvme0n1p2  453G  246G  184G  58% /
tmpfs           7.8G  152M  7.7G   2% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           7.8G     0  7.8G   0% /sys/fs/cgroup
/dev/nvme0n1p1  511M  132K  511M   1% /boot/efi
tmpfs           1.6G   16K  1.6G   1% /run/user/117
tmpfs           1.6G   40K  1.6G   1% /run/user/1000
```
