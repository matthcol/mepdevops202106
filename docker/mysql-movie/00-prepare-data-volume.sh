#!/bin/bash

# let docker manage mysql db data dir 
# the volume is preserved if you remove the docker container
# mysql image check if there is already a db in /var/lib/mysql before creating it

VOLUME_NAME=mysql-dbmovie-volume
docker volume create ${VOLUME_NAME}
