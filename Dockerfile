FROM centos:7

RUN yum install httpd php php-mysql php-fpm -y

ENTRYPOINT ["usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80

