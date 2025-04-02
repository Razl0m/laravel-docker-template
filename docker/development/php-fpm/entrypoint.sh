#!/bin/sh
set -e

echo "Install dependencies..."
composer install --optimize-autoloader --no-interaction --no-progress --prefer-dist

echo "Waiting for PostgreSQL..."
until nc -z postgres 5432; do sleep 1; done

php artisan migrate --force

echo "Clearing configurations..."
php artisan config:clear
php artisan route:clear
php artisan view:clear

exec "$@"
