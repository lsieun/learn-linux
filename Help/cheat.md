# cheat

URL:

- https://github.com/chrisallenlane/cheat
- https://arkit.co.in/cheat-command-interactive-cheat-sheets/

Cheat is a useful alternative to `man` pages to learn Unix commands. It allows you to create and view interactive cheatsheets(备忘纸条；尤指考试用的作弊纸条) on the command-line.

The recommended way to install Cheat is using `Pip` package manager. 

```bash
$ pip install cheat
```

## Usage

Cheat usage is trivial. To view the cheatsheet of any command, say find, run:

```bash
$ cheat find
```

Output:

```bash
# To find files by case-insensitive extension (ex: .jpg, .JPG, .jpG):
find . -iname "*.jpg"

# To find directories:
find . -type d

# To find files:
find . -type f
```

See? Cheat displays many find command examples in a human-readable format. You don’t need to use `man` pages or Google to know how to use find command.


To view the list of all available cheatsheets: , run:

```bash
$ cheat --list
```

To view help section, run:

```bash
$ cheat -h
```


## View Cheat-Sheets Command Line

Syntax: `cheat <cheat-sheet name>`

```bash
$ cheat ps
```

## List all Available cheat-sheets

```bash
$ cheat -l
```

First column of screen shot is **cheat-sheet name** and next column is **path of source file**.

Output sample:

文件和目录

```txt
cat              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/cat
cd               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/cd
cp               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/cp
find             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/find
mkdir            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/mkdir
mv               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/mv
pwd              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/pwd
rm               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/rm
tail             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/tail
```

权限

```txt
chmod            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/chmod
chown            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/chown
```

软件
```txt
gcc              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/gcc
git              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/git
markdown         /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/markdown
mysql            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/mysql
python           /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/python
vim              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/vim
```

```txt
alias            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/alias
bash             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/bash
cheat            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/cheat
crontab          /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/crontab
curl             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/curl
cut              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/cut
date             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/date
dnf              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/dnf
du               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/du
for              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/for
grep             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/grep
history          /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/history
http             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/http
ip               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/ip
iptables         /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/iptables
kill             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/kill
less             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/less
ln               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/ln
ls               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/ls
lsof             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/lsof
man              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/man
mount            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/mount
netstat          /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/netstat
npm              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/npm
ping             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/ping
pip              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/pip
ps               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/ps
readline         /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/readline
scp              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/scp
shutdown         /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/shutdown
ssh              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/ssh
ssh-copy-id      /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/ssh-copy-id
ssh-keygen       /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/ssh-keygen
stdout           /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/stdout
systemctl        /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/systemctl
systemd          /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/systemd
tar              /home/liusen/.cheat/tar
uname            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/uname
unzip            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/unzip
virtualenv       /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/virtualenv
wc               /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/wc
wget             /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/wget
xargs            /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/xargs
yum              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/yum
zip              /home/liusen/Software/anaconda3/lib/python3.6/site-packages/cheat/cheatsheets/zip
```

## Create Cheat Sheet Linux Command Line


Think if there is no cheat-sheet available which you looking at particularly don’t worry **you can even create your own Linux cheat sheet** using `cheat` command to do this first step is adding preferred cheat sheet editor

```bash
$ cheat -e arkit
```

You must set a `CHEAT_EDITOR`, `VISUAL`, or `EDITOR` environment variable in order to create/edit a cheatsheet.

Edit `~/.bashrc` using any text editor and add 

```bash
export CHEAT_EDITOR=/usr/bin/vim
export CHEATCOLORS=true
```

Now add commands to Linux cheat sheet then view them using cheatsheet name

```bash
$ cheat arkit
Hi This is an Test command line cheat-sheet

$ cat <file Name>
```

## Search Cheat Sheet in Linux

Awesome feature to search for Linux cheat sheets and there available options on the go

```bash
$ cheat -s <Search String>
```

Example

```bash
cheat -s cd
```

## Directory Path of Stored Cheat Sheets

```bash
$ cheat -d

/home/administrator/.cheat
/usr/local/lib/python2.7/dist-packages/cheat/cheatsheets
```

Linux Cheat-Sheets are more useful for regular Linux users and Linux Administrators achieve them simply using cheat command Linux

```bash
$ cheat -v
cheat 2.2.0

$ cheat --help
cheat

Create and view cheat sheets on the command line.

Usage:
 cheat <cheatsheet>
 cheat -e <cheatsheet>
 cheat -s <keyword>
 cheat -l
 cheat -d
 cheat -v

Options:
 -d --directories List directories on CHEATPATH
 -e --edit Edit cheatsheet
 -l --list List cheatsheets
 -s --search Search cheatsheets for <keyword>
 -v --version Print the version number
```

