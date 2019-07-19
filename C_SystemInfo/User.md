# User

The `id` command displays the **identity of the user** running the session, along with the list of groups they belong to. Since access to some files or devices may be limited to group members, checking available group membership may be useful.

```bash
$ id
uid=1000(liusen) gid=1000(liusen) groups=1000(liusen),24(cdrom),25(floppy),29(audio),30(dip),44(video),46(plugdev),108(netdev),114(bluetooth),118(scanner)
```

```bash
# id
uid=0(root) gid=0(root) groups=0(root)
```
