FROM romeoz/docker-apache-php:5.4

RUN apt-get update && apt-get install -y wget unzip vim php-pear php5-dev build-essential subversion graphviz

RUN apt-get install -y postgresql postgresql-contrib phppgadmin
RUN \
  apt-get update && \
  apt-get install -y openjdk-7-jre 
 
# APC
RUN pear config-set php_ini /usr/local/etc/php/php.ini
RUN pecl config-set php_ini /usr/local/etc/php/php.ini
RUN pecl install apc
RUN pecl install pdo
RUN pecl install pdo_pgsql

# Configuración de apache
RUN echo "extension=pdo.so" >>  /etc/php5/cli/php.ini
RUN echo "extension=pdo.so" >> /etc/php5/apache2/php.ini
RUN echo "extension=pdo_pgsql.so" >>  /etc/php5/cli/php.ini
RUN echo "extension=pdo_pgsql.so" >> /etc/php5/apache2/php.ini
RUN sed -i '/allow from all/s/^#//g' /etc/apache2/conf.d/phppgadmin
RUN sed -i 's/\(^.*conf\[.extra_login_security.\] =\) true/\1 false/' /etc/phppgadmin/config.inc.php
RUN sed -i "s/\error_reporting = E_ALL/\error_reporting = E_ALL \& \~E_DEPRECATED \& \~E_STRICT/g"  /etc/php5/cli/conf.d/custom.ini
RUN a2enmod rewrite
RUN a2enmod setenvif

# Archivos de configuracion de apache
ADD 3w.conf /etc/apache2/sites-enabled/3w.conf
ADD toba.conf /etc/apache2/sites-enabled/toba.conf
ADD preinscripcion.conf /etc/apache2/sites-enabled/preinscripcion.conf

#Configuración de postgres
RUN chmod 755 -R /etc/phppgadmin/config.inc.php /etc/postgresql/9.1/main/pg_hba.conf /etc/postgresql/9.1/main/postgresql.conf
RUN sed -i "s/\$conf\['extra_login_security'\] = true;/\$conf\['extra_login_security'\] = false;/g" /etc/phppgadmin/config.inc.php
RUN sed -i "s/\$conf\['servers'\]\[0\]\['host'\] = '';/\$conf\['servers'\]\[0\]\['host'\] = 'localhost';/g" /etc/phppgadmin/config.inc.php
RUN service postgresql start;\
  su - postgres -c "/usr/lib/postgresql/9.1/bin/psql -U postgres -c \"ALTER USER postgres with password 'postgres';\""
RUN sed -i "s/\#listen_addresses = 'localhost'/listen_addresses = '\*'/g" /etc/postgresql/9.1/main/postgresql.conf
RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.1/main/pg_hba.conf
RUN echo "local all postgres trust" >> /etc/postgresql/9.1/main/pg_hba.conf

RUN export PGPASSWORD='postgres'

RUN apt-get update \
    && apt-get install -y --no-install-recommends openjdk-7-jre-headless 
ADD run.sh /run.sh
ADD run.sh /var/www/app/run.sh
RUN chmod -v +x /var/www/app/run.sh

ADD run.sh /var/www/app/cargar_base.sh
RUN chmod -v +x /var/www/app/cargar_base.sh

CMD ["./run.sh"]


