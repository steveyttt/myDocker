### Info
* swarm mode needs enabling on docker hosts before you can use it
* clusters are made up of managers and workers
* MANAGERS are CAs and also keep a local database leveraging RAFT.
* The RAFT database is replicated across all managers
* WORKERS host containers
* All inter-host communication is encrypted
* MANAGERS can be workers (To host containers)
* MANAGERS can be demoted to workers
* WORKERS can be demoted to managers
* ```docker service``` replaces ```docker run``` in swarm mode
* Services >>> Replicas (tasks) >>> container
* Managers perform the following steps when ```docker service create``` is issued