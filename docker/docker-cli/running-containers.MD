#### Handy
Add ```--help``` for any command to get more info

#### Show running containers
```docker container ls```

#### Show all containers (Alive and dead)
```docker container ls -a```

#### Run an nginx instance and claim the terminal
```docker container run --publish 80:80 nginx```

#### Run an nginx instance and move to background
```docker container run --detach --publish 80:80 nginx```

#### Run a specific tag of an nginx instance and move to background
```docker container run --detach --publish 80:80 nginx:1.17-alpine```

#### Run an nginx instance with a custom name and move to background
```docker container run --detach --publish 80:80 --name loadbalancer nginx```

#### Stopping a container
```docker container stop ${conatiner ID}```

#### Start a container
```docker container start ${Container ID}```

#### Delete a stopped container
```docker container rm ${Container ID}```

#### Delete a running container FORCE IT
```docker container rm -f ${Container ID}```

#### Get realtime metric details from a container
```docker container stats ${Container ID}```

#### View container specific metadata (Rich in information)
```docker container inspect ${Container ID}```

#### Checking logs on a container
```docker container logs ${Container ID}```

#### Checking processes running on a container
```docker container top ${Container ID}```

#### Get into a container with a bash shell (container stops when session stops)
```docker container run --tty --interactive --name proxy nginx bash```

#### Run a fullish linux distro (container stops when session stops)
```docker container run --tty --interactive --name ubuntu ubuntu```

#### Run a shell session on an existing container (container stops when session stops)
```docker attach ${Container ID}```

#### Run a shell on a container which will not stop the container when you exit
```docker container exec --interactive --tty nginx ${Container ID}```

#### Alpine uses sh and not bash
```docker container run -it alpine sh```

#### Include a health check when running a container
````docker container run --health-cmd="curl -f localhost:9200/_cluster/health || false" --health-interval=5s --health-retries=3 --health-timeout=2s --health-start-period=15s elasticsearch:2```