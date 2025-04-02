#!/bin/sh

SCRIPT_NAME='/index.php' SCRIPT_FILENAME='/var/www/public/index.php' REQUEST_METHOD='GET' cgi-fcgi -bind -connect 127.0.0.1:9000 > /dev/null 2>&1

if [ $? -ne 0 ]; then
  echo "PHP-FPM is not responding"
  exit 1
fi

exit 0
