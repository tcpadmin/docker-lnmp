FROM centos:7.6.1810
MAINTAINER Tyler <sudobash@126.com>

# nginx mysql php 分开构建
# nginx和mysql稳定性较高 所以优先构建

# nginx + mysql + php7.2
RUN yum install -y yum-utils && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \ # 设置时区
	# 安装nginx mysql php 需要的源
	yum localinstall -y http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
		https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm \
		https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm

RUN yum install --nogpgcheck -y nginx

# 默认是mysql8.0 在此禁用80版本 然后指定mysql 5.6或5.7
RUN	yum-config-manager --disable mysql80-community && \
    yum-config-manager --enable mysql57-community && \
    yum install --nogpgcheck -y mysql-community-server

# 指定php版本
RUN yum-config-manager --enable remi-php72 && \
    yum install --nogpgcheck -y \
		php php-mysqlnd php-curl php-simplexml \
		php-devel php-gd php-mbstring php-opcache php-pecl-imagick \
		php-pecl-zip php-tidy php-xml

COPY default-conf/php.ini /etc/php/letu.ini
COPY default-conf/nginx.conf /etc/nginx/nginx.conf
COPY default-conf/www.conf /etc/php-fpm.d/www.conf
COPY start.sh ./

EXPOSE 9000 3306 80 443

CMD "./start.sh"
