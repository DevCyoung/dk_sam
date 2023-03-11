cd /var/www/html/wordpress

wp core download --path=/var/www/html/wordpress --allow-root
wp config create --path=/var/www/html/wordpress --allow-root --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbprefix=wp_ --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD

#admin user
wp core install --path=/var/www/html/wordpress --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

wp plugin update --path=/var/www/html/wordpress --allow-root --all

#theme
wp theme install $WP_THEME --activate --path=/var/www/html/wordpress --allow-root

#language KR
wp language core install ko_KR --path=/var/www/html/wordpress --allow-root
wp language core activate ko_KR --path=/var/www/html/wordpress --allow-root

#default user
wp user create --path=/var/www/html/wordpress --allow-root $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
chown www-data:www-data /var/www/html/wordpress/wp-content/uploads --recursive

mkdir -p /run/php/
php-fpm7.3 -F
