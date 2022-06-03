#!/bin/sh

sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_NAME|'${DATABASE_NAME}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_USER|'${DATABASE_USER}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_PASS|'${DATABASE_PASS}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_HOST|'${DATABASE_HOST}'|g' /wordpress/wp-config.php


cp -r redis-cache/ /wordpress/wp-content/plugins/
cp -r /wordpress/* /var/www/html/wordpress/

php-fpm7 -FR

rm -f /wordpress/index.php

touch /wordpress/index.html

echo " <!DOCTYPE html>
<html>
   <head>
      <title>HTML Meta Tag</title>
      <meta http-equiv = "refresh" content = "2; url = https://www.dhaliti.42.fr/?p=1" />
   </head>
   <body>
      <p>Hello HTML5!</p>
   </body>
</html>" > /wordpress/index.html
