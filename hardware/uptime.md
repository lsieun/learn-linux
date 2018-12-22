# uptime

NAME

```txt
uptime - Tell how long the system has been running.
```

SYNOPSIS

```bash
uptime [options]
```

Demo:

```bash
$ uptime
```

Output:

```txt
18:31:48 up 9:52, 1 user, load average: 0.14, 0.73, 1.33
```

`uptime` gives a one line display of the following information. 

- The current time, 
- how long the system has been running, 
- how many users are currently logged on, and 
- the system load averages for the past 1, 5, and 15 minutes.

**System load averages** is the average number of processes that are either in a **runnable** or **uninterruptable** state. 
- **A process in a runnable state** is either using the CPU or waiting to use the CPU. 
- **A process in uninterruptable state** is waiting for some I/O access, eg waiting for disk. 

**The averages** are taken over the three time intervals. Load averages are not normalized for the number of CPUs in a system, so a load average of 1 means a single CPU system is loaded all the time while on a 4 CPU system it means it was idle 75% of the time.



