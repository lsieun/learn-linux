# How to install vim with clipboard support on Fedora?

URL: https://superuser.com/questions/194747/how-to-install-vim-with-clipboard-support-on-fedora

## Question

I'm using Fedora Linux and don't have the ability to copy text from vim into the system clipboard (which I should be able to do by using the `+` or `*` register, though I'm not sure which). If I type this at the command line:

```bash
$ vim --version | grep clip
```

Output:
```txt
-clipboard         +jumplist          +persistent_undo   +vertsplit
+emacs_tags        +mouse_dec         -sun_workshop      -xterm_clipboard
```

... the relevant line says `-xterm_clipboard`, when what I want to see is `+xterm_clipboard`.


## Answer

Vim in Fedora is compiled without any X support in order to minimize the number of dependencies it has. You'll need to use `gvim` instead, in the `vim-X11` package.

```bash
sudo dnf install vim-X11
```

Note that while you'll need the version of Vim that supports X, you don't need to run it as an X application--you can run it in a terminal as `gvim -v`. That will launch Vim in `vi` or terminal mode but with access to the X clipboard. You can make this easier with an alias: `alias vim='gvim -v'` in your `~/.bashrc`. 

If you're on Linux and are using a VIm version 7.3.74 or highers, you can do

```vim
:set clipboard=unnamedplus
```

which will place yanked text into the global clipboard, and allow you to paste from the global clipboard, without having to use any special registers.

