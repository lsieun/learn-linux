# Lenovo Y720 + Fedora

使用Rufus制作U盘启动

联想拯救者R270笔记本安装双系统Win10+Ubuntu16.04 
https://blog.csdn.net/yufeng1108/article/details/79752680 

Y720安装windows10和ubuntu双系统 
https://blog.csdn.net/yakerang/article/details/78397130 


## wifi

```bash
$ sudo rfkill list all
$ sudo modprobe -r ideapad_laptop
```

以上命令需要在每次开机后都运行一次，非常麻烦。为了下次开机wifi可以自动使用，使用命令

```bash
cd /etc/modprobe.d
gedit blacklist.conf
```

打开文件，并在最后一行加入

```bash
blacklist ideapad_laptop
```
至此配置wifi结束。重启电脑可以自动搜到wifi热点了。



