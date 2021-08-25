FROM alpine:latest

RUN export phpverx=$(alpinever=$(cat /etc/alpine-release); \
	[ ${alpinever//./} -ge 309 ] \
	&& echo 7 || echo 5) \
	&& apk add apache2 php$phpverx-apache2 php$phpverx-mysqli \
		php$phpverx-fpm

ENTRYPOINT ["usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
