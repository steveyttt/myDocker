### Raw notes
* use docker-compose --help
* Has a few version 1, 2, 3 (Currently at 3.7)
* Can create containers, networks and volumes
* Info is [here](https://docs.docker.com/compose/compose-file/)
* You can build images inside a compose file [here](https://docs.docker.com/compose/compose-file/#build)
* It is a seperate tool to dockerCLI
* It creates a network for the deployment

### Bring up containers
```docker-compose up```

### Bring up containers (Daemon in background)
```docker-compose up -d```

### Bring down containers (You can choose to delete volumes and images too)
```
docker-compose down
docker-compose down -v
docker-compose down -rmi
```

### Check logs
```docker-compose logs```

### check running containers
```docker-compose ps```

### check running containers services
```docker-compose top```

### down a stack and delete images & volumes