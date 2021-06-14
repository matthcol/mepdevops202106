Install a movie database in a mysql docker
Official documentations of docker images:
https://hub.docker.com/_/mysql
https://hub.docker.com/r/phpmyadmin/phpmyadmin/

Summary commands (with container_name mysql-dbmovie)
docker logs mysql-dbmovie
docker start/stop/restart mysql-dbmovie
docker rm mysql-dbmovie
docker exec mysql-dbmovie some-command
docker exec -it mysql-dbmovie some-interactive-command

Environment variables:
MYSQL_ROOT_PASSWORD : root password (DBA)
MYSQL_ALLOW_EMPTY_PASSWORD : no root password (warning all docker users can be DBA)
MYSQL_RANDOM_ROOT_PASSWORD : random root password (printed in stdout)
MYSQL_ONETIME_PASSWORD : root password, must be changed at first login
MYSQL_DATABASE  : create database
MYSQL_USER, MYSQL_PASSWORD : user/password with all privileges on $MYSQL_DATABASE

Files to import:
/etc/mysql/conf.d : configuration file for mysql db 
/docker-entrypoint-initdb.d : *.sh, *.sql, *.sql.gz  (all will be run after install)
/var/lib/mysql : mysql data dir (where your data is stored) 


Examples from the documentation:

# Help:
docker run -it --rm mysql:tag --verbose --help

# Custom configuration
docker run --name some-mysql -v /my/custom:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag

# Encoding and collation: 
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

# Give password/database environment within a secret file 
# MYSQL_ROOT_PASSWORD, MYSQL_ROOT_HOST, MYSQL_DATABASE, MYSQL_USER, and MYSQL_PASSWORD
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD_FILE=/run/secrets/mysql-root -d mysql:tag


Samples in this directory

# The *.sh scripts in this directory can :
00*.sh : prepare an external DATA directory for the database
01*.sh : run/install a new container
02*.sh : manage the database within the container
03*.sh : add a docker php-myadmin to manage database
