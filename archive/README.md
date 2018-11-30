# How to create and extract zip, tar, tar.gz and tar.bz2 files in Linux

URL: https://www.simplehelp.net/2008/12/15/how-to-create-and-extract-zip-tar-targz-and-tarbz2-files-in-linux/

## ZIP

Zip is probably the most commonly used archiving format out there today. **Its biggest advantage** is the fact that it is available on all operating system platforms such as Linux, Windows, and Mac OS, and generally supported out of the box. **The downside of the zip format** is that it does not offer the best level of compression. `Tar.gz` and `tar.bz2` are far superior in that respect. Let’s move on to usage now.

To compress a directory with zip do the following:

```bash
# zip -r archive_name.zip directory_to_compress
```

Here’s how you extract a zip archive:

```bash
# unzip archive_name.zip
```


## TAR

Tar is a very commonly used archiving format on Linux systems. **The advantage** with tar is that it consumes very little time and CPU to compress files, but the compression isn’t very much either. Tar is probably the Linux/UNIX version of zip – quick and dirty. Here’s how you compress a directory:

```bash
# tar -cvf archive_name.tar directory_to_compress
```

And to extract the archive:

```bash
# tar -xvf archive_name.tar
```

This will extract the files in the `archive_name.tar` archive in the current directory. Like with the tar format you can optionally extract the files to a different directory:

```bash
# tar -xvf archive_name.tar -C /tmp/extract_here/
```

## TAR.GZ

This format is my weapon of choice for most compression. It gives very good compression while not utilizing too much of the CPU while it is compressing the data. To compress a directory use the following syntax:

```bash
# tar -zcvf archive_name.tar.gz directory_to_compress
```

To decompress an archive use the following syntax:

```bash
# tar -zxvf archive_name.tar.gz
```

This will extract the files in the `archive_name.tar.gz` archive in the current directory. Like with the tar format you can optionally extract the files to a different directory:

```bash
# tar -zxvf archive_name.tar.gz -C /tmp/extract_here/
```

## TAR.BZ2

This format has the best level of compression among all of the formats I’ve mentioned here. But this comes at a cost – in time and in CPU. Here’s how you compress a directory using tar.bz2:

```bash
# tar -jcvf archive_name.tar.bz2 directory_to_compress
```

This will extract the files in the `archive_name.tar.bz2` archive in the current directory. To extract the files to a different directory use:

```bash
# tar -jxvf archive_name.tar.bz2 -C /tmp/extract_here/
```

Data compression is very handy particularly for backups. So if you have a shell script that takes a backup of your files on a regular basis you should think about using one of the compression formats you learned about here to shrink your backup size.

Over time you will realize that there is a **trade-off** between the level of compression and the the time and CPU taken to compress. You will learn to judge where you need a quick but less effective compression, and when you need the compression to be of a high level and you can afford to wait a little while longer.


