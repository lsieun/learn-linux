# map

## Using the map Command

The `map` command acts a lot like `ab` except that you define a macro for vi’s **command mode** instead of for **insert mode**:

> map与ab命令的区别是：  
> map 用于 command mode  
> ab  用于 insert mode

- `:map x sequence`: Define character `x` as a sequence of editing commands.
- `:unmap x`: Disable the sequence defined for `x`.
- `:map`: List the characters that are currently mapped.

Before you can start creating your own maps, you need to know the **keys not used** in **command mode** that are available for user-defined commands:

- **Letters**: `g`, `K`, `q`, `V`, and `v`
- **Control keys**: `^A`, `^K`, `^O`, `^W`, and `^X`
- **Symbols**: `_`, `*`, `\`, and `=`



## Modifying key bindings

The main commands to know when dealing with key bindings are:
- `:map`: For the **Normal**, **Insert**, **Visual**, and **Command-line** modes
- `:imap`: For the **Insert** mode only
- `:cmap`: For the **Command-line** mode only
- `:nmap`: For the **Normal** mode only
- `:vmap`: For the **Visual** mode only

Each of the command takes **two arguments** — **the first** is **what keys the command should be bound to**, and **the second** is **the command to bind**.

```
:map <C-S> :w<cr>     #  using Ctrl-S to save a file
:imap <C-s> <esc>:w<cr>a    # 
```

Instead of `C` (Ctrl), you could also use `A` (Alt) or `M` (Meta). 
The `<cr>` at the end of the command is what actually executes the command. Without it, the command would simply be written to the command line but not executed.

| Keys           | Notation                    |
| :------------: | --------------------------- |
| `<BS>`         | Backspace                   |
| `<Tab>`        | Tab                         |
| `<CR>`         | Enter                       |
| `<Enter>`      | Enter                       |
| `<Return>`     | Enter                       |
| `<Esc>`        | Escape                      |
| `<Space>`      | Space                       |
| `<Up>`         | Up arrow                    |
| `<Down>`       | Down arrow                  |
| `<Left>`       | Left arrow                  |
| `<Right>`      | Right arrow                 |
| `<F1>-<F12>`   | Function keys 1 to 12       |
| `#1,#2..#9,#0` | Function keys F1 to F9, F10 |
| `<Insert>`     | Insert                      |
| `<Del>`        | Delete                      |
| `<Home>`       | Home                        |
| `<End>`        | End                         |
| `<PageUp>`     | Page up                     |
| `<PageDown>`   | Page down                   |







