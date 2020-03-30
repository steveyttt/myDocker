#### Raw notes
* use docker-compose --help
* Has a few version 1, 2, 3 (Currently at 3.7)
* Can create containers, networks and volumes
* Info is [here](https://docs.docker.com/compose/compose-file/)
* You can build images inside a compose file [here](https://docs.docker.com/compose/compose-file/#build)
* It is a seperate tool to dockerCLI
* It creates a network for the deployment
* By default when you update a service in docker-compose it will update your service one container (replica) at a time
* Over 77 different update commands for rolling containers in docker-compose

* [Using override files in docker](https://docs.docker.com/compose/extends/#multiple-compose-files)
* [Compose in production](https://docs.docker.com/compose/production/)
* [Add a health check](https://docs.docker.com/compose/compose-file/#healthcheck)

#### Bring up containers
```docker-compose up```

#### Bring up containers (Daemon in background)
```docker-compose up -d```

#### Bring down containers (You can choose to delete volumes and images too)
```
docker-compose down
docker-compose down -v
docker-compose down -rmi
```

#### Check logs
```docker-compose logs```

#### check running containers
```docker-compose ps```

#### check running containers services
```docker-compose top```

#### You can reference override files with docker-compose ####
```docker-compose -f docker-compose.yaml -f docker-compose.test.yaml up -d ```  
* This will merge the docker-compose.yaml file with the test docker compose file and run a merged version. This allows you to keep multiple override files in your REPO based on the environment (Dev, Test & PROD)s.  

#### Merge the 2 compose files into one and show via std out - then you can see what will happen with the override
```docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml config```  
* This could be run with a ```> output.yaml``` command on the end which could be then used by ```swarm``` to perform a deployment.  