# How To Use Systemctl to Manage Systemd Services and Units

URL:

- https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units


## 1. Introduction

`Systemd` is **an init system** and **system manager** that is widely becoming the new standard for Linux machines.

In this guide, we will be discussing the `systemctl` command, which is **the central management tool** for controlling **the init system**. We will cover 

- how to manage services, 
- check statuses, 
- change system states, and 
- work with the configuration files.

## 2. Service Management

**The fundamental purpose of an init system** is to **initialize the components that must be started after the Linux kernel is booted** (traditionally known as "userland" components). **The init system** is also used to **manage services** and **daemons** for the server at any point while the system is running. With that in mind, we will start with some simple service management operations.

> 这段，我了解到systemctl的两个应用的时机：  
> （1）在Linux刚刚起动的时候，去初始化components。  
> （2）在Linux运行的过程中，管理services和daemons。

In `systemd`, the target of most actions are "`units`", which are resources that `systemd` knows how to manage. `Units` are categorized by the type of resource they represent and they are defined with files known as unit files. The type of each unit can be inferred from the suffix on the end of the file.

> systemd操作的对象是units。

For **service management tasks**, the target unit will be **service units**, which have unit files with a suffix of `.service`. However, for most service management commands, you can actually leave off the `.service` suffix, as `systemd` is smart enough to know that you probably want to operate on a service when using service management commands.

### 2.1 Starting and Stopping Services

To start a `systemd` service, executing instructions in the service's unit file, use the `start` command. If you are running as a **non-root user**, you will have to use `sudo` since this will affect the state of the operating system:

```bash
sudo systemctl start application.service
```

As we mentioned above, `systemd` knows to look for `*.service` files for service management commands, so the command could just as easily be typed like this:

```bash
sudo systemctl start application
```

Although you may use the above format for general administration, for clarity, we will use the `.service` suffix for the remainder of the commands to be explicit about the target we are operating on.

To stop a currently running service, you can use the stop command instead:

```bash
sudo systemctl stop application.service
```

### 2.2 Restarting and Reloading

To restart a running service, you can use the `restart` command:

```bash
sudo systemctl restart application.service
```

If the application in question is able to reload its configuration files (without restarting), you can issue the `reload` command to initiate that process:

```bash
sudo systemctl reload application.service
```

If you are unsure whether the service has the functionality to reload its configuration, you can issue the `reload-or-restart` command. This will reload the configuration in-place if available. Otherwise, it will restart the service so the new configuration is picked up:

```bash
sudo systemctl reload-or-restart application.service
```

### 2.3 Enabling and Disabling Services

The above commands are useful for starting or stopping commands during the current session. To tell `systemd` to **start services automatically at boot**, you must enable them.

To start a service at boot, use the `enable` command:

```bash
sudo systemctl enable application.service
```

This will create a symbolic link from the system's copy of the service file (usually in `/lib/systemd/system` or `/etc/systemd/system`) into the location on disk where `systemd` looks for autostart files (usually `/etc/systemd/system/some_target.target.wants`. We will go over what a target is later in this guide).

To disable the service from starting automatically, you can type:

```bash
sudo systemctl disable application.service
```

This will remove the symbolic link that indicated that the service should be started automatically.

Keep in mind that enabling a service does not start it in the current session. If you wish to start the service and enable it at boot, you will have to issue both the `start` and `enable` commands.

### 2.4 Checking the Status of Services

To check the status of a service on your system, you can use the `status` command:

```bash
systemctl status application.service
```

This will provide you with the service state, the cgroup hierarchy, and the first few log lines.

For instance, when checking the status of an Nginx server, you may see output like this:

```
● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2015-01-27 19:41:23 EST; 22h ago
 Main PID: 495 (nginx)
   CGroup: /system.slice/nginx.service
           ├─495 nginx: master process /usr/bin/nginx -g pid /run/nginx.pid; error_log stderr;
           └─496 nginx: worker process
Jan 27 19:41:23 desktop systemd[1]: Starting A high performance web server and a reverse proxy server...
Jan 27 19:41:23 desktop systemd[1]: Started A high performance web server and a reverse proxy server.
```

This gives you a nice overview of the current status of the application, notifying you of any problems and any actions that may be required.

There are also methods for checking for specific states. For instance, to check to see if a unit is currently active (running), you can use the `is-active` command:

```bash
systemctl is-active application.service
```

This will return the current unit state, which is usually active or inactive. The exit code will be "0" if it is active, making the result simpler to parse programmatically.

To see if the unit is enabled, you can use the `is-enabled` command:

```bash
systemctl is-enabled application.service
```

This will output whether the service is enabled or disabled and will again set the exit code to "0" or "1" depending on the answer to the command question.

A third check is whether the unit is in a failed state. This indicates that there was a problem starting the unit in question:

