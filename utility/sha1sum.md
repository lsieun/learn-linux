# sha1sum

## 查看文件的sha1值

Print or check SHA1 (160-bit) checksums. With no FILE, or when FILE is `-`, read standard input.

```bash
sha1sum {file}
```

Example:

```bash
$ sha1sum cow.sh

a3bdc332f4caf8bddc3d46e472c2cc528502b040  cow.sh
```

## 将文件的sha1值写入到文件内

If you want to send the file together with its sha1sum output redirect the output to a file:

```bash
sha1sum {file} > {file}.sha1
```

## 检查文件的sha1值是否正确


```bash
sha1sum -c {file}.sha1
```
It should show OK if the sha1 is correct.




