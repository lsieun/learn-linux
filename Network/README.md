# Network

<!-- TOC -->

- [1. Tools](#1-Tools)
  - [1.1. Logging into another machine – Telnet and Secure Shell](#11-Logging-into-another-machine-%E2%80%93-Telnet-and-Secure-Shell)

<!-- /TOC -->

## 1. Tools

### 1.1. Logging into another machine – Telnet and Secure Shell

`Telnet` is an older protocol but is still used a lot today. It suffers from the same **security problem** as `FTP`; **it sends text in a non-encrypted format**. However, it is still useful in say **a lab environment** protected by a good firewall.

The command to start a Telnet session is `telnet hostname`. The `hostname` can be a name reachable on your network or a numeric IP.

```bash
telnet 192.168.80.136
```

之后再输出“用户名”和“密码”就可以连接了。

**Secure Shell** (`SSH`), is a more popular protocol as it provides for **strong encryption of both the password and text**.

To start a secure shell, the command is as follows:

```bash
ssh username@hostname
```

