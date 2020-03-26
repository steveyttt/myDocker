docker network create -d overlay backend
docker network create -d overlay frontend

docker service create --name vote --replicas 2 --network frontend --publish 80:80 bretfisher/examplevotingapp_vote
docker service create --name redis --replicas 1 --network frontend redis:3.2
docker service create --name worker --replicas 1 --network frontend --network backend bretfisher/examplevotingapp_worker:java
docker service create --name db --replicas 1 --network backend --mount type=volume,source=db-data,target=/var/lib/postgresql/data --env POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4
docker service create --name result --replicas 1 --network backend --publish 5001:80 bretfisher/examplevotingapp_result

docker service ps vote
docker service ps worker
docker service ps redis
docker service ps db
docker service ps result

docker service logs vote
docker service logs worker
docker service logs result

docker service rm vote
docker service rm worker
docker service rm redis
docker service rm db
docker service rm result

docker network rm backend
docker network rm frontend