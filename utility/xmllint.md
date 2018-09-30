# xmllint - command line XML tool

> 猜测：  
> xmllint = xml + lint  
> lint = **lin**e + **t**ool

```bash
xmllint [options] {XML-FILE(S)... | -}
```

The xmllint program parses one or more XML files, specified on the command line as `XML-FILE` (or the standard input if the filename provided is `-` ). 

> 这段解读：  
> （1）xmllint可以接受多个xml文件作为参数(argument)；  
> （2）如果接受的参数是"`-`"，则表示是standard input。  


It prints various types of output, depending upon the **options** selected. It is useful for detecting errors both in XML code and in the XML parser itself.

- `--format`: Reformat and reindent the output. The `XMLLINT_INDENT` environment variable controls the indentation. **The default value is two spaces " "**).


```bash
XMLLINT_INDENT="    "
xmllint --format origin.xml target.xml
```



