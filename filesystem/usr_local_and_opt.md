# What is the difference between /opt and /usr/local?

URL:

- https://unix.stackexchange.com/questions/11544/what-is-the-difference-between-opt-and-usr-local


- Everything that has to be **compiled** & **installed** Unix-style and complies to FHS -> `/usr/local`
- Everything else (e.g. a java web-application) that comes with it's own applicationserver and loads of resources in a zip archive -> `/opt`

While both are designed to contain files not belonging to the operating system, `/opt` and `/usr/local` are not intended to contain the same set of files.

> `/opt`和`/usr/local`两者的共同点是存放不属于操作系统的文件，但两者存储的文件类型不同。

`/usr/local` is a place to **install files built by the administrator**, typically by using the `make` command (e.g., `./configure`; `make`; `make install`). The idea is to avoid clashes with files that are part of the operating system, which would either be overwritten or overwrite the local ones otherwise (e.g., `/usr/bin/foo` is **part of the OS** while `/usr/local/bin/foo` is **a local alternative**).


On the other hand, `/opt` is **a directory for installing unbundled packages** (i.e. packages not part of the Operating System distribution, but provided by an independent source), each one in its own subdirectory. They are **already built whole packages** provided by **an independent third party software distributor**. Unlike `/usr/local` stuff, these packages follow the directory conventions (or at least they should). For example, `someapp` would be installed in `/opt/someapp`, with one of its command being `/opt/someapp/bin/foo`, its configuration file would be in `/etc/opt/someapp/foo.conf`, and its log files in `/var/opt/someapp/logs/foo.access`.




