# Windows

**Windows** are simply the **viewports** into **buffers** and I’m 110% sure that they are a huge part of your daily workflow.

## 1、Starting a Vim Session

### 1.1、ONE FILE

Vim windows are not complicated to use; if you want to open a file, `file_one.txt`, simply:

```bash
$ vim file_one.txt
```

### 1.2、MULTIPLE FILES

If you want to open multiple files, `file_one.txt`, `file_two.txt`, and `file_three.txt`, you can do the following:

```bash
$ vim file_one.txt file_two.txt file_three.txt
```

This opens the first file, `file_one.txt`, into a **window**. Files `file_two.txt` and `file_three.txt` are opened as **inactive buffers**.

### 1.3、MULTIPLE HORIZONTAL SPLITS

Say you want to view multiple files at once. Good news! You can open all files and place them into **horizontal splits**.

```bash
$ vim -o file_one.txt file_two.txt file_three.txt
```

### 1.4、MULTIPLE VERTICAL SPLITS

Don’t like horizontal splits? Better news! You can open them all as **vertical splits**.

```bash
$ vim -O file_one.txt file_two.txt file_three.txt
```

## 2、Within a Vim Session

There are two main arrangements for splitting windows, **vertical** and **horizontal**. Let’s say we’re editing a file and want to open up another file. We can do the following:

### 2.1、HORIZONTAL SPLITS

```vim
:split another_file.txt
```

You can use this abbreviation:

```vim
:sp another_file.txt
```

In addition, you can specify **how large the new split will be** by passing in **a numerical value**. This value will represent **the line numbers** shown within the split.

For example, this will reveal 25 lines of `another_file.txt`.

```vim
:25sp another_file.txt
```

Lastly, you can open a **split** window with `CTRL-W s`.

### 2.2、VERTICAL SPLITS

You can open files as **vertical splits** as well.

```vim
:vsplit another_file.txt
```

Which is abbreviated as:

```vim
:vsp another_file.txt
```

**Vertical splits** can also take in **a numerical value**, which corresponds to **the character width of the column**.

```vim
:30vsp another_file.txt
```

Finally, you can open a **vertical split** with `CTRL-W v`.


### 2.3、NEW FILES

Use, `:new` to create a new file inside **the current window**. After you save the file, it will be created within your current directory. You can also use the abbreviation `:n`.

```vim
:n new_file.txt
```

If we specify the path, we can also create files inside existing directories.

```vim
:n ../existing_dir/new_file.txt
```

Use `:vnew` or `:vne` to create a new file inside a new vertical split.

```vim
:vne new_file.txt
```

Lastly, we can use `CTRL-w n` to create a new file inside a **horizontal split**. Note that we have not specified a file name. Upon saving the file with `:w`, we can give the file a name. Such that:

```vim
# CTRL-w n

:w this_is_a_new_file.txt
```

## 3、SWITCHING WINDOWS

Switching windows ain’t hard either!

- `CTRL-w h` = Switch to the window to the left
- `CTRL-w j` = Switch to the window below
- `CTRL-w k` = Switch to the window above
- `CTRL-w l` = Switch to the window to the right


## 4、MOVING WINDOWS

I’ve realized that window placement is incredibly useful when pairing with another person. Here’s are a some ways to adjust the windows.

- `CTRL-w T` = Move current window to a new tab
- `CTRL-w r` = Rotates the windows from left to right - only if the windows are split vertically
- `CTRL-w R` = Rotates the windows from right to left - only if the windows are split vertically
- `CTRL-w H` = Move current window the far left and use the full height of the screen
- `CTRL-w J` = Move current window the far bottom and use the full width of the screen
- `CTRL-w K` = Move current window the far top and full width of the screen
- `CTRL-w L` = Move current window the far right and full height of the screen

## 5、RESIZING WINDOWS

Sometimes windows open up funny or are rendered incorrectly after separating from an external monitor. Or maybe you want to make more room for an important file.

We can easily solve those problems with the following:

- `CTRL-w =` = Resize the windows equally
- `CTRL-w >` = Incrementally increase the window to the right
    - Takes a parameter, e.g. `CTRL-w 20 >`
- `CTRL-w <` = Incrementally increase the window to the left
    - Takes a parameter, e.g. `CTRL-w 20 <`
- `CTRL-w -` = Incrementally decrease the window’s height
    - Takes a parameter, e.g. `CTRL-w 10 -`
- `CTRL-w +` = Incrementally increase the window’s height
    - Takes a parameter, e.g. `CTRL-w 10 +`


That was a lot to cover, but I do believe incorporating these commands into your workflow will prove pretty helpful. Thanks for reading!



