# This directory presents a composition of 2 services
# - web : a python flask web application
# - redis : une base de données légère
#
# - the web container image is built from the Dockerfile description
#     with a python base
# - the redis container is run from the redis image

# To run to composition of dockers:
docker-compose up
# en mode détaché
docker-compose up -d

# arrêter la composition
docker-compose down

# cycle de vie de la composition
docker-compose start/stop/restart

# cycle de vie d'un des 2 containers (web ou redis)
docker-compose start/stop/restart web

# suppresion d'un des 2 containers (web ou redis)
docker-compose rm web

# relancer (run or build+run) 1 seul des containers
docker-compose up web

# supervision
docker-compose logs
docker-compose logs redis
docker-compose logs web

docker-compose top
docker-compose ps
