# sort

## Common sort Options

- `-b`: By default, sorting is performed on the entire line, starting with the first character in the line. This option causes sort to **ignore leading spaces** in lines and calculates sorting based on the first non-whitespace character on the line.
- `-f`: Make sorting case-insensitive.
- `-n`: Perform sorting based on the numeric evaluation of a string. Using this option allows sorting to be performed on numeric values rather than alphabetic values.
- `-r`: Sort in reverse order. Results are in descending rather than ascending order.

## Create File

```bash
$ sort > foo.txt
c
b
a
# <=== press ctrl+D to indicate end of file

$ cat foo.txt
a
b
c
```

## sort multiple files

Because `sort` can accept multiple files on the command line as arguments, it is possible to merge multiple files into a single sorted whole.

```bash
sort file1.txt file2.txt file3.txt > final_sorted_list.txt
```




