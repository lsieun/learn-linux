# ps

`ps` - report a snapshot of the current processes.

- `-e`: Select all processes.
- `-f`: Do full-format listing.
- `-F`: Extra full format.
- `-l`: Long format.
- `-y`: Do not show flags; show rss in place of addr. This option can only be used with `-l`.

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

## How to see process created by specific user in Unix/linux

To view only the processes owned by a specific user, use the following command:

```bash
top -U [username]
```

Replace the `[username]` with the required username

If you want to use `ps` then

```bash
ps -u [username]
```

OR

```bash
ps -ef | grep <username>
```

OR

```bash
ps -efl | grep <username>
```

for the extended listing

Check out the man `ps` page for options

Another alternative is to use `pstree` wchich prints the process tree of the user

```bash
pstree <username or pid>
```
