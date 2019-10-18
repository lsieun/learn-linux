# zip

## create

```bash
zip my.zip f1.txt f2.txt f3.txt
zip my.zip *.txt
zip my.zip *.txt *.dat
```

## extract

```bash
cd test
unzip my.zip
```

解压到指定目录：

```bash
unzip my.zip -d ~/Software/
```

## view

You can also view the contents of a ZIP file, without extracting anything, by running the following command:

```bash
unzip -l <zipped-file>
```


