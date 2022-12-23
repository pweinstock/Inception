#!/bin/sh

cd /var/www/wordpress

wp core download --allow-root

wp core config \
				--dbname=$WP_DB_NAME \
				--dbuser=$WP_DB_USER \
				--dbpass=$WP_DB_PASSWORD \
				--dbhost=$WP_DB_HOST \
				--allow-root

wp core install \
				--url=$WP_URL \
				--title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USER \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_MAIL \
				--allow-root

wp user create \
				$WP_USER \
				$WP_USER_MAIL \
				--role=author \
				--user_pass=$WP_USER_PASSWORD \
				--allow-root

php-fpm7.3 -F