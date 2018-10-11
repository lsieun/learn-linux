# fortune

**NAME**

fortune - print a random, hopefully interesting, adage(格言；俗语)

**SYNOPSIS**

```bash
fortune [-acefilsw] [-n length] [ -m pattern] [[n%] file/dir/all]
```

**DESCRIPTION**

When `fortune` is run with **no arguments** it prints out a random epigram. Epigrams are divided into several categories.

**Options**

The options are as follows:

- `-a` Choose from all lists of maxims.

- `-c` Show the cookie file from which the fortune came.

- `-e` Consider all fortune files to be of equal size (see discussion below on multiple files).

- `-f` Print out the list of files which would be searched, but don't print a fortune.

- `-l` Long dictums only. See -n on how ``long'' is defined in this sense.

- `-m pattern` Print out all fortunes which match the basic regular expression pattern. 

- `-n length` Set the longest fortune length (in characters) considered to be **short** (the default is  160). All fortunes longer than this are considered **long**. Be careful! If you set the  length too short and ask for short fortunes, or too long and ask for long ones, fortune goes  into a never-ending thrash loop.

- `-s` Short apothegms only. See `-n` on which fortunes are considered ``short''.

- `-i` Ignore case for -m patterns.

- `-w` Wait before termination for an amount of time calculated from the number of characters in  the message. This is useful if it is executed as part of the logout procedure to guarantee  that the message can be read before the screen is cleared.

## with cowsay

If you want to combine `cowsay` and `fortune` to present you with a message each time you start a terminal, add the following line:

```bash
fortune | cowsay -f tux
```

to the file `.bashrc` in your home folder.





