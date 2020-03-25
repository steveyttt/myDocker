#### Info
* swarm mode needs enabling on docker hosts before you can use it
* clusters are made up of managers and workers
* MANAGERS are CAs which assign certs for node to node encryption & also keep a local database leveraging RAFT. They assign worker to worker nodes.
* The RAFT database is replicated across all managers
* Goosip is used to replicate information between nodes
* WORKERS host containers
* All inter-host communication is encrypted
* MANAGERS can be workers (To host containers)
* MANAGERS can be demoted to workers
* WORKERS can be demoted to managers
* ```docker service``` replaces ```docker run``` in swarm mode
* Heirachy in a swarm cluster is ```Services >>> Replicas (tasks) >>> container```
* Managers perform the following steps when ```docker service create``` is issued
    * API - accepts the command from the client & creates service object
    * Orchestrator - Reconcilliation loop for service objects and creates tasks
    * Allocator - Allocates IP addresses to tasks
    * Scheduler - Assigns nodes to tasks
    * Dispatcher - Checks in on workers
* If the desired task / replica count drops below what has been configured then a MANAGER node will inform a worker node to start a new replica. This is the job of the orchestrator.
* Worker nodes do not have access to the swarm CLI commands

#### Handy links
[docker swarm docs](https://docs.docker.com/engine/swarm/services/)
[Swarm Deep Dive 1 video](https://www.youtube.com/watch?v=dooPhkXT9yI)
[Swarm Deep Dive 2 video](https://www.youtube.com/watch?v=_F6PSP-qhdA)
[speaker slides](https://speakerdeck.com/aluzzardi/heart-of-the-swarmkit-topology-management)
[Heart of the swarm kit](https://www.youtube.com/watch?v=EmePhjGnCXY)
[Raft Consensus visualisation](http://thesecretlivesofdata.com/raft/)
[Swarm firewall ports](https://www.bretfisher.com/docker-swarm-firewall-ports/)
[swarm mode routing mesh](https://docs.docker.com/engine/swarm/ingress/)

#### Enable swarm mode on your host
```docker swarm init```

#### List nodes in the cluster
```docker node ls```

#### promoting and demoting nodes
```docker node --help```

#### Getting tokens + leaving and joining the swarm cluster is done with
```docker swarm --help```

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