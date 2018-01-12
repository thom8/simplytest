FROM 8thom/simplytest:drupal

ENV DRUPAL_DIR="/drupal"

RUN composer create-project drupal-composer/drupal-project:7.x-dev $DRUPAL_DIR --stability dev --no-interaction

WORKDIR /drupal

RUN { \
		echo "\$databases['default']['default'] = array ("; \
		echo "  'database' => getenv('DRUPAL_DB_NAME') ?: 'drupal',"; \
		echo "  'username' => getenv('DRUPAL_DB_USER') ?: 'drupal',"; \
		echo "  'password' => getenv('DRUPAL_DB_PASS') ?: 'drupal',"; \
		echo "  'prefix' => '',"; \
		echo "  'host' => getenv('DRUPAL_DB_HOST') ?: 'drupal',"; \
		echo "  'port' => getenv('DRUPAL_DB_PORT') ?: '3306',"; \
		echo "  'driver' => 'mysql',"; \
		echo ");"; \
		echo ; \
		echo "\$drupal_hash_salt = getenv('DRUPAL_HASH_SALT') ?: 'changeme';"; \
		echo "\$conf['drupal_http_request_fails'] = FALSE;"; \
	} | tee -a "$DRUPAL_DIR/web/sites/default/settings.php" \
	&& chmod 444 $DRUPAL_DIR/web/sites/default/settings.php

COPY install.sh /install.sh

CMD ["/install.sh", "apache2-foreground"]
