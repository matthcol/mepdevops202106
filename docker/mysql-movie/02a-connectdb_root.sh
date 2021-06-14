#!/bin/bash

# Connect to the docker mysql db with mysql client within the docker itself
# DBA connection

# docker to connect
DOCKER_NAME=mysql-dbmovie

# execute client mysql in docker
docker exec -it ${DOCKER_NAME} mysql -u root -p
