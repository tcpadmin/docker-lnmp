#!/bin/bash
service nginx start
service mysqld start
service php-fpm start

tail -f /var/log/nginx/* /var/lib/php-fpm/php_error.log