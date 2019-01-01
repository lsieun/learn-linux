# firewall

CentOS 7.0默认使用的是firewall作为防火墙，使用iptables必须重新设置一下

One of the changes introduced with **firewalld** are **zones**. This concept allows to separate **networks** into **different zones level of trust** the user has decided to place on the devices and traffic within that network.

To list the active zones:

```bash
firewall-cmd --get-active-zones
```

Output:

```txt
public
  interfaces: wlp3s0
```

In the example below, the **public zone** is active, and the **wlp3s0** interface has been assigned to it automatically. To view all the information about a particular zone:

```bash
sudo firewall-cmd --zone=public --list-all
```

Output:

```txt
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: wlp3s0
  sources: 
  services: ssh dhcpv6-client
  ports: 8080/tcp 8081/tcp
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules:
```

## Using Firewalld to Control Network Traffic

### Example 1: Allowing services through the firewall

To get a list of the supported services, use.

```bash
firewall-cmd --get-services
```

Output:

```txt
RH-Satellite-6 amanda-client amanda-k5-client bacula bacula-client bitcoin bitcoin-rpc bitcoin-testnet bitcoin-testnet-rpc ceph ceph-mon cfengine condor-collector ctdb dhcp dhcpv6 dhcpv6-client dns docker-registry dropbox-lansync elasticsearch freeipa-ldap freeipa-ldaps freeipa-replication freeipa-trust ftp ganglia-client ganglia-master high-availability http https imap imaps ipp ipp-client ipsec iscsi-target kadmin kerberos kibana klogin kpasswd kshell ldap ldaps libvirt libvirt-tls managesieve mdns mosh mountd ms-wbt mssql mysql nfs nfs3 nrpe ntp openvpn ovirt-imageio ovirt-storageconsole ovirt-vmconsole pmcd pmproxy pmwebapi pmwebapis pop3 pop3s postgresql privoxy proxy-dhcp ptp pulseaudio puppetmaster quassel radius rpc-bind rsh rsyncd samba samba-client sane sip sips smtp smtp-submission smtps snmp snmptrap spideroak-lansync squid ssh synergy syslog syslog-tls telnet tftp tftp-client tinc tor-socks transmission-client vdsm vnc-server wbem-https xmpp-bosh xmpp-client xmpp-local xmpp-server
```

To allow **http** and **https** web traffic through the firewall, effective immediately and on subsequent boots:

```bash
# firewall-cmd --zone=MyZone --add-service=http
# firewall-cmd --zone=MyZone --permanent --add-service=http
# firewall-cmd --zone=MyZone --add-service=https
# firewall-cmd --zone=MyZone --permanent --add-service=https
# firewall-cmd --reload
```

If `--zone` is omitted, the default zone (you can check with `firewall-cmd --get-default-zone`) is used.

To **remove** the rule, replace the word `add` with `remove` in the above commands.

### Example 2: IP / Port forwarding

First off, you need to find out if masquerading is enabled for the desired zone:

```bash
# firewall-cmd --zone=MyZone --query-masquerade
```

```bash
$ sudo firewall-cmd --zone=public --query-masquerade
no
$ sudo firewall-cmd --zone=external --query-masquerade
yes
```

You can either enable masquerading for **public**:

```bash
# firewall-cmd --zone=public --add-masquerade
```

or use masquerading in **external**.

```bash
# firewall-cmd --zone=external --add-forward-port=port=631:proto=tcp:toport=631:toaddr=192.168.0.10
```

And don’t forget to reload the firewall.
