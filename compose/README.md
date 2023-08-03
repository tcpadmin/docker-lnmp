# 多容器协作

首先复制 `docker-compose.tpl.yml` 一份，命名为 `docker-compose.yml` 然后修改代码目录的映射。



## 常用操作

所有操作必须在 `docker-compose.yml`所在的路径

启动
```
docker-compose up -d
```

停止
```
docker-compose stop
```

重新build
```
docker-compose build
```
