# Visual Studio Code on Linux

URL: 

- [Visual Studio Code on Linux](https://code.visualstudio.com/docs/setup/linux)
- [Getting Started](https://code.visualstudio.com/docs?start=true)

## Installation: RHEL, Fedora and CentOS based distributions

We currently ship the stable 64-bit VS Code in a yum repository, the following script will install the key and repository:

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
```

Then update the package cache and install the package using `dnf` (Fedora 22 and above):

```bash
dnf check-update
sudo dnf install code
```