# Changing File Ownership

<!-- TOC -->

- [1. ownership of a file](#1-ownership-of-a-file)
- [2. ownership of a directory](#2-ownership-of-a-directory)

<!-- /TOC -->

By default, all files are “owned” by the user who creates them and by that user’s default group.

## 1. ownership of a file

**To change the ownership of a file**, use the `chown` command:

```bash
chown user:group /path/to/file
```

In the following example, the ownership of the “list.html” file will be changed to the “cjones” user in the “marketing” group:

```bash
chown cjones:marketing list.html
```

## 2. ownership of a directory

**To change the ownership of a directory** and all the files contained inside, use the recursive option with the `-R` flag:

```bash
chown -R user:group /path/to/directory
```

In the following example, change the ownership of `/srv/smb/leadership/` to the “cjones” user in the “marketing” group:

```bash
chown -R cjones:marketing /srv/smb/leadership/
```
