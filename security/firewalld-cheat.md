## 1、直接关闭防火墙

```bash
#停止firewall
systemctl stop firewalld.service

#禁止firewall开机启动
systemctl disable firewalld.service
```

## 2、设置 iptables service

```bash
yum -y install iptables-services
```

如果要修改防火墙配置，如增加防火墙端口3306

```bash
vi /etc/sysconfig/iptables 
```

增加规则

```txt
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT
```

保存退出后

```bash
systemctl restart iptables.service #重启防火墙使配置生效

systemctl enable iptables.service #设置防火墙开机启动
```

最后重启系统使设置生效即可。