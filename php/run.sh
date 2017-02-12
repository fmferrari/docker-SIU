
#!/bin/bash
cd /var/www/proyectos/docker-SIU/php/xdebug-2.4.1/ \
&& phpize \
&& aclocal \
&& libtoolize --force \
&& autoheader \
&& autoconf \
&& ./configure --enable-xdebug \
&& make \
&& cp modules/xdebug.so /usr/lib/php5/20100525/ \
&& cd /etc/php5/cli/conf.d/
echo "zend_extension=/usr/lib/php5/20100525/xdebug.so" > xdebug.ini

rm -rf /tmp/pear \
&& echo "zend_extension=/usr/lib/php5/20100525/xdebug.so
xdebug.remote_autostart=1
xdebug.remote_host=10.254.254.254
xdebug.remote_connect_back = 0
memory_limit = 256M
xdebug.idekey = PHPSTORM
xdebug.default_enable = 0
xdebug.remote_enable = 1
xdebug.profiler_enable = 1" > /etc/php5/cli/conf.d/php.ini
service postgresql start
service apache2 start
java -jar /var/www/proyectos/guarani_3_10_2/lib/toba/php/3ros/JavaBridge/WEB-INF/lib/JavaBridge.jar SERVLET:8081
