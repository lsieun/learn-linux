
# Install Google Chrome on CentOS 7 #


## Add Google Chrome Repository ##

Create a repo file under `/etc/yum.repos.d/` directory.

	vi /etc/yum.repos.d/google-chrome.repo

Copy and paste the below repository information to the above repo file.

```
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
```

## Install Google Chrome on CentOS 7 ##

First, check whether the latest version available from the Google’s own repository using following yum command.

	yum info google-chrome-stable

You can install Google Chrome using yum command on CentOS 7 / RHEL 7.

	yum install -y google-chrome-stable

PS: Google官方源可能在中国无法使用，导致安装失败或者在国内无法更新，可以添加以下参数来安装：

	yum -y install google-chrome-stable --nogpgcheck

Want to try Google Chrome beta, run:

	yum install -y google-chrome-beta

> Sadly, the Google Chrome browser no longer supports the most famous commercial distribution RHEL 6.x and its free clones such as CentOS and Scientific Linux.

## Access Google Chrome ##

Start Google Chrome (**Applications** >> **Internet** >> **Google Chrome**).

OR

	$ google-chrome
	或
	$ google-chrome &

Google Chrome beta:

	$ google-chrome-beta

安裝完畢後，檢查版本：

	google-chrome -version

## Run Google Chrome as root on CentOS ##

Edit the `/usr/bin/google-chrome` and add the `--no-sandbox` at the end of the last line (Line No: 49).

	vi /usr/bin/google-chrome

FROM: (Line Number: 35-49)
```
     35 export LD_LIBRARY_PATH
     36 
     37 export CHROME_VERSION_EXTRA="stable"
     38 
     39 # We don't want bug-buddy intercepting our crashes. http://crbug.com/24120
     40 export GNOME_DISABLE_CRASH_DIALOG=SET_BY_GOOGLE_CHROME
     41 
     42 # Sanitize std{in,out,err} because they'll be shared with untrusted child
     43 # processes (http://crbug.com/376567).
     44 exec < /dev/null
     45 exec > >(exec cat)
     46 exec 2> >(exec cat >&2)
     47 
     48 # Note: exec -a below is a bashism.
     49 exec -a "$0" "$HERE/chrome" "$@"
```
TO: 添加`--no-sandbox`參數
```
     49 exec -a "$0" "$HERE/chrome" "$@" --no-sandbox
```
That’s all. Now you can start Google Chrome from the menu as root.

## 參考 ##

Install Google Chrome on CentOS 7 / RHEL 7： https://www.itzgeek.com/how-tos/linux/centos-how-tos/install-google-chrome-37-on-centos-7-rhel-7.html

How to Run Google Chrome as root on CentOS / Ubuntu / Debian / Fedora： https://www.itzgeek.com/how-tos/linux/centos-how-tos/how-to-run-google-chrome-as-root-fedora-16-centos-6-rhel-6.html

https://www.tecmint.com/install-google-chrome-on-redhat-centos-fedora-linux/

https://tecadmin.net/install-google-chrome-in-centos-rhel-and-fedora/

https://mr-chi.com/tech/network/install-chrome-on-centos7/

https://adon988.logdown.com/posts/6672609-centos7-install-chrome-steps


