## 单容器

build
```
docker build -t my-lnmp:1.0.0 .
```

run
```
docker run \
    -v /path/to/code:/var/www/html \
    -p "80:80" \
    -p "3306:3306" \
	my-lnmp:1.0.0 my-lnmp
```