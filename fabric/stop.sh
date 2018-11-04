#docker-compose -f docker/docker-compose.yaml down
kill -9 $(lsof -t -i:3000)

#Kill Docker Images and Delete
docker kill $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi $(docker images dev-* -q)