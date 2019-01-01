# 防火墙 #



## Using Iptables to Control Network Traffic

### Example 1: Allowing both incoming and outgoing web traffic

TCP ports **80** and **443** are the default ports used by the Apache web server to handle normal (**HTTP**) and secure (**HTTPS**) web traffic. You can allow incoming and outgoing web traffic through both ports on the **enp0s3** interface as follows:

```bash
# iptables -A INPUT -i enp0s3 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
# iptables -A OUTPUT -o enp0s3 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
# iptables -A INPUT -i enp0s3 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
# iptables -A OUTPUT -o enp0s3 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT
```

### Example 2: Block all (or some) incoming connections from a specific network

There may be times when you need to block all (or some) type of traffic originating from a specific network, say `192.168.1.0/24` for example:

```bash
# iptables -I INPUT -s 192.168.1.0/24 -j DROP
```

will drop all packages coming from the 192.168.1.0/24 network, whereas,

```bash
# iptables -A INPUT -s 192.168.1.0/24 --dport 22 -j ACCEPT
```

will only allow incoming traffic through port 22.

### Example 3: Redirect incoming traffic to another destination

If you use your **RHEL 7** box not only as a **software firewall**, but also as the actual **hardware-based** one, so that it sits between two distinct networks, IP forwarding must have been already enabled in your system. If not, you need to edit `/etc/sysctl.conf` and set the value of **net.ipv4.ip_forward** to **1**, as follows:

```txt
net.ipv4.ip_forward = 1
```

then save the change, close your text editor and finally run the following command to apply the change:

```txt
# sysctl -p /etc/sysctl.conf
```

For example, you may have a printer installed at an internal box with IP `192.168.0.10`, with the CUPS service listening on port `631` (both on the print server and on your firewall). In order to forward print requests from clients on the other side of the firewall, you should add the following iptables rule:

```bash
# iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 631 -j DNAT --to 192.168.0.10:631
```

Please keep in mind that **iptables** reads its rules sequentially, so make sure the default policies or later rules do not override those outlined in the examples above.


