# 截图工具

## 快捷键

```
Shift+PrtSc(reen)
```

## 截图自动保存

图片文件自动保存到以下路径下：

```
/home/<user>/Pictures
```

```bash
man gnome-screenshot
```

NOW=$(date +"%Y%m%d%H%M%S")
FILE="${NOW}.png"
gnome-screenshot -af ${FILE}
echo ${FILE}

NOW=$(date +"%Y%m%d%H%M%S") && FILE="${NOW}.png" && gnome-screenshot -af ${FILE} && echo ${FILE}

alias shot="NOW=$(date +\"%Y%m%d%H%M%S\") && FILE=\"${NOW}.png\" && gnome-screenshot -af ${FILE} && echo ${FILE}"

```bash
#!/bin/bash
NOW=$(date +"%Y%m%d%H%M%S")
FILE="${NOW}.png"
echo ${FILE}
gnome-screenshot -af ${FILE}
```

```bash
alias shot="sh ~/Software/screenshot.sh"
```