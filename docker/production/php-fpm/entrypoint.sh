#!/bin/sh
set -e

if [ ! "$(ls -A /var/www/storage)" ]; then
  echo "Initializing storage directory..."
  cp -R /var/www/storage-init/. /var/www/storage
  chown -R www-data:www-data /var/www/storage
fi

rm -rf /var/www/storage-init

echo "Waiting for PostgreSQL..."
until nc -z postgres 5432; do sleep 1; done

php artisan migrate --force

php artisan config:cache
php artisan route:cache

exec "$@"
