# RedHat vs Debian : Administrative Point of View

URL: [RedHat vs Debian : Administrative Point of View](https://www.tecmint.com/redhat-vs-debian-administrative-point-of-view/)

- **Fedora**: Cutting Edge Technology Implementation
- **RedHat** and **Debian** Server
- **Ubuntu**: one of the Introductory distro for Newbies
- **Kali** and **Backtrack**: Penetration Testing, etc.

Well this article aims to compare **RedHat** (**Fedora**, **CentOS**) and **Debian** (**Ubuntu**) from an administrator point of view. **RedHat** is a commercial Linux Distribution, which is most widely used on a number of servers, across the world. **Fedora** is the testing laboratory of **RedHat** which is well known for its bleeding edge technology implementation, which is released every six month.

> RedHat是属于商业版  
> Fedora是RedHat前沿实验室，有最新的技术应用。

Here **the question** is **when there are hundreds of Linux distribution available for free** (in either sense, open-source and economic), **why would someone invest hundreds of bucks in buying a Linux Distribution**, making **RedHat** so much successful. Well the answer is **RedHat** is very much stable.

> 有人花钱购买RedHat，是因为它的稳定性。

The life cycle is of about ten years and after all there is someone to be blamed if something doesn’t work, the corporate culture. **CentOS** is another distribution which is **RedHat** minus Non-Free packages. **CentOS** is a stable distribution hence latest version of all packages is pushed into its RPM after testing, the focus remains on stability of distribution.

> 2012年2月2日,据国外媒体报道，红帽（Red Hat）公司宣布，它已经把Red Hat企业版Linux（RHEL）第五版和第六版的生产生命周期从7年延长到10年，以便为用户长期部署操作系统提供更多的灵活性。红帽称，这是对企业客户的要求做出的回应。  
> CentOS是RedHat的免费版

**Debian** on the other hand is a Linux distribution which is very much stable and contains very large number of packages into its repository. Any other distribution that comes close to **Debian** at this point is **Gentoo**. On my Debian server (**Squeeze**), which is a bit outdated.

> Debian也非常稳定，包含大量的packages。

```bash
root@localhost:/home/avi# apt-cache stats 

Total package names: 37544 (751 k) 
Total package structures: 37544 (1,802 k)
```

You see packages more than **37.5K**! Everything you need is present in the repository itself. The package manager **Apt** is too smart to resolve all the dependency problem itself. Very rarely a Debian user requires to download and install dependency manually. **Debian** is built with a number of package manager which makes package management a cake walk.

**Ubuntu** which is a Linux distribution for newbies. A newbie **Linux Enthusiast** is suggested to start with **Ubuntu** in most of the Linux forum. **Ubuntu** maintains a simple and user-friendly interface, which gives a feeling of **Windows** like OS to a new user.

**Debian** is the base of **Ubuntu**, but their repository varies. **Ubuntu** contains newer updated packages and is still stable. In-fact **Ubuntu** is highly appreciated by **newbies** as well as **advanced users**.

Taking the above description into the next stage by presenting them in a point-wise fashion for better understanding and reference, here we go.

1. **RedHat** is Most Widely used Distribution for servers. **Debian** is widely used Distribution next to RedHat. (市场占有量)

2. **RedHat** is Commercial Linux Distribution. **Debian** is Non-commercial Linux Distribution. (是否收费)

3. **RedHat** contains roughly **3000** packages. Latest **Debian** Release (Wheezy) contains well over **38000** packages. (可以使用的软件数量)

It means Debian contains nearly 80% more packages than RedHat and this is the reason Debian contains packages like openoffice, Transmission bittorrent client, mp3 codecs, etc which a RedHat like distribution lacks and is required to be installed manually or from 3rd party repository.

4. **RedHat** bug fixing takes considerable time, since it is controlled by a small group of people-RedHat Employee. Bug fixing in **Debian** is very much quick as people all around the globe from Debian community, working from different geographical location simultaneously fixes it.  (修复bug的周期)

5. **RedHat** don’t release package updates, till next release, means you have to wait for the next release be it minor. **Debian** community believes – software is a continuous evolution process, hence updates are released on Daily Basis.  (软件更新周期)

6. **RedHat** releases major updates every six month and nothing in between. Installing new updates in RedHat based System is a tuff task, where you need to reinstall everything. Installing the **Debian** updates being released everyday is a pretty easy task barely 3-4 clicks away. (OS更新周期)

7. **RedHat** is rock solid stable distribution released after continuous testing. **Debian** contains packages from stable, unstable and testing Repository. Stable contains rock solid stable release packages. Unstable contains more updated packages ready to be pushed into stable repository. Testing contains packages already tested and marked safe. (稳定性)

8. **RedHat** package manager **Yum** is less mature and is not able to solve dependencies automatically, many a times. **Debian** package manager **Apt** is very mature and solve dependency automatically, most of the times. (package manager)

9. Installing **VLC** in **RedHat** Beta Release 6.1, is a very difficult task which requires installing tens of packages manually. In **Debian** it is as simple as `apt-get install vlc*`. (对于多媒体的支持)

> VLC is a free and open source cross-platform multimedia player and framework that plays most multimedia files, and various streaming protocols.

10. **Debian** is intelligent in differentiating Configuration files with other files. This makes upgradation easy. The virgin (untouched) configuration files are updated automatically and the one modified, requires users interaction as the package manager ask what to do, but this is not the case with **RedHat**. (配置文件更新)

11. **RedHat** uses the **rpm** packages. **Debian** uses the **deb** packages.

12. **RedHat** uses the **RPM** package manager. **Debian** uses the **dpkg** package manager.

13. **RedHat** uses the **yum** dependency resolver. **Debian** uses the **apt-get** dependency resolver.

14. **Fedora** uses single global repository which contains free software’s only. **Debian** contains contribute and Non-free repository along with free software repository.

15. According to Wikipedia, **Ubuntu** is a based on the unstable branch of Debian but **Fedora** is not a derivative and has a more direct relationship and stays close to many upstream projects.

16. **Fedora** uses ‘`su`‘ whereas **Ubuntu** uses ‘`sudo`‘ by default.

17. **Fedora** ships with **SELinux** installed and enabled by default along with some other ‘hardening’ software to make things more secure by default, unlike **Debian**.

18. **Debian** is a community based distribution, unlike **RedHat**.

19. Security is one of the most important issue for both **RedHat** and **Debian**.

20. **Fedora**, **CentOs**, **Oracle** Linux are among those distribution developed around **RedHat** Linux and is a variant of **RedHat Linux**. **Ubuntu**, **Kali**, etc are few of the variant of **Debian**. **Debian** truly is a mother distribution of a number of Linux Distro.

21. Installation, of **RedHat** is little easy to install as compared to **Debian**. Internet Connection during **RedHat** installation is **option**. Internet connection during **Debian** Installation is **optional but recommended**. Moreover till squeeze, one needs to acquire WEP key, to use wifi network (installation). WEP Is not used these days and this is painful during installation of Debian, before wheezy. Wheezy supports both WEP ans WPA.

> WEP Wired Equivalent Privacy; 有线等效保密; 802.11无线协议加密; 已被WPA替代;  
> WPA全名为Wi-Fi Protected Access，有WPA和WPA2两个标准，是一种保护无线电脑网络（Wi-Fi）安全的系统
