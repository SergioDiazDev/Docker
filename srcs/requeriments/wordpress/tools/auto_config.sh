#!/bin/bash

WP_CONFIG_FILE="/var/www/wordpress/wp-config.php"
WP_CONFIG_SAMPLE="/var/www/wordpress/wp-config-sample.php"
WP_CLI_URL="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

echo "SE EJECUTO EL SCRIPT"

if ! [[ -f /var/www/wordpress/wp-config.php ]]; then
    # Descargar WP-CLI
    curl -o /usr/local/bin/wp $WP_CLI_URL
    chmod +x /usr/local/bin/wp

    # Copiar wp-config-sample.php a wp-config.php
    cp $WP_CONFIG_SAMPLE $WP_CONFIG_FILE

    # Configurar wp-config.php
    sed -i "s/password_here/$PASS1/g" $WP_CONFIG_FILE
    sed -i "s/localhost/mariadb.srcs_inception/g" $WP_CONFIG_FILE
    sed -i "s/username_here/$USER1/g" $WP_CONFIG_FILE
    sed -i "s/database_name_here/$NAME/g" $WP_CONFIG_FILE

    # Instalar WordPress
    wp core install --allow-root --url=$HOST --title=$USER1 \
        --admin_user=$USER1 --admin_password=$PASS1 \
        --admin_email=$EMAIL1 --path=/var/www/wordpress

    # Crear usuario adicional
    wp user create $USER2 $EMAIL2 --user_pass=$PASS2 \
        --role=author --allow-root --path=/var/www/wordpress
else
    echo "El archivo wp-config.php ya existe."
fi

# Iniciar el servidor PHP-FPM (usando la ruta completa)
/usr/sbin/php-fpm7.4 -y /etc/php/7.4/fpm/php-fpm.conf -F
