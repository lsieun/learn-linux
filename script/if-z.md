# What does -z mean in Bash?

URL: https://stackoverflow.com/questions/18096670/what-does-z-mean-in-bash

```bash
if [ -z $2 ]; then
        echo "usage: ...
```

`-z string`: `True` if the string is `null` (an empty string)


`test -z` returns `true` if the parameter is empty (see `man sh` or `man test`)
