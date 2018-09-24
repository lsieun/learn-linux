
设置开机启动FastDFS的Tracker

一般生产环境需要开机启动一些服务，如keeplived、tomcat等。可以通过修改以下文件添加Tracker的开机启动：

	vi /etc/rc.d/rc.local

添加如下配置：

	/etc/init.d/fdfs_trackerd start