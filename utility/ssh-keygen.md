# How to use the Linux ‘scp’ command without a password to make remote backups

URL: 

- https://alvinalexander.com/linux-unix/how-use-scp-without-password-backups-copy
- https://www.thegeekdiary.com/centos-rhel-how-to-setup-passwordless-ssh-login/


As a result, after reading this tutorial, you will have learned how to:

- Create a public and private key pair.
- Install your public key on your remote Unix and Linux servers.
- Use `ssh` to login to your remote servers without using a password.
- Use `ssh` to run commands (such as backup scripts) on your remote servers without using a password.
- Use `scp` to copy files to and from your remote servers without a password.

## 1. Generate a public and private key pair

```bash
$ ssh-keygen -t rsa

Generating public/private rsa key pair.
Enter file in which to save the key (/Users/al/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /Users/al/.ssh/id_rsa.
Your public key has been saved in /Users/al/.ssh/id_rsa.pub.
The key fingerprint is:
6f:16:29:90:46:b6:88:34:3d:81:07:fc:bd:1a:fc:db al@Al-Alexanders-MacBook.local
The key's randomart image is:
+--[ RSA 2048]----+
| .++..o          |
| .oo++ o         |
|  .o.o=          |
|    ....   .     |
|   .   .S o      |
|    o .  o .     |
|     +    +      |
|    . .. o       |
|      ..E        |
+-----------------+
```

As you can see from the output of this command:

- Your private key is in a file named `~/.ssh/id_rsa`
- Your public key is in a file named `~/.ssh/id_rsa.pub`

Feel free to use `vi` or `cat` to look at both files if you like, but don't change them. As you’ll see, they are both **plain text files**.

You should **never** give **your private key** to anyone else, so for all intents and purposes, the `id_rsa` file will just stay right where it is.

As for your **public key** (`id_rsa.pub`), you're going to copy that to your remote servers in the following step.

## 2. Copy your public key to your remote servers

### 2.1 第一种方法（推荐）

Use the `ssh-copy-id` command to install the public half of the newly-generated authentication key into a specific user’s home directory on the remote host. The `ssh-copy-id` command will then automatically append the identity information into the `~/.ssh/authorized_keys` file for the specified user on the remote host (creating `~/.ssh` and `~/.ssh/authorized_keys` if necessary).

```bash
ssh-copy-id -i root@ip_address
```

### 2.2 第二种方法

The next step is to copy the `id_rsa.pub` file to the remote server you want to be able to access with `ssh` and/or `scp` without using a password.

First, `scp` that file to the remote server as you normally would, supplying a password during the `scp` process:

```bash
$ scp id_rsa.pub al@pluto.example.com:./
```

Next, `ssh` into the remote server, again supplying your password when prompted:

```bash
$ ssh al@pluto.example.com
```

On the remote server, if the `.ssh` directory does not already exist in your home directory, create it. Assuming you are in your home directory, just create it like any other directory:

```bash
$ mkdir .ssh
$ chmod 700 .ssh
```

> 通过`mkdir .ssh`创建之后的默认权限是`rwxrwxr-x`，后续免密码测试的时候一直不成功，只有通过`chmod 700 .ssh`修改权限后，才能免密登录成功。我猜测，对于`.ssh`的group不能有写的权限，我测试了`754`的权限也是可以成功的。

> The problem is the fact that files permissions are too open. Try setting the mode of `authorized_keys` to `600` and the `.ssh` directory to `700`.

> For reasons of paranoia(无端恐惧), the `.ssh` directory and `authorized_keys` **must not be group-writable**. I guess the thinking is, **the user must be the only one with explicit control over his/her authorization**. I believe a work-around for this lies with ACL. The other work around is `StrictModes=no` setting in **sshd's configuration** file. But it would be too dangerous to do that for the sake of one user.

Now copy the `id_rsa.pub` file to a new file named `authorized_keys` in that `.ssh` directory, like this:

```bash
$ cp id_rsa.pub .ssh/authorized_keys
$ cd .ssh/
$ chmod 600 authorized_keys
```

## 3. Test your ssh login

To test that you can log in to your remote server using `ssh` without a password, either (a) logout of your remote server, or (b) open a new ssh window on your local computer.

In your ssh/terminal window, all you have to do to test the system is to attempt to login to your remote server as you did before:

```bash
$ ssh al@pluto.example.com
```

## 4. Run your backup scripts with ssh

Given this setup, I can now use ssh to remotely run my backup scripts. I run the remote MySQL backup script like this:

```bash
ssh al@pluto.example.com "/home/al/backup/mysql-bu.sh"
```

## 5. Use scp to copy your backup files back home

Because of the naming convention used, I can just use one `scp` command to copy the files back to my local system:

```bash
scp al@pluto.example.com:/home/al/backup/*gz .
```

