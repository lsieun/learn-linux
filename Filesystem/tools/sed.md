# sed—Stream Editor for Filtering and Transforming Text

## Intro

The name `sed` is short for **stream editor**. It performs *text editing* on a stream of text, either **a set of specified files** or **standard input**.

```bash
$ echo "front" | sed 's/front/back/'
back
```

Commands in `sed` begin with a single letter. In the previous example, the substitution command is represented by the letter `s` and is followed by the **search-and-replace strings**, separated by the **slash character**(`/`) as a delimiter.

### delimiter character

**The choice of the delimiter character is arbitrary**. By convention, the **slash character**(`/`) is often used, but `sed` will accept any character that immediately follows the command as the delimiter. We could perform the same command this way:

```bash
$ echo "front" | sed 's_front_back_'
back
```

### address

Most commands in `sed` may be preceded by **an address**, which specifies which line(s) of the input stream will be edited. **If the address is omitted, then the editing command is carried out on every line in the input stream**.

The simplest form of address is a line number. We can add one to our example.

```bash
$ echo "front" | sed '1s/front/back/'
back

$ echo "front" | sed '2s/front/back/'
front
```

Addresses may be expressed in many ways.

- `n`: A line number where `n` is a positive integer.
- `$`: The last line.
- `/regexp/` Lines matching a POSIX basic regular expression. Note that the reg­ular expression is delimited by **slash characters**. Optionally, the regular expression may be delimited by an alternate character, by specifying the expression with `\cregexpc`, where `c` is the alternate character.
- `addr1,addr2`: A range of lines from `addr1` to `addr2`, inclusive. Addresses may be any of the single address forms listed earlier.
- `first~step`: Match the line represented by the number `first` and then each subsequent line at `step` intervals. For example, `1~2` refers to each odd numbered line, and `5~5` refers to the fifth line and every fifth line thereafter.
- `addr1,+n`: Match `addr1` and the following `n` lines.
- `addr!`: Match all lines except `addr`, which may be any of the forms listed earlier.

The option `-n` (the “no auto-print” option) to cause `sed` not to print every line by default.

```bash
$ cat hello.txt
Hello 1
World 2
Hello 3
World 4
Hello 5
World 6

$ sed "1,3p" hello.txt
Hello 1
Hello 1
World 2
World 2
Hello 3
Hello 3
World 4
Hello 5
World 6

# 使用数字
$ sed -n "1,3p" hello.txt
Hello 1
World 2
Hello 3

# 使用正则表达式
$ sed -n "/Hello/p" hello.txt 
Hello 1
Hello 3
Hello 5
```

### Basic Editing Commands

- `p`: Print the current line. By default, `sed` prints every line and only edits lines that match a specified address within the file. The default behavior can be overridden by specifying the `-n` option.
- `s/regexp/replacement/`: Substitute the contents of replacement wherever `regexp` is found. `replacement` may include the special character `&`, which is equivalent to the text matched by `regexp`. In addition, `replacement` may include the sequences `\1` through `\9`, which are the contents of the corresponding subexpressions in `regexp`.
- `y/set1/set2`: Perform transliteration by converting characters from `set1` to the corresponding characters in `set2`. Note that unlike `tr`, `sed` requires that both sets be of the same length.

### substitue

Another feature of the `s` command is the use of optional flags that may follow the `replacement` string. The most important of these is the `g` flag, which instructs `sed` to apply the search-and-replace globally to a line, not just to the first instance, which is the default. Here is an example:

```bash
$ echo "aaabbbccc" | sed 's/b/B/'
aaaBbbccc

$ echo "aaabbbccc" | sed 's/b/B/g'
aaaBBBccc
```

## Example

### delete comment message

File: `hello.txt`

```txt
/**
 * Hello World
 */
public class TempTest {
    /**
     * my parameter
     * @param args
     */
    public static void main(String[] args) {
        String line = "how   are    you";
        String result = line.replaceAll("( )\\1+", " ");
        System.out.println(result);
    }
}
```

删除其中的注释：

```bash
$ sed "/\/\*/,/\*\//d" hello.txt
public class TempTest {
    public static void main(String[] args) {
        String line = "how   are    you";
        String result = line.replaceAll("( )\\1+", " ");
        System.out.println(result);
    }
}
```

解释：

- （1） 使用正则表达进行选择范围：`/regexp1/,/regexp2/`
  - （1.1） regexp1的取值是`/*`，而regexp2的取值是`*/`
  - （1.2） 对regexp1的取值进行escape后是`\/\*`，对regexp1的取值进行escape后是`\*\/`
  - （1.3） 将（3）代入（1）后，得到结果：`/\/\*/,/\*\//`
- （2） 进行的操作是删除，字符是`d`

### substitue date

While the date is formatted `MM/DD/YYYY`, it would be better (for ease of sorting) if the format were `YYYY-MM-DD`.

Performing this change on the file by hand would be both time-consuming and error-prone, but with `sed`, this change can be performed in one step.

```bash
$ cat mydate.txt
10/10/2020
10/10/2010
10/10/2000

$ sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\3-\1-\2/' mydate.txt
2020-10-10
2010-10-10
2000-10-10

$ sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\3-\1-\2/' mydate.txt | sort
2000-10-10
2010-10-10
2020-10-10
```

It is also a perfect example of why regular expressions are sometimes jokingly referred to as a **write-only** medium. **We can write them, but we sometimes cannot read them**.
