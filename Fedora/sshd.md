# Fedora 28: Install openssh-server for SSH server

URL: https://www.hiroom2.com/2018/06/28/fedora-28-openssh-server-en/

Install openssh-server and open port.

```bash
$ sudo dnf install -y openssh-server
$ sudo systemctl enable sshd
$ sudo systemctl restart sshd
$ sudo firewall-cmd --permanent --add-service=ssh
$ sudo firewall-cmd --reload
```