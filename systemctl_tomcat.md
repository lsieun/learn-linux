# Linux Centos 7 systemctl（systemd）新增加service服务，并且开机启动

URL:

- https://blog.csdn.net/qq_25821067/article/details/79120222

Centos 7中采用了`systemd`控制系统服务，更加简单，以前启动服务需要 `service xxxx start|stop`等。现在需要的是`systemctl start|stop xxx`。比如我配置的启动tomcat，`systemctl start tomcat`。十分方便。以前是在，现在直接在`/usr/lib/systemd/system`里面新建一个`tomcat.service`，内容如下：

```txt
[Unit]  
Description=tomcatapi  
After=network.target  
   
[Service]  
Type=forking  
ExecStart=/usr/local/soft/tomcat/tomcat8/bin/startup.sh  
ExecReload=  
ExecStop=/usr/local/soft/tomcat/tomcat8/bin/shutdown.sh  
PrivateTmp=true  
   
[Install]  
WantedBy=multi-user.target 
```

然后给这个`tomcat.service` 文件`chomod +x`权限即可！最后在重启下`systemctl`，命令如下：

```bash
systemctl daemon-reload
```

最后就可以通过`systemctl start tomcat`启动啦！

参数解释：

- `[Unit]`： unit 本身的说明，以及与其他相依 daemon 的设置，包括在什么服务之后才启动此 unit 之类的设置值；
    - `Description`: 就是当我们使用 `systemctl list-units` 时，会输出给管理员看的简易说明！
    - `After`: 说明此 unit 是在哪个 daemon 启动之后才启动的意思！
- `[Service]`
    - `Type`: 说明这个 daemon 启动的方式，会影响到 ExecStart 喔！
        - `simple`:默认值，这个 daemon 主要由 ExecStart 接的指令串来启动，启动后常驻于内存中。
        - `forking`:由 ExecStart 启动的程序通过 spawns 延伸出其他子程序来作为此 daemon 的主要服务。原生的父程序在启动结束后就会终止运行。
    - `ExecStart`:就是实际执行此 daemon 的指令或脚本程序。
    - `ExecStop`: 与 systemctl stop 的执行有关，关闭此服务时所进行的指令。
    - `ExecReload`: 与 systemctl reload 有关的指令行为
- `[Install]`
    - `WantedBy`: 这个设置后面接的大部分是 `*.target` unit ！意思是，这个 unit 本身是附挂在哪一个 target unit 下面的！一般来说，大多的服务性质的 unit 都是附挂在 `multi-user.target` 下面！
