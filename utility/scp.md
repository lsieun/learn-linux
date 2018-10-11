# SCP Linux – Securely Copy Files Using SCP examples

## scp command

Basic syntax of SCP

```bash
scp source_file_name username@destination_host:destination_folder
```

There are much parameters in SCP command that you can use.

```bash
$ man scp
```

```txt
scp — secure copy (remote file copy program)

scp copies files between hosts on a network.  It uses ssh for data transfer, and uses the same authentication and provides the same security as ssh.  scp will ask for passwords or passphrases if they are needed for authentication.
```

**SCP Linux options**:

- `-r` Recursively copy entire directories. Note that this follows symbolic links encountered in the tree traversal.
- `-C` Compression enable. Passes the `-C` flag to ssh to enable compression.
- `-l` limit – Limits the used bandwidth, specified in `Kbit/s`.
- `-o` ssh_option – Can be used to pass options to ssh in the format used in ssh_config.
- `-P` port – Specifies the port to connect to on the remote host. Note that this option is written with a capital ‘P’.
- `-p` Preserves modification times, access times, and modes from the original file.
- `-q` Quiet mode: disables the progress meter as well as warning and diagnostic messages from ssh.
- `-v` Verbose mode. Print debugging messages about progress. This is helpful in debugging connection, authentication, and configuration problems.

## SCP examples

Copy **file** from **a remote host** to **local host** SCP example:

```bash
$ scp username@from_host:file.txt /local/directory/
```

Copy **file** from **local host** to **a remote host** SCP example:

```bash
$ scp file.txt username@to_host:/remote/directory/
```

Copy **directory** from **a remote host** to **local host** SCP example:

```bash
$ scp -r username@from_host:/remote/directory/  /local/directory/
```

Copy **directory** from **local host** to **a remote host** SCP example:

```bash
$ scp -r /local/directory/ username@to_host:/remote/directory/
```

Copy **file** from **remote host** to **remote host** SCP example:

```bash
$ scp username@from_host:/remote/directory/file.txt username@to_host:/remote/directory/
```

## Provide the detail information of SCP process using `-v` parameter

Basic `scp` command without parameter will copy the files in background. User will see nothing unless the process is done or some error appears. You can use “`-v`” parameter to print debug information into the screen. It can help you debugging connection, authentication and configuration problems.

```bash
$ scp -v Label.pdf mrarianto@202.x.x.x:.
```

## Provide modification times, access times, and modes from original files

The “`-p`” parameter will help you on this. An estimated time and **the connection speed** will appear on the screen.

```bash
$ scp -p Label.pdf mrarianto@202.x.x.x:.
```

## Make file transfer faster using `-C` parameter

One of parameter that can faster your file transfer is “`-C`” parameter. The “`-C`” parameter will compress your files on the go. The unique thing is the compression is only happen in the network. When the file is arrived to the destination server, it will returning into the original size as before the compression happen.

```bash
$ scp -Cpv messages.log mrarianto@202.x.x.x:.
```

If you are copying a lot files across the network, “`-C`” parameter would help you to decrease the total time you need.

The thing that we should notice that compression method will not work on any files. When the source file is already compressed, you will not find any improvement there. Files such as `.zip`, `.rar`, **pictures**, and `.iso` files will not affected by “`-C`” parameter.


## Select another cipher to encrypt files

By default SCP using “**AES-128**” to encrypt files. If you want to change to another cipher to encrypt it, you can use “`-c`” parameter. Take a look of this command.

```bash
$ scp -c 3des Label.pdf mrarianto@202.x.x.x:.
```

Above command tell SCP to use `3des` algorithm to encrypt file. Please be careful that this parameter using “`-c`” not “`-C`“.

## Limiting bandwidth usage

Another parameter that may useful is “`-l`” parameter. The “`-l`” parameter will limit the bandwidth to use. It will be useful if you do an automation script to copy a lot of file, but you don’t want the bandwidth is drained by the `SCP` process.

```bash
$ scp -l 400 Label.pdf mrarianto@202.x.x.x:.
```

The `400` value behind “`-l`” parameter is mean that we limit the bandwidth for `SCP` process only `50 KB/sec`. One thing to remember that bandwidth is specified in `Kilobits/sec` (kbps). It is mean that 8 bits equal with 1 byte.

While SCP counts in Kilobyte/sec (KB/s). So if you want to limit your bandwidth for SCP maximum only `50 KB/s`, you need to set it into `50 x 8 = 400`.

## Specify specific port to use with SCP

Usually SCP is using port `22` as a default port. But for security reason, you may change the port into another port. For example, we are using port `2249`. Then the command should be like this.

```bash
$ scp -P 2249 Label.pdf mrarianto@202.x.x.x:.
```

Make sure that it use capital “`P`” not “`p`“, since “`p`” is already used for preserved times and modes.

## Copy files inside directory recursively

Sometimes we need to copy directory and all **files** / **directories** inside it. It will be better if we can do it in 1 command. SCP support that scenario using “`-r`” parameter.

```bash
$ scp -r documents mrarianto@202.x.x.x:.
```

When the copy process is done, at the destination server you will found a directory named “documents” with all it’s files. The folder “documents” is automatically created.

## Disable progress meter(仪表) and warning / diagnostic message

If you choose not to see progress meter and warning / diagnostic messages from SCP, you may disable it using “`-q`” parameter. Here’s the example.

```bash
$ scp -q Label.pdf mrarianto@202.x.x.x:.
```

As you can see, after the you enter the password, there is no any information about SCP process. After the process is complete, you will be see a prompt again.

