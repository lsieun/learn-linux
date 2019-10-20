# chattr

<!-- TOC -->

- [1. Immutable attribute](#1-immutable-attribute)
- [2. More file attributes](#2-more-file-attributes)
- [3. Format of a symbolic mode](#3-format-of-a-symbolic-mode)
- [4. Reference](#4-reference)

<!-- /TOC -->

Chattr is a command used to set/unset file attributes in Linux. Using `chattr` it is possible to make a file immutable. That is, even a root user will be prohibited from deleting the file.

The trick lies in setting the appropriate attribute for the file.

## 1. Immutable attribute

To prevent anyone - even a root user - from deleting a file, you set the immutable bit of the file using the `chattr` command as follows:

```bash
sudo chattr +i filename
```

The immutable bit option `+i` can only be set by **the root user**. So either you should have root priviledges or you need to use `sudo` to execute the command.

Once the `+i` bit is set, even root user won't be able to delete or tamper with the file.

To unset the immutable flag:

```bash
sudo chattr -i filename
```

Every file in Linux have a number of attributes associated with it. The immutable bit attribute being just one of them. To see what all attributes are set for a particular file, you run the `lsattr` command as follows.

```bash
$ lsattr filename
----i--------  filename
```

If the immutable flag is set, there will be an `i` in the listing.

## 2. More file attributes

`chattr` can be used to set/unset many more file attributes.

For example, if you want to allow everybody to just append data to a file and not change already entered data, you can set the append bit as follows:

```bash
sudo chattr +a filename
```

Now the filename can only be opened in **append** mode for writing data. You can unset the append attribute as follows:

```bash
chattr -a filename
```

To know more about `chattr` command, check its man page.

## 3. Format of a symbolic mode

The format of a symbolic mode is

```txt
+-=[aAcCdDeijsStTu]
```

The operator '`+`' causes the selected attributes to be added to the existing attributes of the files; '`-`' causes them to be
removed; and '`=`' causes them to be the only attributes that the files have.

The letters '`aAcCdDeijsStTu`' select the new attributes for the files:

- append only (`a`),
- no atime  updates  (`A`),  
- compressed (`c`),  
- no  copy  on write (`C`),
- no dump (`d`),
- synchronous directory updates (`D`),
- extent format (`e`),
- immutable (`i`),
- data journalling (`j`),
- project hierarchy (`P`),
- secure deletion (`s`),
- synchronous updates (`S`),
- no tail-merging (`t`),
- top of directory hierarchy (`T`), and
- undeletable (`u`).

The  following attributes are read-only, and may be listed by `lsattr` but not modified by `chattr`:

- compression error (`E`),
- huge file (`h`),
- indexed directory (`I`),
- inline data (`N`),
- compression raw access (`X`), and
- compressed dirty file (`Z`).

## 4. Reference

- [How To Set File Attributes In Linux Using Chattr Command](http://www.aboutlinux.info/2005/11/make-your-files-immutable-which-even.html)
