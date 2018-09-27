# Run Process in Background Linux Terminal

URL:

- https://turbofuture.com/computers/Run-process-in-background-linux-terminal

If you’re like me and you started to hate clicking icons to launch projects, you start them from the shell. 

When you start the process this way, you’ll see the shell waits (blocks) until the program finishes or is terminated.

If you close the terminal you will be prompted by the terminal: “There is still a process running in this terminal. Closing the terminal will kill it”. You can cancel or close the terminal. This is because the process your started inherits some things from the shell (stdin, stdout, etc) . This makes that the process is bound to that terminal.

When you close your terminal, **the shell** receives a `SIGHUP`, it also sends a `SIGHUP` to **the process** you started, this will end the process.

Let’s assume you don’t want to kill the process, but you don’t need or want this terminal anymore. Or you want to continue using the terminal for other tasks.

## 1. Adding the ‘`&`’ to your command

In the case of `vlc &` **the process** moves to the background and you can continue to use **the terminal** as you see it. You are You get a shell prompt again. Often I just continue from there or clear the terminal and use it for other tasks or starting different processes.

If you **close the terminal** by pressing **the close button** (`x`) with the mouse or `Shift+Ctrl+W`, then it will **stop all the processes** you started in **that terminal**. This is more or less the same problem as before, but this time the terminal doesn’t prompt you to do so, it just kills the program(s) immediately.

If you type the `exit` command in the terminal or close with the `Ctrl+D` shortcut it will close the terminal, but the running processes will stay up. This was the first solution I tried. I still use it quite often, but there are others. Some have other benefits or give you more options if needed.

```bash
$ vlc &
```

## 2. Adding the ‘`& disown`’ to your command

In many ways this (`& disown`) seems to do the same as adding the “`&`” to the command. But when you add `disown`, the process will be removed from the shell’s list of jobs. **The process** is still connected to **the terminal**, but it does not receive the `SIGHUP`.

One of the **downsides** of `disown` is that it is `bash` specific. If you often use different systems which don’t know this command then it can be a pain. Since most of the commands are near reflex like after a while, you could end up typing this command on systems where it is of no use. But for me this is not really an issue, but keep it in mind.

```bash
$ vlc & disown
```

## 3. Using ‘`setsid`’ in your shell command

A command run with `setsid` opens and/or assigns **a new session id** to **the process**. This session id is different from the session id of the current running terminal. A tree of all processes (executing instances of the programs) running on your system, would show that the process with a new session id starts at the root of the tree structure, not as a branch of the terminal process.

With `setsid` you can’t check the output of the process you started later on. This is something that you can do with for example `nohup` and `screen`. With `screen` there is an attached screen session to the process and with `nohup` you can check the output file. But is this something you need or want for the process you are starting? Sometimes this is the case, but often you just need to run the program and that’s it.

You can also make it write to an output file when using `setsid`.

```bash
$ setsid vlc
```

## 4. Using ‘`nohup`’ with your command

`Nohup` will seperate **the process** from **the terminal**. Because of the disconnect it will not receive `SIGHUP`, which is why it is named `nohup`. If you close the terminal the process will keep running until you close it.

When the terminal is open, the job is still in the foreground and still under the shell’s job control. This means if you just use `nohup` that you still can’t use that terminal for other tasks. So you should combine it with an ‘`&`’.

```bash
$ nohup vlc

$ nohup vlc &
```

As you see it closes/ignores the input and will append the output to a `nohup.out`. The use of `nohup.out` will make sure the process can still write its output even when the terminal ends/closes.
