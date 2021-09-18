Official documentation of docker images:

https://hub.docker.com/r/phpmyadmin/phpmyadmin/
https://hub.docker.com/_/mariadb


To run the composition of:
- php-myadmin
- mariadb server with database dbmovie
- moviapi backend

docker-compose up
docker stack deploy -c docker-compose.yml dbmoviestack 

(re)build movieapi image
docker-compose build api

access to phpmyadmin with a web browser:
  http://ipthisvm:8081

  web form:
    host: name-db-container (mariadphpmyadmin_db_1 for example)
    utilistateur: movie
    mot de passe: password

mariadb volume must be remove if you want to destroy data and restart from the ground
Ex: docker volume rm mariadphpmyadmin_mariadb_dbmovie_volume

To exec something within a container:
docker-compose exec db bash
docker-compose exec db mysql -u movie -p dbmovie

