#!/bin/bash
# run a phpmyadmin web server in a docker container
# to admin a mysql database in another conatiner
# Example:
#   docker volume create phpmyadmin-dbmovie-volume
#   docker run --name phpmyadmin-dbmovie -v phpmyadmin-dbmovie-volume:/etc/phpmyadmin/config.user.inc.php \
#     --link mysql-dbmovie:db -p 8081:80 -d phpmyadmin/phpmyadmin


PHPMYADMIN_CONTAINER=phpmyadmin-dbmovie
PHPMYADMIN_VOLUME=phpmyadmin-dbmovie-volume
PHPMYADMIN_IMAGE=phpmyadmin/phpmyadmin:latest
MYSQL_CONTAINER=mysql-dbmovie
LOCAL_PORT=8081

# check if volume already exists
# `docker volume ls` report at least one line of headers: DRIVER    VOLUME NAME

if [ `docker volume ls -f "name=${PHPMYADMIN_VOLUME}" | wc -l` -eq 1 ]
then
  echo "creating volume: ${PHPMYADMIN_VOLUME}"
  docker volume create ${PHPMYADMIN_VOLUME}
else
  echo "skipping creating existing volume: ${PHPMYADMIN_VOLUME}"
fi

# create and run phpmyadmin container


echo "creating and running container: ${PHPMYADMIN_CONTAINER}"
docker run --name ${PHPMYADMIN_CONTAINER} -v ${PHPMYADMIN_VOLUME}:/etc/phpmyadmin/config.user.inc.php \
    --link ${MYSQL_CONTAINER}:db -p ${LOCAL_PORT}:80 -d ${PHPMYADMIN_IMAGE}
