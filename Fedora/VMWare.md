# 1. VMWare

URL:

- [fedora 下卸载vmware](https://blog.csdn.net/ZmeiXuan/article/details/78969647)
- [Uninstall Workstation from a Linux Host](https://pubs.vmware.com/workstation-9/index.jsp?topic=%2Fcom.vmware.ws.get_started.doc%2FGUID-05E4C876-F32C-49D2-82B4-8C759691E7F5.html)

<!-- TOC -->

- [安装vmware](#安装vmware)
- [1.1. 卸载vmware](#11-卸载vmware)
    - [1.1.1. 先查看安装的虚拟机](#111-先查看安装的虚拟机)
    - [1.1.2. 卸载虚拟机](#112-卸载虚拟机)

<!-- /TOC -->

## 安装vmware

> 我测试的版本是VMware-Workstation-Full-15.0.2-10952284.x86_64

During an attempt to run WS (14.1.1 build-7528167) after an uneventful install on Fedora 28, the modules would not compile correctly. To correct the errors, the following worked for me:

```bash
sudo dnf install elfutils-libelf-devel

sudo cp /usr/include/linux/version.h /lib/modules/$(uname -r)/build/include/linux/

sudo vmware-modconfig --console --install-all
```

密钥

```txt
GV7N2-DQZ00-4897Y-27ZNX-NV0TD
```

## 1.1. 卸载vmware

### 1.1.1. 先查看安装的虚拟机

```bash
vmware-installer -l
```

可以查看到已经安装的vmare-workstation版本号

```txt
No protocol specified
No protocol specified
Product Name         Product Version     
==================== ====================
vmware-workstation   14.0.0.6661328  
```

### 1.1.2. 卸载虚拟机

```bash
vmware-installer --uninstall-product vmware-workstation
```

根据提示确定卸载：

```txt
> VMware Workstation
: 

All configuration information is about to be removed. Do you wish to
keep your configuration files? [yes]: yes

Uninstalling VMware Installer 2.1.0
    Deconfiguring...
[######################################################################] 100%
Uninstallation was successful.
```
