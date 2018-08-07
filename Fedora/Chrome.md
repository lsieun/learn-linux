# Chrome + Shadowsocks

## Install Google Chrome on Fedora 28

参考：https://www.if-not-true-then-false.com/2010/install-google-chrome-with-yum-on-fedora-red-hat-rhel/

Enable Google YUM repository

```
dnf install fedora-workstation-repositories

dnf config-manager --set-enabled google-chrome
```

Install Google Chrome with YUM/DNF

```bash
## Install Google Chrome Stable version ##
## Fedora 28/27/26/25 ##
dnf install google-chrome-stable

## CentOS/RHEL 7.5 ##
yum install google-chrome-stable
```


## Shadowsocks-libev

### 介绍Shadowsocks-libev

[Shadowsocks-libev](https://shadowsocks.org/en/index.html) is a lightweight secured SOCKS5 proxy for embedded devices and low-end boxes.

这段话拆分成两句来理解：

- Shadowsocks-libev是一个SOCK5 proxy，而不是HTTP Proxy。后续，我们设置全局代理的时候，选择`Socks host`。（这句话重要）
- Shadowsocks-libev是一个轻量级的proxy，适合于嵌入式设备或低端设备。（这句话不重要）

### 安装Shadowsocks-libev

Enable repo via dnf:

```
dnf copr enable librehat/shadowsocks
```

Then, install shadowsocks-libev via dnf:

```
dnf update
dnf install shadowsocks-libev
```

### 配置Shadowsocks-libev

打开网址：http://free-ss.tk/

```
vi /etc/shadowsocks-libev/config.json
```

内容如下：

```
{
    "server":"你的服务器ip或域名",
    "server_port":服务器端口,
    "local_port":本地端口,
    "password":"密码",
     "timeout":60,
    "method":"加密方式"
}
```

### 启动Shadowsocks-libev

第一种启动方式：配置文件启动

```
ss-local [-c /etc/shadowsocks-libev/config.json]
```

第二种启动方式：参数启动

```
ss-local -s 服务器地址 -p 服务器端口 -l 本地端端口 -k 密码 -m 加密方法
```

配合`nohup`和`&`可以使之后台运行，关闭终端也不影响

```
nohup ss-local > /dev/null 2>&1 &
```

### 使用Shadowsocks-libev

Shadowsocks-libev客户端启动后，其他程序并不会直接应用socks5连接，浏览器要用一些插件来连接，比如SwitchOmega；这个时候，我们需要设置全局代理：

```
Settings-->Network-->VPN-->Network Proxy-->Manual
```

Socks Host行左边填写`127.0.0.1`，右边填写`1080`（注意：此处的1080是根据`/etc/shadowsocks-libev/config.json`文件中的`local_port`填写的）。

设置完成后，就可以通过Chrome访问Google网站了。

> 注意：记得把Socks Host修改回去哟！

## shadowsocks-qt5


```
dnf copr enable librehat/shadowsocks
dnf update
dnf install shadowsocks-qt5
```

安装完成后，遇到的问题是shadowsocks-qt5无法启动；相应的解决方法是：

```
ln -s /usr/lib64/libbotan-2.so.7 /usr/lib64/libbotan-2.so.5
```

原因说明：[Botan2-2.7.0 causes shadowsocks-qt5 to fail to start](https://www.bountysource.com/issues/60778061-botan2-2-7-0-causes-shadowsocks-qt5-to-fail-to-start)

<!-- 
Outline Server Singapore
ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwNTp1S04wYTVFakp0b3g=@206.189.94.126:9176/?outline=1



```json
    {
        "method": "chacha20-ietf-poly1305",
        "password": "uKN0a5EjJtox",
        "remarks": "OutlineServer",
        "server": "206.189.94.126",
        "server_port": 9176
    }
```


http://thetowerinfo.com/use-shadowsocks-step-by-step/

https://getoutline.org/en/home
-->



## SwitchyOmega

下载地址：https://github.com/FelisCatus/SwitchyOmega/releases

参考URL：
```
https://blog.huihut.com/2017/08/25/LinuxInstallConfigShadowsocksClient/
```

## SSR地址自动获取

https://github.com/PangPangpeng/-SSR-