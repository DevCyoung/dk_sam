echo "== Installing and setting up Wordpress =="

cd /var/www/html/wordpress

# Download WordPress core files
wp core download --path=/var/www/html/wordpress --allow-root

# Create wp-config.php file with the appropriate database parameters
wp config create --path=/var/www/html/wordpress --allow-root --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbprefix=wp_ --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD

# Install WordPress with the specified site parameters
wp core install --path=/var/www/html/wordpress --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

# Update all plugins
wp plugin update --path=/var/www/html/wordpress --allow-root --all

# Install and activate the Twenty Twenty-One theme
wp theme install $WP_THEME --activate --path=/var/www/html/wordpress --allow-root

# Install Korean language pack
wp language core install ko_KR --path=/var/www/html/wordpress --allow-root

# Set the language to Korean
wp language core activate ko_KR --path=/var/www/html/wordpress --allow-root

# Create default user
wp user create --path=/var/www/html/wordpress --allow-root $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD

# Set the owner of the content of our site to www-data user and group
chown www-data:www-data /var/www/html/wordpress/wp-content/uploads --recursive

# Start the PHP-FPM server
mkdir -p /run/php/
php-fpm7.3 -F

