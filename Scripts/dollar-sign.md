# Special Parameters

URL: 

- https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html
- https://www.gnu.org/software/bash/manual/html_node/Shell-Variables.html


The `$#` refers to the number of parameters received at run time, not a specific parameter.  `$1` gets replaced by whatever was in location 1 on the command line when the script was executed.

`$#` Denotes **the number of command line arguments** or positional parameters

`$1` and `$2` denote the first and second command line argument passed, respectively


- `$0` is the name of the shell or shell script.
- `$1`, `$2`, `$3`, ... are the positional parameters.
- "`$@`" is an array-like construct of all positional parameters, {$1, $2, $3 ...}.
- "`$*`" is the IFS expansion of all positional parameters, $1 $2 $3 ....
- `$#` is the number of positional parameters.

- `$-` current options set for the shell.
- `$_` most recent parameter (or the abs path of the command to start the current shell immediately after startup). 另一种解释，last argument of last command.
- `$IFS` is the (input) field separator.
- `$?` is the most recent foreground pipeline exit status.
- `$!` is the PID of the most recent background command.
- `$$` pid of the current shell (not subshell).

Most of the above can be found under [Special Parameters](https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html) in the Bash Reference Manual. There are all the [environment variables set by the shell](https://www.gnu.org/software/bash/manual/html_node/Shell-Variables.html).

For a comprehensive index, please see the [Reference Manual Variable Index](https://www.gnu.org/software/bash/manual/html_node/Variable-Index.html).

## 输入参数 `$#`,`$0`,`$n`

To help understand what do `$#`, `$0` and `$1`, ..., `$n` do, I use this script:

```bash
#!/bin/bash

for((i=0; i<=$#; i++)); do
    echo "parameter $i --> ${!i}"
done
```
Running it returns a representative output:

```bash
$ sh abc.sh "hello" "how are you" "i am fine"
```

Output:

```txt
parameter 0 --> abc.sh
parameter 1 --> hello
parameter 2 --> how are you
parameter 3 --> i am fine
```

## `$@` and `$*`


"`$@`" expands to a list, "`$*`" expands to a single string.

