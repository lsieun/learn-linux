# /etc/sudoers

<!-- TOC -->

- [1. Open sudoers File](#1-open-sudoers-file)
- [2. /etc/sudoers File Syntax](#2-etcsudoers-file-syntax)
  - [2.1. Aliases](#21-aliases)
  - [2.2. User Specifications](#22-user-specifications)
  - [2.3. Predefined Tags used in the /etc/sudoers file](#23-predefined-tags-used-in-the-etcsudoers-file)
- [3. Allow An Unprivileged User To Run A Certain Command With Sudo](#3-allow-an-unprivileged-user-to-run-a-certain-command-with-sudo)
- [Example](#example)
- [4. Reference](#4-reference)

<!-- /TOC -->

## 1. Open sudoers File

`visudo` is the command used to make changes to the file `/etc/sudoers`.

```bash
sudo visudo
```

You should edit `/etc/sudoers` only using the `visudo` command. Do not edit the file directly.

## 2. /etc/sudoers File Syntax

The `/etc/sudoers` file is composed of two entries. They are

- (1) **Aliases** - These are variables; and
- (2) **User specifications** - These decide who is allowed to run what.

### 2.1. Aliases

There are 4 kinds of Aliases (variables). They are **User_Alias**, **Runas_Alias**, **Host_Alias** and **Cmnd_Alias**.

Here is an example of `User_Alias` definition.

```txt
User_Alias ADMINS = ravi, anand
```

`User_Alias` is very rarely used as you can use regular groups in this file. Just use `%groupname`.

`Host_Alias` assigns computers to variables. The variables accept host names or ip address of the machines. Here is an example of the `Host_Alias` usage.

```txt
Host_Alias   FILESERVERS = fs1, fs2, 192.168.0.1
```

`Cmnd_Alias` are group of related commands. For example, you can bunch together useful networking tools into a command alias as follows.

```txt
## Networking
Cmnd_Alias   NETWORKING = /sbin/route, /sbin/ifconfig, /bin/ping, /sbin/dhclient, /usr/bin/net, /sbin/iptables, /usr/bin/wvdial, /sbin/iwconfig, /sbin/mii-tool
```

```txt
## Updating the locate database
Cmnd_Alias   LOCATE = /usr/bin/updatedb
```

There is no limit to the number of variables you can define using `Cmd_Alias`. And it need not be `NETWORKING` or `LOCATE`. You can give any useful name.

Once you have defined all the variables using the Aliases feature, you have to provide the user specifications.

### 2.2. User Specifications

Defining the user specifications is the most important part of the `/etc/sudoers` file. It defines which users can run what software on which machines.

The syntax for user specification is as follows.

```txt
user  MACHINE=COMMANDS
```

There is no space on either side of the '`=`' symbol in the above syntax.

The following are a few examples of user specification rules in the `/etc/sudoers` file.

```txt
## Allow root to run any commands anywhere.
root    ALL=(ALL)   ALL
```

```txt
## Allow people in the wheel group to run all the commands
## without a password.
%wheel   ALL=(ALL)   NOPASSWD: ALL
```

By default `SUDO` requires that a user authenticate him or herself before running a command. This behaviour can be modified via the `NOPASSWD` tag as shown in the example above. Alternately, you can use the `PASSWD` tag to reverse the situation.

```txt
## Allow members of the users group to shutdown this system.
%users   localhost=/sbin/shutdown -h now
```

### 2.3. Predefined Tags used in the /etc/sudoers file

- `PASSWD` - Used to indicate the user needs to enter his password to run the command.
- `NOPASSWD` - User need not enter his password to run the command.
- `EXEC` and `NOEXEC` - Allow/prevent a dynamically-linked executable from running further commands itself.
- `SETENV` and `NOSETENV` - The user is allowed to enable or disable the `env_reset` option from the command line via the `-E` option.
- `LOG_INPUT` and `NOLOG_INPUT` - These tags override the value of the log_input option on a per-command basis.
- `LOG_OUTPUT` and `NOLOG_OUTPUT` - These tags override the value of the log_output option on a per-command basis.

You can use wildcards when defining host names, path names and command line arguments in the `/etc/sudoers` file.

## 3. Allow An Unprivileged User To Run A Certain Command With Sudo

Let’s say you want to allow a user named “joe” to run a given command. You just need to add a line like this below (customize for your needs)

```txt
joe ALL=(ALL) NOPASSWD: /full/path/to/command
```

Now what if you want to restrict joe to only use that command within a given set of parameters or with only certain arguments? Well, just toss them in there too! Check this out:

```txt
joe ALL=(ALL) NOPASSWD: /full/path/to/command ARG1 ARG2
```

## Example

In this example:

```txt
alan    ALL = (root, bin : operator, system) ALL
```

user `alan` may run any command as either user `root` or `bin`, optionally setting the group to `operator` or `system`.

## 4. Reference

- [Allow An Unprivileged User To Run A Certain Command With Sudo](https://www.atrixnet.com/allow-an-unprivileged-user-to-run-a-certain-command-with-sudo/)

