# Everything Is a File

One of the defining features of Linux and other UNIX-like operating systems is that “**everything is a file**.” This is an oversimplification, but understanding what it means will help you understand how Linux works.

Many things on Linux appear in your file system, but they aren’t actually files. They’re special files that represent hardware devices, system information, and other things — including a random number generator.

These special files may be located in pseudo or virtual file systems such as `/dev`, which contains special files that represent **devices**, and `/proc`, which contains special files that represent **system and process information**.

## /proc

For example, let’s say you want to find information about your CPU. The `/proc` directory contains a special file – `/proc/cpuinfo` – that contains this information.

You don’t need a special command that tells you your CPU info – you can just read the contents of this file using any standard command that works with plain-text files. For example, you could use the command `cat /proc/cpuinfo` to print this file’s contents to the terminal – printing your CPU information to the terminal. You could even open `/proc/cpuinfo` in a text editor to view its contents.

Remember, `/proc/cpuinfo` isn’t actually a text file containing this information – the Linux kernel and the proc file system are exposing this information to us as a file. This allows us to use familiar tools to view and work with the information.

The `/proc` directory also contains other similar files, for example:

- `/proc/uptime` – Exposes the uptime of your Linux kernel – in other words, how long your system has been on without shutting down.
- `/proc/version` – Exposes the version of your Linux kernel.

## /dev

In the `/dev` directory, you’ll find files that represent devices – as well as files that represent other special things. For example, `/dev/cdrom` is your CD-ROM drive. `/dev/sda` represents your first hard drive, while `/dev/sda1` represents the first partition on your first hard drive.

Want to mount your CD-ROM? Run the mount command and specify `/dev/cdrom` as the device you want to mount. Want to partition your first hard drive? Run a disk-partitioning utility and specify `/dev/sda` as the hard disk you want to edit. Want to format the first partition on your first hard drive? Run a formatting command and tell it to format `/dev/sda1`.

## /dev/null, /dev/random, and /dev/zero

The `/dev` file system doesn’t just contain files that represent physical devices. Here are three of the most notable special devices it contains:

- `/dev/null` – Discards all data written to it – think of it as a trash can or black hole. If you ever see a comment telling you to send complains to `/dev/null` – that’s a geeky way of saying “throw them in the trash.”
- `/dev/random` – Produces randomness using environmental noise. It’s a random number generator you can tap into.
- `/dev/zero` – Produces zeros – a constant stream of zeros.

If you think of these three as files, you won’t see a use for them. Instead, think of them as tools.

For example, by default, Linux commands produce error messages and other output that they print to the standard output, normally the terminal. If you want to run a command and don’t care about its output, you can redirect that output to `/dev/null`. Redirecting a command’s output to `/dev/null` immediately discards it. Instead of having every command implement its own “quiet mode,” you can use this method with any command.

## Clarification

In practice, it’s more accurate to say that “**everything is a stream of bytes**” than “**everything is a file**.” `/dev/random` isn’t a file, but it certainly is a stream of bytes. And, although these things technically aren’t files, they are accessible in the file system – the file system is a universal “name space” where everything is accessible. Want to access a random number generator or read directly from a device? You’ll find both in the file system; no other form of addressing needed.

Of course, some things aren’t actually files – processes running on your system aren’t a part of the file system. “Everything is a file” is inaccurate, but lots of things do behave as files.

## Reference

- [What Does “Everything Is a File” Mean in Linux?](https://www.howtogeek.com/117939/htg-explains-what-everything-is-a-file-means-on-linux/)
