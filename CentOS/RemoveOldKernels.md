# YUM/DNF Remove Old Kernels on Fedora/CentOS/RHEL

URL: [YUM/DNF Remove Old Kernels on Fedora/CentOS/RHEL](https://www.if-not-true-then-false.com/2012/delete-remove-old-kernels-on-fedora-centos-red-hat-rhel/)

This is quick guide **how to delete/remove/clean old kernels on Fedora 28/27/26, CentOS 7.5/6.10, Red Hat (RHEL) 7.5/6.10**. I use here two kernel as example, if you want to keep other more or less, then adjust amount of **installed kernels** as you wish. Normally reason why you maybe want remove kernels is limited disk space, example on VPS servers and laptop. This is very easy task.

## Check Installed Kernels and All Kernel Packages

```bash
$ rpm -qa kernel\* |sort -V

kernel-4.18.9-200.fc28.x86_64
kernel-4.18.10-200.fc28.x86_64
kernel-core-4.18.9-200.fc28.x86_64
kernel-core-4.18.10-200.fc28.x86_64
kernel-devel-4.18.9-200.fc28.x86_64
kernel-devel-4.18.10-200.fc28.x86_64
kernel-headers-4.18.10-200.fc28.x86_64
kernel-modules-4.18.9-200.fc28.x86_64
kernel-modules-4.18.10-200.fc28.x86_64
kernel-modules-extra-4.18.9-200.fc28.x86_64
kernel-modules-extra-4.18.10-200.fc28.x86_64
```

## Delete / Remove Old Kernels

### Delete / Remove Old Kernels on Fedora

```bash
## dnf repoquery set negative --latest-limit ##
## as how many old kernels you want keep ##
sudo dnf remove $(dnf repoquery --installonly --latest-limit=-2 -q)
```

### Delete / Remove Old Kernels on CentOS / Red Hat (RHEL)

```bash
## CentOS, Red Hat (RHEL) ##
yum install yum-utils

## Package-cleanup set count as how many old kernels you want keep ##
package-cleanup --oldkernels --count=2
```

## Make Amount of Installed Kernels Permanent on Fedora / CentOS / Red Hat (RHEL)

Edit `/etc/yum.conf` or `/etc/dnf/dnf.conf` and set **installonly_limit**:

```txt
installonly_limit=2
```
