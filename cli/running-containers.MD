### Handy
Add ```--help``` for any command to get more info

### Show running containers
```docker container ls```

### Show all containers (Alive and dead)
```docker container ls -a```

### Run an nginx instance and claim the terminal
```docker container run --publish 80:80 nginx```

### Run an nginx instance and move to background
```docker container run --detach --publish 80:80 nginx```

### Run a specific tag of an nginx instance and move to background
```docker container run --detach --publish 80:80 nginx:1.17-alpine```

### Run an nginx instance with a custom name and move to background
```docker container run --detach --publish 80:80 --name loadbalancer nginx```

### Stopping a container
```docker container stop ${conatiner ID}```

### Start a container
```docker container start ${Container ID}```

### Delete a stopped container
```docker container rm ${Container ID}```

### Delete a running container FORCE IT
```docker container rm -f ${Container ID}```

### Get realtime metric details from a container
```docker container stats ${Container ID}```

### View container specific metadata (Rich in information)
```docker container inspect ${Container ID}```

### Checking logs on a container
```docker container logs ${Container ID}```

### Checking processes running on a container
```docker container top ${Container ID}```