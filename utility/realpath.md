# realpath

```bash
$ realpath test.sh 

/home/liusen/workdir/dummy/test.sh
```

[GNU coreutils](http://www.gnu.org/software/coreutils/) introduced a [realpath](https://www.gnu.org/software/coreutils/manual/html_node/realpath-invocation.html#realpath-invocation) command in version 8.15 in January 2012. 

`realpath` has the same effect as `readlink -f` with GNU `readlink`. What distinguishes the two commands (or rather the various `realpath` commands from `readlink -f`) is the extra options that they support.

GNU `realpath` is not deprecated; it has the opposite problem: it's too new to be available everywhere.

The following usually does the trick:

```bash
echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1")
```

This is explanation of what is going on:

- This script get relative path as argument "`$1`"
- Then we get `dirname` part of that path (you can pass either dir or file to this script): `dirname "$1"`
- Then we `cd "$(dirname "$1")` into this relative dir
- `&& pwd -P` and get absolute path for it. `-P` option will avoid all symlinks
- After that we append `basename` to absolute path: `$(basename "$1")`
- As final step we `echo` it