```bash
systemctl is-failed application.service
```

This will return active if it is running properly or failed if an error occurred. If the unit was intentionally stopped, it may return unknown or inactive. An exit status of "0" indicates that a failure occurred and an exit status of "1" indicates any other status.

## 3. System State Overview

The commands so far have been useful for managing **single services**, but they are not very helpful for exploring **the current state of the system**. There are a number of `systemctl` commands that provide this information.

### 3.1 Listing Current Units

To see a list of all of the active units that `systemd` knows about, we can use the `list-units` command:

```bash
systemctl list-units
```

This will show you a list of all of the units that `systemd` currently has active on the system. The output will look something like this:

```
UNIT                                      LOAD   ACTIVE SUB     DESCRIPTION
atd.service                               loaded active running ATD daemon
avahi-daemon.service                      loaded active running Avahi mDNS/DNS-SD Stack
dbus.service                              loaded active running D-Bus System Message Bus
dcron.service                             loaded active running Periodic Command Scheduler
dkms.service                              loaded active exited  Dynamic Kernel Modules System
getty@tty1.service                        loaded active running Getty on tty1
. . .
```

The output has the following columns:

- **UNIT**: The systemd unit name
- **LOAD**: Whether the unit's configuration has been parsed by systemd. The configuration of loaded units is kept in memory.
- **ACTIVE**: A summary state about whether the unit is active. This is usually a fairly basic way to tell if the unit has started successfully or not.
- **SUB**: This is a lower-level state that indicates more detailed information about the unit. This often varies by unit type, state, and the actual method in which the unit runs.
- **DESCRIPTION**: A short textual description of what the unit is/does.

Since the `list-units` command shows only active units by default, all of the entries above will show "loaded" in the `LOAD` column and "active" in the `ACTIVE` column. This display is actually the default behavior of systemctl when called without additional commands, so you will see the same thing if you call `systemctl` with no arguments:

```bash
systemctl
```

We can tell `systemctl` to output different information by adding additional flags. For instance, to see all of the units that `systemd` has loaded (or attempted to load), regardless of whether they are currently active, you can use the `--all` flag, like this:

```bash
systemctl list-units --all
```

This will show any unit that `systemd` loaded or attempted to load, regardless of its current state on the system. Some units become inactive after running, and some units that `systemd` attempted to load may have not been found on disk.

You can use other flags to filter these results. For example, we can use the `--state=` flag to indicate the `LOAD`, `ACTIVE`, or `SUB` states that we wish to see. You will have to keep the `--all` flag so that systemctl allows non-active units to be displayed:

```bash
systemctl list-units --all --state=inactive
```

Another common filter is the `--type=` filter. We can tell systemctl to only display units of the type we are interested in. For example, to see only active service units, we can use:

```bash
systemctl list-units --type=service
```

### 3.2 Listing All Unit Files

The `list-units` command only displays units that systemd has attempted to parse and load into memory. Since `systemd` will only read units that it thinks it needs, this will not necessarily include all of the available units on the system. To see every available unit file within the `systemd` paths, including those that `systemd` has not attempted to load, you can use the `list-unit-files` command instead:

```bash
systemctl list-unit-files
```

Units are representations of resources that `systemd` knows about. Since `systemd` has not necessarily read all of the unit definitions in this view, it only presents information about the files themselves. The output has two columns: the unit file and the state.

```txt
UNIT FILE                                  STATE   
proc-sys-fs-binfmt_misc.automount          static  
dev-hugepages.mount                        static  
dev-mqueue.mount                           static  
proc-fs-nfsd.mount                         static  
proc-sys-fs-binfmt_misc.mount              static  
sys-fs-fuse-connections.mount              static  
sys-kernel-config.mount                    static  
sys-kernel-debug.mount                     static  
tmp.mount                                  static  
var-lib-nfs-rpc_pipefs.mount               static  
org.cups.cupsd.path                        enabled
. . .
```

The `state` will usually be "enabled", "disabled", "static", or "masked". In this context, `static` means that the unit file does not contain an "install" section, which is used to enable a unit. As such, these units cannot be enabled. Usually, this means that the unit performs a one-off action or is used only as a dependency of another unit and should not be run by itself.

We will cover what "masked" means momentarily.

## 4. Unit Management

So far, we have been working with services and displaying information about the unit and unit files that systemd knows about. However, we can find out more specific information about units using some additional commands.

### 4.1 Displaying a Unit File

To display **the unit file** that `systemd` has loaded into its system, you can use the `cat` command (this was added in `systemd` version 209). For instance, to see the unit file of the atd scheduling daemon, we could type:

```bash
systemctl cat atd.service
```

```txt
[Unit]
Description=ATD daemon
[Service]
Type=forking
ExecStart=/usr/bin/atd
[Install]
WantedBy=multi-user.target
```

