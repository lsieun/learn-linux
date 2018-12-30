# Fedora 28 安装完后的基本配置

<!-- TOC -->

- [1. 设置root密码](#1-设置root密码)
- [2. 切换用户至管理员](#2-切换用户至管理员)
- [3. 设置主机名](#3-设置主机名)
- [4. 关闭selinux](#4-关闭selinux)
    - [4.1. 第一种方式](#41-第一种方式)
    - [4.2. 第二种方式](#42-第二种方式)
- [5. 为gnome-terminal设置快捷键](#5-为gnome-terminal设置快捷键)
- [6. 更新Fedora](#6-更新fedora)
    - [6.1. 修改为tuna repo](#61-修改为tuna-repo)
    - [6.2. 安装插件，自动选择最快的仓库源](#62-安装插件自动选择最快的仓库源)
    - [6.3. 添加RPMFusion仓库](#63-添加rpmfusion仓库)
    - [6.4. 更新源缓存](#64-更新源缓存)
    - [6.5. 更新系统](#65-更新系统)
    - [6.6. 删除旧的内核](#66-删除旧的内核)
- [7. 常用软件安装](#7-常用软件安装)
    - [7.1. 安装五笔](#71-安装五笔)
    - [7.2. 安装下载工具UGET](#72-安装下载工具uget)
    - [7.3. 安装插件](#73-安装插件)
- [Improve battery life and reduce overheating](#improve-battery-life-and-reduce-overheating)
- [Save your eyes at night with Redshift](#save-your-eyes-at-night-with-redshift)

<!-- /TOC -->

## 1. 设置root密码

```bash
#回车后输入密码并重复
$ sudo passwd root
<name><birthday>
```

## 2. 切换用户至管理员

```bash
$ su -
```

## 3. 设置主机名

```bash
#避免因切换网络而导致的主机名变为bogon
# hostnamectl --static set-hostname LOCALHOST（主机名）
```

## 4. 关闭selinux

### 4.1. 第一种方式

```bash
# sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
```

### 4.2. 第二种方式

终端执行命令

```bash
vi /etc/selinux/config
```

按下i键或者a键进入insert模式,修改如下设置

```bash
SELINUX=disabled
```

## 5. 为gnome-terminal设置快捷键

Settings->Devices->Keyboard->Custome Shortcuts->Add

名称：terminal
命令：/usr/bin/gnome-terminal
按键：Ctrl+Alt+t

## 6. 更新Fedora

### 6.1. 修改为tuna repo

URL：[清华Fedora 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/fedora/)

fedora 仓库 (/etc/yum.repos.d/fedora.repo)

```txt
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

```txt
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

之后通过命令更新本地缓存

```bash
sudo dnf clean all
sudo dnf makecache
```

### 6.2. 安装插件，自动选择最快的仓库源

```bash
# dnf install yum-fastestmirror
```

配置/etc/dnf/dnf.conf

```bash
# vi /etc/dnf/dnf.conf
fastestmirror=true        ##添加此行
```

### 6.3. 添加RPMFusion仓库

第一种方式：

```bash
# dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-28.noarch.rpm
# dnf install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-28.noarch.rpm
```

第二种方式：

```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### 6.4. 更新源缓存

```bash
sudo dnf clean all
sudo dnf makecache
```

### 6.5. 更新系统

```bash
sudo dnf upgrade
```

### 6.6. 删除旧的内核

```bash
# uname -a
# rpm -qa |grep kernel         ##查询所有内核,有两个版本的，
# yum remove kernel-core-4.16.＊   ##删除低版本的，我的之前是4.16的
```

## 7. 常用软件安装

安装右键在终端中打开插件

```bash
sudo dnf install nautilus-open-terminal
```

安装 GNOME 桌面配置工具

```bash
sudo dnf install gnome-tweaks
```

安装谷歌浏览器

```bash
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable
```

### 7.1. 安装五笔

```bash
sudo dnf install ibus*wubi*

# 上面的语句会安装两种五笔（海峰五笔 和 极点五笔），我使用下面的语句进行安装

sudo dnf install ibus-table-chinese-wubi-jidian
```

安装完成之后，需要重启操作系统。

在Settings->Region & Language -> Input Sources中添加极点五笔。之后，输入法就会出现在右上角了。

```bash
sudo dnf remove ibus
sudo dnf install im-chooser
sudo dnf install fcitx
sudo dnf install fcitx-configtool
sudo dnf install sunpinyin
sudo dnf install fcitx-sunpinyin
```


### 7.2. 安装下载工具UGET

```bash
sudo dnf install uget
```

需要在uget-编辑-设置-插件-curl+aria2

### 7.3. 安装插件

播放视频Mp4

Sotfware-->Add-ons

安装

- GStreamer Multimedia Codecs-H.264插件
- GStreamer Multimedia Codecs-libav
- GStreamer Multimedia Codecs-License Issues
- GStreamer Multimedia Codecs-Non Free

下面这个是Fedora不自带的，需要手动安装：

OpenH264: https://fedoraproject.org/wiki/OpenH264

```bash
$ sudo dnf config-manager --set-enabled fedora-cisco-openh264

$ sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264
```

## Improve battery life and reduce overheating

I have written in detail about the [best practices to reduce overheating in Linux laptops](https://itsfoss.com/reduce-overheating-laptops-linux/). **TLP** is my favorite tool in recent times. You install it once and you will see its impact almost immediately. Install it and forget it, no need to bother with configuration, not because you cannot do it, more because you don’t need it. I believe that it should be installed by default in all Linux distributions.

To install TLP in Fedora, use the following command:

```bash
sudo dnf install tlp
```

## Save your eyes at night with Redshift

A lot has been discussed about the impact ‘blue light’ makes on our sleeping habit lately. It’s not a secret that computer screens are not the best friend of our eyes, especially at nights in non-natural lights.

For this reason, there are applications that reduce the blue light and provide a more eyes-friendly orange or red screen. [Redshift](http://jonls.dk/redshift/) is one such application that you must install if you use your computer at night. Use the command below to install Redshift

```bash
sudo dnf install redshift
```

There is no configuration needed. It determines your location and automatically turns your screen red-ish after sunset. If you need more features and configuration, try `f.lux`. Read this article about [using f.lux to get night shift feature in Linux](https://itsfoss.com/night-shift-flux-ubuntu-linux/).


