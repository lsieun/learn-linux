
rpm包和deb包是两种Linux系统下最常见的安装包格式，在安装一些软件或服务的时候免不了要和它们打交道。rpm包主要应用在RedHat系列包括 Fedora等发行版的Linux系统上，deb包主要应用于Debian系列包括现在比较流行的Ubuntu等发行版上。

我们知道如果要安装现成的这两种包的话，安装rpm包的命令是“rpm -参数”，安装deb包的命令是“dpkg -参数”。

> 我猜想，rpm = RedHat Package Manager, dpkg = Debian Package

而Linux系统很方便和人性化的一点就是很多软件或服务根本就不用我们去下载，直接使用相应的命令就可以管理了，可能这就是传说中的 “云”的概念。

`yum`可以用于运作rpm包，例如在Fedora系统上对某个软件的管理：
安装：`yum install <package_name>`
卸载：`yum remove <package_name>`
更新：`yum update <package_name>`

`apt-get`可以用于运作deb包，例如在Ubuntu系统上对某个软件的管理：
安装：`apt-get install <package_name>`
卸载：`apt-get remove <package_name>`
更新：`apt-get update <package_name>`

Advanced Package Tool，又名apt-get，是一款适用于Unix和Linux系统的应用程序管理器。最初于1998年发布，用于检索应用程序并将其加载到Debian Linux系统。Apt-get成名的原因之一在于其出色的解决软件依赖关系的能力。其通常使用.deb-formatted文件，但经过修改后可以使用apt-rpm处理红帽的Package Manager（RPM）文件。

apt-get命令一般需要root权限执行，所以一般跟着sudo命令。例：`sudo apt-get xxxx`

Ubuntu中的高级包管理方法apt-get

除了apt的便捷以外，apt-get的一大好处是极大地减小了所谓依赖关系恶梦的发生几率(dependency hell)，即使是陷入了dependency hell，apt-get也提供了很好的援助手段，帮你逃出魔窟。

**dpkg** is the core that does the actual installs. It doesn't manage all of the packages. The others are built off it. **apt** is a **package manager** that manages repos, dependencies etc. **apt-get** is a CLI that's generally used to do installs through **apt**. **apt** is also a CLI that has most **apt-get** and **apt-cache** features in it.

`apt-get` and `apt-cache` is most commonly used commands are available in `apt`.

There are various tools that interact with Advanced Packaging Tool (APT) and allow you to install, remove and manage packages in Debian based Linux distributions. apt-get is one such command-line tool which is widely popular. Another popular tool is Aptitude with both GUI and command-line options.

If you have used apt-get commands, you might have come across a number of similar commands such as apt-cache, apt-config etc. And this is where the problem arises.

You see, these commands are way too low level and they have so many functionalities which are perhaps never used by an average Linux user. On the other hand, the most commonly used package management commands are scattered across apt-get, apt-cache and apt-config.

The apt commands have been introduced to solve this problem. apt consists some of the most widely used features from apt-get, apt-cache and apt-config leaving aside obscure and seldom used features.

With apt, you don’t have to fiddle your way from apt-get to apt-cache to apt-config. apt is more structured and provides you with necessary options needed to manage packages.

Bottom line: apt=most common used command options from apt-get, apt-cache and apt-config.


----

APT is a vast project, whose original plans included a graphical interface. It is based on a library which contains the core application, and apt-get is the first front end — command-line based — which was developed within the project.

apt is a second command-line based front end provided by APT which overcomes some design mistakes of apt-get.

