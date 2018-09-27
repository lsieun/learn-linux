# nohup

**Nohup** stands for **no hang up**, which can be executed as shown below.

nohup syntax:

```bash
# nohup command-with-options &
```

Nohup is very helpful when you have to execute a shell-script or command that take a long time to finish. In that case, you don’t want to be connected to the shell and waiting for the command to complete. Instead, execute it with nohup, exit the shell and continue with your other work.

## Explanation about `nohup.out` file

By default, **the standard output** will be redirected to `nohup.out` file in the current directory. And **the standard error** will be redirected to **stdout**, thus it will also go to `nohup.out`. So, your `nohup.out` will contain both **standard output** and **error messages** from the script that you’ve executed using `nohup` command.

## 示例

```
nohup ss-local > /dev/null 2>&1 &
```

- `2` refers to the second file descriptor of the process, i.e. `stderr`.
- `>` means redirection.
- `&1` means the target of the redirection should be the same location as the first file descriptor, i.e. `stdout`.

So `> /dev/null 2>&1` first redirects `stdout` to `/dev/null` and then redirects `stderr` there as well. This effectively silences all output (regular or error) from the `nohub` command.





