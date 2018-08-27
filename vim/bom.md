# UTF-8 with BOM is not recommended

According to the Unicode standard, the BOM for UTF-8 files is not recommended.

While Unicode standard allows BOM in UTF-8, it does not require or recommend it. Byte order has no meaning in UTF-8 so a BOM only serves to identify a text stream or file as UTF-8 or that it was converted from another format that has a BOM.

1. Open file in VIM:
```vim
vi text.xml
```

2. Remove BOM encoding:
```vim
:set nobomb
```

3. Save and quit:
```vim
:wq
```
