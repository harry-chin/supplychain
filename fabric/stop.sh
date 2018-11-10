#docker-compose -f docker/docker-compose.yaml down
kill -9 $(lsof -t -i:3000)

docker-compose -f docker-compose.yaml down

#Kill Docker Images and Delete
docker kill $(docker ps -q)
docker rm $(docker ps -aq)
docker images -a | grep "dev-" | awk '{print $3}' | xargs docker rmi