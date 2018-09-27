# Here Documents

URL: https://stackoverflow.com/questions/2500436/how-does-cat-eof-work-in-bash

From `man bash`:

## 1. Here Documents

This type of redirection instructs the shell to read input from the current source until a line containing only `delimiter` (with no trailing blanks) is seen.

All of the lines read up to that point are then used as the standard input for a command.

The format of here-documents is:

```
[n]<<[-]word
        here-document
delimiter
```
No parameter expansion, command substitution, arithmetic expansion, or pathname expansion is performed on `word`. If any characters in `word` are quoted, the `delimiter` is the result of quote removal on word, and the lines in the here-document are not expanded. If `word` is unquoted, all lines of the here-document are subjected to parameter expansion, command substitution, and arithmetic expansion. In the latter case, the character sequence `\<newline>` is ignored, and `\` must be used to quote the characters `\`, `$`, and `` ` ``.

If the redirection operator is `<<-`, then all leading tab characters are stripped from input lines and the line containing delimiter. This allows here-documents within shell scripts to be indented in a natural fashion.

## 2. Demo

**Here documents** are available in many Unix shells. In the following example, text is passed to the `tr` command (transliterating lower to upper-case) using a **here document**. This could be in a shell file, or entered interactively at a prompt.

```bash
$ tr a-z A-Z << END_TEXT
> one two three
> four five six
> END_TEXT
ONE TWO THREE
FOUR FIVE SIX
```

`END_TEXT` was used as the delimiting identifier. It specified the **start** and **end** of **the here document**. The **redirect** and **the delimiting identifier** do not need to be separated by a space: `<<END_TEXT` or `<< END_TEXT` both work equally well.

By default, behavior is largely identical to the contents of double quotes: `variable names` are replaced by their values, commands within `backticks` are evaluated, etc.

```bash
$ cat << EOF
> \$ Workding dir "$PWD" `pwd`
> EOF
$ Workding dir "/home/liusen" /home/liusen
```

This can be disabled by quoting any part of the label, which is then ended by the unquoted value; the behavior is essentially identical to that if the contents were enclosed in **single quotes**. Thus for example by setting it in single quotes:

```bash
$ cat << 'EOF'
> \$ Working dir "$PWD" `pwd`
> EOF
\$ Working dir "$PWD" `pwd`
```



