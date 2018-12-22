
# CentOS 7 mini安装Git #

[How To Install Git on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-centos-7)

## 0、前提 ##

没有`ifconfig`命令

	yum search ifconfig
	yum install net-tools

安装常用软件

	yum -y install net-tools wget lrzsz tree

关闭NetworkManager和防火墙

	systemctl disable firewalld
	systemctl stop firewalld
	systemctl disable NetworkManager
	systemctl stop NetworkManager

关闭并确认SELinux处于关闭状态

	vi /etc/selinux/config

```
SELINUX=disabled
SELINUXTYPE=targeted
```

## 1、安装git依赖 ##

Before you begin, you'll need to install the software that git depends on. **These dependencies** are all available in the default CentOS repositories, along with **the tools** that we need to build a **binary** from **source**.

> source --> binary  
> 编译工具+依赖包+git源代码：第1步，安装编译工具和依赖包；第2步，下载git源代码。

	#编译工具
	yum -y groupinstall "Development Tools"
	#依赖包
	yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel

## 2、下载Git源代码 ##

Git releases page： [https://github.com/git/git/releases](https://github.com/git/git/releases)

	wget https://github.com/git/git/archive/v2.17.1.tar.gz  -O git.tar.gz

The version at the top of the list is the most recent release. If it does not have `-rc` (short for "Release Candidate") in the name, that means that it is a stable release and is safe for use.

查看git的最新版。不要下载带有-rc的，因为它代表了一个候选发布版本。 

> RC=Release Candidate,含义是"发布候选版"，它不是最终的版本，而是最终版(RTM=Release To Manufacture)之前的最后一个版本。

## 3、解压 ##

Once the download is complete, we can unpack the source archive using `tar`. We'll need a few extra flags to make sure that the unpacking is done correctly: `z` decompresses the archive (since all .gz files are compressed), `x` extracts the individual files and folders from the archive, and `f` tells `tar` that we are declaring a filename to work with.

	tar -zxf git.tar.gz


## 4、安装 ##

We'll need to move to that folder to begin configuring our build. Instead of bothering with the full version name in the folder, we can use a wildcard (*) to save us some trouble in moving to that folder.

	cd git-*

Once we are in the source folder, we can begin the source build process. This starts with some pre-build checks for things like software dependencies and hardware configurations. We can check for everything that we need with the `configure` script that is generated by `make configure`. This script will also use a `--prefix` to declare `/usr/local` (the default program folder for Linux platforms) as the appropriate destination for the new binary, and will create a `Makefile` to be used in the following step.

	make configure
	./configure --prefix=/usr/local

`Makefiles` are scriptable configuration files that are processed by the `make` utility. Our `Makefile` will tell make how to compile a program and link it to our CentOS installation so that we can execute the program properly. With a `Makefile` in place, we can now execute `make install` (with `sudo` privileges) to compile **the source code** into a working program and install it to our server:

	sudo make install


## 5、查看git版本 ##

Git should now be built and installed on your CentOS 7 server. To double-check that it is working correctly, try running Git's built-in version check:

	git --version

## 6、git错误解决 ##

原文：https://my.oschina.net/hevakelcj/blog/409155

git 错误: Unable to find remote helper for 'https'

是因为 /usr/libexec/git-core/ 路径没在 PATH 环境变量中。

这导致里面的 git-remote-https, git-remote-http 这些得不到执行。所以 git 所表现出来的功能不全。

解决办法是：将 `/usr/libexec/git-core` 纳入 PATH，至少在使用 git 之前，设置一下PATH。

	PATH=$PATH:/usr/libexec/git-core

或直接在 /etc/profile 中修改。

> 至此结束。

