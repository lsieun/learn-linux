# Typora

## 安装MarkDown编辑器Typora

官网下载Typora软件: https://typora.io/linux/Typora-linux-x64.tar.gz

在下载目录下打开终端执行命令

```bash
# tar zxvf Typora-linux-x64.tar.gz -C /opt/
# cd /opt/
# mv Typora-linux-x64 typora
```

安装完成后终端执行命令

```bash
# vi /usr/local/share/applications/Typora.desktop
```

按下i键或者a键进入insert模式,编辑如下内容

```txt
[Desktop Entry]
Name=typora
Version=0.9.9
Exec=/opt/typora/Typora
Comment=The Next Document processor based on Markdown
Icon=/opt/typora/resources/app/asserts/icon/icon_128x128.png
Type=Application
Terminal=false
StartupNotify=true
Encoding=UTF-8
Categories=Development;GTK;GNOME;
```

终端执行命令

```bash
# vi /usr/local/share/applications/defaults.list
```

按下i键或者a键进入insert模式,添加如下内容

```txt
text/x-markdown=Typora.desktop
```

终端执行命令

```bash
# vi /usr/local/share/applications/mimeinfo.cache
```

按下i键或者a键进入insert模式,添加如下内容

```txt
text/x-markdown=Typora.desktop
```
