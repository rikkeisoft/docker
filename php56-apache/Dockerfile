FROM centos:6.7

MAINTAINER HuyNQ "huynq@rikkeisoft.com"

RUN rm -f /etc/localtime && \
  ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
  http://rpms.famillecollet.com/enterprise/remi-release-6.rpm \
  yum-utils wget unzip && \
  yum-config-manager --enable remi,remi-php56,remi-php56-debuginfo

RUN yum -y update

RUN yum -y install make gcc git httpd php \
  php-common php-cli php-pdo php-mysql php-gd \
  php-mbstring php-mcrypt php-xml php-devel php-pear

RUN rm -rf /var/cache/yum/* && yum clean all

RUN echo "<?php phpinfo(); " >> /var/www/html/index.php

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh -v

COPY php-ext-enable /usr/local/bin/
RUN chmod +x /usr/local/bin/php-ext-enable -v

RUN pecl install redis && \
  php-ext-enable redis

WORKDIR /var/www/html

EXPOSE 80 443

ENTRYPOINT ["/docker-entrypoint.sh"]
