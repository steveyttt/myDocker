#### Raw notes  
* By default containers go onto the bridge/docker0 virtual network
* You can create your own virtual networks
* Containers can only communicate over their own virtual network OR communicate back via the host machine (You cannot go direct from one docker network to another docker network)
* Container to Container DNS resolution does not work by default on the default docker network
* The docker daemon has a built in DNS server which all containers inherit at creation (You can specify your own though)
* You can create a DNS alias that all containers can share (see DNS-round-robin folder under examples)

#### Show open ports and their mappings on a container
```docker container port webhost```

#### Get container IP
```docker container inspect --format '{{ .NetworkSettings.IPAddress}}' ${Container ID}```

#### List networks
```docker network ls```

#### Inspect networks
```docker network inspect ${Network name / ID}```

#### Create your own network
```docker network create my_own_network```

#### Run a container on a specific network
```docker container run --network my_own_network --detach nginx```

#### Connect an instance to a new network
```docker network connect ${Network ID} ${Container ID}```

#### Disconnect an instance from an existing network
```docker network disconnect ${Network ID} ${Container ID}```

I created a container on a new network, then ran 1 Million curl commands. During the curl commands run i added the container to the default bridge command and removed it from the original network. During this time it dropped zero requests.

#### Examples of working DNS resolution on a custom network are below  
[DNS details from dockerHub](https://docs.docker.com/config/containers/container-networking/#dns-services)  
Here we create 2 containers with custom names and then attempt a ping between them. 
This works as the DNS daemon in docker allows container 2 container resolution.  

There are 2 caveats with this, YOU MUST use a custom network (Not default), YOU MUST run your container with a custom name.

```
docker container run --network my_own_network --detach --name nginx1 nginx:alpine
docker container run --network my_own_network --detach --name nginx2 nginx:alpine
docker exec --interactive --tty nginx1 ping nginx2
docker exec --interactive --tty nginx2 ping nginx1
```

#### Using custom DNS servers
docker container run --network my_own_network --detach --dns 8.8.8.8 --name nginx3 nginx:alpine
