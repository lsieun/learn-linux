# Indent Code Block


| Before Indent                                                | After Indent                     |
| ------------------------------------------------------------ | -------------------------------- |
| int main(int argc, char *argv[]) <br/>{<br/>printf("Hello World!\n");<br/>printf("Done");<br/>}<br/> | int main(int argc, char *argv[])<br/>{<br/>&nbsp;&nbsp;&nbsp;&nbsp;printf("Hello World!\n");<br/>&nbsp;&nbsp;&nbsp;&nbsp;printf("Done");<br/>}<br/> |

There are two methods to indent the code:

**Method 1**: 先缩进，再界定范围。
- Move the cursor to either the `{` or `}`
- Press `>i{` to indent the code located in between `{` and `}`

**Method 2**: 先选择，再缩进
- Move the cursor to the 1 st line after `{` . i.e `printf`
- Enable visual mode by pressing `v` key
- Use arrow key to select the lines in between `{` and `}`
- Press `>` to indent the code located in between `{` and `}`








