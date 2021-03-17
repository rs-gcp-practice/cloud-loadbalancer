#!/usr/bin/bash
apt-get update -y
apt-get install php -y
mv /var/www/html/index.html /var/www/html/index.php
cat <<EOF > /var/www/html/index.php
    <!DOCTYPE html>
    <html>
    <head> <title>Instance Group</title> </head>
    <body>
        <p>Hello, World!</p>
        <p>
            <span>hostname: </span>
            <?= php_uname('n') ?>
        </p>
        <p>
            <?= "something" ?>
        </p>
    </body>
    </html>
EOF
systemctl reload apache2
