# docker-SIU
#checkout de proyectos en /c/Users/yourUser/SIU/
docker-compose build  
docker-compose up -d  
docker exec -it dockerwindows_siu_1 bash  
./run.sh  

/var/www/proyectos/guarani_3_10_2/lib/toba/bin/instalar  
service apache2 restart  
cd /var/www/proyectos/guarani_3_10_2/lib/toba/bin/  
./toba instalacion cambiar_permisos -u www-data -g root  

#cambiar en el instalacion.ini  
vim /var/www/proyectos/guarani_3_10_2/lib/toba/instalacion/instalacion.ini  
chequea_sincro_svn = 1  
[xslfo]  
fop=/var/www/proyectos/guarani_3_10_2/php/3ros/fop/fop  

cd /var/www/proyectos/guarani_3_10_2/bin  
./guarani cargar -d /var/www/proyectos/guarani_3_10_2  
service apache2 restart  
./guarani instalar  

#instalar fuentes para reportes  
echo "deb http://us-west-2.ec2.archive.ubuntu.com/ubuntu/ trusty multiverse  
deb http://us-west-2.ec2.archive.ubuntu.com/ubuntu/ trusty-updates multiverse  
deb http://us-west-2.ec2.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse" | tee   /etc/apt/sources.list.d/multiverse.list  
apt-get update  
apt-get install ttf-mscorefonts-installer  

#trabajo diario  
docker-compose up -d  
docker exec -it dockerwindows_siu_1 bash  
./run.sh  

#para cargar base  
 su - postgres  
 psql -h localhost -p 5432 -U postgres -f /var/www/proyectos/guarani.sql guarani_prod  

#servidor de reportes  
java -jar /var/www/proyectos/guarani_3_10_2/lib/toba/php/3ros/JavaBridge/WEB-INF/lib/JavaBridge.jar SERVLET:8081  
