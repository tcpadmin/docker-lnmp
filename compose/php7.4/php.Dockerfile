FROM php:7.4-fpm

RUN echo 'date.timezone = Asia/Shanghai' > /usr/local/etc/php/conf.d/tz.ini \
    && docker-php-ext-install pdo pdo_mysql mysqli \
    && pecl install -o redis && docker-php-ext-enable redis
