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






