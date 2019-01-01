# FirewallD and Iptables

In simple words, a **firewall** is a security system that controls the incoming and outgoing traffic in a network based on a set of predefined rules (such as the packet destination / source or type of traffic, for example).

> 简而言之，network的本质就是“有来有往”，而firewall的本质就是在“来往”之间施加某种约束，以达到一定程度的安全。

In this article we will review the basics of **firewalld**, the default dynamic firewall daemon in **Red Hat Enterprise Linux 7**, and **iptables** service, the legacy firewall service for Linux, with which most system and network administrators are well acquainted, and which is also available in **RHEL 7**.

- **firewalld**, the default dynamic firewall daemon in **Red Hat Enterprise Linux 7**
- **iptables**, the legacy firewall service for Linux, with which most system and network administrators are well acquainted, and which is also available in **RHEL 7**.

## A Comparison Between FirewallD and Iptables

Under the hood, both **firewalld** and the **iptables** service talk to the **netfilter** framework in the kernel through the same interface. However, as opposed to the **iptables** service, **firewalld** can change the settings during normal system operation **without existing connections being lost**.

> without existing connections being lost，这应该是firewalld比iptables要好的地方吧。

### 检查是否安装

**Firewalld** should be installed by default in your **RHEL** system, though it may not be running. You can verify with the following commands (`firewall-config` is the user interface configuration tool):

```bash
yum info firewalld firewall-config
```

and,

```bash
systemctl status -l firewalld.service
```

On the other hand, the **iptables** service is not included by default, but can be installed through.

```bash
sudo yum update && yum install iptables-services
```

Both daemons can be started and enabled to start on boot with the usual `systemd` commands:

```bash
sudo systemctl start firewalld.service | iptables-service.service
sudo systemctl enable firewalld.service | iptables-service.service
```

### 配置文件

As for the configuration files, the **iptables** service uses `/etc/sysconfig/iptables` (which will not exist if the package is not installed in your system).

```bash
cat /etc/sysconfig/iptables
```

Whereas **firewalld** store its configuration across **two directories**, `/usr/lib/firewalld` and  `/etc/firewalld`:

```bash
ls /usr/lib/firewalld /etc/firewalld
```

By now it will suffice to remind you that you can always find more information about both tools with.

```bash
man firewalld.conf
man firewall-cmd
man iptables
```
