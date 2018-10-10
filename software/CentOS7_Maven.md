# How to Install Apache Maven 3.5 on CentOS 7

## Install Apache Maven 3.5

First, download and extract the Apache Maven 3.5 archive.

```bash
cd
wget http://www-us.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
tar -zxvf apache-maven-3.5.0-bin.tar.gz
```

Move all Apache Maven 3.5 files to a reasonable location and change their ownership to `root:root`:

```bash
sudo mv ~/apache-maven-3.5.0 /opt
sudo chown -R root:root /opt/apache-maven-3.5.0
```

Create a version-irrelevant symbolic link pointing to the original Apache Maven 3.5 directory.

```bash
sudo ln -s /opt/apache-maven-3.5.0 /opt/apache-maven
```

Add the path `/opt/apache-maven` to the `PATH` environment variable.

```bash
echo 'export PATH=$PATH:/opt/apache-maven/bin' | sudo tee -a /etc/profile
source /etc/profile
```

Finally, use the command below to verify the installation.

```bash
mvn --version
```

The output should resemble the following.

```txt
Apache Maven 3.5.0 (ff8f5e7444045639af65f6095c62210b5713f426; 2017-04-03T19:39:06Z)
Maven home: /opt/maven
Java version: 1.8.0_141, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.141-1.b16.el7_3.x86_64/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "3.10.0-514.26.2.el7.x86_64", arch: "amd64", family: "unix"
```

You have successfully installed Apache Maven on your CentOS 7 server instance.

