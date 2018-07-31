# Upgrade Vim to vim 8 #

[1分钟将CentOS 7 VIM升级到8.0](https://zhuanlan.zhihu.com/p/33292940)

[How to upgrade vim to version 8 on CentOS 7?](https://www.systutorials.com/241762/how-to-upgrade-vim-to-version-8-on-centos-7/)

You may use [this CentOS 7 repository](https://copr.fedorainfracloud.org/coprs/mcepl/vim8/) on Fedora Copr for Vim 8 builds.

By these commands on CentOS 7.

Add this repository:

	curl -L https://copr.fedorainfracloud.org/coprs/mcepl/vim8/repo/epel-7/mcepl-vim8-epel-7.repo -o /etc/yum.repos.d/mcepl-vim8-epel-7.repo

Upgrade Vim to vim 8:

	yum update vim*

After it is successful, your Vim should be version 8.0 now:

	vim --version

> 至此结束。
