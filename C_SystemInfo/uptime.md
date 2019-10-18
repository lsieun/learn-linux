# uptime

## Quick Start

Check the uptime on your computer and you might find the machine has not been rebooted for months or years.

```bash
server@cloud$ uptime
 00:55:30 up 265 days,  2:47,  2 users,  load average: 2.79, 3.58, 3.91
laptop@home$ uptime
 10:55:45 up 6 days, 17:02,  1 user,  load average: 1.37, 0.78, 0.39
```

Here's two variations of `uptime` for reference:

```bash
$ uptime -p  # Pretty print.
up 37 weeks, 6 days, 2 hours, 47 minutes

$ uptime -s  # Since.
2018-10-07 22:08:08
```

## Intro

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

## system load averages

**System load averages** is the average number of processes that are either in a **runnable** or **uninterruptable** state.

- **A process in a runnable state** is either using the CPU or waiting to use the CPU.
- **A process in uninterruptable state** is waiting for some I/O access, eg waiting for disk.

**The averages** are taken over the three time intervals. Load averages are not normalized for the number of CPUs in a system, so a load average of 1 means a single CPU system is loaded all the time while on a 4 CPU system it means it was idle 75% of the time.
