# tar

`tar` is an archiving utility.

## Option

- `-f`: Use archive file or device ARCHIVE.
- `-v`: Verbosely list files processed.
- `-x`: Extract  files from an archive.
- `-z`: Filter the archive through `gzip`.

- `-C`: Change to DIR before performing any operations. This option is **order-sensitive**, i.e. it affects all options that follow.

- `--strip-components=NUMBER`: Strip `NUMBER` leading components from file names on extraction.

## Usage

```bash
tar xvf apache-tomcat-8.5.9.tar.gz -C /opt/tomcat --strip-components=1
```