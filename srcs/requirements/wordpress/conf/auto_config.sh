#!/bin/bash
SQL_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_PASS=$(cat /run/secrets/wp_admin_password)
WP_USER_PASS=$(cat /run/secrets/wp_user_password)
mkdir -p /var/www/html
cd /var/www/html

if [ ! -f wp-config.php ]; then
	wp core download --allow-root

	wp config create \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--allow-root

	wp core install \
		--url='rduport.42.fr' \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root

	wp user create $WP_USER $WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASS \
		--allow-root \
		
fi

wp option update siteurl 'https://rduport.42.fr/' --allow-root
wp option update home 'https://rduport.42.fr/' --allow-root

exec php-fpm8.2 -F
