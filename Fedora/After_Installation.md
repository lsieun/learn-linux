# Fedora 28 安装完后的基本配置

## 为gnome-terminal设置快捷键

Settings->Devices->Keyboard->Custome Shortcuts->Add

名称：terminal
命令：gnome-terminal
按键：Ctrl+Alt+t

## (1)更新Fedora

修改为tuna repo

https://mirrors.tuna.tsinghua.edu.cn/help/fedora/

fedora 仓库 (/etc/yum.repos.d/fedora.repo)
```
[fedora]
name=Fedora $releasever - $basearch
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/releases/$releasever/Everything/$basearch/os/
metadata_expire=28d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
```

updates 仓库 (/etc/yum.repos.d/fedora-updates.repo)
```
[updates]
name=Fedora $releasever - $basearch - Updates
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/updates/$releasever/Everything/$basearch/
enabled=1
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
```

之后通过 `sudo dnf makecache` 命令更新本地缓存

缓存完成之后，进行更新
```
sudo dnf update
```

## (2) Add RPM repo

网址：https://rpmfusion.org/Configuration#Installing_Free_and_Nonfree_Repositories

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

## (3) 安装插件

Sotfware-->Add-ons

安装

- GStreamer Multimedia Codecs-H.264插件
- GStreamer Multimedia Codecs-libav
- GStreamer Multimedia Codecs-License Issues
- GStreamer Multimedia Codecs-Non Free


下面这个是Fedora不自带的，需要手动安装：

OpenH264: https://fedoraproject.org/wiki/OpenH264

```
$ sudo dnf config-manager --set-enabled fedora-cisco-openh264

$ sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264
```

## (4) 安装gnome-tweaks-tool

```
sudo dnf install gnome-tweaks
```

## (5) wine

```
sudo dnf install wine
```

https://www.winehq.org/

## 安装五笔

```
sudo dnf install ibus*wubi*
```

安装完成之后，需要重启操作系统。

在Settings->Region & Language -> Input Sources中添加极点五笔。之后，输入法就会出现在右上角了。



## 安装右键菜单Open in Terminal

```
sudo dnf install nautilus-open-terminal
```

## 安装下载工具UGET

```
sudo dnf install uget
```

需要在uget-编辑-设置-插件-curl+aria2

## 配置RPMFusion仓库

```
dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-28.noarch.rpm


dnf install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-28.noarch.rpm
```

最后更新源缓存，终端执行命令

```
dnf clean all 
dnf makecache
dnf upgrade
```

## Fedy

https://www.folkswithhats.org/

```
dnf install https://dl.folkswithhats.org/fedora/$(rpm -E %fedora)/RPMS/fedy-release.rpm

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


dnf install fedy
```

## 安装开源字体

```
dnf install wqy-bitmap-fonts wqy-zenhei-fonts wqy-unibit-fonts wqy-microhei-fonts
```

## 更改selinux设置，关闭selinux

终端执行命令

```
vi /etc/selinux/config
```

按下i键或者a键进入insert模式,修改如下设置
```
SELINUX=disabled
```

## 安装即时聊天工具Telegram

```
# dnf copr enable rommon/telegram


# dnf install telegram-desktop
```

## 安装MarkDown编辑器Typora

官网下载Typora软件: https://typora.io/linux/Typora-linux-x64.tar.gz

在下载目录下打开终端执行命令

```
# tar zxvf Typora-linux-x64.tar.gz -C /opt/
# cd /opt/
# mv Typora-linux-x64 typora
```

安装完成后终端执行命令

```
# vi /usr/local/share/applications/Typora.desktop
```

按下i键或者a键进入insert模式,编辑如下内容

```
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

```
# vi /usr/local/share/applications/defaults.list
```

按下i键或者a键进入insert模式,添加如下内容

```
text/x-markdown=Typora.desktop
```

终端执行命令

```
# vi /usr/local/share/applications/mimeinfo.cache
```

按下i键或者a键进入insert模式,添加如下内容

```
text/x-markdown=Typora.desktop
```















