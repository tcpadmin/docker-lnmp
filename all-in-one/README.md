## 单容器

build
```
docker build -t my-lnmp:1.0.0 .
```

启动时要映射 mysql的落地文件和代码的路径
```
docker run -d \
    -v /data/docker-lnmp/mysql:/var/lib/mysql
    -v /data/path/to/code:/var/www/html \
    -p "80:80" \
    -p "3306:3306" \
    my-lnmp:1.0.0 my-lnmp
```

如果要重新指定nginx配置文件可以将额外的配置挂到镜像的`/etc/nginx/conf.d/`
```
-v /data/docker-lnmp/nginx-conf:/etc/nginx/conf.d
```

也可以将新的nginx.conf直接替换 /etc/nginx/nginx.conf
```
#宿主机的目录必须为绝对路径
-v `pwd`/default-conf/nginx.conf:/etc/nginx/nginx.conf
```
