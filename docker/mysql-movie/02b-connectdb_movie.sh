#!/bin/bash

# Connect to the docker mysql db with mysql client within the docker itself
# Non superuser connection

# docker to connect
DOCKER_NAME=mysql-dbmovie

# db and user to connect
MYSQL_DATABASE=dbmovie
MYSQL_USER=movie

# execute client mysql in docker
docker exec -it ${DOCKER_NAME} mysql -u ${MYSQL_USER} -p ${MYSQL_DATABASE}
