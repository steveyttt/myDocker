#### manager services with
```docker service --help```

#### Create a service with
```
docker service create alpine ping 8.8.8.8
docker service ls
docker service ps ${Service ID}
docker service update ${Service ID} --replicas 3
```

#### update a docker container on the fly
```docker update --help```

#### mounting a volume to a service ####
```docker service create --name db --replicas 1 --network backend_swarm_voting_app --mount type=volume,source=db-data,target=/var/lib/postgresql/data --env POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4```

#### You can update a docker service with ####
```docker service update [OPTIONS] SERVICE```

#### update a base image in a service ####
```docker service update --image myapp:1.2.2 ${service-name}```

#### add an environment variable and remove a published port ####
```docker service update --env-add NODE_ENV=production --publish-rm 8080 ${service-name}```

#### switch the published port for an app ####
```docker service update --publish-rm 8080 --publish-add 9090:80 ${service-name}```

#### Change the amount of replicas for services ####
```docker service scale web=8 api=6```

#### To force an update / rebalance of a service you can do
```docker service update --force ${service name}```  
* This is handy if you add new hosts to your cluster and need to re:balance

#### start a service with a health check
```docker service create --name pgres2 --health-cmd="pg_isready -U postgres || exit 1" postgres```