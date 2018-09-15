# stderr

URL: https://github.com/sickill/stderred

## Installation

Clone git repository:

```bash
$ git clone git://github.com/sickill/stderred.git
$ cd stderred
```

Make sure you have `cmake` and the `gcc` toolchain required for compilation installed:

```bash
# Fedora
sudo yum install make cmake gcc gcc-c++
```

Build:

```bash
$ make
```

Export `LD_PRELOAD` variable in your shell's config file by putting following in your `~/.bashrc`:

```bash
export LD_PRELOAD="/absolute/path/to/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
```

> 注意：将路径`/absolute/path/to`修改为实际的路径。

## Checking if it works

```bash
cat nonexistingfile
ls nonexistingfile
python -c 'import sys; print("Hello", file=sys.stdout); print("World", file=sys.stderr)'
```
