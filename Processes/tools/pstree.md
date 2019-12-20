# pstree

The `pstree` command displays a tree of processes. Following is its syntax:

```bash
pstree [options]
```

- `-a`: Show command line arguments.
- `-g`: Show PGIDs.
- `-H`: Highlight the specified process instead.
- `-n`: Sort processes with the same ancestor by PID instead of by name.  (Numeric sort.)
- `-s`: Show parent processes of the specified process.

## Example

### How to use pstree command?

Basic usage is simple: all you have to do is to execute 'pstree' sans any option.

```bash
pstree
```

### How to make pstree include command line arguments in output as well?

This can be done using the `-a` command line option.

```bash
pstree -a
```

### How to make pstree highlight a specific process?

In case you want the tool to highlight a specific process in output, use the `-H` command line option.

```bash
pstree -H [PID]
```

### How make pstree show process group IDs in output?

For this, use the `-g` command line option.

```bash
pstree -g
```

### How to make pstree sort processes based on PIDs?

By default, `pstree` sorts processes with same ancestor by **name**. However, if you want, you can have pstree sort processes by PIDs as well, something which you can do using the `-n` command line option.

```bash
pstree -n
```

### How to make pstree display process tree specific to a user?

If you want pstree to display all process trees rooted at processes owned by a specific user, then all you have to do is to pass the name of that user as input to the command.

For example,

```bash
pstree [username]
```

### How to restrict Pstree to a specific process?

If you want pstree to display only the parent and child info for a specific process, use the `-s` option.

```bash
pstree -s [PID]
```
