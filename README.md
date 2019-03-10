docker构建lnmp有两种方式
- 一个docker容器中集成mysql php nginx
- mysql nginx 和 php 各在一个容器，多容器联合工作

## 单容器
[Dockerfile](all-in-one)

单容器操作简单，基于centos的docker镜像构建，其操作与在centos系统上搭建lnmp环境基本一致，适合入门学习。

缺点是复用性不强，而且容器很大，build完之后有1.9G 这还没包括redis等其他依赖。

## 多容器
[docker-compose](compose)

多容器联合工作灵活性更强。

虽然容器间直接连接也可以使用，但考虑到容器间协作操作略复杂，现在推荐使用docker-compose的方式，只需要写好配置文件即可。

### 容器间互联
容器互联后，如果nginx中的镜像要访问php镜像 不能通过ip来访问，要通过 `docker-compose.yml`中定义的label。
同理php镜像要访问mysql 也不能写ip 也要通过定义的name来访问

如果 `docker-compose.yml` 定义如下
```
services:
  php:
    ....
  myDatabase:
    ....
  nginx:
    ....
```
那么nginx配置如下
```
location ~ \.php$ {
	fastcgi_pass  php:9000; #php是 php容器的name
	include fastcgi_params;
	fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
	fastcgi_index index.php;
}
```

php连接数据库如下
```
$pdo = new PDO('mysql:dbname=test;host=myDatabase;port=3306','root',''); //此处的host是 mysql容器的name
```