The output is the unit file as known to the currently running systemd process. This can be important if you have modified unit files recently or if you are overriding certain options in a unit file fragment (we will cover this later).

### 4.2 Displaying Dependencies

To see a unit's dependency tree, you can use the `list-dependencies` command:

```bash
systemctl list-dependencies sshd.service
```

This will display a hierarchy mapping the dependencies that must be dealt with in order to start the unit in question. Dependencies, in this context, include those units that are either required by or wanted by the units above it.

```txt
sshd.service
├─system.slice
└─basic.target
  ├─microcode.service
  ├─rhel-autorelabel-mark.service
  ├─rhel-autorelabel.service
  ├─rhel-configure.service
  ├─rhel-dmesg.service
  ├─rhel-loadmodules.service
  ├─paths.target
  ├─slices.target
. . .
```

The recursive dependencies are only displayed for `.target` units, which indicate system states. To recursively list all dependencies, include the `--all` flag.

To show reverse dependencies (units that depend on the specified unit), you can add the `--reverse` flag to the command. Other flags that are useful are the `--before` and `--after` flags, which can be used to show units that depend on the specified unit starting before and after themselves, respectively.

### 4.3 Checking Unit Properties

To see the low-level properties of a unit, you can use the `show` command. This will display a list of properties that are set for the specified unit using a `key=value` format:

```bash
systemctl show sshd.service
```

```txt
Id=sshd.service
Names=sshd.service
Requires=basic.target
Wants=system.slice
WantedBy=multi-user.target
Conflicts=shutdown.target
Before=shutdown.target multi-user.target
After=syslog.target network.target auditd.service systemd-journald.socket basic.target system.slice
Description=OpenSSH server daemon
. . .
```

If you want to display a single property, you can pass the `-p` flag with the property name. For instance, to see the conflicts that the `sshd.service` unit has, you can type:

```bash
systemctl show sshd.service -p Conflicts
```

```txt
Conflicts=shutdown.target
```

### 4.4 Masking and Unmasking Units

We saw in the service management section how to stop or disable a service, but `systemd` also has the ability to mark a unit as **completely unstartable**, **automatically** or **manually**, by linking it to `/dev/null`. This is called **masking the unit**, and is possible with the mask command:

```bash
sudo systemctl mask nginx.service
```

This will prevent the Nginx service from being started, automatically or manually, for as long as it is masked.

If you check the `list-unit-files`, you will see the service is now listed as masked:

```bash
systemctl list-unit-files
```

```txt
. . .
kmod-static-nodes.service              static  
ldconfig.service                       static  
mandb.service                          static  
messagebus.service                     static  
nginx.service                          masked
quotaon.service                        static  
rc-local.service                       static  
rdisc.service                          disabled
rescue.service                         static
. . .
```

If you attempt to start the service, you will see a message like this:


sudo systemctl start nginx.service
Failed to start nginx.service: Unit nginx.service is masked.
To unmask a unit, making it available for use again, simply use the unmask command:

```bash
sudo systemctl unmask nginx.service
```

This will return the unit to its previous state, allowing it to be started or enabled.

### 4.5 Editing Unit Files

While the specific format for unit files is outside of the scope of this tutorial, `systemctl` provides built-in mechanisms for editing and modifying unit files if you need to make adjustments. This functionality was added in `systemd` version 218.

The `edit` command, by default, will open a unit file snippet for the unit in question:

```bash
sudo systemctl edit nginx.service
```

This will be a blank file that can be used to override or add directives to the unit definition. A directory will be created within the `/etc/systemd/system` directory which contains the name of the unit with `.d` appended. For instance, for the `nginx.service`, a directory called `nginx.service.d` will be created.

Within this directory, a snippet will be created called `override.conf`. When the unit is loaded, `systemd` will, in memory, merge the override snippet with the full unit file. The snippet's directives will take precedence over those found in the original unit file.

If you wish to edit the full unit file instead of creating a snippet, you can pass the `--full` flag:

```bash
sudo systemctl edit --full nginx.service
```

This will load the current unit file into the editor, where it can be modified. When the editor exits, the changed file will be written to `/etc/systemd/system`, which will take precedence over the system's unit definition (usually found somewhere in `/lib/systemd/system`).

To remove any additions you have made, either delete the unit's `.d` configuration directory or the modified service file from `/etc/systemd/system`. For instance, to remove a snippet, we could type:

```bash
sudo rm -r /etc/systemd/system/nginx.service.d
```

To remove a full modified unit file, we would type:

```bash
sudo rm /etc/systemd/system/nginx.service
```

After deleting the file or directory, you should reload the `systemd` process so that it no longer attempts to reference these files and reverts back to using the system copies. You can do this by typing:

```bash
sudo systemctl daemon-reload
```

下面我看不去下去了，就先到这里吧。。。






















