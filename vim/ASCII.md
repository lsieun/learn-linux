# View ASCII value of a character

## 1、查看字符ASCII码

For some reason, if you want to know **a decimal**(十进制)), **Hex**(十六进制) and **Octal**(八进制)) value of **a character**, move your cursor to the character on press `ga`, which will display **the ASCII value**.

ASCII value of character `a`. 也可以查看中文的码值。
```
ga
<a> 97, Hex 61, Octal 141
```

`ga`: 		
- Print the ascii value of the character under the cursor in decimal, hexadecimal and octal.
- Mnemonic: Get Ascii value.

## 2、使用编码输入字符

在vim里面, 进入编辑模式"i". 输入ctrl+v, 然后输入内码就行了.
例如:
A:    ctrl+v, 65
星: ctrl+v, u661f

> 注意：没有`,`号，输入数字时不能使用小键盘。
