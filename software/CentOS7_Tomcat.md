# How to Install Apache Tomcat 8 on CentOS 7

URL: https://www.vultr.com/docs/how-to-install-apache-tomcat-8-on-centos-7


## 1. Install Java

You can confirm your installation with:

```bash
java -version
```

The output will resemble the following:

```txt
java version "1.8.0_181"
Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)
```

## 2. Create a dedicated user for Apache Tomcat

For security purposes, you need to create a dedicated non-root user "tomcat" who belongs to the "tomcat" group:

```bash
sudo groupadd tomcat
sudo mkdir /opt/tomcat
sudo useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
```

In this fashion, you created a user "tomcat" who belongs to the group "tomcat". You cannot use this user account to log into the system. The home directory is `/opt/tomcat`, which is where the Apache Tomcat program will reside.

## 3. Download and install the latest Apache Tomcat

You can always find the latest stable version of Apache Tomcat 8 from its [official download page](https://tomcat.apache.org/download-80.cgi). Tomcat [doc page](http://tomcat.apache.org/tomcat-8.0-doc/index.html)

Under the "Binary Distributions" section and then the "Core" list, use the link pointing to the "tar.gz" archive to compose a `wget` command:

```bash
cd ~
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.tar.gz
sudo tar -zxvf apache-tomcat-8.5.34.tar.gz -C /opt/tomcat --strip-components=1
```

## 4. Setup proper permissions

Before you can run Apache Tomcat, you need to setup proper permissions for several directories:

```bash
cd /opt/tomcat

sudo chgrp -R tomcat bin
sudo chmod g+rwx bin
sudo chmod g+r bin/*

sudo chgrp -R tomcat conf
sudo chmod g+rwx conf
sudo chmod g+r conf/*

sudo chgrp -R tomcat lib
sudo chmod g+rwx lib
sudo chmod g+r lib/*

sudo chown -R tomcat logs/ temp/ webapps/ work/
```

## 5. Setup a Systemd unit file for Apache Tomcat

As a matter of convenience, you should setup a Systemd unit file for Apache Tomcat:

```bash
sudo vi /etc/systemd/system/tomcat.service
```

Populate the file with:

```txt
[Unit]
Description=Apache Tomcat Web Application Container
After=syslog.target network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/jre    # 注意修改这里
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/bin/kill -15 $MAINPID

User=tomcat
Group=tomcat

[Install]
WantedBy=multi-user.target
```

## 6. Install haveged, a security-related program

For security purposes, you should install `haveged` as well:

```bash
sudo yum install haveged
sudo systemctl start haveged.service
sudo systemctl enable haveged.service
```

> haveged 项目的目的是提供一个易用、不可预测的随机数生成器，基于 HAVEGE 算法。  
> 这一步，yum没有找到相应的安装包，我执行了后续的操作，似乎没有影响。

## 7. Start and test Apache Tomcat

Now, start the Apache Tomcat service and set it run on system boot:

```bash
sudo systemctl start tomcat.service
sudo systemctl enable tomcat.service
```

In order to test Apache Tomcat in a web browser, you need to modify the firewall rules:

```
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
```

Then, you can test your installation of Apache Tomcat by visiting the following URL from a web browser:

```txt
http://[your-server-IP]:8080
```

If nothing goes wrong, you will see the default Apache Tomcat front page.

## 8. Configure the Apache Tomcat web management interface

In order to use the "Manager App" and the "Host manager" in the Apache Tomcat web interface, you need to create an admin user for your Apache Tomcat server:

```bash
sudo vi /opt/tomcat/conf/tomcat-users.xml
```

Within the `<tomcat-users ...>...</tomcat-users>` segment, insert a line to define a **admin** user:

```xml
<user username="yourusername" password="yourpassword" roles="manager-gui,admin-gui"/>
```


Remember to replace "yourusername" and "yourpassword" with your own ones, the less common the better.

Restart Apache Tomcat to put your modifications into effect:

```bash
sudo systemctl restart tomcat.service
```

Refresh the Apache Tomcat front page from your web browser. Log in the "Manager App" and the "Host manager" using the credentials you had setup earlier.

但是tomcat8.5 更改之后，仍然访问拒绝。

还需步骤如下： 

```
vi $TOMCAT_HOME/webapps/manager/META-INF/context.xml
```

将下面的语句注释掉就可以了。

```xml
<Valve className="org.apache.catalina.valves.RemoteAddrValve"
    allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
```

The Apache Tomcat setup is complete. You can now use it to deploy your own applications.


我的配置如下，目前我对于tomcat的角色还不是很懂:

```xml
    <role rolename="manager-gui"/>
    <role rolename="manager-script"/>
    <user username="admin" password="admin" roles="manager-gui, manager-script"/>
```

## Access Tomcat Manager App from different host

URL： https://stackoverflow.com/questions/36703856/access-tomcat-manager-app-from-different-host

第一种解决办法：

Each deployed webapp has a `context.xml` file that lives in

```txt
$CATALINA_BASE/conf/[enginename]/[hostname]

(conf/Catalina/localhost by default)
```

and has the same name as the webapp (`manager.xml` in this case). If no file is present, default values are used.

So, you need to create a file `conf/Catalina/localhost/manager.xml` and specify the rule you want to allow remote access. For example, the following content of `manager.xml` will allow access from all machines:

```xml
<Context privileged="true" antiResourceLocking="false" 
         docBase="${catalina.home}/webapps/manager">
    <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="^.*$" />
</Context>
```

Note that the `allow` attribute of the `Valve` element is a regular expression that matches the IP address of the connecting host. Other Valve classes cater for other rules (e.g. `RemoteHostValve` for matching host names).

Once the changes above have been made, you should be presented with an authentication dialog when accessing the manager URL. 

第二种解决办法：

For Tomcat v8.5.4 and above, the file `<tomcat>/webapps/manager/META-INF/context.xml` has been adjusted:

```xml
<Context antiResourceLocking="false" privileged="true" >
    <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
</Context>
```

Change this file to comment the Valve:

```xml
<Context antiResourceLocking="false" privileged="true" >
    <!--
    <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
    -->
</Context>
```

After that, restart Tomcat, you can see the manager page.

