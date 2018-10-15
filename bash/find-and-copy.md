# find and copy

## 

Actually, in two ways you can process `find` command output in `copy` command

If `find` command's output **doesn't contain any space** i.e if file name doesn't contain space in it then you can use below mentioned command:

Syntax: `find <Path> <Conditions> | xargs cp -t <copy file path>`

Example: `find -mtime -1 -type f | xargs cp -t inner/`

But most of the time our production data files **might contain space** in it. So most of time below mentioned command is safer:

Syntax: `find <path> <condition> -exec cp '{}' <copy path> \;`

Example: `find -mtime -1 -type f -exec cp '{}' inner/ \;`

In the second example, last part i.e **semi-colon** is also considered as part of `find` command, that **should be escaped** before press the **enter** button. Otherwise you will get an error something like this

```txt
find: missing argument to `-exec'
```


## aaa

Then, run the following command to find and copy all files that matches with extension `.mp3`.

```bash
$ find -iname '*.mp3' -exec cp {} /home/sk/test2/ \;
```

Let us break down the above command and see what each option does.

- `find` – It’s the command to find files and folders in Unix-like systems.
- `-iname '*.mp3'` – Search for files matching with extension `.mp3`.
- `-exec cp` – Tells you to execute the ‘cp’ command to copy files from source to destination directory.
- `{}` – is automatically replaced with the file name of the files found by ‘find’ command.
- `/home/sk/test2/` – Target directory to save the matching files.
- `\;` – Indicates it that the commands to be executed are now complete, and to carry out the command again on the next match.




```bash
find . -type f -name "*.mp3" -exec cp {} /tmp/MusicFiles \;
```

If you're familiar with the `find` command and have used the `-exec` option before, the only thing hard about this command is knowing where to put **the curly braces** and the `\;` in the command.

A few points:

- In this example, all the MP3 files beneath the current directory are copied into the target directory (/tmp/MusicFiles). Again, this isn't a `cp -r` command; all of these files will end up in one folder.
- As a result, **if there are duplicate file names, some of the files will be lost**.
- If you don’t want to overwrite existing files, use the `cp -n` command, like this:

```bash
find . -type f -name "*.mp3" -exec cp -n {} /tmp/MusicFiles \;
```

The `-n` option of the `cp` command means “**no clobber**,” and you can also type that as `cp --no-clobber` on some systems, such as Linux. (The `-n` option appears to work on MacOS systems, but `--no-clobber` does not.) **Be sure to test this command before using it on something important**; I haven’t tested it yet, I just read the man page for the `cp` command.)


## Another example: Find and move

Here’s another example of a “find and copy” command I just used, though in this case it was a “**find and move**” command. In this case I had a bunch of files (with unique names) in subdirectories, and used this command to copy them all to the current directory:

```bash
find . -type f -exec mv {} . \;
```

As before, this is a dangerous command, so be careful. With this command, if you have **duplicate filenames**, you will **definitely lose data** during the move operations.


