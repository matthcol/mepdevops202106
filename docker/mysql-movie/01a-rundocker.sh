#!/bin/bash

# if you run twice this script (stop/rm between),
# your data will be preserved in the volume or directory DATA_DIR
# Example:
#   docker run --name mysql-dbmovie -e "MYSQL_ROOT_PASSWORD=password" \
#      -e "MYSQL_DATABASE=dbmovie" -e "MYSQL_USER=movie -e "MYSQL_PASSWORD=password" \
#      -v mysql-dbmovie-volume:/docker-entrypoint-initdb.d  -v $(pwd)/db_scripts:/var/lib/mysql \
#      -d ${IMAGE_NAME}
# NB: -e --env for environment variables, -d for detach mode, -v mount dir or volume

DOCKER_NAME=mysql-dbmovie
IMAGE_NAME=mysql:latest
MYSQL_ROOT_PASSWORD=password
MYSQL_DATABASE=dbmovie
MYSQL_USER=movie
MYSQL_PASSWORD=password
SCRIPT_DIR=$(pwd)/db_scripts
DATA_DIR=mysql-dbmovie-volume


docker run --name ${DOCKER_NAME} \
  -e "MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" \
  -e "MYSQL_DATABASE=${MYSQL_DATABASE}" \
  -e "MYSQL_USER=${MYSQL_USER}" \
  -e "MYSQL_PASSWORD=${MYSQL_PASSWORD}" \
  -v ${SCRIPT_DIR}:/docker-entrypoint-initdb.d \
  -v ${DATA_DIR}:/var/lib/mysql \
  -d ${IMAGE_NAME}
