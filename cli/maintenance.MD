#### Delete unused containers, images, networks & cache  
```docker container prune```  
Remove stopped containers  

```docker image prune```  
Remove "Dangling images" (Dangling images are layers that have no relationship to any tagged images)  

```docker image prune -a```  
Remove all images youre not currently using  

```docker system prune```  
Removes all stopped containers, unused volumes, unused networks, dangling images

```docker system prune -a```  
Removes all stopped containers, unused volumes, unused networks, all images

```docker volume prune```  
Remove old unused volumes

#### Show used disk space
```docker system df```

#### Login to hub.docker.com
```docker login```

#### Config file is kept here for docker login deets
```~/.docker/config.json```

#### Get basic docker info
``` docker info```