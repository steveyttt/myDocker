#### info ####
* Stacks allow you to deploy declarative yaml (a'la docker-compose) inside your swarm stacks
* Allows you to use docker-compose files to create services, networks & volumes
* leverages ```docker stack deploy```
* adds a new key to yaml ```deploy:```
* removes the ```build:``` capability
    * If it is present in a compose file it just ignores it
    * build should be done in CI anyway and not on swarm
* You dont actually need docker-compose to be installed on your swarm nodes (Docker-compose is a dev tool, desktop only)
* Need compose version 3 to use stacks


#### Deploying a stack
```docker stack deploy -c ${composefile.yaml} ${stackname}```  
* Updates are done by simply running the same command again. I.E modify the composefile.yaml and re-run the above command. Docker swarm is smart enough to only update the resources which have changed. Idempotent.
* -c denotes compose-file format  

#### List tasks in a stack ####
```docker stack ps ${stackname}```

#### List all stacks ####
```docker stack ls```

#### list the services in the stack (and their runnning tasks) ####
```docker stack services voteapp```