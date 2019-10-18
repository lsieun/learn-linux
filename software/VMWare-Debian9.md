# 使用VMWare过程中的一些问题 #

## 1. clone虚拟机后需要修改的3个地方 ##

克隆的虚拟机需要修改三个地方：  
（1）主机名  
（2）网卡地址  
（3）IP地址  

### 1.1 主机名 ###

修改主机名使用如下命令：

```bash
## Debian
vi /etc/hostname
```

修改其中的`HOSTNAME`:

```txt
MyServer
```

### 1.2 网卡地址 ###

修改网卡地址使用如下命令：

	vi /etc/udev/rules.d/70-persistent-net.rules

具体修改如下：

![](images/linux_clone_modify_pci_device.png)

### 1.3 IP地址 ###

修改IP地址命令如下：

	vi /etc/sysconfig/network-scripts/ifcfg-eth0

具体修改如下：

![](images/linux_clone_modify_ip_address.png)

最后，重启机器：  

	shutdown -r now


## 2.临时设置IP地址 ##

设置IP和子网掩码

	ifconfig eth0 192.168.80.30 netmask 255.255.255.0

设置网关

	route add default gw 192.168.80.2

使用ssh登录

	ssh root@192.168.80.30





