#!/bin/bash

# execute an SQL command in a mysql db within a docker

# docker conatainer to connect
DOCKER_NAME=mysql-dbmovie

# db connection infos
MYSQL_DATABASE=dbmovie
MYSQL_USER=movie
# comment following line to be asked for the password (add -i option for docker exec)
MYSQL_PASSWORD=password

# SQL command to execute
SQL_COMMAND="select * from movies"

docker exec ${DOCKER_NAME} mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} \
   -e "${SQL_COMMAND}"
