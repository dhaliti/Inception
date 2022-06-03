FROM  alpine:3.12.0

RUN apk update

RUN apk add openrc

RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache

RUN wget https://wordpress.org/latest.tar.gz

RUN tar xvf latest.tar.gz

RUN rm latest.tar.gz

RUN wget https://downloads.wordpress.org/plugin/redis-cache.2.0.22.zip

RUN unzip redis-cache.2.0.22.zip

RUN rm -rf redis-cache.2.0.22.zip

ADD ./conf/object-cache.php /wordpress/wp-content/

COPY conf/wp-config.php /wordpress/wp-config.php

RUN openrc

RUN touch /run/openrc/softlevel

COPY tools/script.sh /

COPY conf/www.conf /etc/php7/php-fpm.d

RUN chmod +x ./script.sh

ENTRYPOINT [ "./script.sh" ]
