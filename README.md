docker构建lnmp有两种方式
- 一个docker容器中集成mysql php nginx
- mysql nginx 和 php 各在一个容器，多容器联合工作

## 单容器
[Dockerfile](all-in-one)

单容器操作简单，基于centos的docker镜像构建，其操作与在centos系统上搭建lnmp环境基本一致，适合入门学习。

缺点是复用性不强，而且容器很大，build完之后有1.9G 这还没包括redis等其他依赖。

## 多容器
docker-compose(doing)

多容器联合工作灵活性更强。只是容器间协作操作略复杂。现在推荐使用docker-compose的方式，只需要配置文件即可。