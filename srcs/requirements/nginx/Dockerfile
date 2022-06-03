FROM  alpine:3.12.0

RUN apk update

RUN apk add nginx openrc vim openssl

RUN mkdir -p /var/www/html/

RUN chown -R nginx:nginx /var/lib/nginx

RUN chown -R nginx:nginx /var/www/html

COPY ./conf/nginx.conf /etc/nginx/

RUN openrc

RUN touch /run/openrc/softlevel

RUN mkdir -p /run/nginx

COPY tools/script.sh /

RUN chmod +x ./script.sh

ENTRYPOINT [ "./script.sh" ]
