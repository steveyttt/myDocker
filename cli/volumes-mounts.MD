### Raw Notes
* [Dockerhub volumes](https://docs.docker.com/storage/)
* Docker volumes are kept outside of union file system
* Docker on MAC and WINDOWS uses a VM to run docker, which means the volumes you see in inspect commands are not on your local machine, but on the docker VM.
* If a Dockerfile references a VOLUME, that VOLUME will persist past the creation of the container and needs manually deleting.

### Volumes
* Can be specified in a Dockerfile
* Persist after container deployment
* Creates a seperate file system on the host machine
* Can be given a friendly name
* Host shouldnt access the volume
* Can be created before container runtime
* Can be identified in cli command without an opening / ```docker container run -v mysql-db:/var/lib/mysql```

### Persistent data bind mounting  
* Maps a host file / dir to a container file or dir
* Basically two locations (a host and a container) pointing to the same file(s)
* Not part of the union file system
* Cannot be specified in a Dockerfile
* Can be identified in cli command with an opening / (volumes dont have this)
* Can be assigned only at container runtime ```docker container run -v /Users/Steve/MyDir:/path/on/container```

### check volumes on an image or container with  
```
docker image inspect ${Image Name}
docker container inspect ${Container Name}
```

### See all volumes we have on a host and then inspect them
```
docker volume ls
docker volume inspect ${Volume ID}
```

### You can provision a container with a human readable volume name:
```docker container run -d -p 3306:3306 --env MYSQL_RANDOM_ROOT_PASSWORD=yes -v mysql-db:/var/lib/mysql --name database mysql```

### Create a local docker volume (If you need a different driver)
```docker volume create```

### Example of a bind mount
```docker container run -d --name loadbalancer -p 80:80 -v $(pwd):/usr/share/nginx/html nginx```