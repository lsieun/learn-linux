# The Best Keyboard Shortcuts for Bash

[TOC]

```bash
echo $SHELL
bash --version
```

## 1. Working With Processes

Use the following shortcuts to manage running processes.

- `Ctrl+C`: Interrupt (kill) the current foreground process running in in the terminal. This sends the `SIGINT` signal to the process, which is technically just a request—**most processes will honor it, but some may ignore it**.
- `Ctrl+Z`: Suspend the current foreground process running in bash. This sends the `SIGTSTP` signal to the process. To return the process to the foreground later, use the `fg process_name` command.
- `Ctrl+D`: Close the bash shell. This sends an `EOF` (End-of-file) marker to bash, and bash exits when it receives this marker. This is similar to running the `exit` command.

## 2. Controlling the Screen

The following shortcuts allow you to control what appears on the screen.

- `Ctrl+L`: Clear the screen. This is similar to running the “`clear`” command.
- `Ctrl+S`: Stop all output to the screen. This is particularly useful when running commands with a lot of long, verbose output, but you don’t want to stop the command itself with `Ctrl+C`.
- `Ctrl+Q`: Resume output to the screen after stopping it with Ctrl+S.

## 3. Moving the Cursor

Use the following shortcuts to quickly move the cursor around the current line while typing a command.

- `Ctrl+A` or `Home`: Go to the beginning of the line.
- `Ctrl+E` or `End`: Go to the end of the line.
- `Alt+B`: Go left (back) one word.
- `Alt+F`: Go right (forward) one word.
- `Ctrl+B`: Go left (back) one character.
- `Ctrl+F`: Go right (forward) one character.
`Ctrl+XX`: Move between **the beginning of the line** and **the current position of the cursor**. This allows you to press `Ctrl+XX` to return to the start of the line, change something, and then press `Ctrl+XX` to go back to your original cursor position. To use this shortcut, hold the `Ctrl` key and tap the `X` key **twice**.

## 4. Cutting and Pasting

Bash includes some basic cut-and-paste features.

- `Ctrl+W`: Cut the word before the cursor, adding it to the clipboard.
- `Alt+D`: Delete the Word after the cursor.
- `Ctrl+U`: Cut the part of the line before the cursor, adding it to the clipboard.
- `Ctrl+K`: Cut the part of the line after the cursor, adding it to the clipboard.
- `Ctrl+Y`: Paste the last thing you cut from the clipboard. The `y` here stands for “yank”.

## 5. Deleting Text

Use the following shortcuts to quickly delete characters:

- `Ctrl+D` or `Delete`: Delete the character under the cursor.
- `Ctrl+H` or `Backspace`: Delete the character before the cursor.

Alt+D: Delete all characters after the cursor on the current line.

## emacs vs. vi Keyboard Shortcuts

The above instructions assume you’re using the default keyboard shortcut configuration in `bash`. By default, `bash` uses `emacs`-style keys. If you’re more used to the `vi` text editor, you can switch to `vi`-style keyboard shortcuts.

The following command will put bash into vi mode:

```bash
set -o vi
```

The following command will put bash back into the default emacs mode:

```bash
set -o emacs
```


## Special keys: Tab, Backspace, Enter, Esc

Text Terminals send characters (bytes), not key strokes. 
Special keys such as `Tab`, `Backspace`, `Enter` and `Esc` are encoded as control characters. 
Control characters are not printable, they display in the terminal as `^` and are intended to have an effect on applications.

`Ctrl+I` = `Tab`
`Ctrl+J` = `Newline`
`Ctrl+M` = `Enter`
`Ctrl+[` = `Escape`













