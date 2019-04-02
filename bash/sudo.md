# Keeping the fancy sudo warning forever

URL: https://superuser.com/questions/500119/keeping-the-fancy-sudo-warning-forever

```txt
We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for liusen:
```

Create a file inside `/etc/sudoers.d/` You can use this command

```bash
sudo vi /etc/sudoers.d/privacy
```

Now paste this line into the file.

```txt
Defaults        lecture = always
```

the options for `lecture` are: `always`, `never` and `once`.

Now close Terminal, Reopen it and try to do something with `sudo`.

## Allow An Unprivileged User To Run A Certain Command With Sudo

- [Allow An Unprivileged User To Run A Certain Command With Sudo](https://www.atrixnet.com/allow-an-unprivileged-user-to-run-a-certain-command-with-sudo/)

First, you’ll need to use the `visudo` utility…

```bash
sudo visudo
```

This command safely opens up the `/etc/sudoers` file for you in your default editor. Let’s say you want to allow a user named “joe” to run a given command. You just need to add a line like this below (customize for your needs)

```txt
joe ALL=(ALL) NOPASSWD: /full/path/to/command
```

Now what if you want to restrict joe to only use that command within a given set of parameters or with only certain arguments? Well, just toss them in there too! Check this out:

```txt
joe ALL=(ALL) NOPASSWD: /full/path/to/command ARG1 ARG2
```
