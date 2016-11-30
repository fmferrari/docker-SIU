
#!/bin/bash

service postgresql start
service apache2 start
java -jar /var/www/proyectos/guarani_3_10_2/lib/toba/php/3ros/JavaBridge/WEB-INF/lib/JavaBridge.jar SERVLET:8081