# HowTo Format Date For Display or Use In a Shell Script

URL: https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/

## Syntax

The syntax is as follows for the GNU/date and BSD/date command:

```bash
date +FORMAT
```

OR

```bash
date +"%FORMAT"
```

OR

```bash
date +"%FORMAT%FORMAT"
```

OR

```bash
date +"%FORMAT-%FORMAT"
```

An operand with **a leading plus** (`+`) sign signals **a user-defined format string** which specifies the format in which to display the date and time. The following examples are tested on GNU/Linux, Apple OS X Unix, and FreeBSD unix operating system.

```bash
$ date +%F
2019-10-18

$ date +%T
12:22:10

$ date +"%F %T"
2019-10-18 12:22:32
```

## Examples

### Task: Display date in mm-dd-yy format

Open a terminal and type the following date command:

```bash
$ date +"%m-%d-%y"
```

Sample outputs:

```
10-11-18
```

To turn on 4 digit year display:

```bash
$ date +"%m-%d-%Y"
```

### Task: Display time only

Type the following command:

```bash
$ date +"%T"
```

Sample outputs:

```txt
19:55:04
```

To display locale’s 12-hour clock time, enter:

```bash
$ date +"%r"
```

Sample outputs:

```txt
07:56:05 PM
```

To display time in HH:MM format, type:

```bash
$ date +"%H-%M"
```

Sample outputs:

```txt
08-50
```

### How do I save time/date format to the shell variable?

Simply type the following command at the shell prompt:

```bash
$ NOW=$(date +"%m-%d-%Y")
```

To display a variable use echo / printf command:

```bash
$ echo $NOW
```


A sample shell script

```bash
#!/bin/bash
NOW=$(date +"%m-%d-%Y")
FILE="backup.$NOW.tar.gz"
echo "Backing up data to /nas42/backup.$NOW.tar.gz file, please wait..."
# rest of script
# tar xcvf /nas42/backup.$NOW.tar.gz /home/ /etc/ /var
```

通过`man date`命令可以查看到都有哪些格式：

FORMAT controls the output.  Interpreted sequences are:

```txt
       %%     a literal %

       %a     locale's abbreviated weekday name (e.g., Sun)

       %A     locale's full weekday name (e.g., Sunday)

       %b     locale's abbreviated month name (e.g., Jan)

       %B     locale's full month name (e.g., January)

       %c     locale's date and time (e.g., Thu Mar  3 23:05:25 2005)

       %C     century; like %Y, except omit last two digits (e.g., 20)

       %d     day of month (e.g., 01)

       %D     date; same as %m/%d/%y

       %e     day of month, space padded; same as %_d

       %F     full date; same as %Y-%m-%d

       %g     last two digits of year of ISO week number (see %G)

       %G     year of ISO week number (see %V); normally useful only with %V

       %h     same as %b

       %H     hour (00..23)

       %I     hour (01..12)

       %j     day of year (001..366)

       %k     hour, space padded ( 0..23); same as %_H

       %l     hour, space padded ( 1..12); same as %_I

       %m     month (01..12)

       %M     minute (00..59)

       %n     a newline

       %N     nanoseconds (000000000..999999999)

       %p     locale's equivalent of either AM or PM; blank if not known

       %P     like %p, but lower case

       %q     quarter of year (1..4)

       %r     locale's 12-hour clock time (e.g., 11:11:04 PM)

       %R     24-hour hour and minute; same as %H:%M

       %s     seconds since 1970-01-01 00:00:00 UTC

       %S     second (00..60)

       %t     a tab

       %T     time; same as %H:%M:%S

       %u     day of week (1..7); 1 is Monday

       %U     week number of year, with Sunday as first day of week (00..53)

       %V     ISO week number, with Monday as first day of week (01..53)

       %w     day of week (0..6); 0 is Sunday

       %W     week number of year, with Monday as first day of week (00..53)

       %x     locale's date representation (e.g., 12/31/99)

       %X     locale's time representation (e.g., 23:13:48)

       %y     last two digits of year (00..99)

       %Y     year

       %z     +hhmm numeric time zone (e.g., -0400)

       %:z    +hh:mm numeric time zone (e.g., -04:00)

       %::z   +hh:mm:ss numeric time zone (e.g., -04:00:00)

       %Z     alphabetic time zone abbreviation (e.g., EDT)
```










