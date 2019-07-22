# Troubleshooting

- 人
- 网卡： ping 127.0.0.1
- wire(网线): LED灯
- route(hardware): gateway
- 外网 ping www.baidu.com


First let's make sure the connection is really down by pinging a known external address.

```bash
ping www.baidu.com
```

If the command line says timed out, or says something about no host or bad route, the connection is indeed down. Let's try to fix it.

Find your **gateway address**. Run the `route` command; your gateway should show up at the top of the output. Note, the `route` command taking a long time to complete is also a sign the connection is down.

```bash
$ sudo route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         gateway         0.0.0.0         UG    100    0        0 ens32
link-local      0.0.0.0         255.255.0.0     U     1000   0        0 ens32
192.168.80.0    0.0.0.0         255.255.255.0   U     100    0        0 ens32
```

Ping the `gateway` provided by `route` above. If it pings successfully, then the problem is most likely on the **router**, or at the **ISP** itself.

```bash
$ ping gateway
PING gateway.localdomain (172.16.1.1): 56 data bytes
64 bytes from 172.16.1.1: icmp_seq=0 ttl=128 time=3.040 ms
64 bytes from 172.16.1.1: icmp_seq=1 ttl=128 time=4.603 ms
64 bytes from 172.16.1.1: icmp_seq=2 ttl=128 time=4.551 ms
```

If it doesn't get a good ping, let's try this. If you already know the **interface name**, skip to the next step. If not, find it by using the `ifconfig` command. Look for a stanza that has something like `eth0` or `p3p2`.

这段理解：你要知道interface name。如果不知道的话，那就使用`sudo ifconfig`命令进行查看。

Run the `ethtool` command on the interface. In my case it is `ethtool eth0`. Look at the last line; it should say:

```bash
## ethtool - query or control network driver and hardware settings
$ sudo apt install ethtool
$ sudo ethtool ens32
...
Link detected: yes # 这是最后一行，最重要
```

If it does not, the problem may be the `wire`. If your port has **LEDs** see if they are on. One of them should blink from time to time. Try wiggling the wire. Of course, if you have a known good wire, try replacing it. Note, a "known good wire" does not necessarily mean one right out of the package. Got bit by that once.

If the wire seems okay, let's look deeper. Make sure, in the steps above, you have
the right interface. Note at this point you may want to just read these steps instead
of running the commands, as they will take your network down.

Try running the `ifdown <interface>` command. You probably will not see any output.

Now run the `ifup <interface>` command. It may take a few seconds, and then you
should see some output. If you are using DHCP, you should see the connection being
made. When you get the prompt back, try the `ping` again.

