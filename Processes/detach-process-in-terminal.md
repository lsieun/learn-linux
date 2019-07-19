# How to Start Linux Command in Background and Detach Process in Terminal

URL:

- https://www.tecmint.com/run-linux-command-process-in-background-detach-process/

When a process is associated with a terminal, two problems might occur:

- your controlling terminal is filled with so much output data and error/diagnostic messages.
- in the event that the terminal is closed, the process together with its child processes will be terminated.

> 有Terminal启动Process时，有两个问题：  
> （1）Process的输出信息会不断的显示在Terminal上；  
> （2）Terminal退出的时候，Process也会跟着退出。  
> 这里要解决的就是这两个问题：  
> （1）Process的信息不输出到Terminal上；  
> （2）Terminal退出的时候，Process不会退出。

To deal with these two issues, you need to totally detach a process from a controlling terminal. Before we actually move to solve the problem, let us briefly cover how to run processes in the background.

> 解决这两上问题的关键是：如何让Process与Terminal分离开，不再产生关联？

## 1. How to Start a Linux Process or Command in Background

If a process is already in execution, such as the `tar` command example below, simply press `Ctrl+Z` to stop it then enter the command `bg` to continue with its execution in the background as a job.

You can view all your background jobs by typing `jobs`. However, its stdin, stdout, stderr are still joined to the terminal.

> 这段说明的是：即使现在程序在后台运行了，它的输出信息还是会显示到Terminal上。

```bash
$ tar -czf home.tar.gz .
$ bg
$ jobs
```

![](https://www.tecmint.com/wp-content/uploads/2016/10/Run-Linux-Command-in-Background.png)

You can as well run a process directly from the background using the **ampersand**, `&` sign.

```bash
$ tar -czf home.tar.gz . &
$ jobs
```

![](https://www.tecmint.com/wp-content/uploads/2016/10/Start-Linux-Process-in-Background.png)

Take a look at the example below, although the `tar` command was started as **a background job**, **an error message** was still sent to the terminal meaning **the process** is still connected to **the controlling terminal**.

> 这里再次说明：即使后台运行，Process还是没有脱离开与Terminal之间的关系。  

```bash
$ tar -czf home.tar.gz . &
$ jobs
```

![](https://www.tecmint.com/wp-content/uploads/2016/10/Linux-Process-Running-in-Background-Message.png)


## 2. Keep Linux Processes Running After Exiting Terminal

We will use `disown` command, it is used after the a process has been launched and put in the background, it’s work is to remove **a shell job** from the **shell’s active list jobs**, therefore you will not use `fg`, `bg` commands on that particular job anymore.

> 这段是说明：disown命令是在“后台运行”的基础上使用的，所以上一部分应该是这一部分的铺垫。

In addition, when you close the controlling terminal, the job will not hang or send a `SIGHUP` to any child jobs.

Let’s take a look at the below example of using `diswon` bash built-in function.

```bash
$ sudo rsync Templates/* /var/www/html/files/ &
$ jobs
$ disown  -h  %1
$ jobs
```

![](https://www.tecmint.com/wp-content/uploads/2016/10/Keep-Linux-Processes-Running.png)

You can also use `nohup` command, which also enables a process to continue running in the background when a user exits a shell.

```bash
$ nohup tar -czf iso.tar.gz Templates/* &
$ jobs
```

![](https://www.tecmint.com/wp-content/uploads/2016/10/Put-Linux-Process-in-Background.png)

## 3. Detach a Linux Processes From Controlling Terminal

Therefore, to completely detach **a process** from **a controlling terminal**, use the command format below, this is more effective for graphical user interface (GUI) applications such as `firefox`:

```bash
$ firefox </dev/null &>/dev/null &
```

In Linux, `/dev/null` is a special device file which writes-off (gets rid of) all data written to it, in the command above, input is read from, and output is sent to `/dev/null`.


