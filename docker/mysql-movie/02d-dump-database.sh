#!/bin/bash

# Backup database tables from docker mysql db to a local host dump file

# DOCKER and db access settings
DOCKER_NAME=mysql-dbmovie
# db connection info 
# NB: you can use the env settings from the container by quoting with ' 
# the mysqldump command
MYSQL_DATABASE=dbmovie
MYSQL_USER=movie
MYSQL_PASSWORD=password

# DUMP FILE on local host
HOST_DUMP_DIR=/tmp
DUMP_FILENAME=${MYSQL_DATABASE}-$(date +%Y%m%d).dmp
DUMP_PATH=${HOST_DUMP_DIR}/${DUMP_FILENAME}

# DUMP options
# -y : no tablespace options, the dump can be done with a non superuser
DUMP_OPTIONS="-y"

if [ -e ${DUMP_PATH} ]
then
  echo "Error: a dump with the same name already exits: $DUMP_PATH"
  echo "Exiting without saving db ${MYSQL_DATABASE}"
  exit -1
fi

echo "Dump db ${MYSQL_DATABASE} from docker ${DOCKER_NAME} into host local dir: ${DUMP_PATH}"
echo "Begin at $(date)"

docker exec ${DOCKER_NAME} \
  mysqldump -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${DUMP_OPTIONS} ${MYSQL_DATABASE} \
  > ${DUMP_PATH}

echo "End at $(date)"

# PS: the redirection of the standard output is done on the local host, not in the container
